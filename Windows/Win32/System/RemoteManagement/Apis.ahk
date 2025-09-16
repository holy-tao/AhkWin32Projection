#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class RemoteManagement {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_REQUESTED_API_VERSION_1_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_REQUESTED_API_VERSION_1_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_OPERATION_INFOV1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_OPERATION_INFOV2 => 2864434397

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_DEFAULT_TIMEOUT_MS => 60000

    /**
     * @type {String}
     */
    static WSMAN_STREAM_ID_STDIN => "stdin"

    /**
     * @type {String}
     */
    static WSMAN_STREAM_ID_STDOUT => "stdout"

    /**
     * @type {String}
     */
    static WSMAN_STREAM_ID_STDERR => "stderr"

    /**
     * @type {String}
     */
    static WSMAN_SHELL_NS => "http://schemas.microsoft.com/wbem/wsman/1/windows/shell"

    /**
     * @type {String}
     */
    static WSMAN_CMDSHELL_OPTION_CODEPAGE => "WINRS_CODEPAGE"

    /**
     * @type {String}
     */
    static WSMAN_SHELL_OPTION_NOPROFILE => "WINRS_NOPROFILE"

    /**
     * @type {String}
     */
    static WSMAN_CMDSHELL_OPTION_CONSOLEMODE_STDIN => "WINRS_CONSOLEMODE_STDIN"

    /**
     * @type {String}
     */
    static WSMAN_CMDSHELL_OPTION_SKIP_CMD_SHELL => "WINRS_SKIP_CMD_SHELL"

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_RECEIVE_RESULT_NO_MORE_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_RECEIVE_FLUSH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_RECEIVE_RESULT_DATA_BOUNDARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_MAX_ENVELOPE_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_TIMEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_REMAINING_RESULT_SIZE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_LARGEST_RESULT_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_GET_REQUESTED_LOCALE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_GET_REQUESTED_DATA_LOCALE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_SHAREDHOST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_RUNAS_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_AUTORESTART => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_HOSTIDLETIMEOUTSECONDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_PARAMS_NAME => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_STARTUP_REQUEST_RECEIVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_STARTUP_AUTORESTARTED_REBOOT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_STARTUP_AUTORESTARTED_CRASH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_SHUTDOWN_SYSTEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_SHUTDOWN_SERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_SHUTDOWN_IISHOST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_PLUGIN_SHUTDOWN_IDLETIMEOUT_ELAPSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSMAN_FLAG_SEND_NO_MORE_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESOURCE_NOT_FOUND => 2150858752

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_ACTIONURI => 2150858753

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_URI => 2150858754

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PROVIDER_FAILURE => 2150858755

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_BATCH_COMPLETE => 2150858756

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CORRUPTED => 2150858757

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PULL_IN_PROGRESS => 2150858758

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATION_CLOSED => 2150858759

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIPTION_CLOSED => 2150858760

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIPTION_CLOSE_IN_PROGRESS => 2150858761

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIPTION_CLIENT_DID_NOT_CALL_WITHIN_HEARTBEAT => 2150858762

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIPTION_NO_HEARTBEAT => 2150858763

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_TIMEOUT => 2150858764

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SOAP_VERSION_MISMATCH => 2150858765

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SOAP_DATA_ENCODING_UNKNOWN => 2150858766

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_MESSAGE_INFORMATION_HEADER => 2150858767

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SOAP_FAULT_MUST_UNDERSTAND => 2150858768

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MESSAGE_INFORMATION_HEADER_REQUIRED => 2150858769

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DESTINATION_UNREACHABLE => 2150858770

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ACTION_NOT_SUPPORTED => 2150858771

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENDPOINT_UNAVAILABLE => 2150858772

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_REPRESENTATION => 2150858773

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_INVALID_EXPIRATION_TIME => 2150858774

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_UNSUPPORTED_EXPIRATION_TIME => 2150858775

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_FILTERING_NOT_SUPPORTED => 2150858776

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_FILTER_DIALECT_REQUESTED_UNAVAILABLE => 2150858777

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_CANNOT_PROCESS_FILTER => 2150858778

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_INVALID_ENUMERATION_CONTEXT => 2150858779

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_TIMED_OUT => 2150858780

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_UNABLE_TO_RENEW => 2150858781

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_DELIVERY_MODE_REQUESTED_UNAVAILABLE => 2150858782

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_EXPIRATION_TIME => 2150858783

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_UNSUPPORTED_EXPIRATION_TYPE => 2150858784

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_FILTERING_NOT_SUPPORTED => 2150858785

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_FILTERING_REQUESTED_UNAVAILABLE => 2150858786

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_SOURCE_UNABLE_TO_PROCESS => 2150858787

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_UNABLE_TO_RENEW => 2150858788

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_MESSAGE => 2150858789

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENVELOPE_TOO_LARGE => 2150858790

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SOAP_BODY => 2150858791

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_RESUMPTION_CONTEXT => 2150858792

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPERATION_TIMEDOUT => 2150858793

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESUMPTION_NOT_SUPPORTED => 2150858794

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESUMPTION_TYPE_NOT_SUPPORTED => 2150858795

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_ENCODING => 2150858796

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URI_LIMIT => 2150858797

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_PROPOSED_ID => 2150858798

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_BATCH_PARAMETER => 2150858799

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_ACK => 2150858800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ACTION_MISMATCH => 2150858801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONCURRENCY => 2150858802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ALREADY_EXISTS => 2150858803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DELIVERY_REFUSED => 2150858804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENCODING_LIMIT => 2150858805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FAILED_AUTHENTICATION => 2150858806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INCOMPATIBLE_EPR => 2150858807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_BOOKMARK => 2150858808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_OPTIONS => 2150858809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_PARAMETER => 2150858810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_RESOURCE_URI => 2150858811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SYSTEM => 2150858812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SELECTORS => 2150858813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_METADATA_REDIRECT => 2150858814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_LIMIT => 2150858815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RENAME_FAILURE => 2150858816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SCHEMA_VALIDATION_ERROR => 2150858817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_FEATURE => 2150858818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML => 2150858819

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_KEY => 2150858820

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DELIVER_IN_PROGRESS => 2150858821

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SYSTEM_NOT_FOUND => 2150858822

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAX_ENVELOPE_SIZE => 2150858823

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAX_ENVELOPE_SIZE_EXCEEDED => 2150858824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVER_ENVELOPE_LIMIT => 2150858825

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SELECTOR_LIMIT => 2150858826

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPTION_LIMIT => 2150858827

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CHARACTER_SET => 2150858828

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNREPORTABLE_SUCCESS => 2150858829

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WHITESPACE => 2150858830

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FILTERING_REQUIRED => 2150858831

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_BOOKMARK_EXPIRED => 2150858832

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPTIONS_NOT_SUPPORTED => 2150858833

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPTIONS_INVALID_NAME => 2150858834

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPTIONS_INVALID_VALUE => 2150858835

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PARAMETER_TYPE_MISMATCH => 2150858836

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_PARAMETER_NAME => 2150858837

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML_VALUES => 2150858838

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML_MISSING_VALUES => 2150858839

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML_NAMESPACE => 2150858840

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML_FRAGMENT => 2150858841

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INSUFFCIENT_SELECTORS => 2150858842

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNEXPECTED_SELECTORS => 2150858843

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SELECTOR_TYPEMISMATCH => 2150858844

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SELECTOR_VALUE => 2150858845

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_AMBIGUOUS_SELECTORS => 2150858846

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DUPLICATE_SELECTORS => 2150858847

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_TARGET_SELECTORS => 2150858848

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_TARGET_RESOURCEURI => 2150858849

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_TARGET_SYSTEM => 2150858850

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_TARGET_ALREADY_EXISTS => 2150858851

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_AUTHORIZATION_MODE_NOT_SUPPORTED => 2150858852

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ACK_NOT_SUPPORTED => 2150858853

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OPERATION_TIMEOUT_NOT_SUPPORTED => 2150858854

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_LOCALE_NOT_SUPPORTED => 2150858855

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EXPIRATION_TIME_NOT_SUPPORTED => 2150858856

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DELIVERY_RETRIES_NOT_SUPPORTED => 2150858857

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HEARTBEATS_NOT_SUPPORTED => 2150858858

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_BOOKMARKS_NOT_SUPPORTED => 2150858859

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAXITEMS_NOT_SUPPORTED => 2150858860

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAXTIME_NOT_SUPPORTED => 2150858861

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAXENVELOPE_SIZE_NOT_SUPPORTED => 2150858862

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAXENVELOPE_POLICY_NOT_SUPPORTED => 2150858863

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FILTERING_REQUIRED_NOT_SUPPORTED => 2150858864

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INSECURE_ADDRESS_NOT_SUPPORTED => 2150858865

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FORMAT_MISMATCH_NOT_SUPPORTED => 2150858866

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FORMAT_SECURITY_TOKEN_NOT_SUPPORTED => 2150858867

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_BAD_METHOD => 2150858868

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_MEDIA => 2150858869

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_ADDRESSING_MODE => 2150858870

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FRAGMENT_TRANSFER_NOT_SUPPORTED => 2150858871

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATION_INITIALIZING => 2150858872

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONNECTOR_GET => 2150858873

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URI_QUERY_STRING_SYNTAX_ERROR => 2150858874

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INEXISTENT_MAC_ADDRESS => 2150858875

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_UNICAST_ADDRESSES => 2150858876

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_DHCP_ADDRESSES => 2150858877

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MIN_ENVELOPE_SIZE => 2150858878

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EPR_NESTING_EXCEEDED => 2150858879

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REQUEST_INIT_ERROR => 2150858880

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_TIMEOUT_HEADER => 2150858881

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_NOT_FOUND => 2150858882

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PLUGIN_FAILED => 2150858883

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATION_INVALID => 2150858884

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CANNOT_CHANGE_MUTUAL => 2150858885

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATION_MODE_UNSUPPORTED => 2150858886

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MUSTUNDERSTAND_ON_LOCALE_UNSUPPORTED => 2150858887

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_POLICY_CORRUPTED => 2150858888

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_LISTENER_ADDRESS_INVALID => 2150858889

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CANNOT_CHANGE_GPO_CONTROLLED_SETTING => 2150858890

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_CONCURRENT_CLIENT_RECEIVE => 2150858891

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_FAST_SENDER => 2150858892

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INSECURE_PUSHSUBSCRIPTION_CONNECTION => 2150858893

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_EVENTSOURCE => 2150858894

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_NOMATCHING_LISTENER => 2150858895

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FRAGMENT_DIALECT_REQUESTED_UNAVAILABLE => 2150858896

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MISSING_FRAGMENT_PATH => 2150858897

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_FRAGMENT_DIALECT => 2150858898

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_FRAGMENT_PATH => 2150858899

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INCOMPATIBLE_BATCHPARAMS_AND_DELIVERYMODE => 2150858900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_LOOPBACK_TESTFAILED => 2150858901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_ENDTO_ADDRESSS => 2150858902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_INCOMING_EVENT_PACKET_HEADER => 2150858903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SESSION_ALREADY_CLOSED => 2150858904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIPTION_LISTENER_NOLONGERVALID => 2150858905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PROVIDER_LOAD_FAILED => 2150858906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_SUBSCRIPTIONCLOSED_BYREMOTESERVICE => 2150858907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_DELIVERYFAILED_FROMSOURCE => 2150858908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SECURITY_UNMAPPED => 2150858909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_SUBSCRIPTION_CANCELLED_BYSOURCE => 2150858910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_HOSTNAME_PATTERN => 2150858911

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_MISSING_NOTIFYTO => 2150858912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_MISSING_NOTIFYTO_ADDRESSS => 2150858913

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_NOTIFYTO_ADDRESSS => 2150858914

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_LOCALE_IN_DELIVERY => 2150858915

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_HEARTBEAT => 2150858916

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MACHINE_OPTION_REQUIRED => 2150858917

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_FEATURE_OPTIONS => 2150858918

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_BATCHSIZE_TOO_SMALL => 2150858919

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_DELIVERY_MODE_REQUESTED_INVALID => 2150858920

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PROVSYS_NOT_SUPPORTED => 2150858921

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PUSH_SUBSCRIPTION_CONFIG_INVALID => 2150858922

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREDS_PASSED_WITH_NO_AUTH_FLAG => 2150858923

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_FLAG => 2150858924

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MULTIPLE_AUTH_FLAGS => 2150858925

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SPN_WRONG_AUTH => 2150858926

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERT_UNNEEDED_CREDS => 2150858927

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_USERNAME_PASSWORD_NEEDED => 2150858928

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERT_UNNEEDED_USERNAME => 2150858929

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREDENTIALS_NEEDED => 2150858930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREDENTIALS_FLAG_NEEDED => 2150858931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERT_NEEDED => 2150858932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERT_UNKNOWN_TYPE => 2150858933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERT_UNKNOWN_LOCATION => 2150858934

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_CERT => 2150858935

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_LOCAL_INVALID_CREDS => 2150858936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_LOCAL_INVALID_CONNECTION_OPTIONS => 2150858937

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREATESESSION_NULL_PARAM => 2150858938

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENUMERATE_NULL_PARAM => 2150858939

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SUBSCRIBE_NULL_PARAM => 2150858940

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NULL_RESULT_PARAM => 2150858941

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NO_HANDLE => 2150858942

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_BLANK_URI => 2150858943

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_RESOURCE_LOCATOR => 2150858944

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_BLANK_INPUT_XML => 2150858945

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_BATCH_ITEMS_TOO_SMALL => 2150858946

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MAX_CHARS_TOO_SMALL => 2150858947

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_BLANK_ACTION_URI => 2150858948

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ZERO_HEARTBEAT => 2150858949

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MULTIPLE_DELIVERY_MODES => 2150858950

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MULTIPLE_ENVELOPE_POLICIES => 2150858951

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_UNKNOWN_EXPIRATION_TYPE => 2150858952

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MISSING_EXPIRATION => 2150858953

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_PULL_INVALID_FLAGS => 2150858954

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_PUSH_UNSUPPORTED_TRANSPORT => 2150858955

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_PUSH_HOST_TOO_LONG => 2150858956

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_COMPRESSION_INVALID_OPTION => 2150858957

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DELIVERENDSUBSCRIPTION_NULL_PARAM => 2150858958

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DELIVEREVENTS_NULL_PARAM => 2150858959

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETBOOKMARK_NULL_PARAM => 2150858960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DECODEOBJECT_NULL_PARAM => 2150858961

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENCODEOBJECT_NULL_PARAM => 2150858962

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENUMERATORADDOBJECT_NULL_PARAM => 2150858963

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENUMERATORNEXTOBJECT_NULL_PARAM => 2150858964

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CONSTRUCTERROR_NULL_PARAM => 2150858965

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVER_NONPULLSUBSCRIBE_NULL_PARAM => 2150858966

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_UNENCRYPTED_HTTP_ONLY => 2150858967

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_USE_CERTIFICATES_FOR_HTTP => 2150858968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONNECTIONSTR_INVALID => 2150858969

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_TRANSPORT_NOT_SUPPORTED => 2150858970

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PORT_INVALID => 2150858971

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_PORT_INVALID => 2150858972

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SENDHEARBEAT_EMPTY_ENUMERATOR => 2150858973

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_UNENCRYPTED_DISABLED => 2150858974

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_BASIC_AUTHENTICATION_DISABLED => 2150858975

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DIGEST_AUTHENTICATION_DISABLED => 2150858976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NEGOTIATE_AUTHENTICATION_DISABLED => 2150858977

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_KERBEROS_AUTHENTICATION_DISABLED => 2150858978

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CERTIFICATES_AUTHENTICATION_DISABLED => 2150858979

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVER_NOT_TRUSTED => 2150858980

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EXPLICIT_CREDENTIALS_REQUIRED => 2150858981

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_THUMBPRINT_NOT_BLANK => 2150858982

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_THUMBPRINT_BLANK => 2150858983

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CANNOT_SHARE_SSL_CONFIG => 2150858984

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CERT_CN_DOES_NOT_MATCH_HOSTNAME => 2150858985

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_HOSTNAME_CHANGE_WITHOUT_CERT => 2150858986

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_THUMBPRINT_SHOULD_BE_EMPTY => 2150858987

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_IPFILTER => 2150858988

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_CHANGE_KEYS => 2150858989

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_INVALID_USAGE => 2150858990

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_NO_RESULTS => 2150858991

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREATE_RESPONSE_NO_EPR => 2150858992

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_INVALID_ENUMERATION_CONTEXT => 2150858993

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_NO_XML_FRAGMENT_WRAPPER => 2150858994

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_INVALID_MESSAGE_INFORMATION_HEADER => 2150858995

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_NO_SOAP_HEADER_BODY => 2150858996

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_NO_RESPONSE_DATA => 2150858997

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RESPONSE_INVALID_SOAP_FAULT => 2150858998

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_INVALID_CONTENT_TYPE_IN_RESPONSE_DATA => 2150858999

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_CONTENT_TYPE_MISSMATCH_RESPONSE_DATA => 2150859000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_DECRYPT => 2150859001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_URI_WMI_SINGLETON => 2150859002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_URI_WMI_ENUM_WQL => 2150859003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_IDENTIFY_FOR_LOCAL_SESSION => 2150859004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_PUSH_SUBSCRIPTION_FOR_LOCAL_SESSION => 2150859005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SUBSCRIPTION_MANAGER => 2150859006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NON_PULL_SUBSCRIPTION_NOT_SUPPORTED => 2150859007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_MAX_NESTED => 2150859008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REMOTE_CIMPATH_NOT_SUPPORTED => 2150859009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_PROVIDER_NOT_CAPABLE => 2150859010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_INVALID_VALUE => 2150859011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_SVC_ACCESS_DENIED => 2150859012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_PROVIDER_ACCESS_DENIED => 2150859013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_CANNOT_CONNECT_ACCESS_DENIED => 2150859014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_FILTER_XML => 2150859015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_WMI_INVALID_KEY => 2150859016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_FRAGMENT_PATH_BLANK => 2150859017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_CHARACTERS_IN_RESPONSE => 2150859018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_KERBEROS_IPADDRESS => 2150859019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_WORKGROUP_NO_KERBEROS => 2150859020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_BATCH_SETTINGS_PARAMETER => 2150859021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVER_DESTINATION_LOCALHOST => 2150859022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNKNOWN_HTTP_STATUS_RETURNED => 2150859023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_HTTP_STATUS_REDIRECT => 2150859024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_REQUEST_TOO_LARGE_STATUS => 2150859025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_SERVICE_UNAVAILABLE_STATUS => 2150859026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_NOT_FOUND_STATUS => 2150859027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_MISSING_LOCALE_IN_DELIVERY => 2150859028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUICK_CONFIG_FAILED_CERT_REQUIRED => 2150859029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUICK_CONFIG_FIREWALL_EXCEPTIONS_DISALLOWED => 2150859030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUICK_CONFIG_LOCAL_POLICY_CHANGE_DISALLOWED => 2150859031

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SELECTOR_NAME => 2150859032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENCODING_TYPE => 2150859033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENDPOINT_UNAVAILABLE_INVALID_VALUE => 2150859034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_HEADER => 2150859035

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_UNSUPPORTED_EXPIRATION_TYPE => 2150859036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MAX_ELEMENTS_NOT_SUPPORTED => 2150859037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WMI_PROVIDER_INVALID_PARAMETER => 2150859038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MULTIPLE_ENUM_MODE_FLAGS => 2150859039

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_INVALID_FLAG => 2150859040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_NULL_PARAM => 2150859041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_PROCESS_FILTER => 2150859042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENUMERATORADDEVENT_NULL_PARAM => 2150859043

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ADDOBJECT_MISSING_OBJECT => 2150859044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ADDOBJECT_MISSING_EPR => 2150859045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NETWORK_TIMEDOUT => 2150859046

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_RECEIVE_IN_PROGRESS => 2150859047

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_RECEIVE_NO_RESPONSE_DATA => 2150859048

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_CREATESHELL_NULL_PARAM => 2150859049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_CLOSESHELL_NULL_PARAM => 2150859050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_FREECREATESHELLRESULT_NULL_PARAM => 2150859051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_RUNCOMMAND_NULL_PARAM => 2150859052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_FREERUNCOMMANDRESULT_NULL_PARAM => 2150859053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_SIGNAL_NULL_PARAM => 2150859054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_RECEIVE_NULL_PARAM => 2150859055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_FREEPULLRESULT_NULL_PARAM => 2150859056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_PULL_NULL_PARAM => 2150859057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_CLOSERECEIVEHANDLE_NULL_PARAM => 2150859058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_SEND_NULL_PARAM => 2150859059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_PUSH_NULL_PARAM => 2150859060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_CLOSESENDHANDLE_NULL_PARAM => 2150859061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CLIENT_GET_NULL_PARAM => 2150859062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_POLYMORPHISM_MODE_UNSUPPORTED => 2150859063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REQUEST_NOT_SUPPORTED_AT_SERVICE => 2150859064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URI_NON_DMTF_CLASS => 2150859065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URI_WRONG_DMTF_VERSION => 2150859066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DIFFERENT_CIM_SELECTOR => 2150859067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PUSHSUBSCRIPTION_INVALIDUSERACCOUNT => 2150859068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_NONDOMAINJOINED_PUBLISHER => 2150859069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_NONDOMAINJOINED_COLLECTOR => 2150859070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_READONLY_PROPERTY => 2150859071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CODE_PAGE_NOT_SUPPORTED => 2150859072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DISABLE_LOOPBACK_WITH_EXPLICIT_CREDENTIALS => 2150859073

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_DISABLE_LOOPBACK => 2150859074

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ENUM_RECEIVED_TOO_MANY_ITEMS => 2150859075

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MULTIPLE_CREDENTIALS => 2150859076

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_AUTHENTICATION_INVALID_FLAG => 2150859077

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREDENTIALS_FOR_DEFAULT_AUTHENTICATION => 2150859078

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_USERNAME_AND_PASSWORD_NEEDED => 2150859079

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_CERT_DNS_OR_UPN => 2150859080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREATESHELL_NULL_ENVIRONMENT_VARIABLE_NAME => 2150859081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_ALREADY_CLOSED => 2150859082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREATESHELL_NULL_STREAMID => 2150859083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_INVALID_SHELL_HANDLE => 2150859084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_INVALID_COMMAND_HANDLE => 2150859085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RUNSHELLCOMMAND_NULL_ARGUMENT => 2150859086

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_COMMAND_ALREADY_CLOSED => 2150859087

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SENDSHELLINPUT_INVALID_STREAMID_INDEX => 2150859088

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_SYNCHRONOUS_NOT_SUPPORTED => 2150859089

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_CERTMAPPING_OPERATION_FOR_LOCAL_SESSION => 2150859090

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_CONFIGLIMIT_EXCEEDED => 2150859091

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_INVALIDUSERCREDENTIALS => 2150859092

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_INVALID_USAGE_CLIENT => 2150859093

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_MISSING_AUTH_FLAG => 2150859094

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERT_MULTIPLE_CREDENTIALS_FLAG => 2150859095

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_SHELL_URI_INVALID => 2150859096

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_SHELL_URI_CMDSHELLURI_NOTPERMITTED => 2150859097

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_SHELLURI_INVALID_PROCESSPATH => 2150859098

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_URI_INVALID => 2150859099

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SECURITY_DESCRIPTOR => 2150859100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_POLICY_TOO_COMPLEX => 2150859101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_POLICY_CANNOT_COMPLY => 2150859102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_CONNECTIONRETRY => 2150859103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URISECURITY_INVALIDURIKEY => 2150859104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_INVALIDSUBJECTKEY => 2150859105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_INVALIDISSUERKEY => 2150859106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_PUBLISHERS_TYPE => 2150859107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_DELIVERY_RETRY => 2150859108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NULL_PUBLISHERS => 2150859109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NULL_ISSUERS => 2150859110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_NO_SOURCES => 2150859111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_SUBSCRIBE_OBJECT => 2150859112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PUBLIC_FIREWALL_PROFILE_ACTIVE => 2150859113

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_PASSWORDTOOLONG => 2150859114

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_PASSWORDBLANK => 2150859115

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_PASSWORDUSERTUPLE => 2150859116

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_PROVIDER_RESPONSE => 2150859117

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_NOT_INITIALIZED => 2150859118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_SHELLURI_INVALID_OPERATION_ON_KEY => 2150859119

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_STATUS_SERVER_ERROR => 2150859120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTTP_STATUS_BAD_REQUEST => 2150859121

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_CANNOT_CHANGE_CERTMAPPING_KEYS => 2150859122

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_HTML_ERROR => 2150859123

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INITIALIZE_NULL_PARAM => 2150859124

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_INIT_APPLICATION_FLAG => 2150859125

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_DEINIT_APPLICATION_FLAG => 2150859126

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SETSESSIONOPTION_NULL_PARAM => 2150859127

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SETSESSIONOPTION_INVALID_PARAM => 2150859128

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETSESSIONOPTION_INVALID_PARAM => 2150859129

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREATESHELL_NULL_PARAM => 2150859130

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_CREATE_SHELL_FLAG => 2150859131

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_CLOSE_SHELL_FLAG => 2150859132

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_CLOSE_COMMAND_FLAG => 2150859133

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CLOSESHELL_NULL_PARAM => 2150859134

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CLOSECOMMAND_NULL_PARAM => 2150859135

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_RUNCOMMAND_NULL_PARAM => 2150859136

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_RUNCOMMAND_FLAG => 2150859137

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_RUNCOMMAND_NOTCOMPLETED => 2150859138

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_COMMAND_RESPONSE => 2150859139

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_OPTIONSET => 2150859140

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_COMMANDID => 2150859141

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SIGNAL_NULL_PARAM => 2150859142

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_SIGNAL_SHELL_FLAG => 2150859143

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SEND_NULL_PARAM => 2150859144

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_SEND_SHELL_FLAG => 2150859145

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_SEND_SHELL_PARAMETER => 2150859146

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_INVALID_INPUT_STREAM => 2150859147

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_RECEIVE_NULL_PARAM => 2150859148

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SHELL_INVALID_DESIRED_STREAMS => 2150859149

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_RECEIVE_SHELL_FLAG => 2150859150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NO_RECEIVE_RESPONSE => 2150859151

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PLUGIN_CONFIGURATION_CORRUPTED => 2150859152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_FILEPATH => 2150859153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FILE_NOT_PRESENT => 2150859154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_IISCONFIGURATION_READ_FAILED => 2150859155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_LOCALE => 2150859156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_UI_LANGUAGE => 2150859157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETERRORMESSAGE_NULL_PARAM => 2150859158

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_LANGUAGE_CODE => 2150859159

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_GETERRORMESSAGE_FLAG => 2150859160

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REDIRECT_REQUESTED => 2150859161

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PROXY_AUTHENTICATION_INVALID_FLAG => 2150859162

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREDENTIALS_FOR_PROXY_AUTHENTICATION => 2150859163

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PROXY_ACCESS_TYPE => 2150859164

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_OPTION_NO_PROXY_SERVER => 2150859165

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETSESSIONOPTION_DWORD_NULL_PARAM => 2150859166

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETSESSIONOPTION_DWORD_INVALID_PARAM => 2150859167

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_GETSESSIONOPTION_STRING_INVALID_PARAM => 2150859168

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREDSSP_USERNAME_PASSWORD_NEEDED => 2150859169

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREDSSP_AUTHENTICATION_DISABLED => 2150859170

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ALLOWFRESHCREDENTIALS => 2150859171

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_ALLOWFRESHCREDENTIALS_NTLMONLY => 2150859172

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_SHELLS => 2150859173

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_OPERATIONS => 2150859174

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_USER => 2150859175

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_SYSTEM => 2150859176

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DIFFERENT_AUTHZ_TOKEN => 2150859177

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REDIRECT_LOCATION_NOT_AVAILABLE => 2150859178

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_SHELLUSERS => 2150859179

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REMOTESHELLS_NOT_ALLOWED => 2150859180

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_PULL_PARAMS_NOT_SAME_AS_ENUM => 2150859181

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DEPRECATED_CONFIG_SETTING => 2150859182

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_URI_SECURITY_URI => 2150859183

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_USE_ALLOW_NEGOTIATE_IMPLICIT_CREDENTIALS_FOR_HTTP => 2150859184

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_HTTP => 2150859185

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_KERBEROS => 2150859186

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_CREDSSP => 2150859187

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_MULTIPLE_PROXY_AUTH_FLAGS => 2150859188

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_REDIRECT_ERROR => 2150859189

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REDIRECT_LOCATION_TOO_LONG => 2150859190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REDIRECT_LOCATION_INVALID => 2150859191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_CBT_HARDENING_INVALID => 2150859192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NAME_NOT_RESOLVED => 2150859193

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SSL_CONNECTION_ABORTED => 2150859194

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DEFAULTAUTH_IPADDRESS => 2150859195

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CUSTOMREMOTESHELL_DEPRECATED => 2150859196

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_FEATURE_DEPRECATED => 2150859197

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_USESSL_PARAM => 2150859198

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_CONFIGSDDL_URL => 2150859199

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_SHELLCOMAMNDS_FILTER_EXPECTED => 2150859200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_ENUMERATE_SHELLCOMMANDS_EPRS_NOTSUPPORTED => 2150859201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CREATESHELL_NAME_INVALID => 2150859202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RUNAS_INVALIDUSERCREDENTIALS => 2150859203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_DISCONNECTED => 2150859204

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_DISCONNECT_NOT_SUPPORTED => 2150859205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_CLIENTSESSIONID_MISMATCH => 2150859206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_DISCONNECTSHELL_NULL_PARAM => 2150859207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_RECONNECTSHELL_NULL_PARAM => 2150859208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CONNECTSHELL_NULL_PARAM => 2150859209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_CONNECTCOMMAND_NULL_PARAM => 2150859210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_CONNECT_RESPONSE_BAD_BODY => 2150859211

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_COMMAND_TERMINATED => 2150859212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_CONNECTED_TO_DIFFERENT_CLIENT => 2150859213

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_GRACEFUL => 2150859214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_VALID => 2150859215

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_RECONNECT_OPERATION_NOT_VALID => 2150859216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CONFIG_GROUP_POLICY_CHANGE_NOTIFICATION_SUBSCRIPTION_FAILED => 2150859217

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_RECONNECTSHELLCOMMAND_NULL_PARAM => 2150859218

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELLCOMMAND_RECONNECT_OPERATION_NOT_VALID => 2150859219

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELLCOMMAND_CLIENTID_NOT_VALID => 2150859220

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_CLIENTID_NOT_VALID => 2150859221

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELLCOMMAND_CLIENTID_RESOURCE_CONFLICT => 2150859222

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELL_CLIENTID_RESOURCE_CONFLICT => 2150859223

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_SHELLCOMMAND_DISCONNECT_OPERATION_NOT_VALID => 2150859224

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SUBSCRIBE_WMI_INVALID_KEY => 2150859225

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_DISCONNECT_SHELL_FLAG => 2150859226

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_INVALID_SHELL_COMMAND_PAIR => 2150859227

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SEMANTICCALLBACK_TIMEDOUT => 2150859228

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVICE_REMOTE_ACCESS_DISABLED => 2150859229

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_SERVICE_STREAM_DISCONNECTED => 2150859230

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CREATESHELL_RUNAS_FAILED => 2150859231

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_XML_RUNAS_DISABLED => 2150859232

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_WRONG_METADATA => 2150859233

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_TYPE => 2150859234

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_REMOTE_CONNECTION_NOT_ALLOWED => 2150859235

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_SHELLS_PPQ => 2150859236

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_USERS_PPQ => 2150859237

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_PLUGINSHELLS_PPQ => 2150859238

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_PLUGINOPERATIONS_PPQ => 2150859239

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_OPERATIONS_USER_PPQ => 2150859240

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MAX_COMMANDS_PER_SHELL_PPQ => 2150859241

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_QUOTA_MIN_REQUIREMENT_NOT_AVAILABLE_PPQ => 2150859242

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NEW_DESERIALIZER => 2150859243

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DESERIALIZE_CLASS => 2150859244

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_GETCLASS => 2150859245

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NEW_SESSION => 2150859246

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_NULL_KEY => 2150859247

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MUTUAL_AUTH_FAILED => 2150859248

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_OCTETTYPE => 2150859249

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINRS_IDLETIMEOUT_OUTOFBOUNDS => 2150859250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INSUFFICIENT_METADATA_FOR_BASIC => 2150859251

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_INVALID_LITERAL_URI => 2150859252

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_OBJECTONLY_INVALID => 2150859253

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_MISSING_CLASSNAME => 2150859254

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_INVALID_ENCODING_IN_DELIVERY => 2150859255

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_DESTINATION_INVALID => 2150859256

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_UNSUPPORTED_FEATURE_IDENTIFY => 2150859257

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CLIENT_SESSION_UNUSABLE => 2150859258

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_VIRTUALACCOUNT_NOTSUPPORTED => 2150859259

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_VIRTUALACCOUNT_NOTSUPPORTED_DOWNLEVEL => 2150859260

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_RUNASUSER_MANAGEDACCOUNT_LOGON_FAILED => 2150859261

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_CERTMAPPING_CREDENTIAL_MANAGEMENT_FAILIED => 2150859262

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WSMAN_EVENTING_PUSH_SUBSCRIPTION_NOACTIVATE_EVENTSOURCE => 2150859263
;@endregion Constants

