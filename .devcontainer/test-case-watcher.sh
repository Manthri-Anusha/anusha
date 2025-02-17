#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Watch for new Python files being created or modified in the workspace
inotifywait -m -r -e create,modify --format '%w%f' ./ | while read file
do
  if [[ "$file" == *.py ]]; then
    echo "🔍 Detected new Python file: $file"
    # Generate test file based on the Python file's name
    test_file="tests/$(basename ${file%.*})_test.py"
    
    if [[ ! -f "$test_file" ]]; then
      echo "📝 Generating test file: $test_file"
      # Create a basic test file structure
      echo "import pytest" > "$test_file"
      echo "" >> "$test_file"
      echo "def test_${file%.*}():" >> "$test_file"
      echo "    # Add test logic for $file" >> "$test_file"
      echo "    assert True" >> "$test_file"
      
      # Log the creation of the test file
      echo "✅ Test file created at: $test_file"
    else
      echo "⚠️ Test file already exists: $test_file"
    fi
  fi
done
