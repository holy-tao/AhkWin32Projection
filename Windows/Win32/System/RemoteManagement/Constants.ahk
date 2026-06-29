#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_REQUESTED_API_VERSION_1_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_REQUESTED_API_VERSION_1_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_OPERATION_INFOV1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_OPERATION_INFOV2 := 2864434397

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_DEFAULT_TIMEOUT_MS := 60000

/**
 * @type {String}
 */
export global WSMAN_STREAM_ID_STDIN := "stdin"

/**
 * @type {String}
 */
export global WSMAN_STREAM_ID_STDOUT := "stdout"

/**
 * @type {String}
 */
export global WSMAN_STREAM_ID_STDERR := "stderr"

/**
 * @type {String}
 */
export global WSMAN_SHELL_NS := "http://schemas.microsoft.com/wbem/wsman/1/windows/shell"

/**
 * @type {String}
 */
export global WSMAN_CMDSHELL_OPTION_CODEPAGE := "WINRS_CODEPAGE"

/**
 * @type {String}
 */
export global WSMAN_SHELL_OPTION_NOPROFILE := "WINRS_NOPROFILE"

/**
 * @type {String}
 */
export global WSMAN_CMDSHELL_OPTION_CONSOLEMODE_STDIN := "WINRS_CONSOLEMODE_STDIN"

/**
 * @type {String}
 */
