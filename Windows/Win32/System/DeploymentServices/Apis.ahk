#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class DeploymentServices {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_CLI_TRANSFER_ASYNCHRONOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_CLI_NO_SPARSE_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_SERVER_PORT => 67

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_CLIENT_PORT => 68

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_SERVER_PORT => 4011

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCPV6_SERVER_PORT => 547

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCPV6_CLIENT_PORT => 546

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_FILE_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_SERVER_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_HWAADR_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCP_MAGIC_COOKIE_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_REG_INDEX_TOP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_REG_INDEX_BOTTOM => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_CALLBACK_RECV_REQUEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_CALLBACK_SHUTDOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_CALLBACK_SERVICE_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_CALLBACK_MAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_GSI_TRACE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_GSI_SERVER_DUID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_MAX_ADDRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_ADDR_BROADCAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_ADDR_USE_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_ADDR_USE_ADDR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_ADDR_USE_DHCP_RULES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_DHCPV6_RELAY_HOP_COUNT_LIMIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_BA_NBP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_BA_CUSTOM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_BA_IGNORE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_BA_REJECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_TRACE_VERBOSE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_TRACE_INFO => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_TRACE_WARNING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_TRACE_ERROR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_TRACE_FATAL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_ATTR_FILTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_ATTR_FILTER_IPV6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_ATTR_IPV6_CAPABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_FILTER_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_FILTER_DHCP_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PXE_PROV_FILTER_PXE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MC_SERVER_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSPORTPROVIDER_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_MC_TRACE_VERBOSE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_MC_TRACE_INFO => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_MC_TRACE_WARNING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_MC_TRACE_ERROR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_MC_TRACE_FATAL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_CURRENT_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_NO_CACHE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_STATUS_SUCCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_STATUS_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WDSTRANSPORT_RESOURCE_UTILIZATION_UNKNOWN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_PK_TYPE_DHCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_PK_TYPE_WDSNBP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_PK_TYPE_BCD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_PK_TYPE_DHCPV6 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_BYTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_USHORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_ULONG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_WSTR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_STR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_IP4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPT_TYPE_IP6 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_ACTION_APPROVAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_ACTION_REFERRAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_ACTION_ABORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_PXE_PROMPT_OPTIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_PXE_PROMPT_OPTOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_NBP_VER_7 => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static WDSBP_OPTVAL_NBP_VER_8 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WDSMCSERVER => 289

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WDSMCCLIENT => 290

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCSERVER_CATEGORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCCLIENT_CATEGORY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_SESSION_SHUTDOWN_IN_PROGRESS => -1054801664

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_REQCALLBACKS_NOT_REG => -1054801663

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_INCOMPATIBLE_VERSION => -1054801662

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_CONTENT_NOT_FOUND => -1054801661

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_CLIENT_NOT_FOUND => -1054801660

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_NAMESPACE_NOT_FOUND => -1054801659

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_CONTENT_PROVIDER_NOT_FOUND => -1054801658

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_NAMESPACE_ALREADY_EXISTS => -1054801657

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_NAMESPACE_SHUTDOWN_IN_PROGRESS => -1054801656

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_NAMESPACE_ALREADY_STARTED => -1054801655

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_NS_START_FAILED_NO_CLIENTS => -1054801654

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_START_TIME_IN_PAST => -1054801653

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_PACKET_NOT_HASHED => -1054801652

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_PACKET_NOT_SIGNED => -1054801651

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_PACKET_HAS_SECURITY => -1054801650

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_PACKET_NOT_CHECKSUMED => -1054801649

    /**
     * @type {Integer (Int32)}
     */
    static WDSMCS_E_CLIENT_DOESNOT_SUPPORT_SECURITY_MODE => -1054801648

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_S_PARAMETERS_READ => 1092682240

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_PARAMETERS_READ_FAILED => -1054801407

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_DUPLICATE_MULTICAST_ADDR => -1054801406

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_NON_WDS_DUPLICATE_MULTICAST_ADDR => -1054801405

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_DLL_LOAD_FAILED => -1054801328

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_INIT_FUNC_MISSING => -1054801327

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_INIT_FUNC_FAILED => -1054801326

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_INCOMPATIBLE_SERVER_VERSION => -1054801325

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_CALLBACKS_NOT_REG => -1054801324

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_SHUTDOWN_FUNC_FAILED => -1054801323

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_MEMORY_LEAK => -1054801322

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_OPEN_INSTANCE_FAILED => -1054801321

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_CLOSE_INSTANCE_FAILED => -1054801320

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_OPEN_CONTENT_FAILED => -1054801319

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_W_CP_DLL_LOAD_FAILED_NOT_CRITICAL => -2128543142

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_CP_DLL_LOAD_FAILED_CRITICAL => -1054801317

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_NSREG_START_TIME_IN_PAST => -1054801152

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_NSREG_CONTENT_PROVIDER_NOT_REG => -1054801151

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_NSREG_NAMESPACE_EXISTS => -1054801150

    /**
     * @type {Integer (Int32)}
     */
    static EVT_WDSMCS_E_NSREG_FAILURE => -1054801149

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_CALLBACKS_NOT_REG => -1054735616

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_ALREADY_COMPLETED => -1054735615

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_ALREADY_IN_PROGRESS => -1054735614

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_UNKNOWN_ERROR => -1054735613

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_NOT_INITIALIZED => -1054735612

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_KICKED_POLICY_NOT_MET => -1054735611

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_KICKED_FALLBACK => -1054735610

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_KICKED_FAIL => -1054735609

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_KICKED_UNKNOWN => -1054735608

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_MULTISTREAM_NOT_ENABLED => -1054735607

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_ALREADY_IN_LOWEST_SESSION => -1054735606

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_CLIENT_DEMOTE_NOT_SUPPORTED => -1054735605

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPC_E_NO_IP4_INTERFACE => -1054735604

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTC_E_WIM_APPLY_REQUIRES_REFERENCE_IMAGE => -1054735603

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_WDSTPTMGMT => 272

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_CATEGORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_PROPERTY => -1055915776

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_OPERATION => -1055915775

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_CLASS => -1055915774

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_CONTENT_PROVIDER_ALREADY_REGISTERED => -1055915773

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_CONTENT_PROVIDER_NOT_REGISTERED => -1055915772

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_CONTENT_PROVIDER_NAME => -1055915771

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_TRANSPORT_SERVER_ROLE_NOT_CONFIGURED => -1055915770

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NAMESPACE_ALREADY_REGISTERED => -1055915769

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NAMESPACE_NOT_REGISTERED => -1055915768

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_CANNOT_REINITIALIZE_OBJECT => -1055915767

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_NAMESPACE_NAME => -1055915766

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_NAMESPACE_DATA => -1055915765

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NAMESPACE_READ_ONLY => -1055915764

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_NAMESPACE_START_TIME => -1055915763

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_DIAGNOSTICS_COMPONENTS => -1055915762

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_CANNOT_REFRESH_DIRTY_OBJECT => -1055915761

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_SERVICE_IP_ADDRESS_RANGE => -1055915760

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_SERVICE_PORT_RANGE => -1055915759

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_NAMESPACE_START_PARAMETERS => -1055915758

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_TRANSPORT_SERVER_UNAVAILABLE => -1055915757

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NAMESPACE_NOT_ON_SERVER => -1055915756

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NAMESPACE_REMOVED_FROM_SERVER => -1055915755

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_IP_ADDRESS => -1055915754

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_IPV4_MULTICAST_ADDRESS => -1055915753

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS => -1055915752

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_IPV6_NOT_SUPPORTED => -1055915751

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_IPV6_MULTICAST_ADDRESS_SOURCE => -1055915750

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_MULTISTREAM_STREAM_COUNT => -1055915749

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_AUTO_DISCONNECT_THRESHOLD => -1055915748

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_MULTICAST_SESSION_POLICY_NOT_SUPPORTED => -1055915747

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_SLOW_CLIENT_HANDLING_TYPE => -1055915746

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_NETWORK_PROFILES_NOT_SUPPORTED => -1055915745

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_UDP_PORT_POLICY_NOT_SUPPORTED => -1055915744

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_TFTP_MAX_BLOCKSIZE_NOT_SUPPORTED => -1055915743

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_TFTP_VAR_WINDOW_NOT_SUPPORTED => -1055915742

    /**
     * @type {Integer (Int32)}
     */
    static WDSTPTMGMT_E_INVALID_TFTP_MAX_BLOCKSIZE => -1055915741

    /**
     * @type {Integer (Int32)}
     */
    static WdsCliFlagEnumFilterVersion => 1

    /**
     * @type {Integer (Int32)}
     */
    static WdsCliFlagEnumFilterFirmware => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_STARTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_FINISHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_APPLY_STARTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_APPLY_FINISHED => 6

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_UNATTEND_MODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_TRANSFER_START => 9

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_TRANSFER_END => 10

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE => 11

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR => 12

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START => 13

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END => 14

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2 => 15

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2 => 17

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE => 18

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START => 19

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END => 20

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE => 21

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2 => 22

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED3 => 23

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_TYPE_CLIENT_MAX_CODE => 24

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_LEVEL_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_LEVEL_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_LEVEL_WARNING => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDS_LOG_LEVEL_INFO => 3
;@endregion Constants

