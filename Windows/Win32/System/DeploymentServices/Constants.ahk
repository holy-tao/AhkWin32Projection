#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WDS_CLI_TRANSFER_ASYNCHRONOUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDS_CLI_NO_SPARSE_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_SERVER_PORT := 67

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_CLIENT_PORT := 68

/**
 * @type {Integer (UInt32)}
 */
export global PXE_SERVER_PORT := 4011

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCPV6_SERVER_PORT := 547

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCPV6_CLIENT_PORT := 546

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_FILE_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_SERVER_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_HWAADR_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCP_MAGIC_COOKIE_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PXE_REG_INDEX_TOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global PXE_REG_INDEX_BOTTOM := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global PXE_CALLBACK_RECV_REQUEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global PXE_CALLBACK_SHUTDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_CALLBACK_SERVICE_CONTROL := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_CALLBACK_MAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global PXE_GSI_TRACE_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_GSI_SERVER_DUID := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_MAX_ADDRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global PXE_ADDR_BROADCAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_ADDR_USE_PORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_ADDR_USE_ADDR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PXE_ADDR_USE_DHCP_RULES := 8

/**
 * @type {Integer (UInt32)}
 */
export global PXE_DHCPV6_RELAY_HOP_COUNT_LIMIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PXE_BA_NBP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_BA_CUSTOM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_BA_IGNORE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PXE_BA_REJECTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PXE_TRACE_VERBOSE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PXE_TRACE_INFO := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PXE_TRACE_WARNING := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PXE_TRACE_ERROR := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PXE_TRACE_FATAL := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_ATTR_FILTER := 0

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_ATTR_FILTER_IPV6 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_ATTR_IPV6_CAPABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_FILTER_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_FILTER_DHCP_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PXE_PROV_FILTER_PXE_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MC_SERVER_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSPORTPROVIDER_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDS_MC_TRACE_VERBOSE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WDS_MC_TRACE_INFO := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WDS_MC_TRACE_WARNING := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WDS_MC_TRACE_ERROR := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WDS_MC_TRACE_FATAL := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_CURRENT_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_NO_CACHE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_STATUS_SUCCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WDS_TRANSPORTCLIENT_STATUS_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WDSTRANSPORT_RESOURCE_UTILIZATION_UNKNOWN := 255

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_PK_TYPE_DHCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_PK_TYPE_WDSNBP := 2

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_PK_TYPE_BCD := 4

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_PK_TYPE_DHCPV6 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_BYTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_USHORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_ULONG := 3

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_WSTR := 4

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_STR := 5

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_IP4 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPT_TYPE_IP6 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_ACTION_APPROVAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_ACTION_REFERRAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_ACTION_ABORT := 5

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_PXE_PROMPT_OPTIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_PXE_PROMPT_OPTOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_NBP_VER_7 := 1792

/**
 * @type {Integer (UInt32)}
 */
export global WDSBP_OPTVAL_NBP_VER_8 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_WDSMCSERVER := 289

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_WDSMCCLIENT := 290

/**
 * @type {Integer (Int32)}
 */
export global WDSMCSERVER_CATEGORY := 1

/**
 * @type {Integer (Int32)}
 */
export global WDSMCCLIENT_CATEGORY := 2

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_SESSION_SHUTDOWN_IN_PROGRESS := -1054801664

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_REQCALLBACKS_NOT_REG := -1054801663

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_INCOMPATIBLE_VERSION := -1054801662

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_CONTENT_NOT_FOUND := -1054801661

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_CLIENT_NOT_FOUND := -1054801660

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_NAMESPACE_NOT_FOUND := -1054801659

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_CONTENT_PROVIDER_NOT_FOUND := -1054801658

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_NAMESPACE_ALREADY_EXISTS := -1054801657

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_NAMESPACE_SHUTDOWN_IN_PROGRESS := -1054801656

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_NAMESPACE_ALREADY_STARTED := -1054801655

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_NS_START_FAILED_NO_CLIENTS := -1054801654

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_START_TIME_IN_PAST := -1054801653

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_PACKET_NOT_HASHED := -1054801652

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_PACKET_NOT_SIGNED := -1054801651

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_PACKET_HAS_SECURITY := -1054801650

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_PACKET_NOT_CHECKSUMED := -1054801649

/**
 * @type {Integer (Int32)}
 */
export global WDSMCS_E_CLIENT_DOESNOT_SUPPORT_SECURITY_MODE := -1054801648

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_S_PARAMETERS_READ := 1092682240

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_PARAMETERS_READ_FAILED := -1054801407

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_DUPLICATE_MULTICAST_ADDR := -1054801406

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_NON_WDS_DUPLICATE_MULTICAST_ADDR := -1054801405

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_DLL_LOAD_FAILED := -1054801328

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_INIT_FUNC_MISSING := -1054801327

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_INIT_FUNC_FAILED := -1054801326

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_INCOMPATIBLE_SERVER_VERSION := -1054801325

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_CALLBACKS_NOT_REG := -1054801324

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_SHUTDOWN_FUNC_FAILED := -1054801323

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_MEMORY_LEAK := -1054801322

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_OPEN_INSTANCE_FAILED := -1054801321

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_CLOSE_INSTANCE_FAILED := -1054801320

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_OPEN_CONTENT_FAILED := -1054801319

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_W_CP_DLL_LOAD_FAILED_NOT_CRITICAL := -2128543142

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_CP_DLL_LOAD_FAILED_CRITICAL := -1054801317

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_NSREG_START_TIME_IN_PAST := -1054801152

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_NSREG_CONTENT_PROVIDER_NOT_REG := -1054801151

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_NSREG_NAMESPACE_EXISTS := -1054801150

