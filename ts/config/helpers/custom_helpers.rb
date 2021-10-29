module Terraspace::Project::CustomHelpers
    def app_owner
      ENV['OWNER']
    end

    def aws_region
        ENV['AWS_REGION']
    end
end