;@region Methods
    /**
     * Initializes the Windows Remote Management Client API.
     * @param {Integer} flags A flag of type <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_0</b> or <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b>.
     * The client that will use the disconnect-reconnect functionality should use the 
     * <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b> flag.
     * @param {Pointer<IntPtr>} apiHandle Defines a handle that uniquely identifies the client. This parameter cannot be <b>NULL</b>. When you have finished used the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmandeinitialize">WSManDeinitialize</a> method.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmaninitialize
     * @since windows8.0
     */
    static WSManInitialize(flags, apiHandle) {
        result := DllCall("WsmSvc.dll\WSManInitialize", "uint", flags, "ptr", apiHandle, "uint")
        return result
    }

    /**
     * Deinitializes the Windows Remote Management client stack.
     * @param {Pointer} apiHandle Specifies the API handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmandeinitialize
     * @since windows6.1
     */
    static WSManDeinitialize(apiHandle, flags) {
        result := DllCall("WsmSvc.dll\WSManDeinitialize", "ptr", apiHandle, "uint", flags, "uint")
        return result
    }

    /**
     * Retrieves the error messages associated with a particular error and language codes.
     * @param {Pointer} apiHandle Specifies the API handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter  cannot be <b>NULL</b>.
     * @param {Pointer<PWSTR>} languageCode Specifies the language code name that should be used to localize the error. For more information about the language code names, see the    RFC 3066 specification from the Internet Engineering Task Force at <a href="https://www.ietf.org/rfc/rfc3066.txt">http://www.ietf.org/rfc/rfc3066.txt</a>.  If a language code is not specified, the user interface language of the thread is  used.
     * @param {Integer} errorCode Specifies the error code for the requested error message. This error code can be a hexadecimal or decimal error code from a WinRM, WinHTTP, or other Windows operating system feature.
     * @param {Integer} messageLength Specifies the number of characters that can be stored in the output message buffer, including the <b>null</b> terminator. If this parameter is zero, the <i>message</i> parameter must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} message Specifies the output buffer to store the message in. This buffer must be allocated and deallocated by the client. The buffer must be large enough to store the message and the <b>null</b> terminator. If this parameter is <b>NULL</b>, the <i>messageLength</i> parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} messageLengthUsed Specifies the actual number of characters written to the output buffer, including the <b>null</b> terminator. This parameter cannot be <b>NULL</b>. If either the <i>messageLength</i> or <i>message</i> parameters are zero, the function will return <b>ERROR_INSUFFICIENT_BUFFER</b> and this parameter will be set to the number of characters needed to store the message, including the <b>null</b> terminator.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangeterrormessage
     * @since windows6.1
     */
    static WSManGetErrorMessage(apiHandle, languageCode, errorCode, messageLength, message, messageLengthUsed) {
        static flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("WsmSvc.dll\WSManGetErrorMessage", "ptr", apiHandle, "uint", flags, "ptr", languageCode, "uint", errorCode, "uint", messageLength, "ptr", message, "ptr", messageLengthUsed, "uint")
        return result
    }

    /**
     * Creates a session object.
     * @param {Pointer} apiHandle Specifies the API handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmaninitialize">WSManInitialize</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<PWSTR>} connection Indicates to which protocol and agent to connect. If this parameter is <b>NULL</b>, the 
     *        connection will default to localhost (127.0.0.1). This parameter can be a simple host name or a complete URL. 
     *        The format is the following:
     * 
     * [transport://]host[:port][/prefix] where:
     * 
     * <table>
     * <tr>
     * <th>Element</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * transport
     * 
     * </td>
     * <td>
     * Either HTTP or HTTPS. Default is HTTP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * host
     * 
     * </td>
     * <td>
     * Can be in a DNS name, NetBIOS name, or IP address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * port
     * 
     * </td>
     * <td>
     * Defaults to 80 for HTTP and to 443 for HTTPS. The defaults can be changed in the local configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * prefix
     * 
     * </td>
     * <td>
     * Any string. Default is "wsman". The default can be changed in the local configuration.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<WSMAN_AUTHENTICATION_CREDENTIALS>} serverAuthenticationCredentials Defines the authentication method such as Negotiate, Kerberos, Digest, Basic, or client certificate. If the authentication mechanism is Negotiate, Kerberos, Digest, or Basic, the structure can also contain the credentials used for authentication. If  client certificate authentication is used, the certificate thumbprint must be specified.
     * 
     * If credentials are specified, this parameter contains the user name and password of a local account or domain account. If this parameter is <b>NULL</b>, the default credentials are used. The default credentials are the credentials that the current thread is executing under. The client must explicitly specify the credentials when Basic or Digest authentication is used. If explicit credentials are used, both the user name and the password must be valid. For more information about the authentication credentials, see the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authentication_credentials">WSMAN_AUTHENTICATION_CREDENTIALS</a> structure.
     * @param {Pointer<WSMAN_PROXY_INFO>} proxyInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_proxy_info">WSMAN_PROXY_INFO</a> structure that specifies proxy information. This value can be <b>NULL</b>.
     * @param {Pointer<IntPtr>} session Defines the session handle that uniquely identifies the session. This parameter cannot be <b>NULL</b>. This handle  should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosesession">WSManCloseSession</a> method.
     * @returns {Integer} If the function succeeds, the return value is zero. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreatesession
     * @since windows6.1
     */
    static WSManCreateSession(apiHandle, connection, flags, serverAuthenticationCredentials, proxyInfo, session) {
        result := DllCall("WsmSvc.dll\WSManCreateSession", "ptr", apiHandle, "ptr", connection, "uint", flags, "ptr", serverAuthenticationCredentials, "ptr", proxyInfo, "ptr", session, "uint")
        return result
    }

    /**
     * Closes a session object.
     * @remarks
     * The <b>WSManCloseSession</b> method frees the memory associated with a session and closes all related operations before returning. This is a synchronous call.  All operations are explicitly canceled. It is recommended that all pending operations are either completed or explicitly canceled before calling this function.
     * @param {Pointer} session Specifies the session handle to close. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be NULL.
     * @param {Integer} flags Reserved for future use.  Must be zero.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanclosesession
     * @since windows6.1
     */
    static WSManCloseSession(session, flags) {
        result := DllCall("WsmSvc.dll\WSManCloseSession", "ptr", session, "uint", flags, "uint")
        return result
    }

    /**
     * Sets an extended set of options for the session.
     * @remarks
     * If the <b>WSManSetSessionOption</b> method is called with different values specified for the <i>option</i> parameter, the order of the different options is important. The first  time <b>WSManSetSessionOption</b> is called, the transport is set for the session. If a second call requests a different type of transport, the call will fail.
     * 
     * For example, the second method call will fail if the methods are called in the following order:
     * 
     * <ul>
     * <li><c>WSManSetSessionOption(WSMAN_OPTION_UNENCRYPTED_MESSAGES)</c></li>
     * <li><c>WSManSetSessionOption(WSMAN_OPTION_ALLOW_NEGOTIATE_IMPLICIT_CREDENTIALS)</c></li>
     * </ul>
     * The first method call sets the transport to HTTP because the <i>option</i> parameter is set to <b>WSMAN_OPTION_UNENCRYPTED_MESSAGES</b>.  The second call fails because the option that was passed is applicable for HTTPS and the transport was set to HTTP by the first message.
     * @param {Pointer} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Integer} option Specifies the option to be set. This parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
     * @param {Pointer<WSMAN_DATA>} data A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines the option value.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansetsessionoption
     * @since windows6.1
     */
    static WSManSetSessionOption(session, option, data) {
        result := DllCall("WsmSvc.dll\WSManSetSessionOption", "ptr", session, "int", option, "ptr", data, "uint")
        return result
    }

    /**
     * Gets the value of a session option. (WSManGetSessionOptionAsDword)
     * @param {Pointer} session Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Integer} option Specifies the option to get. Not all session options can be retrieved. The options are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
     * @param {Pointer<UInt32>} value Specifies the value of specified session option.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangetsessionoptionasdword
     * @since windows6.1
     */
    static WSManGetSessionOptionAsDword(session, option, value) {
        result := DllCall("WsmSvc.dll\WSManGetSessionOptionAsDword", "ptr", session, "int", option, "ptr", value, "uint")
        return result
    }

    /**
     * Gets the value of a session option. (WSManGetSessionOptionAsString)
     * @param {Pointer} session Specifies the session handle returned by a  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Integer} option Specifies the option to get. Not all session options can be retrieved. The values for the options are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmansessionoption">WSManSessionOption</a> enumeration.
     * @param {Integer} stringLength Specifies the length of the storage location for <i>string</i> parameter.
     * @param {Pointer<PWSTR>} string A pointer to the storage location for the value of the specified session option.
     * @param {Pointer<UInt32>} stringLengthUsed Specifies the length of the string returned in the <i>string</i> parameter.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmangetsessionoptionasstring
     * @since windows6.1
     */
    static WSManGetSessionOptionAsString(session, option, stringLength, string, stringLengthUsed) {
        result := DllCall("WsmSvc.dll\WSManGetSessionOptionAsString", "ptr", session, "int", option, "uint", stringLength, "ptr", string, "ptr", stringLengthUsed, "uint")
        return result
    }

    /**
     * Cancels or closes an asynchronous operation.
     * @remarks
     * The method de-allocates local and remote resources associated with the operation. After the <b>WSManCloseOperation</b> method is called, the <i>operationHandle</i> parameter cannot be passed to any other call. If the callback associated with the operation is pending and has not completed before <b>WSManCloseOperation</b> is called, the operation is marked for deletion and the method returns immediately.
     * @param {Pointer} operationHandle Specifies the operation handle to be closed.
     * @param {Integer} flags Reserved for future use. Set to zero.
     * @returns {Integer} This method returns zero on success. Otherwise, this method returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancloseoperation
     * @since windows6.1
     */
    static WSManCloseOperation(operationHandle, flags) {
        result := DllCall("WsmSvc.dll\WSManCloseOperation", "ptr", operationHandle, "uint", flags, "uint")
        return result
    }

    /**
     * Creates a shell object.
     * @param {Pointer} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<PWSTR>} resourceUri Defines the shell type to create. The shell type is defined by a unique URI. The actual shell object returned by the call is dependent on the URI specified. This parameter cannot be <b>NULL</b>. To create a Windows cmd.exe shell, use the <b>WSMAN_CMDSHELL_URI</b> resource URI.
     * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure that specifies the input and output streams, working directory, idle time-out, and options for the shell.
     * 
     * If this parameter is <b>NULL</b>, the default values will be used.
     * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell.
     * @param {Pointer<WSMAN_DATA>} createXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the shell. The content should be a valid XML string. This parameter can be <b>NULL</b>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method.
     * @param {Pointer<IntPtr>} shell Defines a shell handle that uniquely identifies the shell object. The resource handle is used to track the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreateshell
     * @since windows6.1
     */
    static WSManCreateShell(session, flags, resourceUri, startupInfo, options, createXml, async, shell) {
        DllCall("WsmSvc.dll\WSManCreateShell", "ptr", session, "uint", flags, "ptr", resourceUri, "ptr", startupInfo, "ptr", options, "ptr", createXml, "ptr", async, "ptr", shell)
    }

    /**
     * Starts the execution of a command within an existing shell and does not wait for the completion of the command.
     * @param {Pointer} shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<PWSTR>} commandLine Defines a required <b>null</b>-terminated string that represents the command to be executed. Typically, the command is specified without any arguments, which are specified separately. However, a user can specify the command line and all of the arguments by using this parameter. If arguments are specified for the <i>commandLine</i> parameter, the <i>args</i> parameter should be <b>NULL</b>.
     * @param {Pointer<WSMAN_COMMAND_ARG_SET>} args A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_command_arg_set">WSMAN_COMMAND_ARG_SET</a> structure that defines an array of argument values, which are passed to the command on creation. If no arguments are required, this parameter should be <b>NULL</b>.
     * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
     * @param {Pointer<IntPtr>} command Defines the command object associated with a command within a shell. This handle is returned on a successful call and is used to send and receive data and to signal the command. This handle should be closed  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanrunshellcommand
     * @since windows6.1
     */
    static WSManRunShellCommand(shell, flags, commandLine, args, options, async, command) {
        DllCall("WsmSvc.dll\WSManRunShellCommand", "ptr", shell, "uint", flags, "ptr", commandLine, "ptr", args, "ptr", options, "ptr", async, "ptr", command)
    }

    /**
     * Sends a control code to an existing command or to the shell itself.
     * @param {Pointer} shell Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Pointer} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call. If this value is <b>NULL</b>, the signal code is sent to the shell.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<PWSTR>} code Specifies the signal code to send to the command or shell.
     * The following codes are common.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method.
     * @param {Pointer<IntPtr>} signalOperation Defines the operation handle for the signal operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the signal operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansignalshell
     * @since windows6.1
     */
    static WSManSignalShell(shell, command, flags, code, async, signalOperation) {
        DllCall("WsmSvc.dll\WSManSignalShell", "ptr", shell, "ptr", command, "uint", flags, "ptr", code, "ptr", async, "ptr", signalOperation)
    }

    /**
     * Retrieves output from a running command or from the shell.
     * @param {Pointer} shell Specifies the shell handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Pointer} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<WSMAN_STREAM_ID_SET>} desiredStreamSet Specifies the requested output from a particular stream or a list of streams.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method.
     * @param {Pointer<IntPtr>} receiveOperation Defines the operation handle for the receive operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the receive operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreceiveshelloutput
     * @since windows6.1
     */
    static WSManReceiveShellOutput(shell, command, flags, desiredStreamSet, async, receiveOperation) {
        DllCall("WsmSvc.dll\WSManReceiveShellOutput", "ptr", shell, "ptr", command, "uint", flags, "ptr", desiredStreamSet, "ptr", async, "ptr", receiveOperation)
    }

    /**
     * Ipes the input stream to a running command or to the shell.
     * @param {Pointer} shell Specifies the shell handle returned by a  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Pointer} command Specifies the command handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.  This handle  should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<PWSTR>} streamId Specifies the input stream ID. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<WSMAN_DATA>} streamData Uses the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure to specify the stream data to be sent to the command or shell. This structure should be allocated by the calling client and must remain allocated until <b>WSManSendShellInput</b> completes. If the end of the stream has been reached, the <i>endOfStream</i> parameter should be set to <b>TRUE</b>.
     * @param {Integer} endOfStream Set to <b>TRUE</b>, if the end of the stream has been reached. Otherwise, this parameter is set to <b>FALSE</b>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
     * @param {Pointer<IntPtr>} sendOperation Defines the operation handle for the send operation. This handle is returned from a successful call of the function and can be used to asynchronously cancel the send operation. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmansendshellinput
     * @since windows6.1
     */
    static WSManSendShellInput(shell, command, flags, streamId, streamData, endOfStream, async, sendOperation) {
        DllCall("WsmSvc.dll\WSManSendShellInput", "ptr", shell, "ptr", command, "uint", flags, "ptr", streamId, "ptr", streamData, "int", endOfStream, "ptr", async, "ptr", sendOperation)
    }

    /**
     * Deletes a command and frees the resources that are associated with it.
     * @param {Pointer} commandHandle Specifies the command handle to be closed. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call.
     * @param {Integer} flags Reserved for future use.
     * Must be set to zero.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanclosecommand
     * @since windows6.1
     */
    static WSManCloseCommand(commandHandle, flags, async) {
        DllCall("WsmSvc.dll\WSManCloseCommand", "ptr", commandHandle, "uint", flags, "ptr", async)
    }

    /**
     * Deletes a shell object and frees the resources associated with the shell.
     * @param {Pointer} shellHandle Specifies the shell handle to close. This handle is returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call.  This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information.  This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancloseshell
     * @since windows6.1
     */
    static WSManCloseShell(shellHandle, flags, async) {
        DllCall("WsmSvc.dll\WSManCloseShell", "ptr", shellHandle, "uint", flags, "ptr", async)
    }

    /**
     * Creates a shell object by using the same functionality as the WSManCreateShell function, with the addition of a client-specified shell ID.
     * @param {Pointer} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be 0.
     * @param {Pointer<PWSTR>} resourceUri Defines the shell type to create. The shell type is defined by a unique URI. The actual shell object returned by the call is dependent on the URI specified. This parameter cannot be <b>NULL</b>. To create a Windows cmd.exe shell, use the <b>WSMAN_CMDSHELL_URI</b> resource URI.
     * @param {Pointer<PWSTR>} shellId The client specified <i>shellID</i>.
     * @param {Pointer<WSMAN_SHELL_STARTUP_INFO_V11>} startupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure that specifies the input and output streams, working directory, idle timeout, and options for the shell. If this parameter is <b>NULL</b>, the default values will be used.
     * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell.
     * @param {Pointer<WSMAN_DATA>} createXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the shell. The content should be a valid XML string. This parameter can be <b>NULL</b>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method.
     * @param {Pointer<IntPtr>} shell Defines a shell handle that uniquely identifies the shell object. The resource handle is used to track the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmancreateshellex
     * @since windows8.0
     */
    static WSManCreateShellEx(session, flags, resourceUri, shellId, startupInfo, options, createXml, async, shell) {
        DllCall("WsmSvc.dll\WSManCreateShellEx", "ptr", session, "uint", flags, "ptr", resourceUri, "ptr", shellId, "ptr", startupInfo, "ptr", options, "ptr", createXml, "ptr", async, "ptr", shell)
    }

    /**
     * Provides the same functionality as the WSManRunShellCommand function, with the addition of a command ID option.
     * @param {Pointer} shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be 0.
     * @param {Pointer<PWSTR>} commandId The client specified command Id.
     * @param {Pointer<PWSTR>} commandLine Defines a required null-terminated string that represents the command to be executed. Typically, the command is specified without any arguments, which are specified separately. However, a user can specify the command line and all of the arguments by using this parameter. If arguments are specified for the commandLine parameter, the args parameter should be <b>NULL</b>.
     * @param {Pointer<WSMAN_COMMAND_ARG_SET>} args A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_command_arg_set">WSMAN_COMMAND_ARG_SET</a> structure that defines an array of argument values, which are passed to the command on creation. If no arguments are required, this parameter should be <b>NULL</b>.
     * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure. The asynchronous structure contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be <b>NULL</b> and should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method.
     * @param {Pointer<IntPtr>} command Defines the command object associated with a command within a shell. This handle is returned on a successful call and is used to send and receive data and to signal the command. This handle should be closed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanrunshellcommandex
     * @since windows8.0
     */
    static WSManRunShellCommandEx(shell, flags, commandId, commandLine, args, options, async, command) {
        DllCall("WsmSvc.dll\WSManRunShellCommandEx", "ptr", shell, "uint", flags, "ptr", commandId, "ptr", commandLine, "ptr", args, "ptr", options, "ptr", async, "ptr", command)
    }

    /**
     * Disconnects the network connection of an active shell and its associated commands.
     * @remarks
     * This function suspends network connection to an actively connected server session. Any operations performed on 
     *     the shell instance, like <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a>, 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansendshellinput">WSManSendShellInput</a>, or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansignalshell">WSManSignalShell</a>, are bound to complete before 
     *     disconnection. This ensures that any data sent through 
     *     <b>WSManSendShellInput</b> is received by the server 
     *     session before the shell disconnects. The client can optionally modify the server buffering mode by using flags. 
     *     The following behavior is observed:
     * 
     * <ul>
     * <li>
     * <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP</b>–When buffers are full, 
     *        the server drops earlier data in response stream buffers to ensure the corresponding command operation 
     *        continues to run.
     * 
     * </li>
     * <li>
     * <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK</b>–When response stream 
     *        buffers are full, the server blocks command execution. If no flag is specified, the server continues to use 
     *        either the configured mode or the mode specified when the shell was created. In case of a network failure, if 
     *        the client is unable to contact the session to disconnect the shell, the following error is returned:
     * 
     * <b>ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_GRACEFUL</b>
     * 
     * The client session still goes into a disconnected state, but it is not guaranteed that any prior operations 
     *        have completed before the session is disconnected.
     * 
     * </li>
     * </ul>
     * @param {Pointer} shell Specifies the handle returned by a call to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> function. This parameter cannot 
     *       be <b>NULL</b>.
     * @param {Integer} flags Can be a <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_DROP</b> flag or a 
     *       <b>WSMAN_FLAG_SERVER_BUFFERING_MODE_BLOCK</b> flag.
     * @param {Pointer<UInt32>} disconnectInfo A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_disconnect_info">WSMAN_SHELL_DISCONNECT_INFO</a> structure 
     *       that specifies an idle time-out that the server session may enforce. If this parameter is 
     *       <b>NULL</b>, the server session idle time-out will not be changed.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This 
     *       parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmandisconnectshell
     * @since windows8.0
     */
    static WSManDisconnectShell(shell, flags, disconnectInfo, async) {
        DllCall("WsmSvc.dll\WSManDisconnectShell", "ptr", shell, "uint", flags, "ptr", disconnectInfo, "ptr", async)
    }

    /**
     * Reconnects a previously disconnected shell session. To reconnect the shell session's associated commands, use WSManReconnectShellCommand.
     * @param {Pointer} shell Specifies the handle returned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> function. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags This parameter is reserved for future use and must be set to zero.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreconnectshell
     * @since windows8.0
     */
    static WSManReconnectShell(shell, flags, async) {
        DllCall("WsmSvc.dll\WSManReconnectShell", "ptr", shell, "uint", flags, "ptr", async)
    }

    /**
     * Reconnects a previously disconnected command.
     * @param {Pointer} commandHandle Specifies the handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanrunshellcommand">WSManRunShellCommand</a> call or a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanconnectshellcommand">WSManConnectShellCommand</a> call. This parameter cannot be NULL.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure which will contain an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanreconnectshellcommand
     * @since windows8.0
     */
    static WSManReconnectShellCommand(commandHandle, flags, async) {
        DllCall("WsmSvc.dll\WSManReconnectShellCommand", "ptr", commandHandle, "uint", flags, "ptr", async)
    }

    /**
     * Connects to an existing server session.
     * @remarks
     * Connects to an existing server shell session identified by the <i>ShellId</i> parameter. This builds the necessary client side context, represented by the return parameter shell, that can be used to carry out subsequent operations such as running commands and sending and receiving output on the server shell session. 
     * This <b>WSManConnectShell</b> function does not automatically construct the client side contexts for any commands that are currently associated with the server shell session.
     * @param {Pointer} session Specifies the session handle returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreatesession">WSManCreateSession</a> function. This parameter cannot be NULL.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<PWSTR>} resourceUri Defines the shell type  to which the connection will be made. The shell type is defined by a unique URI, therefore the shell object returned by the call is dependent on the URI that is specified by this parameter. The <i>resourceUri</i> parameter cannot be NULL and it is a null-terminated string.
     * @param {Pointer<PWSTR>} shellID Specifies the shell identifier that is associated with the server shell session to which the client intends to connect.
     * @param {Pointer<WSMAN_OPTION_SET>} options A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies a set of options for the shell. This parameter is optional.
     * @param {Pointer<WSMAN_DATA>} connectXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the connect shell operation. The content should be a valid XML string. This parameter can be NULL.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure that contains an optional user context and a mandatory callback function. See the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a> structure for more information. This parameter cannot be NULL.
     * @param {Pointer<IntPtr>} shell Specifies a shell handle that uniquely identifies the shell object that was returned by <i>resourceURI</i>. The resource handle tracks the client endpoint for the shell and is used by other WinRM methods to interact with the shell object. The shell object should be deleted by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method. This parameter cannot be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanconnectshell
     * @since windows8.0
     */
    static WSManConnectShell(session, flags, resourceUri, shellID, options, connectXml, async, shell) {
        DllCall("WsmSvc.dll\WSManConnectShell", "ptr", session, "uint", flags, "ptr", resourceUri, "ptr", shellID, "ptr", options, "ptr", connectXml, "ptr", async, "ptr", shell)
    }

    /**
     * Connects to an existing command running in a shell.
     * @param {Pointer} shell Specifies the shell handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> call. This parameter cannot be <b>NULL</b>.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<PWSTR>} commandID A null-terminated string that identifies a specific command, currently running in the server session, that the client intends to connect to.
     * @param {Pointer<WSMAN_OPTION_SET>} options Defines a set of options for the command. These options are passed to the service to modify or refine the command execution. This parameter can be <b>NULL</b>. For more information about the options, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a>.
     * @param {Pointer<WSMAN_DATA>} connectXml A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that defines an open context for the connect shell operation. The content must be a valid XML string. This parameter can be <b>NULL</b>.
     * @param {Pointer<WSMAN_SHELL_ASYNC>} async Defines an asynchronous structure to contain an optional user context and a mandatory callback function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_async">WSMAN_SHELL_ASYNC</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<IntPtr>} command This handle is returned on a successful call and is used to send and receive data and to signal the command. When you have finished using this handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> method. This parameter cannot be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanconnectshellcommand
     * @since windows8.0
     */
    static WSManConnectShellCommand(shell, flags, commandID, options, connectXml, async, command) {
        DllCall("WsmSvc.dll\WSManConnectShellCommand", "ptr", shell, "uint", flags, "ptr", commandID, "ptr", options, "ptr", connectXml, "ptr", async, "ptr", command)
    }

    /**
     * Reports shell and command context back to the Windows Remote Management (WinRM) infrastructure so that further operations can be performed against the shell and/or command.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<Void>} context Defines the value to pass into all future shell and command operations. Represents either the shell or the command. This value should be unique for all shells, and it should also be unique for all commands associated with a shell.
     * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code.  If this method returns an error, the plug-in should shut down the current operation and call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginreportcontext
     * @since windows6.1
     */
    static WSManPluginReportContext(requestDetails, flags, context) {
        result := DllCall("WsmSvc.dll\WSManPluginReportContext", "ptr", requestDetails, "uint", flags, "ptr", context, "uint")
        return result
    }

    /**
     * Reports results for the WSMAN_PLUGIN_RECEIVE plug-in call and is used by most shell plug-ins that return results.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<PWSTR>} stream Specifies the stream that the data is associated with. Any stream can be used, but the standard streams are STDIN, STDOUT, and STDERR.
     * @param {Pointer<WSMAN_DATA>} streamResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies the result object that is returned to the client. The result can be in either binary or XML format.
     * @param {Pointer<PWSTR>} commandState 
     * @param {Integer} exitCode Ignored in all cases except when <i>commandState</i> is either <b>WSMAN_RECEIVE_STATE_NORMAL_TERMINATION</b> or <b>WSMAN_RECEIVE_STATE_ABNORMAL_TERMINATION</b>. Each result can have separate error codes. If the command or stream has failed, the plug-in must call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginreceiveresult
     * @since windows6.1
     */
    static WSManPluginReceiveResult(requestDetails, flags, stream, streamResult, commandState, exitCode) {
        result := DllCall("WsmSvc.dll\WSManPluginReceiveResult", "ptr", requestDetails, "uint", flags, "ptr", stream, "ptr", streamResult, "ptr", commandState, "uint", exitCode, "uint")
        return result
    }

    /**
     * Reports the completion of an operation by all operation entry points except for the WSManPluginStartup and WSManPluginShutdown methods.
     * @remarks
     * The <b>WSManPluginOperationComplete</b> function is used to report the completion of the 
     * data stream for <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_receive">WSManPluginReceive</a>.  The <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_shell">WSManPluginShell</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_command">WSManPluginCommand</a> operations must also call this function when the shell and command operations are complete.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Integer} errorCode Reports any failure in the operation. If this parameter is not <b>NO_ERROR</b>, any result data that has not been sent will be discarded and the error will be sent.
     * @param {Pointer<PWSTR>} extendedInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
     * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code. If the operation is unsuccessful, the plug-in must stop the current operation and clean up any data associated with this operation. The <i>requestDetails</i> structure is not valid if an error is received and must not be passed to any other WinRM (WinRM) method.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginoperationcomplete
     * @since windows6.1
     */
    static WSManPluginOperationComplete(requestDetails, flags, errorCode, extendedInformation) {
        result := DllCall("WsmSvc.dll\WSManPluginOperationComplete", "ptr", requestDetails, "uint", flags, "uint", errorCode, "ptr", extendedInformation, "uint")
        return result
    }

    /**
     * Gets operational information for items such as time-outs and data restrictions that are associated with the operation.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @param {Integer} flags 
     * @param {Pointer<WSMAN_DATA>} data A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_data">WSMAN_DATA</a> structure that specifies the result object.
     * @returns {Integer} The method returns <b>NO_ERROR</b> if it succeeded; otherwise,  it returns an error code. The following are the most common error codes:
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanplugingetoperationparameters
     * @since windows6.1
     */
    static WSManPluginGetOperationParameters(requestDetails, flags, data) {
        result := DllCall("WsmSvc.dll\WSManPluginGetOperationParameters", "ptr", requestDetails, "uint", flags, "ptr", data, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pluginContext 
     * @param {Integer} flags 
     * @param {Pointer<WSMAN_DATA>} data 
     * @returns {Integer} 
     */
    static WSManPluginGetConfiguration(pluginContext, flags, data) {
        result := DllCall("WsmSvc.dll\WSManPluginGetConfiguration", "ptr", pluginContext, "uint", flags, "ptr", data, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pluginContext 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static WSManPluginReportCompletion(pluginContext, flags) {
        result := DllCall("WsmSvc.dll\WSManPluginReportCompletion", "ptr", pluginContext, "uint", flags, "uint")
        return result
    }

    /**
     * Releases memory that is allocated for the WSMAN_PLUGIN_REQUEST structure, which is passed into operation plug-in entry points.
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_plugin_request">WSMAN_PLUGIN_REQUEST</a> structure that specifies the resource URI, options, locale, shutdown flag, and handle for the request.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginfreerequestdetails
     * @since windows6.1
     */
    static WSManPluginFreeRequestDetails(requestDetails) {
        result := DllCall("WsmSvc.dll\WSManPluginFreeRequestDetails", "ptr", requestDetails, "uint")
        return result
    }

    /**
     * Reports either a successful or failed user connection authorization.
     * @remarks
     * If the impersonation token passed into <i>senderDetails</i> is not the identity with which the operation should be performed, or if no impersonation token is available and the plug-in specifies a new  identity to carry out the request, the plug-in should return the new <i>impersonationToken</i> that the WSMan infrastructure will use to impersonate the client before calling into the operation plug-in. If an impersonation token is provided in the <i>senderDetails</i> and the plug-in wants to carry out the operation under that identity, the plug-in should copy the impersonation token from the <i>senderDetails</i> into the <i>impersonationToken</i> parameter. If the plug-in wants to carry out the request under the context of the Internet Information Services (IIS) host process, the <i>impersonationToken</i> should be <b>NULL</b>. If the <i>impersonationToken</i> is <b>NULL</b>, the thread will impersonate the process token before calling into the operation plug-in. 
     * 
     * If the <i>userIsAdministrator</i> parameter is set to <b>TRUE</b>, the user is allowed to view and delete shells owned by different users.
     * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_user">WSManPluginAuthzUser</a> plug-in call.
     * @param {Integer} flags Reserved for future use. Must be set to zero.
     * @param {Pointer<Void>} userAuthorizationContext Specifies a plug-in defined context that is used to help track user context information. This context can be returned to multiple calls, to this call, or to an operation call.  The plug-in manages reference counting for all calls.  If the user record times out or re-authorization is required, the WinRM infrastructure calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_release_context">WSManPluginAuthzReleaseContext</a>.
     * @param {Pointer<HANDLE>} impersonationToken Specifies the identity of the user. This parameter is the  <i>clientToken</i> that was passed into <i>senderDetails</i>. If the plug-in changes the user context, a new impersonation token should be returned.
     * 
     * <div class="alert"><b>Note</b>  This token is released after the operation has been completed.</div>
     * <div> </div>
     * @param {Integer} userIsAdministrator Set to <b>TRUE</b> if the user is an administrator. Otherwise, this parameter is <b>FALSE</b>.
     * @param {Integer} errorCode Reports either a successful or failed authorization.  If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>.  If the user is not authorized to perform the operation,  the error  should be <b>ERROR_ACCESS_DENIED</b>.  If a failure happens for any other reason, an appropriate error code should be used.  Any error from this call will be sent back as a SOAP fault packet.
     * @param {Pointer<PWSTR>} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
     * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzusercomplete
     * @since windows6.1
     */
    static WSManPluginAuthzUserComplete(senderDetails, flags, userAuthorizationContext, impersonationToken, userIsAdministrator, errorCode, extendedErrorInformation) {
        result := DllCall("WsmSvc.dll\WSManPluginAuthzUserComplete", "ptr", senderDetails, "uint", flags, "ptr", userAuthorizationContext, "ptr", impersonationToken, "int", userIsAdministrator, "uint", errorCode, "ptr", extendedErrorInformation, "uint")
        return result
    }

    /**
     * Reports either a successful or failed authorization for a user operation.
     * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_operation">WSManPluginAuthzOperation</a> plug-in call.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<Void>} userAuthorizationContext Specifies a plug-in defined context that is used to help track user context information. This context can be returned to multiple calls, to this call, or to an operation call.  The plug-in manages reference counting for all calls.  If the user record times out or re-authorization is required, the WinRM (WinRM) infrastructure calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_release_context">WSManPluginAuthzReleaseContext</a>.
     * @param {Integer} errorCode Reports either a successful or failed authorization.  If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>.  If the user is not authorized to perform the operation,  the error  should be <b>ERROR_ACCESS_DENIED</b>.  If a failure happens for any other reason,  an appropriate error code should be used.  Any error from this call will be sent back as a Simple Object Access Protocol (SOAP) fault packet.
     * @param {Pointer<PWSTR>} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
     * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzoperationcomplete
     * @since windows6.1
     */
    static WSManPluginAuthzOperationComplete(senderDetails, flags, userAuthorizationContext, errorCode, extendedErrorInformation) {
        result := DllCall("WsmSvc.dll\WSManPluginAuthzOperationComplete", "ptr", senderDetails, "uint", flags, "ptr", userAuthorizationContext, "uint", errorCode, "ptr", extendedErrorInformation, "uint")
        return result
    }

    /**
     * Called from the WSManPluginAuthzQueryQuota plug-in entry point and must be called whether or not the plug-in can carry out the request.
     * @remarks
     * If the <i>quota</i> parameter is <b>null</b> and the <i>errorCode</i> is <b>NO_ERROR</b>, the method returns <b>ERROR_INVALID_PARAMETER</b> and the plug-in returns the default quota information.  If the plug-in is not returning a quota, the authorization plug-in should not specify that quotas are available in the configuration because performance might be affected.
     * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails A pointer  to the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_sender_details">WSMAN_SENDER_DETAILS</a> structure that was passed into the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_plugin_authorize_query_quota">WSManPluginAuthzQueryQuota</a> plug-in call.
     * @param {Integer} flags Reserved for future use. Must be zero.
     * @param {Pointer<WSMAN_AUTHZ_QUOTA>} quota A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_authz_quota">WSMAN_AUTHZ_QUOTA</a> structure that specifies quota information for a specific user.
     * @param {Integer} errorCode Reports either a successful or failed authorization.   If the authorization is successful, the code  should be <b>ERROR_SUCCESS</b>. If a failure happens for any other reason, an appropriate error code should be used.  Any error from this call will be sent back as a Simple Object Access Protocol (SOAP) fault packet.
     * @param {Pointer<PWSTR>} extendedErrorInformation Specifies an XML document that contains any extra error information that needs to be reported to the client. This parameter is ignored if <i>errorCode</i> is <b>NO_ERROR</b>. The user interface language of the thread should be used for localization.
     * @returns {Integer} The method returns <b>ERROR_SUCCESS</b> if it succeeded; otherwise,  it returns <b>ERROR_INVALID_PARAMETER</b>.  If <b>ERROR_INVALID_PARAMETER</b> is returned, either  the <i>senderDetails</i> parameter was <b>NULL</b> or the <i>flags</i> parameter was not zero.   If the method fails, the default quota is used.
     * @see https://learn.microsoft.com/windows/win32/api/wsman/nf-wsman-wsmanpluginauthzqueryquotacomplete
     * @since windows6.1
     */
    static WSManPluginAuthzQueryQuotaComplete(senderDetails, flags, quota, errorCode, extendedErrorInformation) {
        result := DllCall("WsmSvc.dll\WSManPluginAuthzQueryQuotaComplete", "ptr", senderDetails, "uint", flags, "ptr", quota, "uint", errorCode, "ptr", extendedErrorInformation, "uint")
        return result
    }

;@endregion Methods
}
