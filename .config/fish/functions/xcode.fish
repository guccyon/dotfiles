function xcode
  if count (ls | grep .xcworkspace) > /dev/null 2>&1
    find . -maxdepth 1 -name '*.xcworkspace' -exec open '{}' \;
  else if count (ls | grep .xcodeproj) > /dev/null 2>&1
    find . -maxdepth 1 -name '*.xcodeproj' -exec open '{}' \;
  end
end