;@region Methods
    /**
     * Closes a handle to a WDS session or image, and releases resources.
     * @param {Pointer<Void>} Handle A handle to a WDS session or image. This function can close handles opened with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> functions.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliclose
     * @since windows6.0.6000
     */
    static WdsCliClose(Handle) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliClose", "ptr", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a callback function that will receive debugging messages.
     * @param {Pointer<PFN_WdsCliTraceFunction>} pfn A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nc-wdsclientapi-pfn_wdsclitracefunction">PFN_WdsCliTraceFunction</a> callback function that receives debugging messages.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliregistertrace
     * @since windows6.0.6000
     */
    static WdsCliRegisterTrace(pfn) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliRegisterTrace", "ptr", pfn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function can be used to free the array of string values that gets allocated by the WdsCliObtainDriverPackages function.
     * @param {Pointer<Char>} ppwszArray Pointer to the array of string values being freed.
     * @param {Integer} ulCount Number of strings in the array that is pointed to by <i>ppwszArray</i>.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclifreestringarray
     * @since windows6.1
     */
    static WdsCliFreeStringArray(ppwszArray, ulCount) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliFreeStringArray", "ptr", ppwszArray, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Starts the enumeration of images stored on a WDS server and returns a find handle that references the first image.
     * @param {Pointer<Void>} hSession A handle to a session   with a WDS server. This was a handle returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
     * @param {Pointer<Void>} phFindHandle Pointer to a <b>HANDLE</b> value that receives the find handle. If the function succeeds, the find handle will reference the first image stored on the WDS server. If the function is unsuccessful, this parameter is unchanged. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function to advance the reference of the find handle to the next image. 
     * 
     * <div class="alert"><b>Note</b>  Information about the image can only be obtained from the find handle by using the image information functions of the WDS client API.</div>
     * <div> </div>
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage
     * @since windows6.0.6000
     */
    static WdsCliFindFirstImage(hSession, phFindHandle) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliFindFirstImage", "ptr", hSession, "ptr", phFindHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Advances the reference of a find handle to the next image stored on a WDS server.
     * @param {Pointer<Void>} Handle The find handle returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. If the <b>WdsCliFindNextImage</b> function is successful, the reference of the find handle is advanced to the next image stored on the WDS server.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * 
     * If the function succeeds, and the end of the enumeration has been reached, the return is  <b>HRESULT_FROM_WIN32(ERROR_NO_MORE_FILES)</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclifindnextimage
     * @since windows6.0.6000
     */
    static WdsCliFindNextImage(Handle) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliFindNextImage", "ptr", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the image enumeration flag for the current image handle.
     * @param {Pointer<Void>} Handle A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<UInt32>} pdwFlags A pointer to a value that receives the enumeration flag value.
     * 
     * 
     * This parameter can have the following values
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WdsCliFlagEnumFilterVersion"></a><a id="wdscliflagenumfilterversion"></a><a id="WDSCLIFLAGENUMFILTERVERSION"></a><dl>
     * <dt><b>WdsCliFlagEnumFilterVersion</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WDS client only shows images that have the same version as the boot image. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetenumerationflags
     * @since windows6.0.6000
     */
    static WdsCliGetEnumerationFlags(Handle, pdwFlags) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetEnumerationFlags", "ptr", Handle, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an image handle for the current image in an image enumeration.
     * @param {Pointer<Void>} FindHandle A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Void>} phImageHandle A pointer to a location that contains an image handle for the current image referenced by the find handle.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagehandlefromfindhandle
     * @since windows6.0.6000
     */
    static WdsCliGetImageHandleFromFindHandle(FindHandle, phImageHandle) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHandleFromFindHandle", "ptr", FindHandle, "ptr", phImageHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an image handle from a completed transfer handle. The handle is to the local copy of the image that's been transferred from the server to the client.
     * @param {Pointer<Void>} hTransfer A WDS transfer handle that has completed the transfer. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
     * @param {Pointer<Void>} phImageHandle A pointer to a location that contains an image handle.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagehandlefromtransferhandle
     * @since windows6.0.6000
     */
    static WdsCliGetImageHandleFromTransferHandle(hTransfer, phImageHandle) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHandleFromTransferHandle", "ptr", hTransfer, "ptr", phImageHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Starts a new session with a WDS server.
     * @param {Pointer<Char>} pwszServer A pointer to a string value that contains the name or IP address of the WDS server.
     * @param {Pointer<WDS_CLI_CRED>} pCred A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred">WDS_CLI_CRED</a> structure that contains the 
     *       client's credentials. This parameter can be null  for a session without authentication.
     * @param {Pointer<Void>} phSession A pointer to a handle for the new session. This parameter is unmodified if the function is unsuccessful.
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclicreatesession
     * @since windows6.0.6000
     */
    static WdsCliCreateSession(pwszServer, pCred, phSession) {
        pwszServer := pwszServer is String? StrPtr(pwszServer) : pwszServer

        A_LastError := 0

        result := DllCall("WDSCLIENTAPI.dll\WdsCliCreateSession", "ptr", pwszServer, "ptr", pCred, "ptr", phSession, "int")
        if(A_LastError)
            throw OSError()

        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a session with a WDS server into an authenticated session.
     * @param {Pointer<Void>} hSession A handle to a session   with a WDS server. This was a handle returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
     * @param {Pointer<WDS_CLI_CRED>} pCred Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/ns-wdsclientapi-wds_cli_cred">WDS_CLI_CRED</a> structure that contains the 
     *       client's credentials.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliauthorizesession
     * @since windows6.0.6000
     */
    static WdsCliAuthorizeSession(hSession, pCred) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliAuthorizeSession", "ptr", hSession, "ptr", pCred, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes logging for the WDS client.
     * @param {Pointer<Void>} hSession A handle to a session   with a WDS server. This was a handle returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
     * @param {Integer} ulClientArchitecture A constant that identifies the processor architecture of the client.
     * @param {Pointer<Char>} pwszClientId A pointer to a string value that contains a GUID that represents this WDS client. This is typically the GUID for the System Management BIOS (SMBIOS.)
     * @param {Pointer<Char>} pwszClientAddress A pointer to a string value that contains the network address of the WDS client. This is typically the IP address in string form, for example, 
     *       "127.0.0.1".
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>. 
     * 
     * If logging has already been initialize for the session, the return value is 
     *       <b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliinitializelog
     * @since windows6.0.6000
     */
    static WdsCliInitializeLog(hSession, ulClientArchitecture, pwszClientId, pwszClientAddress) {
        pwszClientId := pwszClientId is String? StrPtr(pwszClientId) : pwszClientId
        pwszClientAddress := pwszClientAddress is String? StrPtr(pwszClientAddress) : pwszClientAddress

        result := DllCall("WDSCLIENTAPI.dll\WdsCliInitializeLog", "ptr", hSession, "uint", ulClientArchitecture, "ptr", pwszClientId, "ptr", pwszClientAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a log event to the WDS server.
     * @param {Pointer<Void>} hSession A handle to a session   with a WDS server. This was a handle returned by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
     * @param {Integer} ulLogLevel Indicates the threshold severity required to log an event. The WDS server will log events only if the server log level is greater 
     *       than or equal to the value specified.
     * @param {Integer} ulMessageCode The type of message that is being logged.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_ERROR"></a><a id="wds_log_type_client_error"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_ERROR</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A client error message. An additional parameter of type <b>PWSTR</b> that describes the error is 
     *         required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_STARTED"></a><a id="wds_log_type_client_started"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_STARTED</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A client started message. No additional parameters are required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_FINISHED"></a><a id="wds_log_type_client_finished"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_FINISHED</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A client finished message. No additional parameters are required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED"></a><a id="wds_log_type_client_image_selected"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A client image selected message. Two additional parameters of type <b>PWSTR</b> are required. The first is the Image 
     *         Name and the second is the Group Name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_APPLY_STARTED"></a><a id="wds_log_type_client_apply_started"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_APPLY_STARTED</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No additional parameters are required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_APPLY_FINISHED"></a><a id="wds_log_type_client_apply_finished"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_APPLY_FINISHED</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No additional parameters are required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE"></a><a id="wds_log_type_client_generic_message"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A generic message. An additional parameter of type <b>PWSTR</b> that contains the message is 
     *         required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_LOG_TYPE_CLIENT_MAX_CODE"></a><a id="wds_log_type_client_max_code"></a><dl>
     * <dt><b>WDS_LOG_TYPE_CLIENT_MAX_CODE</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used to determine an out-of-range index. Values greater than or equal to 
     *         <b>WDS_LOG_TYPE_CLIENT_MAX_CODE</b> are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclilog
     * @since windows6.0.6000
     */
    static WdsCliLog(hSession, ulLogLevel, ulMessageCode) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliLog", "ptr", hSession, "uint", ulLogLevel, "uint", ulMessageCode, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the name of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a 
     *       null-terminated string value that contains the name of the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagename
     * @since windows6.0.6000
     */
    static WdsCliGetImageName(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageName", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a description of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a 
     *       null-terminated string value that contains a description of the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagedescription
     * @since windows6.0.6000
     */
    static WdsCliGetImageDescription(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageDescription", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hIfh 
     * @param {Pointer<Int32>} pImageType 
     * @returns {HRESULT} 
     */
    static WdsCliGetImageType(hIfh, pImageType) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageType", "ptr", hIfh, "int*", pImageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hIfh 
     * @param {Pointer<Char>} pppwszFiles 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    static WdsCliGetImageFiles(hIfh, pppwszFiles, pdwCount) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageFiles", "ptr", hIfh, "ptr", pppwszFiles, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the default language of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a 
     *       null-terminated string value that contains the default language for the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagelanguage
     * @since windows6.0.6000
     */
    static WdsCliGetImageLanguage(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLanguage", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an array of languages supported by the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<SByte>} pppszValues A pointer to a pointer to an array of null-terminated string values. Each element in the 
     *       array contains a language of the current 
     *       image.
     * @param {Pointer<UInt32>} pdwNumValues Pointer to a value that contains the number of languages in the <i>pppszValues</i> parameter.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagelanguages
     * @since windows6.0.6000
     */
    static WdsCliGetImageLanguages(hIfh, pppszValues, pdwNumValues) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLanguages", "ptr", hIfh, "ptr", pppszValues, "uint*", pdwNumValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the version of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a null-terminated string value that contains the version of the current version.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimageversion
     * @since windows6.0.6000
     */
    static WdsCliGetImageVersion(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageVersion", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the path to the file that contains the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a null-terminated string that contains the relative path of the image file for the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagepath
     * @since windows6.0.6000
     */
    static WdsCliGetImagePath(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImagePath", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the index within the Windows Imaging Format(WIM) file for the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<UInt32>} pdwValue A pointer to a 
     *       value that contains the image index for the current image WIM file.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimageindex
     * @since windows6.0.6000
     */
    static WdsCliGetImageIndex(hIfh, pdwValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageIndex", "ptr", hIfh, "uint*", pdwValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the processor architecture for the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<UInt32>} pdwValue Pointer to a value that describes the processor architecture of the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagearchitecture
     * @since windows6.0.6000
     */
    static WdsCliGetImageArchitecture(hIfh, pdwValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageArchitecture", "ptr", hIfh, "uint*", pdwValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the last-modification time of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<SYSTEMTIME>} ppSysTimeValue A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the last-modified time of the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagelastmodifiedtime
     * @since windows6.0.6000
     */
    static WdsCliGetImageLastModifiedTime(hIfh, ppSysTimeValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageLastModifiedTime", "ptr", hIfh, "ptr", ppSysTimeValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the size of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<UInt64>} pullValue A pointer to a value that contains the size of the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagesize
     * @since windows6.0.6000
     */
    static WdsCliGetImageSize(hIfh, pullValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageSize", "ptr", hIfh, "uint*", pullValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the Hardware Abstraction Layer (HAL) name for the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to  a 
     *       null-terminated string value that contains the HAL name for the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagehalname
     * @since windows6.0.6000
     */
    static WdsCliGetImageHalName(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageHalName", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the name of the image group for the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a 
     *       null-terminated string value that contains the name of the image group for the current image.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagegroup
     * @since windows6.0.6000
     */
    static WdsCliGetImageGroup(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageGroup", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the namespace of the current image.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<Char>} ppwszValue A pointer to a pointer to a 
     *       null-terminated string value that contains the namespace of the current image. If there is no namespace associated with this image, this returns null or an empty string.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetimagenamespace
     * @since windows6.0.6000
     */
    static WdsCliGetImageNamespace(hIfh, ppwszValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageNamespace", "ptr", hIfh, "ptr", ppwszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hIfh 
     * @param {Integer} ParamType 
     * @param {Pointer} pResponse 
     * @param {Integer} uResponseLen 
     * @returns {HRESULT} 
     */
    static WdsCliGetImageParameter(hIfh, ParamType, pResponse, uResponseLen) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetImageParameter", "ptr", hIfh, "int", ParamType, "ptr", pResponse, "uint", uResponseLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the size of the current file transfer.
     * @param {Pointer<Void>} hIfh A find handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindfirstimage">WdsCliFindFirstImage</a> function. The image referenced by the find handle can be advanced using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclifindnextimage">WdsCliFindNextImage</a> function.
     * @param {Pointer<UInt64>} pullValue A pointer to a value that contains the size of the current transfer.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligettransfersize
     * @since windows6.0.6000
     */
    static WdsCliGetTransferSize(hIfh, pullValue) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetTransferSize", "ptr", hIfh, "uint*", pullValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static WdsCliSetTransferBufferSize(ulSizeInBytes) {
        DllCall("WDSCLIENTAPI.dll\WdsCliSetTransferBufferSize", "uint", ulSizeInBytes)
    }

    /**
     * Transfers an image from a WDS server to the WDS client.
     * @param {Pointer<Void>} hImage A WDS image handle that refers to a remote image.
     * @param {Pointer<Char>} pwszLocalPath A pointer to a null-terminated string value that contains the full path to the local location to store the image file being transferred.
     * @param {Integer} dwFlags Options associated with the file transfer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_CLI_TRANSFER_ASYNCHRONOUS"></a><a id="wds_cli_transfer_asynchronous"></a><dl>
     * <dt><b>WDS_CLI_TRANSFER_ASYNCHRONOUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag specifies an asynchronous transfer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwReserved This parameter is reserved.
     * @param {Pointer<PFN_WdsCliCallback>} pfnWdsCliCallback A pointer to an optional callback function that will receive callbacks for this transfer.
     * @param {Pointer<Void>} pvUserData A pointer to optional user information that can be passed to the callback function.
     * @param {Pointer<Void>} phTransfer A pointer to a transfer handle that can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> functions to wait for the transfer to complete or to cancel the transfer.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclitransferimage
     * @since windows6.0.6000
     */
    static WdsCliTransferImage(hImage, pwszLocalPath, dwFlags, dwReserved, pfnWdsCliCallback, pvUserData, phTransfer) {
        pwszLocalPath := pwszLocalPath is String? StrPtr(pwszLocalPath) : pwszLocalPath

        result := DllCall("WDSCLIENTAPI.dll\WdsCliTransferImage", "ptr", hImage, "ptr", pwszLocalPath, "uint", dwFlags, "uint", dwReserved, "ptr", pfnWdsCliCallback, "ptr", pvUserData, "ptr", phTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Transfers a file from a WDS server to the WDS client using a multicast transfer protocol.
     * @param {Pointer<Char>} pwszServer A pointer to a null-terminated string value that contains the  WDS server name.
     * @param {Pointer<Char>} pwszNamespace A pointer to a null-terminated string value that contains the multicast namespace name for the image.
     * @param {Pointer<Char>} pwszRemoteFilePath A pointer to a null-terminated string value that contains the  full path for the remote location from which to copy the file being transferred.
     * @param {Pointer<Char>} pwszLocalFilePath A pointer to a null-terminated string value that contains the full path to the local location to store the file being transferred.
     * @param {Integer} dwFlags Options associated with the file transfer. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDS_CLI_TRANSFER_ASYNCHRONOUS"></a><a id="wds_cli_transfer_asynchronous"></a><dl>
     * <dt><b>WDS_CLI_TRANSFER_ASYNCHRONOUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag specifies an asynchronous transfer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwReserved This parameter is reserved.
     * @param {Pointer<PFN_WdsCliCallback>} pfnWdsCliCallback A pointer to an optional callback function for this transfer.
     * @param {Pointer<Void>} pvUserData A pointer to optional user information that can be passed to the callback function.
     * @param {Pointer<Void>} phTransfer A pointer to a transfer handle that can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer">WdsCliWaitForTransfer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer">WdsCliCancelTransfer</a> functions to wait for the transfer to complete or to cancel the transfer.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclitransferfile
     * @since windows6.0.6000
     */
    static WdsCliTransferFile(pwszServer, pwszNamespace, pwszRemoteFilePath, pwszLocalFilePath, dwFlags, dwReserved, pfnWdsCliCallback, pvUserData, phTransfer) {
        pwszServer := pwszServer is String? StrPtr(pwszServer) : pwszServer
        pwszNamespace := pwszNamespace is String? StrPtr(pwszNamespace) : pwszNamespace
        pwszRemoteFilePath := pwszRemoteFilePath is String? StrPtr(pwszRemoteFilePath) : pwszRemoteFilePath
        pwszLocalFilePath := pwszLocalFilePath is String? StrPtr(pwszLocalFilePath) : pwszLocalFilePath

        result := DllCall("WDSCLIENTAPI.dll\WdsCliTransferFile", "ptr", pwszServer, "ptr", pwszNamespace, "ptr", pwszRemoteFilePath, "ptr", pwszLocalFilePath, "uint", dwFlags, "uint", dwReserved, "ptr", pfnWdsCliCallback, "ptr", pvUserData, "ptr", phTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels a WDS transfer operation.
     * @param {Pointer<Void>} hTransfer A handle for the WDS transfer operation being canceled. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdsclicanceltransfer
     * @since windows6.0.6000
     */
    static WdsCliCancelTransfer(hTransfer) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliCancelTransfer", "ptr", hTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Waits for an image or file transfer to complete.
     * @param {Pointer<Void>} hTransfer A WDS transfer handle for the transfer being canceled. This can be the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferimage">WdsCliTransferImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclitransferfile">WdsCliTransferFile</a> functions.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliwaitfortransfer
     * @since windows6.0.6000
     */
    static WdsCliWaitForTransfer(hTransfer) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliWaitForTransfer", "ptr", hTransfer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function obtains from a WDS image, the driver packages (INF files) that can be used on this computer.
     * @param {Pointer<Void>} hImage A handle to a WDS image.
     * @param {Pointer<Char>} ppwszServerName A pointer to a pointer to a string value that receives the IP address of the server hosting the driver packages.
     * @param {Pointer<Char>} pppwszDriverPackages An array of string values that are the full paths for the driver packages (INF files.) The Internet Protocol (IP) address, rather than a computer name, is returned as part of the path.  For example, a string value <b>\\172.31.224.245\REMINST\Stores\Drivers\driver.inf</b> in the array gives the full path to driver.inf.
     * 
     * <div class="code"></div>
     * @param {Pointer<UInt32>} pulCount The number of driver packages returned by <i>pppwszDriverPackages</i>.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliobtaindriverpackages
     * @since windows6.1
     */
    static WdsCliObtainDriverPackages(hImage, ppwszServerName, pppwszDriverPackages, pulCount) {
        result := DllCall("WDSCLIENTAPI.dll\WdsCliObtainDriverPackages", "ptr", hImage, "ptr", ppwszServerName, "ptr", pppwszDriverPackages, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function obtains the driver packages (INF files) that are applicable to the specified WDS driver query XML.
     * @param {Pointer<Void>} hSession A handle to a session with the WDS server. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdsclicreatesession">WdsCliCreateSession</a> function.
     * @param {Pointer<Char>} pwszMachineInfo A pointer to a string containing WDS driver query XML which can be generated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdsclientapi/nf-wdsclientapi-wdscligetdriverqueryxml">WdsCliGetDriverQueryXml</a> function.
     * @param {Pointer<Char>} ppwszServerName A pointer to a pointer to a string value that receives the IP address of the server hosting the driver packages.
     * @param {Pointer<Char>} pppwszDriverPackages An array of string values that are the full paths for the driver packages (INF files.) The Internet Protocol (IP) address, rather than a computer name, is returned as part of the path.  For example, a string value <b>\\172.31.224.245\REMINST\Stores\Drivers\driver.inf</b> in the array gives the full path to driver.inf.
     * @param {Pointer<UInt32>} pulCount The number of driver packages returned by pppwszDriverPackages.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscliobtaindriverpackagesex
     * @since windows8.0
     */
    static WdsCliObtainDriverPackagesEx(hSession, pwszMachineInfo, ppwszServerName, pppwszDriverPackages, pulCount) {
        pwszMachineInfo := pwszMachineInfo is String? StrPtr(pwszMachineInfo) : pwszMachineInfo

        result := DllCall("WDSCLIENTAPI.dll\WdsCliObtainDriverPackagesEx", "ptr", hSession, "ptr", pwszMachineInfo, "ptr", ppwszServerName, "ptr", pppwszDriverPackages, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function generates an XML string which can be used to query a WDS server for driver packages using the WdsCliObtainDriverPackagesEx function.
     * @param {Pointer<Char>} pwszWinDirPath The path to the Windows directory of the applied image. This parameter is optional. If it is specified,  the section of the WDS driver query XML  for the target operating system is generated.
     * @param {Pointer<Char>} ppwszDriverQuery A pointer to a pointer to a string that receives the generated WDS driver query XML. The caller has to free this buffer using "delete\[\]\(\*ppwszDriverQuery\)".
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsclientapi/nf-wdsclientapi-wdscligetdriverqueryxml
     * @since windows8.0
     */
    static WdsCliGetDriverQueryXml(pwszWinDirPath, ppwszDriverQuery) {
        pwszWinDirPath := pwszWinDirPath is String? StrPtr(pwszWinDirPath) : pwszWinDirPath

        result := DllCall("WDSCLIENTAPI.dll\WdsCliGetDriverQueryXml", "ptr", pwszWinDirPath, "ptr", ppwszDriverQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a provider with the system.
     * @param {Pointer<Char>} pszProviderName Address of a null terminated string that specifies the display name of the provider. This name is 
     *       displayed to the user and must be unique among registered providers.
     * @param {Pointer<Char>} pszModulePath Address of a null-terminated string that specifies the full path to the provider DLL.
     * @param {Integer} Index Index into the list of providers. Any existing providers are shifted down if necessary. The administrator 
     *       can rearrange the providers as needed, so no assumptions should be made about the order of providers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_REG_INDEX_TOP"></a><a id="pxe_reg_index_top"></a><dl>
     * <dt><b>PXE_REG_INDEX_TOP</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add the provider to the top of the list to be the first to receive client requests.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_REG_INDEX_BOTTOM"></a><a id="pxe_reg_index_bottom"></a><dl>
     * <dt><b>PXE_REG_INDEX_BOTTOM</b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add the provider to the bottom of the list.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} bIsCritical Indicates whether the provider is critical. If a critical provider fails, the WDS server will also 
     *       fail.
     * @param {Pointer<Void>} phProviderKey Address of a <b>HKEY</b> where the configuration should be stored. The provider will 
     *       receive a handle to this same key as the <i>hProviderKey</i> parameter to its 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> callback.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderregister
     * @since windowsserver2008
     */
    static PxeProviderRegister(pszProviderName, pszModulePath, Index, bIsCritical, phProviderKey) {
        pszProviderName := pszProviderName is String? StrPtr(pszProviderName) : pszProviderName
        pszModulePath := pszModulePath is String? StrPtr(pszModulePath) : pszModulePath

        result := DllCall("WDSPXE.dll\PxeProviderRegister", "ptr", pszProviderName, "ptr", pszModulePath, "uint", Index, "int", bIsCritical, "ptr", phProviderKey, "uint")
        return result
    }

    /**
     * Removes a provider from the list of registered providers.
     * @param {Pointer<Char>} pszProviderName Display name for provider from the call to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderregister">PxeProviderRegister</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderunregister
     * @since windowsserver2008
     */
    static PxeProviderUnRegister(pszProviderName) {
        pszProviderName := pszProviderName is String? StrPtr(pszProviderName) : pszProviderName

        result := DllCall("WDSPXE.dll\PxeProviderUnRegister", "ptr", pszProviderName, "uint")
        return result
    }

    /**
     * Returns the index of the specified provider in the list of registered providers.
     * @param {Pointer<Char>} pszProviderName Friendly name for the provider from the call to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderregister">PxeProviderRegister</a> function.
     * @param {Pointer<UInt32>} puIndex Address of a <b>ULONG</b> that will receive the index of the provider.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderqueryindex
     * @since windowsserver2008
     */
    static PxeProviderQueryIndex(pszProviderName, puIndex) {
        pszProviderName := pszProviderName is String? StrPtr(pszProviderName) : pszProviderName

        result := DllCall("WDSPXE.dll\PxeProviderQueryIndex", "ptr", pszProviderName, "uint*", puIndex, "uint")
        return result
    }

    /**
     * Starts an enumeration of registered providers.
     * @param {Pointer<Void>} phEnum Address of a <b>HANDLE</b> that on successful return can be used with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumnext">PxeProviderEnumNext</a> function to enumerate 
     *       providers. When the enumeration handle is no longer needed, use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumclose">PxeProviderEnumClose</a> function to close the 
     *       enumeration.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderenumfirst
     * @since windowsserver2008
     */
    static PxeProviderEnumFirst(phEnum) {
        result := DllCall("WDSPXE.dll\PxeProviderEnumFirst", "ptr", phEnum, "uint")
        return result
    }

    /**
     * Enumerates registered providers.
     * @param {Pointer<Void>} hEnum <b>HANDLE</b> returned by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumfirst">PxeProviderEnumFirst</a> function.
     * @param {Pointer<PXE_PROVIDER>} ppProvider Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_provider">PXE_PROVIDER</a> structure with the 
     *       <b>uSizeOfStruct</b> member filled in with the size of the structure. On return this 
     *       structure is filled in with provider information. This structure can be freed with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderfreeinfo">PxeProviderFreeInfo</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderenumnext
     * @since windowsserver2008
     */
    static PxeProviderEnumNext(hEnum, ppProvider) {
        result := DllCall("WDSPXE.dll\PxeProviderEnumNext", "ptr", hEnum, "ptr", ppProvider, "uint")
        return result
    }

    /**
     * Closes the enumeration of providers opened by the PxeProviderEnumFirst function.
     * @param {Pointer<Void>} hEnum <b>HANDLE</b> returned by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumfirst">PxeProviderEnumFirst</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderenumclose
     * @since windowsserver2008
     */
    static PxeProviderEnumClose(hEnum) {
        result := DllCall("WDSPXE.dll\PxeProviderEnumClose", "ptr", hEnum, "uint")
        return result
    }

    /**
     * Frees memory allocated by the PxeProviderEnumNext function.
     * @param {Pointer<PXE_PROVIDER>} pProvider Address of a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_provider">PXE_PROVIDER</a> structure returned from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxeproviderenumnext">PxeProviderEnumNext</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeproviderfreeinfo
     * @since windowsserver2008
     */
    static PxeProviderFreeInfo(pProvider) {
        result := DllCall("WDSPXE.dll\PxeProviderFreeInfo", "ptr", pProvider, "uint")
        return result
    }

    /**
     * Registers callback functions for different notification events.
     * @param {Pointer<Void>} hProvider <b>HANDLE</b> passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
     * @param {Integer} CallbackType Specifies the callback that is being registered.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_CALLBACK_RECV_REQUEST"></a><a id="pxe_callback_recv_request"></a><dl>
     * <dt><b>PXE_CALLBACK_RECV_REQUEST</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Register the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> 
     *         callback. This callback must be registered while the provider is processing the 
     *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function or the 
     *         provider will be shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_CALLBACK_SHUTDOWN"></a><a id="pxe_callback_shutdown"></a><dl>
     * <dt><b>PXE_CALLBACK_SHUTDOWN</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Register the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeprovidershutdown">PxeProviderShutdown</a> 
     *         callback. This callback must be registered while the provider is processing the 
     *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function or the 
     *         provider will be shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_CALLBACK_SERVICE_CONTROL"></a><a id="pxe_callback_service_control"></a><dl>
     * <dt><b>PXE_CALLBACK_SERVICE_CONTROL</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Register the 
     *         <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderservicecontrol">PxeProviderServiceControl</a> callback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_CALLBACK_MAX"></a><a id="pxe_callback_max"></a><dl>
     * <dt><b>PXE_CALLBACK_MAX</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used to determine an out-of-range index. Values greater than or equal to 
     *         <b>PXE_CALLBACK_MAX</b> are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pCallbackFunction Address of the callback function. The function signature varies depending on the 
     *       <i>CallbackType</i> parameter.
     * @param {Pointer<Void>} pContext Context value to be passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeregistercallback
     * @since windowsserver2008
     */
    static PxeRegisterCallback(hProvider, CallbackType, pCallbackFunction, pContext) {
        result := DllCall("WDSPXE.dll\PxeRegisterCallback", "ptr", hProvider, "uint", CallbackType, "ptr", pCallbackFunction, "ptr", pContext, "uint")
        return result
    }

    /**
     * Sends a packet to a client request.
     * @param {Pointer<Void>} hClientRequest Handle to the client request received in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
     * @param {Pointer} pPacket Pointer to packet allocated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
     * @param {Pointer<PXE_ADDRESS>} pAddress Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_address">PXE_ADDRESS</a> structure that contains the 
     *       destination address of the packet. If the <i>pAddress</i> parameter is 
     *       <b>NULL</b>, then the packet is sent to the source address of the client request.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxesendreply
     * @since windowsserver2008
     */
    static PxeSendReply(hClientRequest, pPacket, uPacketLen, pAddress) {
        result := DllCall("WDSPXE.dll\PxeSendReply", "ptr", hClientRequest, "ptr", pPacket, "uint", uPacketLen, "ptr", pAddress, "uint")
        return result
    }

    /**
     * Passes the results of processing the client request asynchronously. This function should be called only if the PxeProviderRecvRequest function returns ERROR_IO_PENDING.
     * @param {Pointer<Void>} hClientRequest Handle to the request received from the client.
     * @param {Integer} Action Specifies the action that the system should take for this client request. The following table lists the 
     *       possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_BA_NBP"></a><a id="pxe_ba_nbp"></a><dl>
     * <dt><b>PXE_BA_NBP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider replied to the client with a standard DHCP response packet that contains the path to the 
     *         Network Boot Program. Returning this action means that the provider successfully completed the client request 
     *         by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxesendreply">PxeSendReply</a> function at least 
     *         once.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_BA_CUSTOM"></a><a id="pxe_ba_custom"></a><dl>
     * <dt><b>PXE_BA_CUSTOM</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider replied to the client by using a custom response that does not conform to DHCP 
     *         specifications. Returning this action means that the provider successfully completed the client request by 
     *         calling the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxesendreply">PxeSendReply</a> function at least once.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_BA_IGNORE"></a><a id="pxe_ba_ignore"></a><dl>
     * <dt><b>PXE_BA_IGNORE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not want to service the client request and the request should not be passed to the next 
     *         provider. All resources associated with the client request are released and the client request is ignored. 
     *         Providers can also use this value if they recognize the client but the request was malformed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_BA_REJECTED"></a><a id="pxe_ba_rejected"></a><dl>
     * <dt><b>PXE_BA_REJECTED</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not want to service the client request. The system passes the request to the next 
     *         provider in the list of registered providers. If this was the last provider in the list, then all resources 
     *         associated with the client request are released and client request is ignored.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeasyncrecvdone
     * @since windowsserver2008
     */
    static PxeAsyncRecvDone(hClientRequest, Action) {
        result := DllCall("WDSPXE.dll\PxeAsyncRecvDone", "ptr", hClientRequest, "uint", Action, "uint")
        return result
    }

    /**
     * Adds a trace entry to the PXE log.
     * @param {Pointer<Void>} hProvider <b>HANDLE</b> passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
     * @param {Integer} Severity Severity of trace entry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_TRACE_VERBOSE"></a><a id="pxe_trace_verbose"></a><dl>
     * <dt><b>PXE_TRACE_VERBOSE</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trace entry is verbose and would primarily be useful when debugging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_TRACE_INFO"></a><a id="pxe_trace_info"></a><dl>
     * <dt><b>PXE_TRACE_INFO</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trace entry is informational, but does not indicate a warning condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_TRACE_WARNING"></a><a id="pxe_trace_warning"></a><dl>
     * <dt><b>PXE_TRACE_WARNING</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trace message indicates a warning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_TRACE_ERROR"></a><a id="pxe_trace_error"></a><dl>
     * <dt><b>PXE_TRACE_ERROR</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trace message indicates an error condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_TRACE_FATAL"></a><a id="pxe_trace_fatal"></a><dl>
     * <dt><b>PXE_TRACE_FATAL</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trace message indicates a fatal error condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Char>} pszFormat Address of a buffer that contains a printf-style format string.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxetrace
     * @since windowsserver2008
     */
    static PxeTrace(hProvider, Severity, pszFormat) {
        pszFormat := pszFormat is String? StrPtr(pszFormat) : pszFormat

        result := DllCall("WDSPXE.dll\PxeTrace", "ptr", hProvider, "uint", Severity, "ptr", pszFormat, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProvider 
     * @param {Integer} Severity 
     * @param {Pointer<Char>} pszFormat 
     * @param {Pointer<SByte>} Params 
     * @returns {Integer} 
     */
    static PxeTraceV(hProvider, Severity, pszFormat, Params) {
        pszFormat := pszFormat is String? StrPtr(pszFormat) : pszFormat

        result := DllCall("WDSPXE.dll\PxeTraceV", "ptr", hProvider, "uint", Severity, "ptr", pszFormat, "char*", Params, "uint")
        return result
    }

    /**
     * Allocates a packet to be sent with the PxeSendReply function.
     * @param {Pointer<Void>} hProvider <b>HANDLE</b> passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
     * @param {Pointer<Void>} hClientRequest Handle to the client request received in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
     * @param {Integer} uSize Size of the buffer to be allocated.
     * @returns {Pointer<Void>} Address of allocated buffer, or <b>NULL</b> if the allocation failed. For extended error 
     *       information, use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxepacketallocate
     * @since windowsserver2008
     */
    static PxePacketAllocate(hProvider, hClientRequest, uSize) {
        A_LastError := 0

        result := DllCall("WDSPXE.dll\PxePacketAllocate", "ptr", hProvider, "ptr", hClientRequest, "uint", uSize, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees a packet allocated by the PxePacketAllocate function.
     * @param {Pointer<Void>} hProvider <b>HANDLE</b> passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
     * @param {Pointer<Void>} hClientRequest Handle to the client request received in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
     * @param {Pointer<Void>} pPacket Pointer to packet allocated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxepacketfree
     * @since windowsserver2008
     */
    static PxePacketFree(hProvider, hClientRequest, pPacket) {
        result := DllCall("WDSPXE.dll\PxePacketFree", "ptr", hProvider, "ptr", hClientRequest, "ptr", pPacket, "uint")
        return result
    }

    /**
     * Specifies attributes for the provider.
     * @param {Pointer<Void>} hProvider <b>HANDLE</b> passed to 
     *       the <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderinitialize">PxeProviderInitialize</a> function.
     * @param {Integer} Attribute Identifies the attribute to set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_PROV_ATTR_FILTER"></a><a id="pxe_prov_attr_filter"></a><dl>
     * <dt><b>PXE_PROV_ATTR_FILTER</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pParameterBuffer</i> parameter points to a <b>ULONG</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_PROV_ATTR_FILTER_IPV6"></a><a id="pxe_prov_attr_filter_ipv6"></a><dl>
     * <dt><b>PXE_PROV_ATTR_FILTER_IPV6</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pParameterBuffer</i> parameter points to a <b>ULONG</b>. Use this attribute with DHCPv6 packets. Available beginning with Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_PROV_ATTR_IPV6_CAPABLE"></a><a id="pxe_prov_attr_ipv6_capable"></a><dl>
     * <dt><b>PXE_PROV_ATTR_IPV6_CAPABLE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>BOOL</b> value that is TRUE to indicate the provider is capable of processing IPv6 packets.  By default, the server assumes a provider is not capable of processing IPv6 packets and will not deliver them. Available beginning with Windows 8 and Windows Server 2012.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pParameterBuffer Pointer to a buffer. The size and contents of this buffer vary depending on the value of the 
     *       <i>Attribute</i> parameter.
     * @param {Integer} uParamLen The size of the buffer pointed to by the <i>pParameterBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxeprovidersetattribute
     * @since windowsserver2008
     */
    static PxeProviderSetAttribute(hProvider, Attribute, pParameterBuffer, uParamLen) {
        result := DllCall("WDSPXE.dll\PxeProviderSetAttribute", "ptr", hProvider, "uint", Attribute, "ptr", pParameterBuffer, "uint", uParamLen, "uint")
        return result
    }

    /**
     * Initializes a response packet as a DHCP reply packet.
     * @param {Pointer} pRecvPacket Address of a valid DHCP packet received from the client in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
     * @param {Integer} uRecvPacketLen Length of the packet pointed to by the <i>pRecvPacket</i> parameter.
     * @param {Pointer} pReplyPacket Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Pointer<UInt32>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
     *       the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpinitialize
     * @since windowsserver2008
     */
    static PxeDhcpInitialize(pRecvPacket, uRecvPacketLen, pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen) {
        result := DllCall("WDSPXE.dll\PxeDhcpInitialize", "ptr", pRecvPacket, "uint", uRecvPacketLen, "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, "uint*", puReplyPacketLen, "uint")
        return result
    }

    /**
     * Initializes a response packet as a DHCPv6 reply packet.
     * @param {Pointer} pRequest Address of a valid DHCPv6 packet received from the client in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/Wds/pxeproviderrecvrequest">PxeProviderRecvRequest</a> callback.
     * @param {Integer} cbRequest Length of the packet pointed to by the <i>pRequest</i> parameter.
     * @param {Pointer} pReply Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} cbReply Allocated length of the packet pointed to by the <i>pReply</i> parameter.
     * @param {Pointer<UInt32>} pcbReplyUsed Address of a <b>ULONG</b> that on successful completion will receive the length of 
     *       the packet pointed to by the <i>pReply</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6initialize
     * @since windows8.0
     */
    static PxeDhcpv6Initialize(pRequest, cbRequest, pReply, cbReply, pcbReplyUsed) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6Initialize", "ptr", pRequest, "uint", cbRequest, "ptr", pReply, "uint", cbReply, "uint*", pcbReplyUsed, "uint")
        return result
    }

    /**
     * Appends a DHCP option to the reply packet.
     * @param {Pointer} pReplyPacket Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Pointer<UInt32>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
     *       the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} bOption DHCP option to add to the packet.
     * @param {Integer} bOptionLen Length of the option value pointed to by the <i>pValue</i> parameter. This parameter is 
     *       ignored if the <i>bOption</i> parameter is End Option (0xFF) or Pad Option (0x00).
     * @param {Pointer} pValue Address of the buffer that contains the DHCP option value. This parameter is ignored if the 
     *       <i>bOption</i> parameter is End Option (0xFF) or Pad Option (0x00).
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpappendoption
     * @since windowsserver2008
     */
    static PxeDhcpAppendOption(pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen, bOption, bOptionLen, pValue) {
        result := DllCall("WDSPXE.dll\PxeDhcpAppendOption", "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, "uint*", puReplyPacketLen, "char", bOption, "char", bOptionLen, "ptr", pValue, "uint")
        return result
    }

    /**
     * Appends a DHCPv6 option to the reply packet.
     * @param {Pointer} pReply Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} cbReply The total size in bytes allocated for the buffer that is pointed to by <i>pReply</i>.
     * @param {Pointer<UInt32>} pcbReplyUsed On entry, this is the number of bytes of the buffer pointed to by <i>pReply</i> that are currently used.  On success of the function, this is updated to the number of bytes used after appending the option.
     * @param {Integer} wOptionType DHCPv6 option to add to the packet.
     * @param {Integer} cbOption Length of the option value pointed to by the <i>pOption</i> parameter.
     * @param {Pointer} pOption Address of the buffer that contains the DHCPv6 option value.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6appendoption
     * @since windows8.0
     */
    static PxeDhcpv6AppendOption(pReply, cbReply, pcbReplyUsed, wOptionType, cbOption, pOption) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6AppendOption", "ptr", pReply, "uint", cbReply, "uint*", pcbReplyUsed, "ushort", wOptionType, "ushort", cbOption, "ptr", pOption, "uint")
        return result
    }

    /**
     * Appends a DHCP option to the reply packet.
     * @param {Pointer} pReplyPacket Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uMaxReplyPacketLen Allocated length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Pointer<UInt32>} puReplyPacketLen Address of a <b>ULONG</b> that on successful completion will receive the length of 
     *       the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} uBufferLen Length of the option value pointed to by the <i>pBuffer</i> parameter.
     * @param {Pointer} pBuffer Address of the buffer that contains the DHCP option value.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpappendoptionraw
     * @since windowsserver2008
     */
    static PxeDhcpAppendOptionRaw(pReplyPacket, uMaxReplyPacketLen, puReplyPacketLen, uBufferLen, pBuffer) {
        result := DllCall("WDSPXE.dll\PxeDhcpAppendOptionRaw", "ptr", pReplyPacket, "uint", uMaxReplyPacketLen, "uint*", puReplyPacketLen, "ushort", uBufferLen, "ptr", pBuffer, "uint")
        return result
    }

    /**
     * Appends a DHCPv6 option to the reply packet.
     * @param {Pointer} pReply Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} cbReply Allocated length of the packet pointed to by the <i>pReply</i> parameter.
     * @param {Pointer<UInt32>} pcbReplyUsed On entry, this is the number of bytes of the buffer pointed to by <i>pReply</i> that are currently used.  On success of the function, this is updated to the number of bytes used after appending the option.
     * @param {Integer} cbBuffer Length of the option value pointed to by the <i>pBuffer</i> parameter.
     * @param {Pointer} pBuffer Address of the buffer that contains the DHCPv6 option value. The buffer must contain the encoded option code and option size.
     * 
     * For more information about encoding the option code and option size, developers should refer to the Dynamic Host Configuration Protocol for IPv6 <a href="https://www.ietf.org/rfc/rfc3315.txt">RFC 3315</a> maintained by The Internet Engineering Task Force (IETF).
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6appendoptionraw
     * @since windows8.0
     */
    static PxeDhcpv6AppendOptionRaw(pReply, cbReply, pcbReplyUsed, cbBuffer, pBuffer) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6AppendOptionRaw", "ptr", pReply, "uint", cbReply, "uint*", pcbReplyUsed, "ushort", cbBuffer, "ptr", pBuffer, "uint")
        return result
    }

    /**
     * Validates that a packet is a DHCP packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
     * @param {Integer} bRequestPacket Indicates whether the packet is a request packet. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packet to be validated is a request packet from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packet to be validated is a packet generated by the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Int32>} pbPxeOptionPresent Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the packet 
     *       is a valid DHCP packet that contains the Vendor Class Identifier option (60) with the value set to 
     *       "PXEClient".
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpisvalid
     * @since windowsserver2008
     */
    static PxeDhcpIsValid(pPacket, uPacketLen, bRequestPacket, pbPxeOptionPresent) {
        result := DllCall("WDSPXE.dll\PxeDhcpIsValid", "ptr", pPacket, "uint", uPacketLen, "int", bRequestPacket, "int*", pbPxeOptionPresent, "uint")
        return result
    }

    /**
     * Validates that a packet is a valid DHCPv6 packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pPacket</i> parameter.
     * @param {Integer} bRequestPacket Indicates whether the packet is a request packet. The following table lists the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packet to be validated is a request packet from the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Packet to be validated is a packet generated by the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Int32>} pbPxeOptionPresent Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the packet 
     *       is a valid DHCPv6 packet.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6isvalid
     * @since windows8.0
     */
    static PxeDhcpv6IsValid(pPacket, uPacketLen, bRequestPacket, pbPxeOptionPresent) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6IsValid", "ptr", pPacket, "uint", uPacketLen, "int", bRequestPacket, "int*", pbPxeOptionPresent, "uint")
        return result
    }

    /**
     * Retrieves an option value from a DHCP packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} uInstance One-based index that specifies which instance of the <i>bOption</i> parameter to 
     *       retrieve.
     * @param {Integer} bOption Option whose value will be retrieved.
     * @param {Pointer<Byte>} pbOptionLen Address of <b>BYTE</b> which will receive the length of the option value.
     * @param {Pointer<Void>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
     *       packet.
     * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
     *       error code is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was found and a pointer to the value was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was not located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
     *         <a href="/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpisvalid">PxeDhcpIsValid</a> function; only the packet length and 
     *         magic cookie are verified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpgetoptionvalue
     * @since windowsserver2008
     */
    static PxeDhcpGetOptionValue(pPacket, uPacketLen, uInstance, bOption, pbOptionLen, ppOptionValue) {
        result := DllCall("WDSPXE.dll\PxeDhcpGetOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", uInstance, "char", bOption, "char*", pbOptionLen, "ptr", ppOptionValue, "uint")
        return result
    }

    /**
     * Retrieves an option value from a DHCPv6 packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} uInstance One-based index that specifies which instance of the <i>wOption</i> parameter to 
     *       retrieve.
     * @param {Integer} wOption Option whose value will be retrieved.
     * @param {Pointer<UInt16>} pwOptionLen Address of <b>WORD</b> which will receive the length of the option value.
     * @param {Pointer<Void>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
     *       packet.
     * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
     *       error code is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was found and a pointer to the value was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was not located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is not a valid DHCPv6 packet. This test is not as thorough as the tests used by the 
     *         <a href="/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6isvalid">PxeDhcpv6IsValid</a> function; only the packet length and 
     *         magic cookie are verified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6getoptionvalue
     * @since windows8.0
     */
    static PxeDhcpv6GetOptionValue(pPacket, uPacketLen, uInstance, wOption, pwOptionLen, ppOptionValue) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6GetOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", uInstance, "ushort", wOption, "ushort*", pwOptionLen, "ptr", ppOptionValue, "uint")
        return result
    }

    /**
     * Retrieves an option value from the Vendor Specific Information field (43) of a DHCP packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} bOption Option whose value will be retrieved.
     * @param {Integer} uInstance One-based index that specifies which instance of the <i>bOption</i> parameter to 
     *       retrieve.
     * @param {Pointer<Byte>} pbOptionLen Address of <b>BYTE</b> which will receive the length of the option value.
     * @param {Pointer<Void>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
     *       packet.
     * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
     *       error code is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was found and a pointer to the value was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was not located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
     *         <a href="/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpisvalid">PxeDhcpIsValid</a> function; only the packet length and 
     *         magic cookie are verified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpgetvendoroptionvalue
     * @since windowsserver2008
     */
    static PxeDhcpGetVendorOptionValue(pPacket, uPacketLen, bOption, uInstance, pbOptionLen, ppOptionValue) {
        result := DllCall("WDSPXE.dll\PxeDhcpGetVendorOptionValue", "ptr", pPacket, "uint", uPacketLen, "char", bOption, "uint", uInstance, "char*", pbOptionLen, "ptr", ppOptionValue, "uint")
        return result
    }

    /**
     * Retrieves option values from the OPTION_VENDOR_OPTS (17) field of a DHCPv6 packet.
     * @param {Pointer} pPacket Pointer to a reply packet allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxepacketallocate">PxePacketAllocate</a> function.
     * @param {Integer} uPacketLen Length of the packet pointed to by the <i>pReplyPacket</i> parameter.
     * @param {Integer} dwEnterpriseNumber An Enterprise Number assigned to the vendor of the option by the Internet Assigned Numbers Authority (IANA).
     * 
     * For more information about assigned Enterprise Numbers, developers should refer to the Dynamic Host Configuration Protocol for IPv6 (<a href="https://www.ietf.org/rfc/rfc3315.txt">RFC 3315</a>) maintained by The Internet Engineering Task Force (IETF).
     * @param {Integer} wOption Option whose value will be retrieved.
     * @param {Integer} uInstance One-based index that specifies which instance of the <i>wOption</i> parameter to 
     *       retrieve.
     * @param {Pointer<UInt16>} pwOptionLen Address of <b>WORD</b> which will receive the length of the option value.
     * @param {Pointer<Void>} ppOptionValue Address of <b>PVOID</b> which will receive the address of the option value inside the 
     *       packet.
     * @returns {Integer} Common return values are listed in the following table. For all other failures, an appropriate Windows 
     *       error code is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was found and a pointer to the value was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The option was not located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The packet is not a valid DHCP packet. This test is not as thorough as the tests used by the 
     *         <a href="/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6isvalid">PxeDhcpv6IsValid</a> function; only the packet length and 
     *         magic cookie are verified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6getvendoroptionvalue
     * @since windows8.0
     */
    static PxeDhcpv6GetVendorOptionValue(pPacket, uPacketLen, dwEnterpriseNumber, wOption, uInstance, pwOptionLen, ppOptionValue) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6GetVendorOptionValue", "ptr", pPacket, "uint", uPacketLen, "uint", dwEnterpriseNumber, "ushort", wOption, "uint", uInstance, "ushort*", pwOptionLen, "ptr", ppOptionValue, "uint")
        return result
    }

    /**
     * This function can be used by a provider to parse RELAY-FORW messages and their nested OPTION_RELAY_MSG messages.
     * @param {Pointer} pRelayForwPacket Specifies a pointer to a DHCPv6 RELAY-FORW message.
     * @param {Integer} uRelayForwPacketLen The size in bytes of the RELAY-FORW message pointed to by the <i>pRelayForwPacket</i> parameter.
     * @param {Pointer<PXE_DHCPV6_NESTED_RELAY_MESSAGE>} pRelayMessages An array of <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/ns-wdspxe-pxe_dhcpv6_nested_relay_message">PXE_DHCPV6_NESTED_RELAY_MESSAGE</a> structures initialized by this routine.  The array’s size is specified by <i>nRelayMessages</i>.  Elements of this array are initialized to point to the nested chain of relay packets encoded in OPTION_RELAY_MSG.  Index 0 is the outermost nested OPTION_RELAY_MSG packet. As the index increases the pointers correspond to more deeply nested OPTION_RELAY_MSG packets.
     * @param {Integer} nRelayMessages The size of the array, in number of array elements, pointed to by the <i>pRelayMessages</i> parameter.
     * @param {Pointer<UInt32>} pnRelayMessages Specifies a pointer to a <b>ULONG</b> value which on success receives the actual number of elements written into the <i>pRelayMessages</i> array.
     * @param {Pointer<Byte>} ppInnerPacket Specifies a pointer to a <b>PVOID</b> value which on success is set to the start of the innermost packet in the relay chain. This is the original client request packet.
     * @param {Pointer<UInt32>} pcbInnerPacket Specifies a pointer to a <b>ULONG</b> value which on success will be set to the size, in bytes, of the innermost packet in the relay chain which is the original client request packet.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6parserelayforw
     * @since windows8.0
     */
    static PxeDhcpv6ParseRelayForw(pRelayForwPacket, uRelayForwPacketLen, pRelayMessages, nRelayMessages, pnRelayMessages, ppInnerPacket, pcbInnerPacket) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6ParseRelayForw", "ptr", pRelayForwPacket, "uint", uRelayForwPacketLen, "ptr", pRelayMessages, "uint", nRelayMessages, "uint*", pnRelayMessages, "ptr", ppInnerPacket, "uint*", pcbInnerPacket, "uint")
        return result
    }

    /**
     * Generates a RELAY-REPL message.
     * @param {Pointer<PXE_DHCPV6_NESTED_RELAY_MESSAGE>} pRelayMessages An array of <b>PXE_DHCPV6_NESTED_RELAY_FORW</b> structures which together specify the sequence of nested RELAY-FORW packets.  This value can be obtained from the <i>pRelayMessages</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxedhcpv6parserelayforw">PxeDhcpv6ParseRelayForw</a>.
     * @param {Integer} nRelayMessages The number of elements in the array pointed to by the <i>pRelayMessages</i> argument.
     * @param {Pointer} pInnerPacket A pointer to a packet which is the server’s response to the innermost packet in the RELAY-FORW chain.
     * @param {Integer} cbInnerPacket The size of the packet pointed to by the <i>pInnerPacket</i> argument.
     * @param {Pointer} pReplyBuffer A pointer to a buffer used to construct the outer RELAY-REPL packet. This buffer receives the nested response packet and the nested RELAY-REPL chain specified by the <i>pRelayMessages</i> parameter.
     * @param {Integer} cbReplyBuffer The size of the buffer in bytes  pointed to by <i>pRelyBuffer</i>.
     * @param {Pointer<UInt32>} pcbReplyBuffer On success, this is set to the actual size of the RELAY-REPL packet in the buffer pointed to by <i>pRelyBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxedhcpv6createrelayrepl
     * @since windows8.0
     */
    static PxeDhcpv6CreateRelayRepl(pRelayMessages, nRelayMessages, pInnerPacket, cbInnerPacket, pReplyBuffer, cbReplyBuffer, pcbReplyBuffer) {
        result := DllCall("WDSPXE.dll\PxeDhcpv6CreateRelayRepl", "ptr", pRelayMessages, "uint", nRelayMessages, "ptr", pInnerPacket, "uint", cbInnerPacket, "ptr", pReplyBuffer, "uint", cbReplyBuffer, "uint*", pcbReplyBuffer, "uint")
        return result
    }

    /**
     * Returns information about the PXE server.
     * @param {Integer} uInfoType Selects the information that will be returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_GSI_TRACE_ENABLED"></a><a id="pxe_gsi_trace_enabled"></a><dl>
     * <dt><b>PXE_GSI_TRACE_ENABLED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns a <b>BOOL</b> that indicates whether tracing is enabled for the 
     *         server. <b>TRUE</b> indicates that tracing is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pBuffer Address of a buffer that will receive the results of the query. The size and format of the results depends 
     *       on the value of the <i>uInfoType</i> parameter.
     * @param {Integer} uBufferLen Size of buffer pointed to by the <i>pBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxegetserverinfo
     * @since windowsserver2008
     */
    static PxeGetServerInfo(uInfoType, pBuffer, uBufferLen) {
        result := DllCall("WDSPXE.dll\PxeGetServerInfo", "uint", uInfoType, "ptr", pBuffer, "uint", uBufferLen, "uint")
        return result
    }

    /**
     * Returns information about the PXE server.
     * @param {Integer} uInfoType Selects the information that will be returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_GSI_TRACE_ENABLED"></a><a id="pxe_gsi_trace_enabled"></a><dl>
     * <dt><b>PXE_GSI_TRACE_ENABLED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns a <b>BOOL</b> that indicates whether tracing is enabled for the 
     *         server. <b>TRUE</b> indicates that tracing is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PXE_GSI_SERVER_DUID"></a><a id="pxe_gsi_server_duid"></a><dl>
     * <dt><b>PXE_GSI_SERVER_DUID</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Returns a byte array that corresponds to the DHCPv6 DUID that is sent to DHCPv6 PXE clients in response packets in the OPTION_SERVERID option.  <b>PXE_GSI_SERVER_DUID</b> cannot be used with <a href="https://docs.microsoft.com/windows/desktop/api/wdspxe/nf-wdspxe-pxegetserverinfo">PxeGetServerInfo</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pBuffer Address of a buffer that will receive the results of the query. The size and format of the results depends 
     *       on the value of the <i>uInfoType</i> parameter.
     * @param {Integer} uBufferLen Size of buffer pointed to by the <i>pBuffer</i> parameter.
     * @param {Pointer<UInt32>} puBufferUsed Size of buffer pointed to by the <i>pBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdspxe/nf-wdspxe-pxegetserverinfoex
     * @since windows8.0
     */
    static PxeGetServerInfoEx(uInfoType, pBuffer, uBufferLen, puBufferUsed) {
        result := DllCall("WDSPXE.dll\PxeGetServerInfoEx", "uint", uInfoType, "ptr", pBuffer, "uint", uBufferLen, "uint*", puBufferUsed, "uint")
        return result
    }

    /**
     * Registers a provider callback with the multicast server.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Integer} CallbackId The value of this parameter is a <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/ne-wdstpdi-transportprovider_callback_id">TRANSPORTPROVIDER_CALLBACK_ID</a> structure.
     * @param {Pointer<Void>} pfnCallback Pointer to the function pointer associated with this id.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportserverregistercallback
     * @since windowsserver2008
     */
    static WdsTransportServerRegisterCallback(hProvider, CallbackId, pfnCallback) {
        result := DllCall("WDSMC.dll\WdsTransportServerRegisterCallback", "ptr", hProvider, "int", CallbackId, "ptr", pfnCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides status of read operation.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Integer} ulBytesRead The number of bytes read.
     * @param {Pointer<Void>} pvUserData User data specified by <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderreadcontent">WdsTransportProviderReadContent</a>.
     * @param {HRESULT} hReadResult The status of this read operation.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportservercompleteread
     * @since windowsserver2008
     */
    static WdsTransportServerCompleteRead(hProvider, ulBytesRead, pvUserData, hReadResult) {
        result := DllCall("WDSMC.dll\WdsTransportServerCompleteRead", "ptr", hProvider, "uint", ulBytesRead, "ptr", pvUserData, "int", hReadResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a debugging message.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Integer} Severity Severity level of the message.
     * @param {Pointer<Char>} pwszFormat A pointer to a null-terminated string value that contains a formatted string.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportservertrace
     * @since windowsserver2008
     */
    static WdsTransportServerTrace(hProvider, Severity, pwszFormat) {
        pwszFormat := pwszFormat is String? StrPtr(pwszFormat) : pwszFormat

        result := DllCall("WDSMC.dll\WdsTransportServerTrace", "ptr", hProvider, "uint", Severity, "ptr", pwszFormat, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a debugging message.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Integer} Severity Severity level of the message.
     * @param {Pointer<Char>} pwszFormat A pointer to a null-terminated string value that contains a formatted string.
     * @param {Pointer<SByte>} Params A list of parameters used by the formatted string.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportservertracev
     * @since windowsserver2008
     */
    static WdsTransportServerTraceV(hProvider, Severity, pwszFormat, Params) {
        pwszFormat := pwszFormat is String? StrPtr(pwszFormat) : pwszFormat

        result := DllCall("WDSMC.dll\WdsTransportServerTraceV", "ptr", hProvider, "uint", Severity, "ptr", pwszFormat, "char*", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a buffer in memory.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Integer} ulBufferSize Size of the buffer to be allocated.
     * @returns {Pointer<Void>} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportserverallocatebuffer
     * @since windowsserver2008
     */
    static WdsTransportServerAllocateBuffer(hProvider, ulBufferSize) {
        result := DllCall("WDSMC.dll\WdsTransportServerAllocateBuffer", "ptr", hProvider, "uint", ulBufferSize, "ptr")
        return result
    }

    /**
     * Releases memory used by a buffer.
     * @param {Pointer<Void>} hProvider Handle to the provider. This handle was given to the provider in the <a href="https://docs.microsoft.com/windows/desktop/api/wdstpdi/nf-wdstpdi-wdstransportproviderinitialize">WdsTransportProviderInitialize</a> function.
     * @param {Pointer<Void>} pvBuffer Pointer to location of buffer to be released.
     * @returns {HRESULT} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstpdi/nf-wdstpdi-wdstransportserverfreebuffer
     * @since windowsserver2008
     */
    static WdsTransportServerFreeBuffer(hProvider, pvBuffer) {
        result := DllCall("WDSMC.dll\WdsTransportServerFreeBuffer", "ptr", hProvider, "ptr", pvBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes the Multicast Client.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientinitialize
     * @since windows6.0.6000
     */
    static WdsTransportClientInitialize() {
        result := DllCall("WDSTPTC.dll\WdsTransportClientInitialize", "uint")
        return result
    }

    /**
     * Initiates a multicast file transfer.
     * @param {Pointer<WDS_TRANSPORTCLIENT_REQUEST>} pSessionRequest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ns-wdstci-wds_transportclient_request">WDS_TRANSPORTCLIENT_REQUEST</a> structure that contains all the details required to initiate the multicast session.  The format of this structure is described below.
     * @param {Pointer<Void>} pCallerData User supplied pointer that will be provided with every callback for this session.
     * @param {Pointer<Void>} hSessionKey Buffer that will receive the address of a handle that the consumer can use to uniquely identify this session to the client.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientinitializesession
     * @since windows6.0.6000
     */
    static WdsTransportClientInitializeSession(pSessionRequest, pCallerData, hSessionKey) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientInitializeSession", "ptr", pSessionRequest, "ptr", pCallerData, "ptr", hSessionKey, "uint")
        return result
    }

    /**
     * Registers a callback with the multicast client.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
     * @param {Integer} CallbackId Identifier specifying which callback is being registered. This parameter receives a <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/ne-wdstci-transportclient_callback_id">TRANSPORTCLIENT_CALLBACK_ID</a> enumeration value. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WDS_TRANSPORTCLIENT_SESSION_START</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessionstart">PFN_WdsTransportClientSessionStart</a> callback. This callback is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivecontents">PFN_WdsTransportClientReceiveContents</a> callback. This callback is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WDS_TRANSPORTCLIENT_SESSION_COMPLETE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete">PFN_WdsTransportClientSessionComplete</a> callback. This callback is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WDS_TRANSPORTCLIENT_RECEIVE_METADATA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Identifies the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientreceivemetadata">PFN_WdsTransportClientReceiveMetadata</a> callback. This callback is optional.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pfnCallback Pointer to the function pointer associated with this id.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientregistercallback
     * @since windows6.0.6000
     */
    static WdsTransportClientRegisterCallback(hSessionKey, CallbackId, pfnCallback) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientRegisterCallback", "ptr", hSessionKey, "int", CallbackId, "ptr", pfnCallback, "uint")
        return result
    }

    /**
     * Initiates a multicast file transfer.
     * @param {Pointer<Void>} hSessionKey The handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a> session.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientstartsession
     * @since windows6.0.6000
     */
    static WdsTransportClientStartSession(hSessionKey) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientStartSession", "ptr", hSessionKey, "uint")
        return result
    }

    /**
     * Indicates that all processing on a block of data is finished, and that the multicast client may purge this block of data from its cache to make room for further receives.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
     * @param {Integer} ulSize The size of the block being released.
     * @param {Pointer<UInt64>} pullOffset The offset of the block being released.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientcompletereceive
     * @since windows6.0.6000
     */
    static WdsTransportClientCompleteReceive(hSessionKey, ulSize, pullOffset) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientCompleteReceive", "ptr", hSessionKey, "uint", ulSize, "uint*", pullOffset, "uint")
        return result
    }

    /**
     * Releases the resources associated with a session in the client.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.  This session will eventually complete with an error code of <b>ERROR_CANCELLED</b> to the callback <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nc-wdstci-pfn_wdstransportclientsessioncomplete">PFN_WdsTransportClientSessionComplete</a> callback.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientcancelsession
     * @since windows6.0.6000
     */
    static WdsTransportClientCancelSession(hSessionKey) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientCancelSession", "ptr", hSessionKey, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hSessionKey 
     * @param {Integer} dwErrorCode 
     * @returns {Integer} 
     */
    static WdsTransportClientCancelSessionEx(hSessionKey, dwErrorCode) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientCancelSessionEx", "ptr", hSessionKey, "uint", dwErrorCode, "uint")
        return result
    }

    /**
     * Blocks until either the multicast session is complete or the specified timeout is reached.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
     * @param {Integer} uTimeout A timeout, in milliseconds.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientwaitforcompletion
     * @since windows6.0.6000
     */
    static WdsTransportClientWaitForCompletion(hSessionKey, uTimeout) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientWaitForCompletion", "ptr", hSessionKey, "uint", uTimeout, "uint")
        return result
    }

    /**
     * Retrieves the current status of an ongoing or complete multicast transmission from the multicast client.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>.
     * @param {Pointer<UInt32>} puStatus 
     * @param {Pointer<UInt32>} puErrorCode If puStatus is set to <b>WDS_TRANSPORTCLIENT_STATUS_FAILURE</b>, this field will be set to the error code of the session.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientquerystatus
     * @since windows6.0.6000
     */
    static WdsTransportClientQueryStatus(hSessionKey, puStatus, puErrorCode) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientQueryStatus", "ptr", hSessionKey, "uint*", puStatus, "uint*", puErrorCode, "uint")
        return result
    }

    /**
     * Releases the resources associated with a session in the client.
     * @param {Pointer<Void>} hSessionKey Unique handle returned by the call to <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientinitializesession">WdsTransportClientInitializeSession</a>. After this handle has been used with the <b>WdsTransportClientCloseSession</b>, it cannot be used again with the <a href="https://docs.microsoft.com/windows/desktop/api/wdstci/nf-wdstci-wdstransportclientcancelsession">WdsTransportClientCancelSession</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientclosesession
     * @since windows6.0.6000
     */
    static WdsTransportClientCloseSession(hSessionKey) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientCloseSession", "ptr", hSessionKey, "uint")
        return result
    }

    /**
     * Increments the reference count on a buffer owned by the multicast client.
     * @param {Pointer<Void>} pvBuffer The buffer on which to increment the reference count.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientaddrefbuffer
     * @since windows6.0.6000
     */
    static WdsTransportClientAddRefBuffer(pvBuffer) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientAddRefBuffer", "ptr", pvBuffer, "uint")
        return result
    }

    /**
     * Decrements the reference count on a buffer owned by the multicast client.
     * @param {Pointer<Void>} pvBuffer The buffer on which to decrement the reference count.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientreleasebuffer
     * @since windows6.0.6000
     */
    static WdsTransportClientReleaseBuffer(pvBuffer) {
        result := DllCall("WDSTPTC.dll\WdsTransportClientReleaseBuffer", "ptr", pvBuffer, "uint")
        return result
    }

    /**
     * Shuts down the multicast client.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdstci/nf-wdstci-wdstransportclientshutdown
     * @since windows6.0.6000
     */
    static WdsTransportClientShutdown() {
        result := DllCall("WDSTPTC.dll\WdsTransportClientShutdown", "uint")
        return result
    }

    /**
     * Receives a handle to the packet sent by the network boot program.
     * @param {Pointer} pPacket A pointer to the packet received from the WDS client. The packet must be a valid DHCP packet.
     * @param {Integer} uPacketLen The length of the packet, in bytes.
     * @param {Pointer<Byte>} pbPacketType A value that indicates the type of boot program that sent the packet. The bit flags in the following table can be combined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_DHCP"></a><a id="wdsbp_pk_type_dhcp"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_DHCP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presence of this value indicates that the packet is a DHCP packet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_WDSNBP"></a><a id="wdsbp_pk_type_wdsnbp"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_WDSNBP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This presence of this value indicates that the DHCP packet came from the WDS network boot program. If this value is absent the type of client was not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_BCD"></a><a id="wdsbp_pk_type_bcd"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_BCD</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presence of this value indicates that the packet contains a path to a Boot Configuration Data (BCD) file. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} phHandle A handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpqueryoption">WdsBpQueryOption</a> function and must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpparseinitialize
     * @since windows6.0.6000
     */
    static WdsBpParseInitialize(pPacket, uPacketLen, pbPacketType, phHandle) {
        result := DllCall("WDSBP.dll\WdsBpParseInitialize", "ptr", pPacket, "uint", uPacketLen, "char*", pbPacketType, "ptr", phHandle, "uint")
        return result
    }

    /**
     * Receives a handle to the packet sent by the network boot program.
     * @param {Pointer} pPacket A pointer to the packet received from the WDS client. The packet must be a valid DHCPv6 packet.
     * @param {Integer} uPacketLen The length of the packet, in bytes.
     * @param {Pointer<Byte>} pbPacketType A value that indicates the type of boot program that sent the packet. The bit flags in the following table can be combined except <b>WDSBP_PK_TYPE_DHCP</b> and <b>WDSBP_PK_TYPE_DHCPV6</b> are mutually exclusive.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_DHCP"></a><a id="wdsbp_pk_type_dhcp"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_DHCP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presence of this value indicates that the packet is a DHCP packet. This value is mutually exclusive of <b>WDSBP_PK_TYPE_DHCPV6</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_WDSNBP"></a><a id="wdsbp_pk_type_wdsnbp"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_WDSNBP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This presence of this value indicates that the DHCPv6 packet came from the WDS network boot program. If this value is absent the type of client was not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_BCD"></a><a id="wdsbp_pk_type_bcd"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_BCD</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presence of this value indicates that the packet contains a path to a Boot Configuration Data (BCD) file. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WDSBP_PK_TYPE_DHCPV6"></a><a id="wdsbp_pk_type_dhcpv6"></a><dl>
     * <dt><b>WDSBP_PK_TYPE_DHCPV6</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presence of this value indicates that the packet is a DHCPV6 packet. This value is mutually exclusive of <b>WDSBP_PK_TYPE_DHCP</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} phHandle A handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpqueryoption">WdsBpQueryOption</a> function and must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpparseinitializev6
     * @since windows8.0
     */
    static WdsBpParseInitializev6(pPacket, uPacketLen, pbPacketType, phHandle) {
        result := DllCall("WDSBP.dll\WdsBpParseInitializev6", "ptr", pPacket, "uint", uPacketLen, "char*", pbPacketType, "ptr", phHandle, "uint")
        return result
    }

    /**
     * Constructs options for the WDS network boot program.
     * @param {Integer} bPacketType 
     * @param {Pointer<Void>} phHandle A pointer to the handle to the packet. This handle can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpaddoption">WdsBpAddOption</a> function to add options for the WDS network boot program. After all the options have been added, use the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpgetoptionbuffer">WdsBpGetOptionBuffer</a> function to add these to the DHCP options list sent to WDS network boot program. The handle must be closed using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpclosehandle">WdsBpCloseHandle</a> function.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpinitialize
     * @since windows6.0.6000
     */
    static WdsBpInitialize(bPacketType, phHandle) {
        result := DllCall("WDSBP.dll\WdsBpInitialize", "char", bPacketType, "ptr", phHandle, "uint")
        return result
    }

    /**
     * Closes the specified handle.
     * @param {Pointer<Void>} hHandle A handle to be closed. This can be a handle obtained using the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpparseinitialize">WdsBpParseInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> functions.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpclosehandle
     * @since windows6.0.6000
     */
    static WdsBpCloseHandle(hHandle) {
        result := DllCall("WDSBP.dll\WdsBpCloseHandle", "ptr", hHandle, "uint")
        return result
    }

    /**
     * Returns the value of an option from the parsed packet.
     * @param {Pointer<Void>} hHandle A handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpparseinitialize">WdsBpParseInitialize</a> function.
     * @param {Integer} uOption Specifies the option to add to the packet.
     * @param {Integer} uValueLen The total number of bytes of memory pointed to by the <i>pValue</i> parameter. To determine the number of bytes required to store the value for the option, set <i>uValueLen</i> to zero and <i>pValue</i> to <b>NULL</b>; the <b>WdsBpQueryOption</b> function returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the location pointed to by the <i>puBytes</i> parameter receives the number of bytes required for the value.
     * @param {Pointer} pValue The value of the option is returned in this buffer.
     * @param {Pointer<UInt32>} puBytes If the buffer is large enough for the value, this parameter receives the number of bytes copied to <i>pValue</i>. If not enough space is available, this parameter receives the total number of bytes required to store the value.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpqueryoption
     * @since windows6.0.6000
     */
    static WdsBpQueryOption(hHandle, uOption, uValueLen, pValue, puBytes) {
        result := DllCall("WDSBP.dll\WdsBpQueryOption", "ptr", hHandle, "uint", uOption, "uint", uValueLen, "ptr", pValue, "uint*", puBytes, "uint")
        return result
    }

    /**
     * Adds an option to the packet.
     * @param {Pointer<Void>} hHandle A handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> function.
     * @param {Integer} uOption Specifies the option to add to the packet.
     * @param {Integer} uValueLen The length, in bytes, for the value.
     * @param {Pointer} pValue A pointer to a location that contains the value for the option.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpaddoption
     * @since windows6.0.6000
     */
    static WdsBpAddOption(hHandle, uOption, uValueLen, pValue) {
        result := DllCall("WDSBP.dll\WdsBpAddOption", "ptr", hHandle, "uint", uOption, "uint", uValueLen, "ptr", pValue, "uint")
        return result
    }

    /**
     * Copies information into a buffer that should be added to your DHCP packet options.
     * @param {Pointer<Void>} hHandle A handle to the packet. This handle must have been returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wdsbp/nf-wdsbp-wdsbpinitialize">WdsBpInitialize</a> function.
     * @param {Integer} uBufferLen The total number of bytes of memory pointed to by the <i>pBuffer</i> parameter.  To determine the amount of memory required, call the <b>WdsBpGetOptionBuffer</b> function with <i>uBufferLen</i> set to zero and  <i>pBuffer</i> set to <b>NULL</b>. The location pointed to by  the <i>puBytes</i> parameter then receives the size required.
     * @param {Pointer} pBuffer A pointer to a location in memory that receives the information that is being sent to the network boot program.
     * @param {Pointer<UInt32>} puBytes The number of bytes copied to the buffer.
     * @returns {Integer} If the function succeeds, the return is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wdsbp/nf-wdsbp-wdsbpgetoptionbuffer
     * @since windows6.0.6000
     */
    static WdsBpGetOptionBuffer(hHandle, uBufferLen, pBuffer, puBytes) {
        result := DllCall("WDSBP.dll\WdsBpGetOptionBuffer", "ptr", hHandle, "uint", uBufferLen, "ptr", pBuffer, "uint*", puBytes, "uint")
        return result
    }

;@endregion Methods
}