export global WSMAN_CMDSHELL_OPTION_SKIP_CMD_SHELL := "WINRS_SKIP_CMD_SHELL"

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_RECEIVE_RESULT_NO_MORE_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_RECEIVE_FLUSH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_RECEIVE_RESULT_DATA_BOUNDARY := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_MAX_ENVELOPE_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_TIMEOUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_REMAINING_RESULT_SIZE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_LARGEST_RESULT_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_GET_REQUESTED_LOCALE := 5

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_GET_REQUESTED_DATA_LOCALE := 6

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_SHAREDHOST := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_RUNAS_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_AUTORESTART := 3

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_HOSTIDLETIMEOUTSECONDS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_PARAMS_NAME := 5

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_STARTUP_REQUEST_RECEIVED := 0

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_STARTUP_AUTORESTARTED_REBOOT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_STARTUP_AUTORESTARTED_CRASH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_SHUTDOWN_SYSTEM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_SHUTDOWN_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_SHUTDOWN_IISHOST := 3

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_PLUGIN_SHUTDOWN_IDLETIMEOUT_ELAPSED := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSMAN_FLAG_SEND_NO_MORE_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESOURCE_NOT_FOUND := 2150858752

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_ACTIONURI := 2150858753

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_URI := 2150858754

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PROVIDER_FAILURE := 2150858755

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_BATCH_COMPLETE := 2150858756

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CORRUPTED := 2150858757

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PULL_IN_PROGRESS := 2150858758

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATION_CLOSED := 2150858759

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIPTION_CLOSED := 2150858760

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIPTION_CLOSE_IN_PROGRESS := 2150858761

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIPTION_CLIENT_DID_NOT_CALL_WITHIN_HEARTBEAT := 2150858762

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIPTION_NO_HEARTBEAT := 2150858763

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_TIMEOUT := 2150858764

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SOAP_VERSION_MISMATCH := 2150858765

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SOAP_DATA_ENCODING_UNKNOWN := 2150858766

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_MESSAGE_INFORMATION_HEADER := 2150858767

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SOAP_FAULT_MUST_UNDERSTAND := 2150858768

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MESSAGE_INFORMATION_HEADER_REQUIRED := 2150858769

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DESTINATION_UNREACHABLE := 2150858770

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ACTION_NOT_SUPPORTED := 2150858771

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENDPOINT_UNAVAILABLE := 2150858772

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_REPRESENTATION := 2150858773

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_INVALID_EXPIRATION_TIME := 2150858774

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_UNSUPPORTED_EXPIRATION_TIME := 2150858775

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_FILTERING_NOT_SUPPORTED := 2150858776

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_FILTER_DIALECT_REQUESTED_UNAVAILABLE := 2150858777

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_CANNOT_PROCESS_FILTER := 2150858778

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_INVALID_ENUMERATION_CONTEXT := 2150858779

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_TIMED_OUT := 2150858780

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_UNABLE_TO_RENEW := 2150858781

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_DELIVERY_MODE_REQUESTED_UNAVAILABLE := 2150858782

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_EXPIRATION_TIME := 2150858783

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_UNSUPPORTED_EXPIRATION_TYPE := 2150858784

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_FILTERING_NOT_SUPPORTED := 2150858785

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_FILTERING_REQUESTED_UNAVAILABLE := 2150858786

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_SOURCE_UNABLE_TO_PROCESS := 2150858787

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_UNABLE_TO_RENEW := 2150858788

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_MESSAGE := 2150858789

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENVELOPE_TOO_LARGE := 2150858790

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SOAP_BODY := 2150858791

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_RESUMPTION_CONTEXT := 2150858792

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPERATION_TIMEDOUT := 2150858793

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESUMPTION_NOT_SUPPORTED := 2150858794

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESUMPTION_TYPE_NOT_SUPPORTED := 2150858795

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_ENCODING := 2150858796

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URI_LIMIT := 2150858797

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_PROPOSED_ID := 2150858798

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_BATCH_PARAMETER := 2150858799

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_ACK := 2150858800

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ACTION_MISMATCH := 2150858801

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONCURRENCY := 2150858802

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ALREADY_EXISTS := 2150858803

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DELIVERY_REFUSED := 2150858804

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENCODING_LIMIT := 2150858805

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FAILED_AUTHENTICATION := 2150858806

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INCOMPATIBLE_EPR := 2150858807

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_BOOKMARK := 2150858808

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_OPTIONS := 2150858809

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_PARAMETER := 2150858810

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_RESOURCE_URI := 2150858811

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SYSTEM := 2150858812

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SELECTORS := 2150858813

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_METADATA_REDIRECT := 2150858814

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_LIMIT := 2150858815

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RENAME_FAILURE := 2150858816

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SCHEMA_VALIDATION_ERROR := 2150858817

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_FEATURE := 2150858818

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML := 2150858819

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_KEY := 2150858820

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DELIVER_IN_PROGRESS := 2150858821

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SYSTEM_NOT_FOUND := 2150858822

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAX_ENVELOPE_SIZE := 2150858823

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAX_ENVELOPE_SIZE_EXCEEDED := 2150858824

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVER_ENVELOPE_LIMIT := 2150858825

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SELECTOR_LIMIT := 2150858826

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPTION_LIMIT := 2150858827

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CHARACTER_SET := 2150858828

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNREPORTABLE_SUCCESS := 2150858829

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WHITESPACE := 2150858830

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FILTERING_REQUIRED := 2150858831

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_BOOKMARK_EXPIRED := 2150858832

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPTIONS_NOT_SUPPORTED := 2150858833

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPTIONS_INVALID_NAME := 2150858834

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPTIONS_INVALID_VALUE := 2150858835

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PARAMETER_TYPE_MISMATCH := 2150858836

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_PARAMETER_NAME := 2150858837

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML_VALUES := 2150858838

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML_MISSING_VALUES := 2150858839

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML_NAMESPACE := 2150858840

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML_FRAGMENT := 2150858841

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INSUFFCIENT_SELECTORS := 2150858842

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNEXPECTED_SELECTORS := 2150858843

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SELECTOR_TYPEMISMATCH := 2150858844

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SELECTOR_VALUE := 2150858845

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_AMBIGUOUS_SELECTORS := 2150858846

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DUPLICATE_SELECTORS := 2150858847

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_TARGET_SELECTORS := 2150858848

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_TARGET_RESOURCEURI := 2150858849

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_TARGET_SYSTEM := 2150858850

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_TARGET_ALREADY_EXISTS := 2150858851

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_AUTHORIZATION_MODE_NOT_SUPPORTED := 2150858852

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ACK_NOT_SUPPORTED := 2150858853

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OPERATION_TIMEOUT_NOT_SUPPORTED := 2150858854

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_LOCALE_NOT_SUPPORTED := 2150858855

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EXPIRATION_TIME_NOT_SUPPORTED := 2150858856

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DELIVERY_RETRIES_NOT_SUPPORTED := 2150858857

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HEARTBEATS_NOT_SUPPORTED := 2150858858

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_BOOKMARKS_NOT_SUPPORTED := 2150858859

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAXITEMS_NOT_SUPPORTED := 2150858860

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAXTIME_NOT_SUPPORTED := 2150858861

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAXENVELOPE_SIZE_NOT_SUPPORTED := 2150858862

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAXENVELOPE_POLICY_NOT_SUPPORTED := 2150858863

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FILTERING_REQUIRED_NOT_SUPPORTED := 2150858864

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INSECURE_ADDRESS_NOT_SUPPORTED := 2150858865

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FORMAT_MISMATCH_NOT_SUPPORTED := 2150858866

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FORMAT_SECURITY_TOKEN_NOT_SUPPORTED := 2150858867

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_BAD_METHOD := 2150858868

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_MEDIA := 2150858869

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_ADDRESSING_MODE := 2150858870

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FRAGMENT_TRANSFER_NOT_SUPPORTED := 2150858871

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATION_INITIALIZING := 2150858872

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONNECTOR_GET := 2150858873

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URI_QUERY_STRING_SYNTAX_ERROR := 2150858874

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INEXISTENT_MAC_ADDRESS := 2150858875

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_UNICAST_ADDRESSES := 2150858876

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_DHCP_ADDRESSES := 2150858877

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MIN_ENVELOPE_SIZE := 2150858878

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EPR_NESTING_EXCEEDED := 2150858879

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REQUEST_INIT_ERROR := 2150858880

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_TIMEOUT_HEADER := 2150858881

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_NOT_FOUND := 2150858882

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PLUGIN_FAILED := 2150858883

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATION_INVALID := 2150858884

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CANNOT_CHANGE_MUTUAL := 2150858885

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATION_MODE_UNSUPPORTED := 2150858886

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MUSTUNDERSTAND_ON_LOCALE_UNSUPPORTED := 2150858887

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_POLICY_CORRUPTED := 2150858888

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_LISTENER_ADDRESS_INVALID := 2150858889

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CANNOT_CHANGE_GPO_CONTROLLED_SETTING := 2150858890

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_CONCURRENT_CLIENT_RECEIVE := 2150858891

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_FAST_SENDER := 2150858892

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INSECURE_PUSHSUBSCRIPTION_CONNECTION := 2150858893

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_EVENTSOURCE := 2150858894

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_NOMATCHING_LISTENER := 2150858895

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FRAGMENT_DIALECT_REQUESTED_UNAVAILABLE := 2150858896

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MISSING_FRAGMENT_PATH := 2150858897

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_FRAGMENT_DIALECT := 2150858898

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_FRAGMENT_PATH := 2150858899

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INCOMPATIBLE_BATCHPARAMS_AND_DELIVERYMODE := 2150858900

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_LOOPBACK_TESTFAILED := 2150858901

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_ENDTO_ADDRESSS := 2150858902

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_INCOMING_EVENT_PACKET_HEADER := 2150858903

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SESSION_ALREADY_CLOSED := 2150858904

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIPTION_LISTENER_NOLONGERVALID := 2150858905

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PROVIDER_LOAD_FAILED := 2150858906

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_SUBSCRIPTIONCLOSED_BYREMOTESERVICE := 2150858907

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_DELIVERYFAILED_FROMSOURCE := 2150858908

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SECURITY_UNMAPPED := 2150858909

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_SUBSCRIPTION_CANCELLED_BYSOURCE := 2150858910

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_HOSTNAME_PATTERN := 2150858911

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_MISSING_NOTIFYTO := 2150858912

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_MISSING_NOTIFYTO_ADDRESSS := 2150858913

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_NOTIFYTO_ADDRESSS := 2150858914

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_LOCALE_IN_DELIVERY := 2150858915

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_HEARTBEAT := 2150858916

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MACHINE_OPTION_REQUIRED := 2150858917

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_FEATURE_OPTIONS := 2150858918

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_BATCHSIZE_TOO_SMALL := 2150858919

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_DELIVERY_MODE_REQUESTED_INVALID := 2150858920

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PROVSYS_NOT_SUPPORTED := 2150858921

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PUSH_SUBSCRIPTION_CONFIG_INVALID := 2150858922

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREDS_PASSED_WITH_NO_AUTH_FLAG := 2150858923

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_FLAG := 2150858924

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MULTIPLE_AUTH_FLAGS := 2150858925

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SPN_WRONG_AUTH := 2150858926

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERT_UNNEEDED_CREDS := 2150858927

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_USERNAME_PASSWORD_NEEDED := 2150858928

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERT_UNNEEDED_USERNAME := 2150858929

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREDENTIALS_NEEDED := 2150858930

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREDENTIALS_FLAG_NEEDED := 2150858931

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERT_NEEDED := 2150858932

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERT_UNKNOWN_TYPE := 2150858933

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERT_UNKNOWN_LOCATION := 2150858934

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_CERT := 2150858935

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_LOCAL_INVALID_CREDS := 2150858936

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_LOCAL_INVALID_CONNECTION_OPTIONS := 2150858937

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREATESESSION_NULL_PARAM := 2150858938

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENUMERATE_NULL_PARAM := 2150858939

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SUBSCRIBE_NULL_PARAM := 2150858940

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NULL_RESULT_PARAM := 2150858941

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NO_HANDLE := 2150858942

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_BLANK_URI := 2150858943

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_RESOURCE_LOCATOR := 2150858944

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_BLANK_INPUT_XML := 2150858945

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_BATCH_ITEMS_TOO_SMALL := 2150858946

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MAX_CHARS_TOO_SMALL := 2150858947

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_BLANK_ACTION_URI := 2150858948

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ZERO_HEARTBEAT := 2150858949

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MULTIPLE_DELIVERY_MODES := 2150858950

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MULTIPLE_ENVELOPE_POLICIES := 2150858951

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_UNKNOWN_EXPIRATION_TYPE := 2150858952

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MISSING_EXPIRATION := 2150858953

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_PULL_INVALID_FLAGS := 2150858954

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_PUSH_UNSUPPORTED_TRANSPORT := 2150858955

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_PUSH_HOST_TOO_LONG := 2150858956

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_COMPRESSION_INVALID_OPTION := 2150858957

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DELIVERENDSUBSCRIPTION_NULL_PARAM := 2150858958

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DELIVEREVENTS_NULL_PARAM := 2150858959

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETBOOKMARK_NULL_PARAM := 2150858960

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DECODEOBJECT_NULL_PARAM := 2150858961

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENCODEOBJECT_NULL_PARAM := 2150858962

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENUMERATORADDOBJECT_NULL_PARAM := 2150858963

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENUMERATORNEXTOBJECT_NULL_PARAM := 2150858964

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CONSTRUCTERROR_NULL_PARAM := 2150858965

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVER_NONPULLSUBSCRIBE_NULL_PARAM := 2150858966

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_UNENCRYPTED_HTTP_ONLY := 2150858967

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_USE_CERTIFICATES_FOR_HTTP := 2150858968

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONNECTIONSTR_INVALID := 2150858969

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_TRANSPORT_NOT_SUPPORTED := 2150858970

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PORT_INVALID := 2150858971

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_PORT_INVALID := 2150858972

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SENDHEARBEAT_EMPTY_ENUMERATOR := 2150858973

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_UNENCRYPTED_DISABLED := 2150858974

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_BASIC_AUTHENTICATION_DISABLED := 2150858975

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DIGEST_AUTHENTICATION_DISABLED := 2150858976

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NEGOTIATE_AUTHENTICATION_DISABLED := 2150858977

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_KERBEROS_AUTHENTICATION_DISABLED := 2150858978

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CERTIFICATES_AUTHENTICATION_DISABLED := 2150858979

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVER_NOT_TRUSTED := 2150858980

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EXPLICIT_CREDENTIALS_REQUIRED := 2150858981

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_THUMBPRINT_NOT_BLANK := 2150858982

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_THUMBPRINT_BLANK := 2150858983

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CANNOT_SHARE_SSL_CONFIG := 2150858984

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CERT_CN_DOES_NOT_MATCH_HOSTNAME := 2150858985

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_HOSTNAME_CHANGE_WITHOUT_CERT := 2150858986

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_THUMBPRINT_SHOULD_BE_EMPTY := 2150858987

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_IPFILTER := 2150858988

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_CHANGE_KEYS := 2150858989

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_INVALID_USAGE := 2150858990

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_NO_RESULTS := 2150858991

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREATE_RESPONSE_NO_EPR := 2150858992

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_INVALID_ENUMERATION_CONTEXT := 2150858993

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_NO_XML_FRAGMENT_WRAPPER := 2150858994

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_INVALID_MESSAGE_INFORMATION_HEADER := 2150858995

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_NO_SOAP_HEADER_BODY := 2150858996

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_NO_RESPONSE_DATA := 2150858997

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RESPONSE_INVALID_SOAP_FAULT := 2150858998

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_INVALID_CONTENT_TYPE_IN_RESPONSE_DATA := 2150858999

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_CONTENT_TYPE_MISSMATCH_RESPONSE_DATA := 2150859000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_DECRYPT := 2150859001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_URI_WMI_SINGLETON := 2150859002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_URI_WMI_ENUM_WQL := 2150859003

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_IDENTIFY_FOR_LOCAL_SESSION := 2150859004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_PUSH_SUBSCRIPTION_FOR_LOCAL_SESSION := 2150859005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SUBSCRIPTION_MANAGER := 2150859006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NON_PULL_SUBSCRIPTION_NOT_SUPPORTED := 2150859007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_MAX_NESTED := 2150859008

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REMOTE_CIMPATH_NOT_SUPPORTED := 2150859009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_PROVIDER_NOT_CAPABLE := 2150859010

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_INVALID_VALUE := 2150859011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_SVC_ACCESS_DENIED := 2150859012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_PROVIDER_ACCESS_DENIED := 2150859013

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_CANNOT_CONNECT_ACCESS_DENIED := 2150859014

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_FILTER_XML := 2150859015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_WMI_INVALID_KEY := 2150859016

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_FRAGMENT_PATH_BLANK := 2150859017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_CHARACTERS_IN_RESPONSE := 2150859018

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_KERBEROS_IPADDRESS := 2150859019

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_WORKGROUP_NO_KERBEROS := 2150859020

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_BATCH_SETTINGS_PARAMETER := 2150859021

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVER_DESTINATION_LOCALHOST := 2150859022

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNKNOWN_HTTP_STATUS_RETURNED := 2150859023

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_HTTP_STATUS_REDIRECT := 2150859024

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_REQUEST_TOO_LARGE_STATUS := 2150859025

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_SERVICE_UNAVAILABLE_STATUS := 2150859026

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_NOT_FOUND_STATUS := 2150859027

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_MISSING_LOCALE_IN_DELIVERY := 2150859028

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUICK_CONFIG_FAILED_CERT_REQUIRED := 2150859029

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUICK_CONFIG_FIREWALL_EXCEPTIONS_DISALLOWED := 2150859030

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUICK_CONFIG_LOCAL_POLICY_CHANGE_DISALLOWED := 2150859031

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SELECTOR_NAME := 2150859032

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENCODING_TYPE := 2150859033

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENDPOINT_UNAVAILABLE_INVALID_VALUE := 2150859034

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_HEADER := 2150859035

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_UNSUPPORTED_EXPIRATION_TYPE := 2150859036

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MAX_ELEMENTS_NOT_SUPPORTED := 2150859037

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WMI_PROVIDER_INVALID_PARAMETER := 2150859038

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MULTIPLE_ENUM_MODE_FLAGS := 2150859039

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_INVALID_FLAG := 2150859040

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_NULL_PARAM := 2150859041

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_PROCESS_FILTER := 2150859042

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENUMERATORADDEVENT_NULL_PARAM := 2150859043

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ADDOBJECT_MISSING_OBJECT := 2150859044

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ADDOBJECT_MISSING_EPR := 2150859045

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NETWORK_TIMEDOUT := 2150859046

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_RECEIVE_IN_PROGRESS := 2150859047

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_RECEIVE_NO_RESPONSE_DATA := 2150859048

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_CREATESHELL_NULL_PARAM := 2150859049

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_CLOSESHELL_NULL_PARAM := 2150859050

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_FREECREATESHELLRESULT_NULL_PARAM := 2150859051

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_RUNCOMMAND_NULL_PARAM := 2150859052

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_FREERUNCOMMANDRESULT_NULL_PARAM := 2150859053

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_SIGNAL_NULL_PARAM := 2150859054

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_RECEIVE_NULL_PARAM := 2150859055

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_FREEPULLRESULT_NULL_PARAM := 2150859056

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_PULL_NULL_PARAM := 2150859057

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_CLOSERECEIVEHANDLE_NULL_PARAM := 2150859058

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_SEND_NULL_PARAM := 2150859059

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_PUSH_NULL_PARAM := 2150859060

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_CLOSESENDHANDLE_NULL_PARAM := 2150859061

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CLIENT_GET_NULL_PARAM := 2150859062

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_POLYMORPHISM_MODE_UNSUPPORTED := 2150859063

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REQUEST_NOT_SUPPORTED_AT_SERVICE := 2150859064

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URI_NON_DMTF_CLASS := 2150859065

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URI_WRONG_DMTF_VERSION := 2150859066

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DIFFERENT_CIM_SELECTOR := 2150859067

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PUSHSUBSCRIPTION_INVALIDUSERACCOUNT := 2150859068

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_NONDOMAINJOINED_PUBLISHER := 2150859069

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_NONDOMAINJOINED_COLLECTOR := 2150859070

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_READONLY_PROPERTY := 2150859071

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CODE_PAGE_NOT_SUPPORTED := 2150859072

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DISABLE_LOOPBACK_WITH_EXPLICIT_CREDENTIALS := 2150859073

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_DISABLE_LOOPBACK := 2150859074

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ENUM_RECEIVED_TOO_MANY_ITEMS := 2150859075

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MULTIPLE_CREDENTIALS := 2150859076

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_AUTHENTICATION_INVALID_FLAG := 2150859077

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREDENTIALS_FOR_DEFAULT_AUTHENTICATION := 2150859078

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_USERNAME_AND_PASSWORD_NEEDED := 2150859079

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_CERT_DNS_OR_UPN := 2150859080

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREATESHELL_NULL_ENVIRONMENT_VARIABLE_NAME := 2150859081

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_ALREADY_CLOSED := 2150859082

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREATESHELL_NULL_STREAMID := 2150859083

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_INVALID_SHELL_HANDLE := 2150859084

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_INVALID_COMMAND_HANDLE := 2150859085

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RUNSHELLCOMMAND_NULL_ARGUMENT := 2150859086

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_COMMAND_ALREADY_CLOSED := 2150859087

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SENDSHELLINPUT_INVALID_STREAMID_INDEX := 2150859088

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_SYNCHRONOUS_NOT_SUPPORTED := 2150859089

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_CERTMAPPING_OPERATION_FOR_LOCAL_SESSION := 2150859090

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_CONFIGLIMIT_EXCEEDED := 2150859091

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_INVALIDUSERCREDENTIALS := 2150859092

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_INVALID_USAGE_CLIENT := 2150859093

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_MISSING_AUTH_FLAG := 2150859094

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERT_MULTIPLE_CREDENTIALS_FLAG := 2150859095

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_SHELL_URI_INVALID := 2150859096

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_SHELL_URI_CMDSHELLURI_NOTPERMITTED := 2150859097

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_SHELLURI_INVALID_PROCESSPATH := 2150859098

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_URI_INVALID := 2150859099

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SECURITY_DESCRIPTOR := 2150859100

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_POLICY_TOO_COMPLEX := 2150859101

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_POLICY_CANNOT_COMPLY := 2150859102

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_CONNECTIONRETRY := 2150859103

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URISECURITY_INVALIDURIKEY := 2150859104

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_INVALIDSUBJECTKEY := 2150859105

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_INVALIDISSUERKEY := 2150859106

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_PUBLISHERS_TYPE := 2150859107

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_DELIVERY_RETRY := 2150859108

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NULL_PUBLISHERS := 2150859109

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NULL_ISSUERS := 2150859110

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_NO_SOURCES := 2150859111

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_SUBSCRIBE_OBJECT := 2150859112

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PUBLIC_FIREWALL_PROFILE_ACTIVE := 2150859113

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_PASSWORDTOOLONG := 2150859114

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_PASSWORDBLANK := 2150859115

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_PASSWORDUSERTUPLE := 2150859116

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_PROVIDER_RESPONSE := 2150859117

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_NOT_INITIALIZED := 2150859118

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_SHELLURI_INVALID_OPERATION_ON_KEY := 2150859119

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_STATUS_SERVER_ERROR := 2150859120

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTTP_STATUS_BAD_REQUEST := 2150859121

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_CANNOT_CHANGE_CERTMAPPING_KEYS := 2150859122

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_HTML_ERROR := 2150859123

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INITIALIZE_NULL_PARAM := 2150859124

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_INIT_APPLICATION_FLAG := 2150859125

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_DEINIT_APPLICATION_FLAG := 2150859126

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SETSESSIONOPTION_NULL_PARAM := 2150859127

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SETSESSIONOPTION_INVALID_PARAM := 2150859128

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETSESSIONOPTION_INVALID_PARAM := 2150859129

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREATESHELL_NULL_PARAM := 2150859130

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_CREATE_SHELL_FLAG := 2150859131

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_CLOSE_SHELL_FLAG := 2150859132

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_CLOSE_COMMAND_FLAG := 2150859133

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CLOSESHELL_NULL_PARAM := 2150859134

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CLOSECOMMAND_NULL_PARAM := 2150859135

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_RUNCOMMAND_NULL_PARAM := 2150859136

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_RUNCOMMAND_FLAG := 2150859137

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_RUNCOMMAND_NOTCOMPLETED := 2150859138

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_COMMAND_RESPONSE := 2150859139

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_OPTIONSET := 2150859140

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_COMMANDID := 2150859141

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SIGNAL_NULL_PARAM := 2150859142

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_SIGNAL_SHELL_FLAG := 2150859143

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SEND_NULL_PARAM := 2150859144

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_SEND_SHELL_FLAG := 2150859145

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_SEND_SHELL_PARAMETER := 2150859146

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_INVALID_INPUT_STREAM := 2150859147

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_RECEIVE_NULL_PARAM := 2150859148

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SHELL_INVALID_DESIRED_STREAMS := 2150859149

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_RECEIVE_SHELL_FLAG := 2150859150

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NO_RECEIVE_RESPONSE := 2150859151

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PLUGIN_CONFIGURATION_CORRUPTED := 2150859152

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_FILEPATH := 2150859153

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FILE_NOT_PRESENT := 2150859154

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_IISCONFIGURATION_READ_FAILED := 2150859155

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_LOCALE := 2150859156

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_UI_LANGUAGE := 2150859157

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETERRORMESSAGE_NULL_PARAM := 2150859158

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_LANGUAGE_CODE := 2150859159

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_GETERRORMESSAGE_FLAG := 2150859160

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REDIRECT_REQUESTED := 2150859161

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PROXY_AUTHENTICATION_INVALID_FLAG := 2150859162

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREDENTIALS_FOR_PROXY_AUTHENTICATION := 2150859163

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PROXY_ACCESS_TYPE := 2150859164

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_OPTION_NO_PROXY_SERVER := 2150859165

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETSESSIONOPTION_DWORD_NULL_PARAM := 2150859166

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETSESSIONOPTION_DWORD_INVALID_PARAM := 2150859167

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_GETSESSIONOPTION_STRING_INVALID_PARAM := 2150859168

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREDSSP_USERNAME_PASSWORD_NEEDED := 2150859169

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREDSSP_AUTHENTICATION_DISABLED := 2150859170

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ALLOWFRESHCREDENTIALS := 2150859171

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_ALLOWFRESHCREDENTIALS_NTLMONLY := 2150859172

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_SHELLS := 2150859173

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_OPERATIONS := 2150859174

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_USER := 2150859175

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_SYSTEM := 2150859176

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DIFFERENT_AUTHZ_TOKEN := 2150859177

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REDIRECT_LOCATION_NOT_AVAILABLE := 2150859178

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_SHELLUSERS := 2150859179

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REMOTESHELLS_NOT_ALLOWED := 2150859180

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_PULL_PARAMS_NOT_SAME_AS_ENUM := 2150859181

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DEPRECATED_CONFIG_SETTING := 2150859182

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_URI_SECURITY_URI := 2150859183

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_USE_ALLOW_NEGOTIATE_IMPLICIT_CREDENTIALS_FOR_HTTP := 2150859184

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_HTTP := 2150859185

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_KERBEROS := 2150859186

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CANNOT_USE_PROXY_SETTINGS_FOR_CREDSSP := 2150859187

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_MULTIPLE_PROXY_AUTH_FLAGS := 2150859188

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_REDIRECT_ERROR := 2150859189

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_REDIRECT_LOCATION_TOO_LONG := 2150859190

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_REDIRECT_LOCATION_INVALID := 2150859191

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SERVICE_CBT_HARDENING_INVALID := 2150859192

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NAME_NOT_RESOLVED := 2150859193

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SSL_CONNECTION_ABORTED := 2150859194

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DEFAULTAUTH_IPADDRESS := 2150859195

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CUSTOMREMOTESHELL_DEPRECATED := 2150859196

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_FEATURE_DEPRECATED := 2150859197

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_USESSL_PARAM := 2150859198

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_CONFIGSDDL_URL := 2150859199

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_SHELLCOMAMNDS_FILTER_EXPECTED := 2150859200

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_ENUMERATE_SHELLCOMMANDS_EPRS_NOTSUPPORTED := 2150859201

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CREATESHELL_NAME_INVALID := 2150859202

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RUNAS_INVALIDUSERCREDENTIALS := 2150859203

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_DISCONNECTED := 2150859204

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_DISCONNECT_NOT_SUPPORTED := 2150859205

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_CLIENTSESSIONID_MISMATCH := 2150859206

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_DISCONNECTSHELL_NULL_PARAM := 2150859207

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_RECONNECTSHELL_NULL_PARAM := 2150859208

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CONNECTSHELL_NULL_PARAM := 2150859209

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_CONNECTCOMMAND_NULL_PARAM := 2150859210

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_CONNECT_RESPONSE_BAD_BODY := 2150859211

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_COMMAND_TERMINATED := 2150859212

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_CONNECTED_TO_DIFFERENT_CLIENT := 2150859213

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_GRACEFUL := 2150859214

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_DISCONNECT_OPERATION_NOT_VALID := 2150859215

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_RECONNECT_OPERATION_NOT_VALID := 2150859216

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CONFIG_GROUP_POLICY_CHANGE_NOTIFICATION_SUBSCRIPTION_FAILED := 2150859217

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_RECONNECTSHELLCOMMAND_NULL_PARAM := 2150859218

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELLCOMMAND_RECONNECT_OPERATION_NOT_VALID := 2150859219

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELLCOMMAND_CLIENTID_NOT_VALID := 2150859220

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_CLIENTID_NOT_VALID := 2150859221

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELLCOMMAND_CLIENTID_RESOURCE_CONFLICT := 2150859222

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELL_CLIENTID_RESOURCE_CONFLICT := 2150859223

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_SHELLCOMMAND_DISCONNECT_OPERATION_NOT_VALID := 2150859224

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SUBSCRIBE_WMI_INVALID_KEY := 2150859225

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_DISCONNECT_SHELL_FLAG := 2150859226

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_INVALID_SHELL_COMMAND_PAIR := 2150859227

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SEMANTICCALLBACK_TIMEDOUT := 2150859228

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVICE_REMOTE_ACCESS_DISABLED := 2150859229

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_SERVICE_STREAM_DISCONNECTED := 2150859230

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CREATESHELL_RUNAS_FAILED := 2150859231

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_XML_RUNAS_DISABLED := 2150859232

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_WRONG_METADATA := 2150859233

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_TYPE := 2150859234

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_REMOTE_CONNECTION_NOT_ALLOWED := 2150859235

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_SHELLS_PPQ := 2150859236

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_USERS_PPQ := 2150859237

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_PLUGINSHELLS_PPQ := 2150859238

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_PLUGINOPERATIONS_PPQ := 2150859239

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_OPERATIONS_USER_PPQ := 2150859240

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MAX_COMMANDS_PER_SHELL_PPQ := 2150859241

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_QUOTA_MIN_REQUIREMENT_NOT_AVAILABLE_PPQ := 2150859242

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NEW_DESERIALIZER := 2150859243

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DESERIALIZE_CLASS := 2150859244

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_GETCLASS := 2150859245

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NEW_SESSION := 2150859246

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_NULL_KEY := 2150859247

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MUTUAL_AUTH_FAILED := 2150859248

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_OCTETTYPE := 2150859249

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINRS_IDLETIMEOUT_OUTOFBOUNDS := 2150859250

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INSUFFICIENT_METADATA_FOR_BASIC := 2150859251

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_INVALID_LITERAL_URI := 2150859252

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_OBJECTONLY_INVALID := 2150859253

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_MISSING_CLASSNAME := 2150859254

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_INVALID_ENCODING_IN_DELIVERY := 2150859255

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_DESTINATION_INVALID := 2150859256

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_UNSUPPORTED_FEATURE_IDENTIFY := 2150859257

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CLIENT_SESSION_UNUSABLE := 2150859258

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_VIRTUALACCOUNT_NOTSUPPORTED := 2150859259

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_VIRTUALACCOUNT_NOTSUPPORTED_DOWNLEVEL := 2150859260

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_RUNASUSER_MANAGEDACCOUNT_LOGON_FAILED := 2150859261

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_CERTMAPPING_CREDENTIAL_MANAGEMENT_FAILIED := 2150859262

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WSMAN_EVENTING_PUSH_SUBSCRIPTION_NOACTIVATE_EVENTSOURCE := 2150859263
;@endregion Constants