/**
 * @type {Integer (Int32)}
 */
export global EVT_WDSMCS_E_NSREG_FAILURE := -1054801149

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_CALLBACKS_NOT_REG := -1054735616

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_ALREADY_COMPLETED := -1054735615

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_ALREADY_IN_PROGRESS := -1054735614

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_UNKNOWN_ERROR := -1054735613

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_NOT_INITIALIZED := -1054735612

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_KICKED_POLICY_NOT_MET := -1054735611

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_KICKED_FALLBACK := -1054735610

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_KICKED_FAIL := -1054735609

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_KICKED_UNKNOWN := -1054735608

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_MULTISTREAM_NOT_ENABLED := -1054735607

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_ALREADY_IN_LOWEST_SESSION := -1054735606

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_CLIENT_DEMOTE_NOT_SUPPORTED := -1054735605

/**
 * @type {Integer (Int32)}
 */
export global WDSTPC_E_NO_IP4_INTERFACE := -1054735604

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTC_E_WIM_APPLY_REQUIRES_REFERENCE_IMAGE := -1054735603

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_WDSTPTMGMT := 272

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_CATEGORY := 1

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_PROPERTY := -1055915776

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_OPERATION := -1055915775

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_CLASS := -1055915774

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_CONTENT_PROVIDER_ALREADY_REGISTERED := -1055915773

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_CONTENT_PROVIDER_NOT_REGISTERED := -1055915772

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_CONTENT_PROVIDER_NAME := -1055915771

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_TRANSPORT_SERVER_ROLE_NOT_CONFIGURED := -1055915770

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NAMESPACE_ALREADY_REGISTERED := -1055915769

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NAMESPACE_NOT_REGISTERED := -1055915768

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_CANNOT_REINITIALIZE_OBJECT := -1055915767

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_NAMESPACE_NAME := -1055915766

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_NAMESPACE_DATA := -1055915765

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NAMESPACE_READ_ONLY := -1055915764

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_NAMESPACE_START_TIME := -1055915763

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_DIAGNOSTICS_COMPONENTS := -1055915762

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_CANNOT_REFRESH_DIRTY_OBJECT := -1055915761

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_SERVICE_IP_ADDRESS_RANGE := -1055915760

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_SERVICE_PORT_RANGE := -1055915759

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_NAMESPACE_START_PARAMETERS := -1055915758

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_TRANSPORT_SERVER_UNAVAILABLE := -1055915757

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NAMESPACE_NOT_ON_SERVER := -1055915756

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NAMESPACE_REMOVED_FROM_SERVER := -1055915755

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_IP_ADDRESS := -1055915754

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_IPV4_MULTICAST_ADDRESS := -1055915753

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS := -1055915752

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_IPV6_NOT_SUPPORTED := -1055915751

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS_SOURCE := -1055915750

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_MULTISTREAM_STREAM_COUNT := -1055915749

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_AUTO_DISCONNECT_THRESHOLD := -1055915748

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_MULTICAST_SESSION_POLICY_NOT_SUPPORTED := -1055915747

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_SLOW_CLIENT_HANDLING_TYPE := -1055915746

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_NETWORK_PROFILES_NOT_SUPPORTED := -1055915745

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_UDP_PORT_POLICY_NOT_SUPPORTED := -1055915744

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_TFTP_MAX_BLOCKSIZE_NOT_SUPPORTED := -1055915743

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_TFTP_VAR_WINDOW_NOT_SUPPORTED := -1055915742

/**
 * @type {Integer (Int32)}
 */
export global WDSTPTMGMT_E_INVALID_TFTP_MAX_BLOCKSIZE := -1055915741

/**
 * @type {Integer (Int32)}
 */
export global WdsCliFlagEnumFilterVersion := 1

/**
 * @type {Integer (Int32)}
 */
export global WdsCliFlagEnumFilterFirmware := 2

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_ERROR := 1

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_STARTED := 2

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_FINISHED := 3

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED := 4

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_APPLY_STARTED := 5

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_APPLY_FINISHED := 6

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE := 7

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_UNATTEND_MODE := 8

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_TRANSFER_START := 9

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_TRANSFER_END := 10

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE := 11

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR := 12

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START := 13

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END := 14

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2 := 15

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2 := 16

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2 := 17

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE := 18

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START := 19

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END := 20

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE := 21

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2 := 22

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED3 := 23

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_TYPE_CLIENT_MAX_CODE := 24

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_LEVEL_DISABLED := 0

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_LEVEL_ERROR := 1

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_LEVEL_WARNING := 2

/**
 * @type {Integer (Int32)}
 */
export global WDS_LOG_LEVEL_INFO := 3
;@endregion Constants
