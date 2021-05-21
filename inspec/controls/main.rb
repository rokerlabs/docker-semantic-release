# encoding: utf-8

title 'base'

include_controls 'linux-baseline' do
  # Skip Check login.defs - The image will never become available for login.
  skip_control 'os-05'

  # Temporatily disabled 'Detect vulnerabilities in the cpu-vulnerability-directory'
  skip_control 'os-12'
end

include_controls 'linux-patch-baseline'