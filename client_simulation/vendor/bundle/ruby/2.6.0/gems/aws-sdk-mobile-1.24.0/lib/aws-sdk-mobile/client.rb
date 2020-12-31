# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/credentials_configuration.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/endpoint_discovery.rb'
require 'aws-sdk-core/plugins/endpoint_pattern.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/idempotency_token.rb'
require 'aws-sdk-core/plugins/jsonvalue_converter.rb'
require 'aws-sdk-core/plugins/client_metrics_plugin.rb'
require 'aws-sdk-core/plugins/client_metrics_send_plugin.rb'
require 'aws-sdk-core/plugins/transfer_encoding.rb'
require 'aws-sdk-core/plugins/http_checksum.rb'
require 'aws-sdk-core/plugins/signature_v4.rb'
require 'aws-sdk-core/plugins/protocols/rest_json.rb'

Aws::Plugins::GlobalConfiguration.add_identifier(:mobile)

module Aws::Mobile
  # An API client for Mobile.  To construct a client, you need to configure a `:region` and `:credentials`.
  #
  #     client = Aws::Mobile::Client.new(
  #       region: region_name,
  #       credentials: credentials,
  #       # ...
  #     )
  #
  # For details on configuring region and credentials see
  # the [developer guide](/sdk-for-ruby/v3/developer-guide/setup-config.html).
  #
  # See {#initialize} for a full list of supported configuration options.
  class Client < Seahorse::Client::Base

    include Aws::ClientStubs

    @identifier = :mobile

    set_api(ClientApi::API)

    add_plugin(Seahorse::Client::Plugins::ContentLength)
    add_plugin(Aws::Plugins::CredentialsConfiguration)
    add_plugin(Aws::Plugins::Logging)
    add_plugin(Aws::Plugins::ParamConverter)
    add_plugin(Aws::Plugins::ParamValidator)
    add_plugin(Aws::Plugins::UserAgent)
    add_plugin(Aws::Plugins::HelpfulSocketErrors)
    add_plugin(Aws::Plugins::RetryErrors)
    add_plugin(Aws::Plugins::GlobalConfiguration)
    add_plugin(Aws::Plugins::RegionalEndpoint)
    add_plugin(Aws::Plugins::EndpointDiscovery)
    add_plugin(Aws::Plugins::EndpointPattern)
    add_plugin(Aws::Plugins::ResponsePaging)
    add_plugin(Aws::Plugins::StubResponses)
    add_plugin(Aws::Plugins::IdempotencyToken)
    add_plugin(Aws::Plugins::JsonvalueConverter)
    add_plugin(Aws::Plugins::ClientMetricsPlugin)
    add_plugin(Aws::Plugins::ClientMetricsSendPlugin)
    add_plugin(Aws::Plugins::TransferEncoding)
    add_plugin(Aws::Plugins::HttpChecksum)
    add_plugin(Aws::Plugins::SignatureV4)
    add_plugin(Aws::Plugins::Protocols::RestJson)

    # @overload initialize(options)
    #   @param [Hash] options
    #   @option options [required, Aws::CredentialProvider] :credentials
    #     Your AWS credentials. This can be an instance of any one of the
    #     following classes:
    #
    #     * `Aws::Credentials` - Used for configuring static, non-refreshing
    #       credentials.
    #
    #     * `Aws::SharedCredentials` - Used for loading static credentials from a
    #       shared file, such as `~/.aws/config`.
    #
    #     * `Aws::AssumeRoleCredentials` - Used when you need to assume a role.
    #
    #     * `Aws::AssumeRoleWebIdentityCredentials` - Used when you need to
    #       assume a role after providing credentials via the web.
    #
    #     * `Aws::SSOCredentials` - Used for loading credentials from AWS SSO using an
    #       access token generated from `aws login`.
    #
    #     * `Aws::ProcessCredentials` - Used for loading credentials from a
    #       process that outputs to stdout.
    #
    #     * `Aws::InstanceProfileCredentials` - Used for loading credentials
    #       from an EC2 IMDS on an EC2 instance.
    #
    #     * `Aws::ECSCredentials` - Used for loading credentials from
    #       instances running in ECS.
    #
    #     * `Aws::CognitoIdentityCredentials` - Used for loading credentials
    #       from the Cognito Identity service.
    #
    #     When `:credentials` are not configured directly, the following
    #     locations will be searched for credentials:
    #
    #     * `Aws.config[:credentials]`
    #     * The `:access_key_id`, `:secret_access_key`, and `:session_token` options.
    #     * ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']
    #     * `~/.aws/credentials`
    #     * `~/.aws/config`
    #     * EC2/ECS IMDS instance profile - When used by default, the timeouts
    #       are very aggressive. Construct and pass an instance of
    #       `Aws::InstanceProfileCredentails` or `Aws::ECSCredentials` to
    #       enable retries and extended timeouts.
    #
    #   @option options [required, String] :region
    #     The AWS region to connect to.  The configured `:region` is
    #     used to determine the service `:endpoint`. When not passed,
    #     a default `:region` is searched for in the following locations:
    #
    #     * `Aws.config[:region]`
    #     * `ENV['AWS_REGION']`
    #     * `ENV['AMAZON_REGION']`
    #     * `ENV['AWS_DEFAULT_REGION']`
    #     * `~/.aws/credentials`
    #     * `~/.aws/config`
    #
    #   @option options [String] :access_key_id
    #
    #   @option options [Boolean] :active_endpoint_cache (false)
    #     When set to `true`, a thread polling for endpoints will be running in
    #     the background every 60 secs (default). Defaults to `false`.
    #
    #   @option options [Boolean] :adaptive_retry_wait_to_fill (true)
    #     Used only in `adaptive` retry mode.  When true, the request will sleep
    #     until there is sufficent client side capacity to retry the request.
    #     When false, the request will raise a `RetryCapacityNotAvailableError` and will
    #     not retry instead of sleeping.
    #
    #   @option options [Boolean] :client_side_monitoring (false)
    #     When `true`, client-side metrics will be collected for all API requests from
    #     this client.
    #
    #   @option options [String] :client_side_monitoring_client_id ("")
    #     Allows you to provide an identifier for this client which will be attached to
    #     all generated client side metrics. Defaults to an empty string.
    #
    #   @option options [String] :client_side_monitoring_host ("127.0.0.1")
    #     Allows you to specify the DNS hostname or IPv4 or IPv6 address that the client
    #     side monitoring agent is running on, where client metrics will be published via UDP.
    #
    #   @option options [Integer] :client_side_monitoring_port (31000)
    #     Required for publishing client metrics. The port that the client side monitoring
    #     agent is running on, where client metrics will be published via UDP.
    #
    #   @option options [Aws::ClientSideMonitoring::Publisher] :client_side_monitoring_publisher (Aws::ClientSideMonitoring::Publisher)
    #     Allows you to provide a custom client-side monitoring publisher class. By default,
    #     will use the Client Side Monitoring Agent Publisher.
    #
    #   @option options [Boolean] :convert_params (true)
    #     When `true`, an attempt is made to coerce request parameters into
    #     the required types.
    #
    #   @option options [Boolean] :correct_clock_skew (true)
    #     Used only in `standard` and adaptive retry modes. Specifies whether to apply
    #     a clock skew correction and retry requests with skewed client clocks.
    #
    #   @option options [Boolean] :disable_host_prefix_injection (false)
    #     Set to true to disable SDK automatically adding host prefix
    #     to default service endpoint when available.
    #
    #   @option options [String] :endpoint
    #     The client endpoint is normally constructed from the `:region`
    #     option. You should only configure an `:endpoint` when connecting
    #     to test or custom endpoints. This should be a valid HTTP(S) URI.
    #
    #   @option options [Integer] :endpoint_cache_max_entries (1000)
    #     Used for the maximum size limit of the LRU cache storing endpoints data
    #     for endpoint discovery enabled operations. Defaults to 1000.
    #
    #   @option options [Integer] :endpoint_cache_max_threads (10)
    #     Used for the maximum threads in use for polling endpoints to be cached, defaults to 10.
    #
    #   @option options [Integer] :endpoint_cache_poll_interval (60)
    #     When :endpoint_discovery and :active_endpoint_cache is enabled,
    #     Use this option to config the time interval in seconds for making
    #     requests fetching endpoints information. Defaults to 60 sec.
    #
    #   @option options [Boolean] :endpoint_discovery (false)
    #     When set to `true`, endpoint discovery will be enabled for operations when available.
    #
    #   @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
    #     The log formatter.
    #
    #   @option options [Symbol] :log_level (:info)
    #     The log level to send messages to the `:logger` at.
    #
    #   @option options [Logger] :logger
    #     The Logger instance to send log messages to.  If this option
    #     is not set, logging will be disabled.
    #
    #   @option options [Integer] :max_attempts (3)
    #     An integer representing the maximum number attempts that will be made for
    #     a single request, including the initial attempt.  For example,
    #     setting this value to 5 will result in a request being retried up to
    #     4 times. Used in `standard` and `adaptive` retry modes.
    #
    #   @option options [String] :profile ("default")
    #     Used when loading credentials from the shared credentials file
    #     at HOME/.aws/credentials.  When not specified, 'default' is used.
    #
    #   @option options [Proc] :retry_backoff
    #     A proc or lambda used for backoff. Defaults to 2**retries * retry_base_delay.
    #     This option is only used in the `legacy` retry mode.
    #
    #   @option options [Float] :retry_base_delay (0.3)
    #     The base delay in seconds used by the default backoff function. This option
    #     is only used in the `legacy` retry mode.
    #
    #   @option options [Symbol] :retry_jitter (:none)
    #     A delay randomiser function used by the default backoff function.
    #     Some predefined functions can be referenced by name - :none, :equal, :full,
    #     otherwise a Proc that takes and returns a number. This option is only used
    #     in the `legacy` retry mode.
    #
    #     @see https://www.awsarchitectureblog.com/2015/03/backoff.html
    #
    #   @option options [Integer] :retry_limit (3)
    #     The maximum number of times to retry failed requests.  Only
    #     ~ 500 level server errors and certain ~ 400 level client errors
    #     are retried.  Generally, these are throttling errors, data
    #     checksum errors, networking errors, timeout errors, auth errors,
    #     endpoint discovery, and errors from expired credentials.
    #     This option is only used in the `legacy` retry mode.
    #
    #   @option options [Integer] :retry_max_delay (0)
    #     The maximum number of seconds to delay between retries (0 for no limit)
    #     used by the default backoff function. This option is only used in the
    #     `legacy` retry mode.
    #
    #   @option options [String] :retry_mode ("legacy")
    #     Specifies which retry algorithm to use. Values are:
    #
    #     * `legacy` - The pre-existing retry behavior.  This is default value if
    #       no retry mode is provided.
    #
    #     * `standard` - A standardized set of retry rules across the AWS SDKs.
    #       This includes support for retry quotas, which limit the number of
    #       unsuccessful retries a client can make.
    #
    #     * `adaptive` - An experimental retry mode that includes all the
    #       functionality of `standard` mode along with automatic client side
    #       throttling.  This is a provisional mode that may change behavior
    #       in the future.
    #
    #
    #   @option options [String] :secret_access_key
    #
    #   @option options [String] :session_token
    #
    #   @option options [Boolean] :stub_responses (false)
    #     Causes the client to return stubbed responses. By default
    #     fake responses are generated and returned. You can specify
    #     the response data to return or errors to raise by calling
    #     {ClientStubs#stub_responses}. See {ClientStubs} for more information.
    #
    #     ** Please note ** When response stubbing is enabled, no HTTP
    #     requests are made, and retries are disabled.
    #
    #   @option options [Boolean] :validate_params (true)
    #     When `true`, request parameters are validated before
    #     sending the request.
    #
    #   @option options [URI::HTTP,String] :http_proxy A proxy to send
    #     requests through.  Formatted like 'http://proxy.com:123'.
    #
    #   @option options [Float] :http_open_timeout (15) The number of
    #     seconds to wait when opening a HTTP session before raising a
    #     `Timeout::Error`.
    #
    #   @option options [Integer] :http_read_timeout (60) The default
    #     number of seconds to wait for response data.  This value can
    #     safely be set per-request on the session.
    #
    #   @option options [Float] :http_idle_timeout (5) The number of
    #     seconds a connection is allowed to sit idle before it is
    #     considered stale.  Stale connections are closed and removed
    #     from the pool before making a request.
    #
    #   @option options [Float] :http_continue_timeout (1) The number of
    #     seconds to wait for a 100-continue response before sending the
    #     request body.  This option has no effect unless the request has
    #     "Expect" header set to "100-continue".  Defaults to `nil` which
    #     disables this behaviour.  This value can safely be set per
    #     request on the session.
    #
    #   @option options [Boolean] :http_wire_trace (false) When `true`,
    #     HTTP debug output will be sent to the `:logger`.
    #
    #   @option options [Boolean] :ssl_verify_peer (true) When `true`,
    #     SSL peer certificates are verified when establishing a
    #     connection.
    #
    #   @option options [String] :ssl_ca_bundle Full path to the SSL
    #     certificate authority bundle file that should be used when
    #     verifying peer certificates.  If you do not pass
    #     `:ssl_ca_bundle` or `:ssl_ca_directory` the the system default
    #     will be used if available.
    #
    #   @option options [String] :ssl_ca_directory Full path of the
    #     directory that contains the unbundled SSL certificate
    #     authority files for verifying peer certificates.  If you do
    #     not pass `:ssl_ca_bundle` or `:ssl_ca_directory` the the
    #     system default will be used if available.
    #
    def initialize(*args)
      super
    end

    # @!group API Operations

    # Creates an AWS Mobile Hub project.
    #
    # @option params [String] :name
    #   Name of the project.
    #
    # @option params [String] :region
    #   Default region where project resources should be created.
    #
    # @option params [String, StringIO, File] :contents
    #   ZIP or YAML file which contains configuration settings to be used when
    #   creating the project. This may be the contents of the file downloaded
    #   from the URL provided in an export project operation.
    #
    # @option params [String] :snapshot_id
    #   Unique identifier for an exported snapshot of project configuration.
    #   This snapshot identifier is included in the share URL when a project
    #   is exported.
    #
    # @return [Types::CreateProjectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateProjectResult#details #details} => Types::ProjectDetails
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_project({
    #     name: "ProjectName",
    #     region: "ProjectRegion",
    #     contents: "data",
    #     snapshot_id: "SnapshotId",
    #   })
    #
    # @example Response structure
    #
    #   resp.details.name #=> String
    #   resp.details.project_id #=> String
    #   resp.details.region #=> String
    #   resp.details.state #=> String, one of "NORMAL", "SYNCING", "IMPORTING"
    #   resp.details.created_date #=> Time
    #   resp.details.last_updated_date #=> Time
    #   resp.details.console_url #=> String
    #   resp.details.resources #=> Array
    #   resp.details.resources[0].type #=> String
    #   resp.details.resources[0].name #=> String
    #   resp.details.resources[0].arn #=> String
    #   resp.details.resources[0].feature #=> String
    #   resp.details.resources[0].attributes #=> Hash
    #   resp.details.resources[0].attributes["AttributeKey"] #=> <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/CreateProject AWS API Documentation
    #
    # @overload create_project(params = {})
    # @param [Hash] params ({})
    def create_project(params = {}, options = {})
      req = build_request(:create_project, params)
      req.send_request(options)
    end

    # Delets a project in AWS Mobile Hub.
    #
    # @option params [required, String] :project_id
    #   Unique project identifier.
    #
    # @return [Types::DeleteProjectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteProjectResult#deleted_resources #deleted_resources} => Array&lt;Types::Resource&gt;
    #   * {Types::DeleteProjectResult#orphaned_resources #orphaned_resources} => Array&lt;Types::Resource&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_project({
    #     project_id: "ProjectId", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.deleted_resources #=> Array
    #   resp.deleted_resources[0].type #=> String
    #   resp.deleted_resources[0].name #=> String
    #   resp.deleted_resources[0].arn #=> String
    #   resp.deleted_resources[0].feature #=> String
    #   resp.deleted_resources[0].attributes #=> Hash
    #   resp.deleted_resources[0].attributes["AttributeKey"] #=> <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    #   resp.orphaned_resources #=> Array
    #   resp.orphaned_resources[0].type #=> String
    #   resp.orphaned_resources[0].name #=> String
    #   resp.orphaned_resources[0].arn #=> String
    #   resp.orphaned_resources[0].feature #=> String
    #   resp.orphaned_resources[0].attributes #=> Hash
    #   resp.orphaned_resources[0].attributes["AttributeKey"] #=> <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/DeleteProject AWS API Documentation
    #
    # @overload delete_project(params = {})
    # @param [Hash] params ({})
    def delete_project(params = {}, options = {})
      req = build_request(:delete_project, params)
      req.send_request(options)
    end

    # Get the bundle details for the requested bundle id.
    #
    # @option params [required, String] :bundle_id
    #   Unique bundle identifier.
    #
    # @return [Types::DescribeBundleResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeBundleResult#details #details} => Types::BundleDetails
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_bundle({
    #     bundle_id: "BundleId", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.details.bundle_id #=> String
    #   resp.details.title #=> String
    #   resp.details.version #=> String
    #   resp.details.description #=> String
    #   resp.details.icon_url #=> String
    #   resp.details.available_platforms #=> Array
    #   resp.details.available_platforms[0] #=> String, one of "OSX", "WINDOWS", "LINUX", "OBJC", "SWIFT", "ANDROID", "JAVASCRIPT"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/DescribeBundle AWS API Documentation
    #
    # @overload describe_bundle(params = {})
    # @param [Hash] params ({})
    def describe_bundle(params = {}, options = {})
      req = build_request(:describe_bundle, params)
      req.send_request(options)
    end

    # Gets details about a project in AWS Mobile Hub.
    #
    # @option params [required, String] :project_id
    #   Unique project identifier.
    #
    # @option params [Boolean] :sync_from_resources
    #   If set to true, causes AWS Mobile Hub to synchronize information from
    #   other services, e.g., update state of AWS CloudFormation stacks in the
    #   AWS Mobile Hub project.
    #
    # @return [Types::DescribeProjectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeProjectResult#details #details} => Types::ProjectDetails
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_project({
    #     project_id: "ProjectId", # required
    #     sync_from_resources: false,
    #   })
    #
    # @example Response structure
    #
    #   resp.details.name #=> String
    #   resp.details.project_id #=> String
    #   resp.details.region #=> String
    #   resp.details.state #=> String, one of "NORMAL", "SYNCING", "IMPORTING"
    #   resp.details.created_date #=> Time
    #   resp.details.last_updated_date #=> Time
    #   resp.details.console_url #=> String
    #   resp.details.resources #=> Array
    #   resp.details.resources[0].type #=> String
    #   resp.details.resources[0].name #=> String
    #   resp.details.resources[0].arn #=> String
    #   resp.details.resources[0].feature #=> String
    #   resp.details.resources[0].attributes #=> Hash
    #   resp.details.resources[0].attributes["AttributeKey"] #=> <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/DescribeProject AWS API Documentation
    #
    # @overload describe_project(params = {})
    # @param [Hash] params ({})
    def describe_project(params = {}, options = {})
      req = build_request(:describe_project, params)
      req.send_request(options)
    end

    # Generates customized software development kit (SDK) and or tool
    # packages used to integrate mobile web or mobile app clients with
    # backend AWS resources.
    #
    # @option params [required, String] :bundle_id
    #   Unique bundle identifier.
    #
    # @option params [String] :project_id
    #   Unique project identifier.
    #
    # @option params [String] :platform
    #   Developer desktop or target application platform.
    #
    # @return [Types::ExportBundleResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ExportBundleResult#download_url #download_url} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.export_bundle({
    #     bundle_id: "BundleId", # required
    #     project_id: "ProjectId",
    #     platform: "OSX", # accepts OSX, WINDOWS, LINUX, OBJC, SWIFT, ANDROID, JAVASCRIPT
    #   })
    #
    # @example Response structure
    #
    #   resp.download_url #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/ExportBundle AWS API Documentation
    #
    # @overload export_bundle(params = {})
    # @param [Hash] params ({})
    def export_bundle(params = {}, options = {})
      req = build_request(:export_bundle, params)
      req.send_request(options)
    end

    # Exports project configuration to a snapshot which can be downloaded
    # and shared. Note that mobile app push credentials are encrypted in
    # exported projects, so they can only be shared successfully within the
    # same AWS account.
    #
    # @option params [required, String] :project_id
    #   Unique project identifier.
    #
    # @return [Types::ExportProjectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ExportProjectResult#download_url #download_url} => String
    #   * {Types::ExportProjectResult#share_url #share_url} => String
    #   * {Types::ExportProjectResult#snapshot_id #snapshot_id} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.export_project({
    #     project_id: "ProjectId", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.download_url #=> String
    #   resp.share_url #=> String
    #   resp.snapshot_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/ExportProject AWS API Documentation
    #
    # @overload export_project(params = {})
    # @param [Hash] params ({})
    def export_project(params = {}, options = {})
      req = build_request(:export_project, params)
      req.send_request(options)
    end

    # List all available bundles.
    #
    # @option params [Integer] :max_results
    #   Maximum number of records to list in a single response.
    #
    # @option params [String] :next_token
    #   Pagination token. Set to null to start listing bundles from start. If
    #   non-null pagination token is returned in a result, then pass its value
    #   in here in another request to list more bundles.
    #
    # @return [Types::ListBundlesResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListBundlesResult#bundle_list #bundle_list} => Array&lt;Types::BundleDetails&gt;
    #   * {Types::ListBundlesResult#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_bundles({
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.bundle_list #=> Array
    #   resp.bundle_list[0].bundle_id #=> String
    #   resp.bundle_list[0].title #=> String
    #   resp.bundle_list[0].version #=> String
    #   resp.bundle_list[0].description #=> String
    #   resp.bundle_list[0].icon_url #=> String
    #   resp.bundle_list[0].available_platforms #=> Array
    #   resp.bundle_list[0].available_platforms[0] #=> String, one of "OSX", "WINDOWS", "LINUX", "OBJC", "SWIFT", "ANDROID", "JAVASCRIPT"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/ListBundles AWS API Documentation
    #
    # @overload list_bundles(params = {})
    # @param [Hash] params ({})
    def list_bundles(params = {}, options = {})
      req = build_request(:list_bundles, params)
      req.send_request(options)
    end

    # Lists projects in AWS Mobile Hub.
    #
    # @option params [Integer] :max_results
    #   Maximum number of records to list in a single response.
    #
    # @option params [String] :next_token
    #   Pagination token. Set to null to start listing projects from start. If
    #   non-null pagination token is returned in a result, then pass its value
    #   in here in another request to list more projects.
    #
    # @return [Types::ListProjectsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListProjectsResult#projects #projects} => Array&lt;Types::ProjectSummary&gt;
    #   * {Types::ListProjectsResult#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_projects({
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.projects #=> Array
    #   resp.projects[0].name #=> String
    #   resp.projects[0].project_id #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/ListProjects AWS API Documentation
    #
    # @overload list_projects(params = {})
    # @param [Hash] params ({})
    def list_projects(params = {}, options = {})
      req = build_request(:list_projects, params)
      req.send_request(options)
    end

    # Update an existing project.
    #
    # @option params [String, StringIO, File] :contents
    #   ZIP or YAML file which contains project configuration to be updated.
    #   This should be the contents of the file downloaded from the URL
    #   provided in an export project operation.
    #
    # @option params [required, String] :project_id
    #   Unique project identifier.
    #
    # @return [Types::UpdateProjectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateProjectResult#details #details} => Types::ProjectDetails
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_project({
    #     contents: "data",
    #     project_id: "ProjectId", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.details.name #=> String
    #   resp.details.project_id #=> String
    #   resp.details.region #=> String
    #   resp.details.state #=> String, one of "NORMAL", "SYNCING", "IMPORTING"
    #   resp.details.created_date #=> Time
    #   resp.details.last_updated_date #=> Time
    #   resp.details.console_url #=> String
    #   resp.details.resources #=> Array
    #   resp.details.resources[0].type #=> String
    #   resp.details.resources[0].name #=> String
    #   resp.details.resources[0].arn #=> String
    #   resp.details.resources[0].feature #=> String
    #   resp.details.resources[0].attributes #=> Hash
    #   resp.details.resources[0].attributes["AttributeKey"] #=> <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/mobile-2017-07-01/UpdateProject AWS API Documentation
    #
    # @overload update_project(params = {})
    # @param [Hash] params ({})
    def update_project(params = {}, options = {})
      req = build_request(:update_project, params)
      req.send_request(options)
    end

    # @!endgroup

    # @param params ({})
    # @api private
    def build_request(operation_name, params = {})
      handlers = @handlers.for(operation_name)
      context = Seahorse::Client::RequestContext.new(
        operation_name: operation_name,
        operation: config.api.operation(operation_name),
        client: self,
        params: params,
        config: config)
      context[:gem_name] = 'aws-sdk-mobile'
      context[:gem_version] = '1.24.0'
      Seahorse::Client::Request.new(handlers, context)
    end

    # @api private
    # @deprecated
    def waiter_names
      []
    end

    class << self

      # @api private
      attr_reader :identifier

      # @api private
      def errors_module
        Errors
      end

    end
  end
end
