#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class Ndis {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS630_MINIPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WDM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BINARY_COMPATIBLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS685_MINIPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WDF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MIN_API => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_MAJOR_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_MINOR_VERSION => 87

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_MINIMUM_MAJOR_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_MINIMUM_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_MAJOR_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_MINOR_VERSION => 87

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_MAJOR_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_MINOR_VERSION => 87

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_MINIMUM_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_MINIMUM_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_MINIMUM_MAJOR_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_MINIMUM_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LEGACY_MINIPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LEGACY_PROTOCOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LEGACY_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_60_COMPATIBLE_API => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RUNTIME_VERSION_60 => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_PROTOCOL_ID_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_MULTICAST_PACKET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_RESERVED2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_RESERVED3 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_DONT_LOOPBACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_IS_LOOPBACK_PACKET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_LOOPBACK_ONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_RESERVED4 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_DOUBLE_BUFFERED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_SENT_AT_DPC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_USES_SG_BUFFER_LIST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_USES_ORIGINAL_PACKET => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_PADDED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FLAGS_XLATE_AT_TOP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static fPACKET_WRAPPER_RESERVED => 63

    /**
     * @type {Integer (UInt32)}
     */
    static fPACKET_CONTAINS_MEDIA_SPECIFIC_INFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fPACKET_ALLOCATED_BY_NDIS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CO_ADDRESS_FAMILY_PROXY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEMORY_CONTIGUOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEMORY_NONCACHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OPEN_RECEIVE_NOT_REENTRANT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RWL_AT_DISPATCH_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAX_PROCESSOR_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CONFIGURATION_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CONFIG_FLAG_FILTER_INSTANCE_CONFIGURATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_EVENT_HALT_MINIPORT_ON_LOW_POWER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_EVENT_FLAGS_VPORT_ID_VALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_PNP_EVENT_NOTIFICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_PNP_EVENT_NOTIFICATION_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATUS_INDICATION_FLAGS_NDIS_RESERVED => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATUS_INDICATION_FLAGS_MEDIA_CONNECT_TO_CONNECT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATUS_INDICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TIMER_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NDIS_MAX_LOOKAHEAD_SIZE_ACCESSED_UNDEFINED => -1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RESTART_GENERAL_ATTRIBUTES_MAX_LOOKAHEAD_ACCESSED_DEFINED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RESTART_GENERAL_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RESTART_GENERAL_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SYSTEM_PROCESSOR_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_NDIS_INTERNAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_LOW_POWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_BIND_PROTOCOL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_UNBIND_PROTOCOL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_ATTACH_FILTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_DETACH_FILTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_FILTER_RESTART_STACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSE_MINIPORT_DEVICE_REMOVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_IM_FILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_LW_FILTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_SEND_BYPASS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_RECEIVE_BYPASS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_INTERFACE_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENUM_FILTERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_OBJECT_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_DRIVER_WRAPPER_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEM_PARAMETERS_CONTIGUOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEM_PARAMETERS_CONTIGOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEMORY_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEMORY_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEMORY_PROVIDER_CHAR_SUPPORTS_PF_VPORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SHARED_MEMORY_PROVIDER_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SCATTER_GATHER_LIST_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_CONFIG_STATE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_QUEUE_STATE_CHANGE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_STATUS_INDICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PD_BUFFER_FLAG_PARTIAL_PACKET_HEAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PD_BUFFER_ATTR_BUILT_IN_DATA_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PD_BUFFER_MIN_RX_DATA_START_VALUE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PD_BUFFER_MIN_RX_DATA_START_ALIGNMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PD_BUFFER_MIN_TX_DATA_START_ALIGNMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_QUEUE_DISPATCH_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_QUEUE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_QUEUE_FLAG_DRAIN_NOTIFICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_QUEUE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_ACQUIRE_QUEUES_FLAG_DRAIN_NOTIFICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_ACQUIRE_QUEUES_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_COUNTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_FILTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_PROVIDER_DISPATCH_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_OPEN_PROVIDER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CLOSE_PROVIDER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_DEFAULT_PORT_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_DEFAULT_NIC_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_INFO_DIRECTION_INGRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_INFO_EXCEPTION_PACKET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_INFO_COPY_PACKET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_INFO_SAMPLE_PACKET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_FORWARDING_DESTINATION_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_MEDIA_SPECIFIC_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_SPECIFIC_INFO_TUNDL => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_SPECIFIC_INFO_FCOE => 2147549184

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_SPECIFIC_INFO_EAPOL => 2147549185

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_SPECIFIC_INFO_LLDP => 2147549186

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_SPECIFIC_INFO_TIMESYNC => 2147549187

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TASK_OFFLOAD_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_HASHES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUNCATED_HASH_LEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_GENERIC_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_TRANSPORT_AH_AUTH_FAILED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_TRANSPORT_ESP_AUTH_FAILED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_TUNNEL_AH_AUTH_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_TUNNEL_ESP_AUTH_FAILED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_INVALID_PACKET_SYNTAX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_INVALID_PROTOCOL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TASK_TCP_LARGE_SEND_V0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPT_UDPESP_ENCAPTYPE_IKE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TUN_UDPESP_ENCAPTYPE_IKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPTOVERTUN_UDPESP_ENCAPTYPE_IKE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPT_UDPESP_OVER_PURE_TUN_ENCAPTYPE_IKE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPT_UDPESP_ENCAPTYPE_OTHER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TUN_UDPESP_ENCAPTYPE_OTHER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPTOVERTUN_UDPESP_ENCAPTYPE_OTHER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_TPT_UDPESP_OVER_PURE_TUN_ENCAPTYPE_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_MAX_EXTENSION_HEADERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_UDP_ESP_ENCAPSULATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_UDP_ESP_ENCAPSULATION_TRANSPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_UDP_ESP_ENCAPSULATION_TUNNEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_TRANSPORT_OVER_UDP_ESP_ENCAPSULATION_TUNNEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_UDP_ESP_ENCAPSULATION_TRANSPORT_OVER_TUNNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ESN_SA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_IPv6 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IPSEC_OFFLOAD_V2_ADD_SA_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IPSEC_OFFLOAD_V2_ADD_SA_EX_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IPSEC_OFFLOAD_V2_DELETE_SA_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IPSEC_OFFLOAD_V2_UPDATE_SA_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_BIND_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_BIND_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_BIND_PARAMETERS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_BIND_PARAMETERS_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_CO_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_DRIVER_SUPPORTS_CURRENT_MAC_ADDRESS_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_DRIVER_SUPPORTS_L2_MTU_SIZE_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_DRIVER_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_DRIVER_CHARACTERISTICS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OPEN_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_PAUSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_RESTART_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_BIND_FAILED_NOTIFICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_M_MAX_LOOKAHEAD => 526

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_INTERRUPT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_PNP_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SG_DMA_64_BIT_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SG_DMA_V3_HAL_API => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SG_DMA_HYBRID_DMA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SG_DMA_DESCRIPTION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SG_DMA_DESCRIPTION_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_INIT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_RESTART_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_REGISTRATION_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_REGISTRATION_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_XMIT_OK_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_RCV_OK_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_XMIT_ERROR_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_RCV_ERROR_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_RCV_NO_BUFFER_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_DIRECTED_BYTES_XMIT_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_DIRECTED_FRAMES_XMIT_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_MULTICAST_BYTES_XMIT_SUPPORTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_MULTICAST_FRAMES_XMIT_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BROADCAST_BYTES_XMIT_SUPPORTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BROADCAST_FRAMES_XMIT_SUPPORTED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_DIRECTED_BYTES_RCV_SUPPORTED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_DIRECTED_FRAMES_RCV_SUPPORTED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_MULTICAST_BYTES_RCV_SUPPORTED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_MULTICAST_FRAMES_RCV_SUPPORTED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BROADCAST_BYTES_RCV_SUPPORTED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BROADCAST_FRAMES_RCV_SUPPORTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_RCV_CRC_ERROR_SUPPORTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_TRANSMIT_QUEUE_LENGTH_SUPPORTED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BYTES_RCV_SUPPORTED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_BYTES_XMIT_SUPPORTED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_RCV_DISCARDS_SUPPORTED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_GEN_STATISTICS_SUPPORTED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_XMIT_DISCARDS_SUPPORTED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADD_DEVICE_REGISTRATION_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_OFFLOAD_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_802_11_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_802_11_ATTRIBUTES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_802_11_ATTRIBUTES_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_NDK_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ADAPTER_PACKET_DIRECT_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_HARDWARE_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_NDIS_WDM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_SURPRISE_REMOVE_OK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_NOT_CO_NDIS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_DO_NOT_BIND_TO_ALL_CO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_NO_HALT_ON_SUSPEND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_BUS_MASTER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_CONTROLS_DEFAULT_PORT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_NO_PAUSE_ON_SUSPEND => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_NO_OID_INTERCEPT_ON_NONDEFAULT_PORTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_ATTRIBUTES_REGISTER_BUGCHECK_CALLBACK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_PAUSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_DEVICE_PNP_EVENT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERMEDIATE_DRIVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WDM_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DRIVER_FLAGS_RESERVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_DRIVER_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_DRIVER_CHARACTERISTICS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_DRIVER_CHARACTERISTICS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_CO_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_IGNORE_PACKET_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_IGNORE_REQUEST_TIMEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_IGNORE_TOKEN_RING_ERRORS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_BUS_MASTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_INTERMEDIATE_DRIVER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_DESERIALIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_NO_HALT_ON_SUSPEND => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_SURPRISE_REMOVE_OK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_NOT_CO_NDIS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_USES_SAFE_BUFFER_APIS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_DO_NOT_BIND_TO_ALL_CO => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ATTRIBUTE_MINIPORT_PADS_SHORT_PACKETS => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static NDIS_SG_LIST_WRITE_TO_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MSIX_CONFIG_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MINIPORT_SS_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_COPY_NBL_INFO_FLAGS_PRESERVE_DESTINATIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_COPY_NBL_INFO_FLAGS_PRESERVE_SWITCH_INFO_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_REPORT_FILTERED_NBL_FLAGS_IS_INCOMING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NET_BUFFER_LIST_CONTEXT_TYPE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_OPTIONAL_HANDLERS_PD_RESERVED_SIZE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_OPTIONAL_HANDLERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_OPTIONAL_HANDLERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CO_SEND_FLAG_SET_DISCARD_ELIBILITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RECEIVE_TIME_INDICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_TIME_STAMPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSMIT_VC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RECEIVE_VC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INDICATE_ERRED_PACKETS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INDICATE_END_OF_TX => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RESERVE_RESOURCES_VC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ROUND_DOWN_FLOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ROUND_UP_FLOW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ERRED_PACKET_INDICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERMANENT_VC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CALL_PARAMETERS_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_CALL_PARAMETERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BROADCAST_VC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MULTIPOINT_VC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_ASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_DBCS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_UNICODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STRINGFORMAT_BINARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CO_CLIENT_OPTIONAL_HANDLERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CO_CALL_MANAGER_OPTIONAL_HANDLERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTACH_FLAGS_IGNORE_MANDATORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTACH_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTACH_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTACH_PARAMETERS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTACH_PARAMETERS_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_RESTART_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_PAUSE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_PARTIAL_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_DRIVER_MANDATORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_DRIVER_SUPPORTS_CURRENT_MAC_ADDRESS_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_DRIVER_SUPPORTS_L2_MTU_SIZE_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_CHARACTERISTICS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_CHARACTERISTICS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_FILTER_ATTRIBUTES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_OFFLOAD_ENCAPSULATION => 168

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_ENCAPSULATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_KDNET_PF_ENUM_ELEMENT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_KDNET_ENUMERATE_PFS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_KDNET_ADD_PF_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_KDNET_REMOVE_PF_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_KDNET_QUERY_PF_INFORMATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PACKET_MONITOR => 66257

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MONITOR_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NBL_FLAGS_PROTOCOL_RESERVED => 4293918723

    /**
     * @type {Integer (UInt32)}
     */
    static NBL_FLAGS_MINIPORT_RESERVED => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static NBL_FLAGS_SCRATCH => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static NBL_FLAGS_NDIS_RESERVED => 4092

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_SEND_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_RECV_READ_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_HD_SPLIT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_IS_IPV4 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_IS_IPV6 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_IS_TCP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_IS_UDP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_SPLIT_AT_UPPER_LAYER_PROTOCOL_HEADER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_SPLIT_AT_UPPER_LAYER_PROTOCOL_PAYLOAD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_IS_LOOPBACK_PACKET => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NBL_FLAGS_CAPTURE_TIMESTAMP_ON_TRANSMIT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NBL_PROT_RSVD_FLAGS => 4293918723

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_LIST_POOL_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_LIST_POOL_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_LIST_POOL_FLAG_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_POOL_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_POOL_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_BUFFER_POOL_FLAG_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CLONE_FLAGS_RESERVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CLONE_FLAGS_USE_ORIGINAL_MDLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_LARGE_SEND_OFFLOAD_V1_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_LARGE_SEND_OFFLOAD_V2_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_LARGE_SEND_OFFLOAD_IPv4 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_LARGE_SEND_OFFLOAD_IPv6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LARGE_SEND_OFFLOAD_MAX_HEADER_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_DISPATCH_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_RESOURCES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SINGLE_ETHER_TYPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SINGLE_VLAN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_PERFECT_FILTERED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SINGLE_QUEUE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SHARED_MEMORY_INFO_VALID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_MORE_NBLS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SWITCH_DESTINATION_GROUP => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FLAGS_SWITCH_SINGLE_SOURCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RETURN_FLAGS_DISPATCH_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RETURN_FLAGS_SINGLE_QUEUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RETURN_FLAGS_SWITCH_SINGLE_SOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_FLAGS_DISPATCH_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_FLAGS_CHECK_FOR_LOOPBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_FLAGS_SINGLE_QUEUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_FLAGS_SWITCH_DESTINATION_GROUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_FLAGS_SWITCH_SINGLE_SOURCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_COMPLETE_FLAGS_DISPATCH_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_COMPLETE_FLAGS_SINGLE_QUEUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SEND_COMPLETE_FLAGS_SWITCH_SINGLE_SOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_UDP_SEGMENTATION_OFFLOAD_IPV4 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_UDP_SEGMENTATION_OFFLOAD_IPV6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OID_REQUEST_TIMEOUT_INFINITE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OID_REQUEST_NDIS_RESERVED_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OID_REQUEST_FLAGS_VPORT_ID_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OID_REQUEST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OID_REQUEST_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ANY_NUMBER_OF_NBLS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_POLL_DATA_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_POLL_NOTIFICATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_POLL_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NdisHashFunctionToeplitz => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NdisHashFunctionReserved1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NdisHashFunctionReserved2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NdisHashFunctionReserved3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_FUNCTION_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_TYPE_MASK => 16776960

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_IPV4 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_TCP_IPV4 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_IPV6 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_IPV6_EX => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_TCP_IPV6 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_TCP_IPV6_EX => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_UDP_IPV4 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_UDP_IPV6 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HASH_UDP_IPV6_EX => 65536

    /**
     * @type {String}
     */
    static DD_NDIS_DEVICE_NAME => "\Device\NDIS"

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAXIMUM_PORTS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_SET_NO_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_SET_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_SET_OFF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_NULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_IEEE_802_3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_IEEE_802_3_P_AND_Q => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_IEEE_802_3_P_AND_Q_IN_OOB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_IEEE_LLC_SNAP_ROUTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_OID_REQUEST => 150

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS687 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS686 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS685 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS684 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS683 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS682 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS681 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS680 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS670 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS660 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS651 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS650 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS640 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS630 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS620 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS61 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS6 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NDIS_RESERVED5 => 1507380

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NDIS_RESERVED6 => 1540152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_DEFAULT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_INIT_PARAMETERS => 129

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_SG_DMA_DESCRIPTION => 131

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_INTERRUPT => 132

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_DEVICE_OBJECT_ATTRIBUTES => 133

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_BIND_PARAMETERS => 134

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_OPEN_PARAMETERS => 135

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RSS_CAPABILITIES => 136

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RSS_PARAMETERS => 137

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_DRIVER_CHARACTERISTICS => 138

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_DRIVER_CHARACTERISTICS => 139

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_PARTIAL_CHARACTERISTICS => 140

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_ATTRIBUTES => 141

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CLIENT_CHIMNEY_OFFLOAD_GENERIC_CHARACTERISTICS => 142

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PROVIDER_CHIMNEY_OFFLOAD_GENERIC_CHARACTERISTICS => 143

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CO_PROTOCOL_CHARACTERISTICS => 144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CO_MINIPORT_CHARACTERISTICS => 145

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_PNP_CHARACTERISTICS => 146

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CLIENT_CHIMNEY_OFFLOAD_CHARACTERISTICS => 147

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PROVIDER_CHIMNEY_OFFLOAD_CHARACTERISTICS => 148

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PROTOCOL_DRIVER_CHARACTERISTICS => 149

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_REQUEST_EX => 150

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_TIMER_CHARACTERISTICS => 151

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_STATUS_INDICATION => 152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_ATTACH_PARAMETERS => 153

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_PAUSE_PARAMETERS => 154

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_FILTER_RESTART_PARAMETERS => 155

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PORT_CHARACTERISTICS => 156

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PORT_STATE => 157

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_REGISTRATION_ATTRIBUTES => 158

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES => 159

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_OFFLOAD_ATTRIBUTES => 160

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_NATIVE_802_11_ATTRIBUTES => 161

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RESTART_GENERAL_ATTRIBUTES => 162

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PROTOCOL_RESTART_PARAMETERS => 163

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADD_DEVICE_REGISTRATION_ATTRIBUTES => 164

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CO_CALL_MANAGER_OPTIONAL_HANDLERS => 165

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CO_CLIENT_OPTIONAL_HANDLERS => 166

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_OFFLOAD => 167

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_CONFIGURATION_OBJECT => 169

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_DRIVER_WRAPPER_OBJECT => 170

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_HD_SPLIT_ATTRIBUTES => 171

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_NSI_NETWORK_RW_STRUCT => 172

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_NSI_COMPARTMENT_RW_STRUCT => 173

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_NSI_INTERFACE_PERSIST_RW_STRUCT => 174

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES => 175

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_SHARED_MEMORY_PROVIDER_CHARACTERISTICS => 176

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RSS_PROCESSOR_INFO => 177

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_NDK_PROVIDER_CHARACTERISTICS => 178

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_NDK_ATTRIBUTES => 179

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_SS_CHARACTERISTICS => 180

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_QOS_CAPABILITIES => 181

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_QOS_PARAMETERS => 182

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_QOS_CLASSIFICATION_ELEMENT => 183

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_SWITCH_OPTIONAL_HANDLERS => 184

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PD_TRANSMIT_QUEUE => 190

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PD_RECEIVE_QUEUE => 191

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_PACKET_DIRECT_ATTRIBUTES => 197

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_MINIPORT_DEVICE_POWER_NOTIFICATION => 198

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RSS_PARAMETERS_V2 => 200

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_RSS_SET_INDIRECTION_ENTRIES => 201

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_DIRECTED_FRAMES_RCV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_MULTICAST_FRAMES_RCV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BROADCAST_FRAMES_RCV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BYTES_RCV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_RCV_DISCARDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_RCV_ERROR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_DIRECTED_FRAMES_XMIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_MULTICAST_FRAMES_XMIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BROADCAST_FRAMES_XMIT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BYTES_XMIT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_XMIT_ERROR => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_XMIT_DISCARDS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_DIRECTED_BYTES_RCV => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_MULTICAST_BYTES_RCV => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BROADCAST_BYTES_RCV => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_DIRECTED_BYTES_XMIT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_MULTICAST_BYTES_XMIT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_FLAGS_VALID_BROADCAST_BYTES_XMIT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_STATISTICS_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSC_STATISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERRUPT_MODERATION_CHANGE_NEEDS_RESET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERRUPT_MODERATION_CHANGE_NEEDS_REINITIALIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERRUPT_MODERATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TIMEOUT_DPC_REQUEST_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PCI_DEVICE_CUSTOM_PROPERTIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OBJECT_TYPE_PCI_DEVICE_CUSTOM_PROPERTIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_SUPPORTED_LIST => 65793

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_HARDWARE_STATUS => 65794

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_SUPPORTED => 65795

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_IN_USE => 65796

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAXIMUM_LOOKAHEAD => 65797

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAXIMUM_FRAME_SIZE => 65798

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_LINK_SPEED => 65799

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_TRANSMIT_BUFFER_SPACE => 65800

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_BUFFER_SPACE => 65801

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_TRANSMIT_BLOCK_SIZE => 65802

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_BLOCK_SIZE => 65803

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_VENDOR_ID => 65804

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_VENDOR_DESCRIPTION => 65805

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CURRENT_PACKET_FILTER => 65806

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CURRENT_LOOKAHEAD => 65807

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DRIVER_VERSION => 65808

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAXIMUM_TOTAL_SIZE => 65809

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PROTOCOL_OPTIONS => 65810

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAC_OPTIONS => 65811

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_CONNECT_STATUS => 65812

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAXIMUM_SEND_PACKETS => 65813

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_VENDOR_DRIVER_VERSION => 65814

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_SUPPORTED_GUIDS => 65815

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NETWORK_LAYER_ADDRESSES => 65816

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_TRANSPORT_HEADER_OFFSET => 65817

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_CAPABILITIES => 66049

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PHYSICAL_MEDIUM => 66050

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_SCALE_CAPABILITIES => 66051

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_SCALE_PARAMETERS => 66052

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAC_ADDRESS => 66053

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MAX_LINK_SPEED => 66054

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_LINK_STATE => 66055

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_LINK_PARAMETERS => 66056

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_INTERRUPT_MODERATION => 66057

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_3 => 66058

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_4 => 66059

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_5 => 66060

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_ENUMERATE_PORTS => 66061

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PORT_STATE => 66062

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PORT_AUTHENTICATION_PARAMETERS => 66063

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_TIMEOUT_DPC_REQUEST_CAPABILITIES => 66064

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PCI_DEVICE_CUSTOM_PROPERTIES => 66065

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_6 => 66066

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PHYSICAL_MEDIUM_EX => 66067

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_SCALE_PARAMETERS_V2 => 66068

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MACHINE_NAME => 66074

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RNDIS_CONFIG_PARAMETER => 66075

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_VLAN_ID => 66076

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RECEIVE_HASH => 66079

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MINIPORT_RESTART_ATTRIBUTES => 66077

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_HD_SPLIT_PARAMETERS => 66078

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_HD_SPLIT_CURRENT_CONFIG => 66080

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_PROMISCUOUS_MODE => 66176

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_LAST_CHANGE => 66177

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DISCONTINUITY_TIME => 66178

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_OPERATIONAL_STATUS => 66179

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_XMIT_LINK_SPEED => 66180

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_LINK_SPEED => 66181

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_UNKNOWN_PROTOS => 66182

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_INTERFACE_INFO => 66183

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_ADMIN_STATUS => 66184

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_ALIAS => 66185

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_CONNECT_STATUS_EX => 66186

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_LINK_SPEED_EX => 66187

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_DUPLEX_STATE => 66188

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_IP_OPER_STATUS => 66189

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DRIVER_CAPS => 234946816

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_CAPS => 234946817

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_READY_INFO => 234946818

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_RADIO_STATE => 234946819

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PIN => 234946820

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PIN_LIST => 234946821

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_HOME_PROVIDER => 234946822

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PREFERRED_PROVIDERS => 234946823

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_VISIBLE_PROVIDERS => 234946824

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_REGISTER_STATE => 234946825

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PACKET_SERVICE => 234946826

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SIGNAL_STATE => 234946827

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_CONNECT => 234946828

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PROVISIONED_CONTEXTS => 234946829

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SERVICE_ACTIVATION => 234946830

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SMS_CONFIGURATION => 234946831

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SMS_READ => 234946832

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SMS_SEND => 234946833

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SMS_DELETE => 234946834

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SMS_STATUS => 234946835

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_VENDOR_SPECIFIC => 234946836

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_AUTH_CHALLENGE => 234946837

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_ENUMERATE_DEVICE_SERVICES => 234946838

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SUBSCRIBE_DEVICE_SERVICE_EVENTS => 234946839

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_SERVICE_COMMAND => 234946840

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_USSD => 234946841

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PIN_EX => 234946849

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_ENUMERATE_DEVICE_SERVICE_COMMANDS => 234946850

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_SERVICE_SESSION => 234946851

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_SERVICE_SESSION_WRITE => 234946852

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PREFERRED_MULTICARRIER_PROVIDERS => 234946853

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_CREATE_MAC => 234946854

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DELETE_MAC => 234946855

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_FILE_STATUS => 234946856

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_ACCESS_BINARY => 234946857

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_ACCESS_RECORD => 234946858

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PIN_EX2 => 234946859

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_MBIM_VERSION => 234946860

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SYS_CAPS => 234946861

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_CAPS_EX => 234946862

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SYS_SLOTMAPPINGS => 234946863

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SLOT_INFO_STATUS => 234946864

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_BINDINGS => 234946865

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_REGISTER_STATE_EX => 234946866

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_IMS_VOICE_STATE => 234946867

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SIGNAL_STATE_EX => 234946868

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_LOCATION_STATE => 234946869

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_NITZ => 234946870

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_NETWORK_IDLE_HINT => 234946871

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PRESHUTDOWN => 234946872

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_ATR => 234946873

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_OPEN_CHANNEL => 234946874

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_CLOSE_CHANNEL => 234946875

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_APDU => 234946876

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_TERMINAL_CAPABILITY => 234946877

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PS_MEDIA_CONFIG => 234946878

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SAR_CONFIG => 234946879

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_SAR_TRANSMISSION_STATUS => 234946880

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_NETWORK_BLACKLIST => 234946881

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_LTE_ATTACH_CONFIG => 234946882

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_LTE_ATTACH_STATUS => 234946883

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_MODEM_CONFIG_INFO => 234946884

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_PCO => 234946885

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_RESET => 234946886

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_DEVICE_RESET => 234946887

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_BASE_STATIONS_INFO => 234946888

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_MPDP => 234946889

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UICC_APP_LIST => 234946890

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_MODEM_LOGGING_CONFIG => 234946891

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_REGISTER_PARAMS => 234946892

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_NETWORK_PARAMS => 234946893

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WWAN_UE_POLICY => 234946894

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_XMIT_OK => 131329

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_OK => 131330

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_XMIT_ERROR => 131331

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_ERROR => 131332

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_NO_BUFFER => 131333

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_STATISTICS => 131334

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DIRECTED_BYTES_XMIT => 131585

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DIRECTED_FRAMES_XMIT => 131586

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MULTICAST_BYTES_XMIT => 131587

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MULTICAST_FRAMES_XMIT => 131588

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BROADCAST_BYTES_XMIT => 131589

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BROADCAST_FRAMES_XMIT => 131590

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DIRECTED_BYTES_RCV => 131591

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DIRECTED_FRAMES_RCV => 131592

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MULTICAST_BYTES_RCV => 131593

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MULTICAST_FRAMES_RCV => 131594

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BROADCAST_BYTES_RCV => 131595

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BROADCAST_FRAMES_RCV => 131596

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_CRC_ERROR => 131597

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_TRANSMIT_QUEUE_LENGTH => 131598

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_GET_TIME_CAPS => 131599

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_GET_NETCARD_TIME => 131600

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NETCARD_LOAD => 131601

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_DEVICE_PROFILE => 131602

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_INIT_TIME_MS => 131603

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RESET_COUNTS => 131604

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_MEDIA_SENSE_COUNTS => 131605

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_FRIENDLY_NAME => 131606

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_1 => 131607

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_2 => 131608

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BYTES_RCV => 131609

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_BYTES_XMIT => 131610

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RCV_DISCARDS => 131611

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_XMIT_DISCARDS => 131612

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_RSC_STATISTICS => 131613

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_NDIS_RESERVED_7 => 131614

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_SUPPORTED_LIST => 65793

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_HARDWARE_STATUS => 65794

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_MEDIA_SUPPORTED => 65795

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_MEDIA_IN_USE => 65796

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_LINK_SPEED => 65799

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_VENDOR_ID => 65804

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_VENDOR_DESCRIPTION => 65805

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_DRIVER_VERSION => 65808

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_PROTOCOL_OPTIONS => 65810

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_MAC_OPTIONS => 65811

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_MEDIA_CONNECT_STATUS => 65812

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_VENDOR_DRIVER_VERSION => 65814

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_SUPPORTED_GUIDS => 65815

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_GET_TIME_CAPS => 131599

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_GET_NETCARD_TIME => 131600

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_MINIMUM_LINK_SPEED => 131360

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_XMIT_PDUS_OK => 131329

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_RCV_PDUS_OK => 131330

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_XMIT_PDUS_ERROR => 131331

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_RCV_PDUS_ERROR => 131332

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_RCV_PDUS_NO_BUFFER => 131333

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_RCV_CRC_ERROR => 131597

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_TRANSMIT_QUEUE_LENGTH => 131598

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_BYTES_XMIT => 131585

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_BYTES_RCV => 131591

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_NETCARD_LOAD => 131601

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_DEVICE_PROFILE => 131602

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_CO_BYTES_XMIT_OUTSTANDING => 131617

    /**
     * @type {Integer (UInt32)}
     */
    static OID_KDNET_ENUMERATE_PFS => 131618

    /**
     * @type {Integer (UInt32)}
     */
    static OID_KDNET_ADD_PF => 131619

    /**
     * @type {Integer (UInt32)}
     */
    static OID_KDNET_REMOVE_PF => 131620

    /**
     * @type {Integer (UInt32)}
     */
    static OID_KDNET_QUERY_PF_INFORMATION => 131621

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_PERMANENT_ADDRESS => 16843009

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_CURRENT_ADDRESS => 16843010

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_MULTICAST_LIST => 16843011

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_MAXIMUM_LIST_SIZE => 16843012

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_MAC_OPTIONS => 16843013

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_3_MAC_OPTION_PRIORITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_RCV_ERROR_ALIGNMENT => 16908545

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_ONE_COLLISION => 16908546

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_MORE_COLLISIONS => 16908547

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_DEFERRED => 16908801

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_MAX_COLLISIONS => 16908802

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_RCV_OVERRUN => 16908803

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_UNDERRUN => 16908804

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_HEARTBEAT_FAILURE => 16908805

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_TIMES_CRS_LOST => 16908806

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_XMIT_LATE_COLLISIONS => 16908807

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_ADD_MULTICAST_ADDRESS => 16843272

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_3_DELETE_MULTICAST_ADDRESS => 16843273

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_PERMANENT_ADDRESS => 33620225

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_CURRENT_ADDRESS => 33620226

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_CURRENT_FUNCTIONAL => 33620227

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_CURRENT_GROUP => 33620228

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_LAST_OPEN_STATUS => 33620229

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_CURRENT_RING_STATUS => 33620230

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_CURRENT_RING_STATE => 33620231

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_LINE_ERRORS => 33685761

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_LOST_FRAMES => 33685762

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_BURST_ERRORS => 33686017

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_AC_ERRORS => 33686018

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_ABORT_DELIMETERS => 33686019

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_FRAME_COPIED_ERRORS => 33686020

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_FREQUENCY_ERRORS => 33686021

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_TOKEN_ERRORS => 33686022

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_5_INTERNAL_ERRORS => 33686023

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LONG_PERMANENT_ADDR => 50397441

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LONG_CURRENT_ADDR => 50397442

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LONG_MULTICAST_LIST => 50397443

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LONG_MAX_LIST_SIZE => 50397444

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SHORT_PERMANENT_ADDR => 50397445

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SHORT_CURRENT_ADDR => 50397446

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SHORT_MULTICAST_LIST => 50397447

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SHORT_MAX_LIST_SIZE => 50397448

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_ATTACHMENT_TYPE => 50462977

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_UPSTREAM_NODE_LONG => 50462978

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_DOWNSTREAM_NODE_LONG => 50462979

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_FRAME_ERRORS => 50462980

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_FRAMES_LOST => 50462981

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_RING_MGT_STATE => 50462982

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LCT_FAILURES => 50462983

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LEM_REJECTS => 50462984

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_LCONNECTION_STATE => 50462985

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_STATION_ID => 50528769

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_OP_VERSION_ID => 50528770

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_HI_VERSION_ID => 50528771

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_LO_VERSION_ID => 50528772

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MANUFACTURER_DATA => 50528773

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_USER_DATA => 50528774

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MIB_VERSION_ID => 50528775

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MAC_CT => 50528776

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_NON_MASTER_CT => 50528777

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MASTER_CT => 50528778

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_AVAILABLE_PATHS => 50528779

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_CONFIG_CAPABILITIES => 50528780

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_CONFIG_POLICY => 50528781

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_CONNECTION_POLICY => 50528782

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_T_NOTIFY => 50528783

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_STAT_RPT_POLICY => 50528784

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_TRACE_MAX_EXPIRATION => 50528785

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_PORT_INDEXES => 50528786

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MAC_INDEXES => 50528787

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_BYPASS_PRESENT => 50528788

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_ECM_STATE => 50528789

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_CF_STATE => 50528790

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_HOLD_STATE => 50528791

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_REMOTE_DISCONNECT_FLAG => 50528792

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_STATION_STATUS => 50528793

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_PEER_WRAP_FLAG => 50528794

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_MSG_TIME_STAMP => 50528795

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_TRANSITION_TIME_STAMP => 50528796

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_SET_COUNT => 50528797

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_LAST_SET_STATION_ID => 50528798

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_FRAME_STATUS_FUNCTIONS => 50528799

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_BRIDGE_FUNCTIONS => 50528800

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_MAX_CAPABILITY => 50528801

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_TVX_CAPABILITY => 50528802

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_AVAILABLE_PATHS => 50528803

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_CURRENT_PATH => 50528804

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_UPSTREAM_NBR => 50528805

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_DOWNSTREAM_NBR => 50528806

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_OLD_UPSTREAM_NBR => 50528807

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_OLD_DOWNSTREAM_NBR => 50528808

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_DUP_ADDRESS_TEST => 50528809

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_REQUESTED_PATHS => 50528810

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_DOWNSTREAM_PORT_TYPE => 50528811

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_INDEX => 50528812

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_SMT_ADDRESS => 50528813

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_LONG_GRP_ADDRESS => 50528814

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_SHORT_GRP_ADDRESS => 50528815

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_REQ => 50528816

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_NEG => 50528817

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_MAX => 50528818

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_TVX_VALUE => 50528819

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI0 => 50528820

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI1 => 50528821

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI2 => 50528822

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI3 => 50528823

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI4 => 50528824

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI5 => 50528825

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_T_PRI6 => 50528826

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_FRAME_CT => 50528827

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_COPIED_CT => 50528828

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_TRANSMIT_CT => 50528829

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_TOKEN_CT => 50528830

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_ERROR_CT => 50528831

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_LOST_CT => 50528832

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_TVX_EXPIRED_CT => 50528833

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_NOT_COPIED_CT => 50528834

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_LATE_CT => 50528835

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_RING_OP_CT => 50528836

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_FRAME_ERROR_THRESHOLD => 50528837

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_FRAME_ERROR_RATIO => 50528838

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_NOT_COPIED_THRESHOLD => 50528839

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_NOT_COPIED_RATIO => 50528840

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_RMT_STATE => 50528841

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_DA_FLAG => 50528842

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_UNDA_FLAG => 50528843

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_FRAME_ERROR_FLAG => 50528844

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_NOT_COPIED_FLAG => 50528845

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_MA_UNITDATA_AVAILABLE => 50528846

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_HARDWARE_PRESENT => 50528847

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_MAC_MA_UNITDATA_ENABLE => 50528848

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_INDEX => 50528849

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_RING_LATENCY => 50528850

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_TRACE_STATUS => 50528851

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_SBA_PAYLOAD => 50528852

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_SBA_OVERHEAD => 50528853

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_CONFIGURATION => 50528854

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_T_R_MODE => 50528855

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_SBA_AVAILABLE => 50528856

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_TVX_LOWER_BOUND => 50528857

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_T_MAX_LOWER_BOUND => 50528858

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PATH_MAX_T_REQ => 50528859

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_MY_TYPE => 50528860

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_NEIGHBOR_TYPE => 50528861

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_CONNECTION_POLICIES => 50528862

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_MAC_INDICATED => 50528863

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_CURRENT_PATH => 50528864

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_REQUESTED_PATHS => 50528865

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_MAC_PLACEMENT => 50528866

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_AVAILABLE_PATHS => 50528867

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_MAC_LOOP_TIME => 50528868

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_PMD_CLASS => 50528869

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_CONNECTION_CAPABILITIES => 50528870

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_INDEX => 50528871

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_MAINT_LS => 50528872

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_BS_FLAG => 50528873

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_PC_LS => 50528874

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_EB_ERROR_CT => 50528875

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LCT_FAIL_CT => 50528876

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LER_ESTIMATE => 50528877

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LEM_REJECT_CT => 50528878

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LEM_CT => 50528879

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LER_CUTOFF => 50528880

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LER_ALARM => 50528881

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_CONNNECT_STATE => 50528882

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_PCM_STATE => 50528883

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_PC_WITHHOLD => 50528884

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_LER_FLAG => 50528885

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_HARDWARE_PRESENT => 50528886

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_SMT_STATION_ACTION => 50528887

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_PORT_ACTION => 50528888

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_DESCR => 50528889

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_TYPE => 50528890

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_MTU => 50528891

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_SPEED => 50528892

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_PHYS_ADDRESS => 50528893

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_ADMIN_STATUS => 50528894

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OPER_STATUS => 50528895

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_LAST_CHANGE => 50528896

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_OCTETS => 50528897

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_UCAST_PKTS => 50528898

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_NUCAST_PKTS => 50528899

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_DISCARDS => 50528900

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_ERRORS => 50528901

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_IN_UNKNOWN_PROTOS => 50528902

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_OCTETS => 50528903

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_UCAST_PKTS => 50528904

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_NUCAST_PKTS => 50528905

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_DISCARDS => 50528906

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_ERRORS => 50528907

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_OUT_QLEN => 50528908

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FDDI_IF_SPECIFIC => 50528909

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_PERMANENT_ADDRESS => 67174657

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CURRENT_ADDRESS => 67174658

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_QUALITY_OF_SERVICE => 67174659

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_PROTOCOL_TYPE => 67174660

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_MEDIUM_SUBTYPE => 67174661

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_HEADER_FORMAT => 67174662

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_GET_INFO => 67174663

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_SET_LINK_INFO => 67174664

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_GET_LINK_INFO => 67174665

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_LINE_COUNT => 67174666

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_PROTOCOL_CAPS => 67174667

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_GET_BRIDGE_INFO => 67174922

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_SET_BRIDGE_INFO => 67174923

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_GET_COMP_INFO => 67174924

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_SET_COMP_INFO => 67174925

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_GET_STATS_INFO => 67174926

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_GET_INFO => 67174784

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_SET_LINK_INFO => 67174785

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_GET_LINK_INFO => 67174786

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_GET_COMP_INFO => 67175040

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_SET_COMP_INFO => 67175041

    /**
     * @type {Integer (UInt32)}
     */
    static OID_WAN_CO_GET_STATS_INFO => 67175042

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_CURRENT_NODE_ID => 83951874

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_IN_BROADCASTS => 84017409

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_IN_LENGTH_ERRORS => 84017410

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_OUT_NO_HANDLERS => 84017665

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_COLLISIONS => 84017666

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_DEFERS => 84017667

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_NO_DATA_ERRORS => 84017668

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_RANDOM_CTS_ERRORS => 84017669

    /**
     * @type {Integer (UInt32)}
     */
    static OID_LTALK_FCS_ERRORS => 84017670

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ARCNET_PERMANENT_ADDRESS => 100729089

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ARCNET_CURRENT_ADDRESS => 100729090

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ARCNET_RECONFIGURATIONS => 100794881

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_ACCEPT => 117637377

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_ANSWER => 117637378

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_CLOSE => 117637379

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_CLOSE_CALL => 117637380

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_CONDITIONAL_MEDIA_DETECTION => 117637381

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_CONFIG_DIALOG => 117637382

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_DEV_SPECIFIC => 117637383

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_DIAL => 117637384

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_DROP => 117637385

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_ADDRESS_CAPS => 117637386

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_ADDRESS_ID => 117637387

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_ADDRESS_STATUS => 117637388

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_CALL_ADDRESS_ID => 117637389

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_CALL_INFO => 117637390

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_CALL_STATUS => 117637391

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_DEV_CAPS => 117637392

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_DEV_CONFIG => 117637393

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_EXTENSION_ID => 117637394

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_ID => 117637395

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GET_LINE_DEV_STATUS => 117637396

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_MAKE_CALL => 117637397

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_NEGOTIATE_EXT_VERSION => 117637398

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_OPEN => 117637399

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_PROVIDER_INITIALIZE => 117637400

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_PROVIDER_SHUTDOWN => 117637401

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SECURE_CALL => 117637402

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SELECT_EXT_VERSION => 117637403

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SEND_USER_USER_INFO => 117637404

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_APP_SPECIFIC => 117637405

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_CALL_PARAMS => 117637406

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_DEFAULT_MEDIA_DETECTION => 117637407

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_DEV_CONFIG => 117637408

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_MEDIA_MODE => 117637409

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_SET_STATUS_MESSAGES => 117637410

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_GATHER_DIGITS => 117637411

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TAPI_MONITOR_DIGITS => 117637412

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_SUPPORTED_VC_RATES => 134283521

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_SUPPORTED_SERVICE_CATEGORY => 134283522

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_SUPPORTED_AAL_TYPES => 134283523

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_HW_CURRENT_ADDRESS => 134283524

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_ACTIVE_VCS => 134283525

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_ACTIVE_VCI_BITS => 134283526

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_ACTIVE_VPI_BITS => 134283527

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_AAL0_PACKET_SIZE => 134283528

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_AAL1_PACKET_SIZE => 134283529

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_AAL34_PACKET_SIZE => 134283530

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MAX_AAL5_PACKET_SIZE => 134283531

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_SIGNALING_VPIVCI => 134283777

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_ASSIGNED_VPI => 134283778

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_ACQUIRE_ACCESS_NET_RESOURCES => 134283779

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_RELEASE_ACCESS_NET_RESOURCES => 134283780

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_ILMI_VPIVCI => 134283781

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_DIGITAL_BROADCAST_VPIVCI => 134283782

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_GET_NEAREST_FLOW => 134283783

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_ALIGNMENT_REQUIRED => 134283784

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_LECS_ADDRESS => 134283785

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_SERVICE_ADDRESS => 134283786

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_CALL_PROCEEDING => 134283787

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_CALL_ALERTING => 134283788

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_PARTY_ALERTING => 134283789

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_CALL_NOTIFY => 134283790

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_MY_IP_NM_ADDRESS => 134283791

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_RCV_CELLS_OK => 134349057

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_XMIT_CELLS_OK => 134349058

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_RCV_CELLS_DROPPED => 134349059

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_RCV_INVALID_VPI_VCI => 134349313

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_CELLS_HEC_ERROR => 134349314

    /**
     * @type {Integer (UInt32)}
     */
    static OID_ATM_RCV_REASSEMBLY_ERROR => 134349315

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_BSSID => 218169601

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_SSID => 218169602

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_NETWORK_TYPES_SUPPORTED => 218169859

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_NETWORK_TYPE_IN_USE => 218169860

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_TX_POWER_LEVEL => 218169861

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RSSI => 218169862

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RSSI_TRIGGER => 218169863

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_INFRASTRUCTURE_MODE => 218169608

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_FRAGMENTATION_THRESHOLD => 218169865

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RTS_THRESHOLD => 218169866

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_NUMBER_OF_ANTENNAS => 218169867

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RX_ANTENNA_SELECTED => 218169868

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_TX_ANTENNA_SELECTED => 218169869

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_SUPPORTED_RATES => 218169870

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_DESIRED_RATES => 218169872

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_CONFIGURATION => 218169873

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_STATISTICS => 218235410

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_ADD_WEP => 218169619

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_REMOVE_WEP => 218169620

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_DISASSOCIATE => 218169621

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_POWER_MODE => 218169878

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_BSSID_LIST => 218169879

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_AUTHENTICATION_MODE => 218169624

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_PRIVACY_FILTER => 218169625

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_BSSID_LIST_SCAN => 218169626

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_WEP_STATUS => 218169627

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_ENCRYPTION_STATUS => 218169627

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RELOAD_DEFAULTS => 218169628

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_ADD_KEY => 218169629

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_REMOVE_KEY => 218169630

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_ASSOCIATION_INFORMATION => 218169631

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_TEST => 218169632

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_MEDIA_STREAM_MODE => 218169633

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_CAPABILITY => 218169634

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_PMKID => 218169635

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_NON_BCAST_SSID_LIST => 218169636

    /**
     * @type {Integer (UInt32)}
     */
    static OID_802_11_RADIO_STATUS => 218169637

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_IPV4 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_ARP => 2054

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_IPV6 => 34525

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_802_1X => 34958

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_802_1Q => 33024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ETH_TYPE_SLOW_PROTOCOL => 34825

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_LENGTH_SSID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_LENGTH_RATES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_LENGTH_RATES_EX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AUTH_REQUEST_AUTH_FIELDS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AUTH_REQUEST_REAUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AUTH_REQUEST_KEYUPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AUTH_REQUEST_PAIRWISE_ERROR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AUTH_REQUEST_GROUP_ERROR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_PMKID_CANDIDATE_PREAUTH_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_REQFI_CAPABILITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_REQFI_LISTENINTERVAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_REQFI_CURRENTAPADDRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_RESFI_CAPABILITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_RESFI_STATUSCODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_802_11_AI_RESFI_ASSOCIATIONID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_RECEIVING => 167837952

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_TURNAROUND_TIME => 167837953

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_SUPPORTED_SPEEDS => 167837954

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_LINK_SPEED => 167837955

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_MEDIA_BUSY => 167837956

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_EXTRA_RCV_BOFS => 167838208

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_RATE_SNIFF => 167838209

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_UNICAST_LIST => 167838210

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_MAX_UNICAST_LIST_SIZE => 167838211

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_MAX_RECEIVE_WINDOW_SIZE => 167838212

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_MAX_SEND_WINDOW_SIZE => 167838213

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_RESERVED1 => 167838218

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IRDA_RESERVED2 => 167838223

    /**
     * @type {Integer (UInt32)}
     */
    static OID_1394_LOCAL_NODE_INFO => 201392385

    /**
     * @type {Integer (UInt32)}
     */
    static OID_1394_VC_INFO => 201392386

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_ADD_PVC => 4261412865

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_DELETE_PVC => 4261412866

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_GET_CALL_INFORMATION => 4261412867

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_ADD_ADDRESS => 4261412868

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_DELETE_ADDRESS => 4261412869

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_GET_ADDRESSES => 4261412870

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_ADDRESS_CHANGE => 4261412871

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_SIGNALING_ENABLED => 4261412872

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_SIGNALING_DISABLED => 4261412873

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_AF_CLOSE => 4261412874

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_CM_CAPS => 4261416961

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_LINE_CAPS => 4261416962

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_ADDRESS_CAPS => 4261416963

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_TRANSLATE_TAPI_CALLPARAMS => 4261416964

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_TRANSLATE_NDIS_CALLPARAMS => 4261416965

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_TRANSLATE_TAPI_SAP => 4261416966

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_GET_CALL_DIAGNOSTICS => 4261416967

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_REPORT_DIGITS => 4261416968

    /**
     * @type {Integer (UInt32)}
     */
    static OID_CO_TAPI_DONT_REPORT_DIGITS => 4261416969

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_CAPABILITIES => 4244701440

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_SET_POWER => 4244701441

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_QUERY_POWER => 4244701442

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_ADD_WAKE_UP_PATTERN => 4244701443

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_REMOVE_WAKE_UP_PATTERN => 4244701444

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_WAKE_UP_PATTERN_LIST => 4244701445

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_ENABLE_WAKE_UP => 4244701446

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_WAKE_UP_OK => 4244767232

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PNP_WAKE_UP_ERROR => 4244767233

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_CURRENT_CAPABILITIES => 4244701447

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_HARDWARE_CAPABILITIES => 4244701448

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_PARAMETERS => 4244701449

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_ADD_WOL_PATTERN => 4244701450

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_REMOVE_WOL_PATTERN => 4244701451

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_WOL_PATTERN_LIST => 4244701452

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_ADD_PROTOCOL_OFFLOAD => 4244701453

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_GET_PROTOCOL_OFFLOAD => 4244701454

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_REMOVE_PROTOCOL_OFFLOAD => 4244701455

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_PROTOCOL_OFFLOAD_LIST => 4244701456

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PM_RESERVED_1 => 4244701457

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_HARDWARE_CAPABILITIES => 66081

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_GLOBAL_PARAMETERS => 66082

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_ALLOCATE_QUEUE => 66083

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_FREE_QUEUE => 66084

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_ENUM_QUEUES => 66085

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_QUEUE_PARAMETERS => 66086

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_SET_FILTER => 66087

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_CLEAR_FILTER => 66088

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_ENUM_FILTERS => 66089

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_PARAMETERS => 66090

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_QUEUE_ALLOCATION_COMPLETE => 66091

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_CURRENT_CAPABILITIES => 66093

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_HARDWARE_CAPABILITIES => 66094

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_CURRENT_CAPABILITIES => 66095

    /**
     * @type {Integer (UInt32)}
     */
    static OID_RECEIVE_FILTER_MOVE_FILTER => 66096

    /**
     * @type {Integer (UInt32)}
     */
    static OID_VLAN_RESERVED1 => 66097

    /**
     * @type {Integer (UInt32)}
     */
    static OID_VLAN_RESERVED2 => 66098

    /**
     * @type {Integer (UInt32)}
     */
    static OID_VLAN_RESERVED3 => 66099

    /**
     * @type {Integer (UInt32)}
     */
    static OID_VLAN_RESERVED4 => 66100

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PACKET_COALESCING_FILTER_MATCH_COUNT => 66101

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_CREATE_SWITCH => 66103

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_PARAMETERS => 66104

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_DELETE_SWITCH => 66105

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_ENUM_SWITCHES => 66112

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_CREATE_VPORT => 66113

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_VPORT_PARAMETERS => 66114

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_ENUM_VPORTS => 66115

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_DELETE_VPORT => 66116

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_ALLOCATE_VF => 66117

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_FREE_VF => 66118

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_VF_PARAMETERS => 66119

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NIC_SWITCH_ENUM_VFS => 66120

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_HARDWARE_CAPABILITIES => 66121

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_CURRENT_CAPABILITIES => 66128

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_READ_VF_CONFIG_SPACE => 66129

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_WRITE_VF_CONFIG_SPACE => 66130

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_READ_VF_CONFIG_BLOCK => 66131

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_WRITE_VF_CONFIG_BLOCK => 66132

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_RESET_VF => 66133

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_SET_VF_POWER_STATE => 66134

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_VF_VENDOR_DEVICE_ID => 66135

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_PROBED_BARS => 66136

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_BAR_RESOURCES => 66137

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_PF_LUID => 66144

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_CONFIG_STATE => 66145

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_VF_SERIAL_NUMBER => 66146

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_OVERLYING_ADAPTER_INFO => 66152

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SRIOV_VF_INVALIDATE_CONFIG_BLOCK => 66153

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PROPERTY_ADD => 66147

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PROPERTY_UPDATE => 66148

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PROPERTY_DELETE => 66149

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PROPERTY_ENUM => 66150

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_FEATURE_STATUS_QUERY => 66151

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_REQUEST => 66160

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_PROPERTY_ADD => 66161

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_PROPERTY_UPDATE => 66162

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_PROPERTY_DELETE => 66163

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_PROPERTY_ENUM => 66164

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PARAMETERS => 66165

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_ARRAY => 66166

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_ARRAY => 66167

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_CREATE => 66168

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_DELETE => 66169

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_CREATE => 66170

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_CONNECT => 66171

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_DISCONNECT => 66172

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_DELETE => 66173

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_FEATURE_STATUS_QUERY => 66174

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_TEARDOWN => 66175

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_SAVE => 66192

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_SAVE_COMPLETE => 66193

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_RESTORE => 66194

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_RESTORE_COMPLETE => 66195

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_UPDATED => 66196

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_PORT_UPDATED => 66197

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_DIRECT_REQUEST => 66198

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_SUSPEND => 66199

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_RESUME => 66200

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_SUSPENDED_LM_SOURCE_STARTED => 66201

    /**
     * @type {Integer (UInt32)}
     */
    static OID_SWITCH_NIC_SUSPENDED_LM_SOURCE_FINISHED => 66202

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_RSS_SET_INDIRECTION_TABLE_ENTRIES => 66240

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GEN_ISOLATION_PARAMETERS => 66304

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_HARDWARE_CAPABILITIES => 66561

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_CURRENT_CAPABILITIES => 66562

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_GLOBAL_PARAMETERS => 66563

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_CREATE_TABLE => 66564

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_DELETE_TABLE => 66565

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ENUM_TABLES => 66566

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ALLOCATE_COUNTERS => 66567

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_FREE_COUNTERS => 66568

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ENUM_COUNTERS => 66569

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_COUNTER_VALUES => 66570

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_STATISTICS => 66571

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ADD_FLOW_ENTRIES => 66572

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_DELETE_FLOW_ENTRIES => 66573

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ENUM_FLOW_ENTRIES => 66574

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ACTIVATE_FLOW_ENTRIES => 66575

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_DEACTIVATE_FLOW_ENTRIES => 66576

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_FLOW_ENTRY_PARAMETERS => 66577

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_EXACT_MATCH_PROFILE => 66578

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_HEADER_TRANSPOSITION_PROFILE => 66579

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_WILDCARD_MATCH_PROFILE => 66580

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ENUM_PROFILES => 66581

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_DELETE_PROFILE => 66582

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_VPORT_PARAMETERS => 66583

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_CREATE_LOGICAL_VPORT => 66584

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_DELETE_LOGICAL_VPORT => 66585

    /**
     * @type {Integer (UInt32)}
     */
    static OID_GFT_ENUM_LOGICAL_VPORTS => 66586

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_HARDWARE_CAPABILITIES => 67073

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_CURRENT_CAPABILITIES => 67074

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_CREATE_SQ => 67075

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_DELETE_SQ => 67076

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_UPDATE_SQ => 67077

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_ENUM_SQS => 67078

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OFFLOAD_SQ_STATS => 67079

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PD_OPEN_PROVIDER => 66817

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PD_CLOSE_PROVIDER => 66818

    /**
     * @type {Integer (UInt32)}
     */
    static OID_PD_QUERY_CURRENT_CONFIG => 66819

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PNP_WAKE_UP_MAGIC_PACKET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PNP_WAKE_UP_PATTERN_MATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PNP_WAKE_UP_LINK_CHANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_OFFLOAD => 4227924481

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_ADD_SA => 4227924482

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_DELETE_SA => 4227924483

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_SAN_SUPPORT => 4227924484

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_ADD_UDPESP_SA => 4227924485

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_DELETE_UDPESP_SA => 4227924486

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP4_OFFLOAD_STATS => 4227924487

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP6_OFFLOAD_STATS => 4227924488

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IP4_OFFLOAD_STATS => 4227924489

    /**
     * @type {Integer (UInt32)}
     */
    static OID_IP6_OFFLOAD_STATS => 4227924490

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_OFFLOAD_CURRENT_CONFIG => 4227924491

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_OFFLOAD_PARAMETERS => 4227924492

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_OFFLOAD_HARDWARE_CAPABILITIES => 4227924493

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_CONNECTION_OFFLOAD_CURRENT_CONFIG => 4227924494

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_CONNECTION_OFFLOAD_HARDWARE_CAPABILITIES => 4227924495

    /**
     * @type {Integer (UInt32)}
     */
    static OID_OFFLOAD_ENCAPSULATION => 16843018

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_OFFLOAD_V2_ADD_SA => 4228055554

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_OFFLOAD_V2_DELETE_SA => 4228055555

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_OFFLOAD_V2_UPDATE_SA => 4228055556

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_TASK_IPSEC_OFFLOAD_V2_ADD_SA_EX => 4228055557

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_SUPPORT => 4227924496

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_FLUSH => 4227924497

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_CONTROL => 4227924498

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_PARAMS => 4227924499

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_DATA => 4227924500

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_DRIVER_STATS => 4227990032

    /**
     * @type {Integer (UInt32)}
     */
    static OID_FFP_ADAPTER_STATS => 4227990033

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TCP_CONNECTION_OFFLOAD_PARAMETERS => 4228055553

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TUNNEL_INTERFACE_SET_OID => 251724038

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TUNNEL_INTERFACE_RELEASE_OID => 251724039

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED1 => 4211147008

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED2 => 4211147009

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED3 => 4211147010

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED4 => 4211147011

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED5 => 4211147012

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED6 => 4211147013

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED7 => 4211147014

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED8 => 4211147015

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED9 => 4211147016

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED10 => 4211147017

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED11 => 4211147018

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED12 => 4211147019

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED13 => 4211147020

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED14 => 4211147021

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED15 => 4211147022

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED16 => 4211147023

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED17 => 4211147024

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED18 => 4211147025

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED19 => 4211147026

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_RESERVED20 => 4211147027

    /**
     * @type {Integer (UInt32)}
     */
    static OID_XBOX_ACC_RESERVED0 => 4194304000

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_MAX_SAS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_INBOUND_SA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_OUTBOUND_SA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_TCP_IP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_IP6 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_IPX => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_NBF => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_MAX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROTOCOL_ID_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static READABLE_LOCAL_CLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK_NETWORK_DERIVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK_PRECISION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RECEIVE_TIME_INDICATION_CAPABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TIMED_SEND_CAPABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_STAMP_CAPABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_WAKE_UP_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_WAKE_ON_PATTERN_MATCH_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_WAKE_ON_MAGIC_PACKET_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WAN_PROTOCOL_KEEPS_STATS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_TO_OID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_TO_STATUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_ANSI_STRING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_UNICODE_STRING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_ARRAY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_ALLOW_READ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_ALLOW_WRITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_METHOD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_NDIS_RESERVED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static fNDIS_GUID_SUPPORT_COMMON_HEADER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_DIRECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_MULTICAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_ALL_MULTICAST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_BROADCAST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_SOURCE_ROUTING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_PROMISCUOUS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_SMT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_ALL_LOCAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_GROUP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_ALL_FUNCTIONAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_FUNCTIONAL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_MAC_FRAME => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PACKET_TYPE_NO_LOCAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_SIGNAL_LOSS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_HARD_ERROR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_SOFT_ERROR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_TRANSMIT_BEACON => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_LOBE_WIRE_FAULT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_AUTO_REMOVAL_ERROR => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_REMOVE_RECEIVED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_COUNTER_OVERFLOW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_SINGLE_STATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RING_RING_RECOVERY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROT_OPTION_ESTIMATED_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROT_OPTION_NO_LOOPBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROT_OPTION_NO_RSVD_ON_RCVPKT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PROT_OPTION_SEND_RESTRICTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_COPY_LOOKAHEAD_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_RECEIVE_SERIALIZED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_TRANSFERS_NOT_PEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_NO_LOOPBACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_FULL_DUPLEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_EOTX_INDICATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_8021P_PRIORITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_SUPPORTS_MAC_ADDRESS_OVERWRITE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_RECEIVE_AT_DPC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_8021Q_VLAN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MAC_OPTION_RESERVED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_CAP_TRANSMIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_CAP_RECEIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_CO_MAC_OPTION_DYNAMIC_LINK_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_STATE_XMIT_LINK_SPEED_AUTO_NEGOTIATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_STATE_RCV_LINK_SPEED_AUTO_NEGOTIATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_STATE_DUPLEX_AUTO_NEGOTIATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_STATE_PAUSE_FUNCTIONS_AUTO_NEGOTIATED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_LINK_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OPER_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_IP_OPER_STATUS_ADDRESS_FAMILIES_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IP_OPER_STATUS_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_IP_OPER_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_NO_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_TX_RX_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_TX_ENABLED_RX_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_RX_ENABLED_TX_DISABLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_TX_RX_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_LSOV1_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_LSOV1_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV1_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV1_AH_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV1_ESP_ENABLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV1_AH_AND_ESP_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_LSOV2_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_LSOV2_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV2_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV2_AH_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV2_ESP_ENABLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_IPSECV2_AH_AND_ESP_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_RSC_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_RSC_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_TYPE_GRE_MAC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATION_TYPE_VXLAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_CONNECTION_OFFLOAD_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_CONNECTION_OFFLOAD_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_USO_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_USO_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_REVISION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PARAMETERS_SKIP_REGISTRY_UPDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_MD5 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_SHA_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_SHA_256 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_AES_GCM_128 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_AES_GCM_192 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AUTHENTICATION_AES_GCM_256 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_DES_CBC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_3_DES_CBC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_GCM_128 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_GCM_192 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_GCM_256 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_CBC_128 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_CBC_192 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_ENCRYPTION_AES_CBC_256 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_RECV_SEG_COALESC_OFFLOAD_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATED_PACKET_TASK_OFFLOAD_NOT_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATED_PACKET_TASK_OFFLOAD_INNER_IPV4 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATED_PACKET_TASK_OFFLOAD_OUTER_IPV4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATED_PACKET_TASK_OFFLOAD_INNER_IPV6 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ENCAPSULATED_PACKET_TASK_OFFLOAD_OUTER_IPV6 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_FLAGS_GROUP_CHECKSUM_CAPABILITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AND_TCP_CHECKSUM_COEXISTENCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_OFFLOAD_V2_AND_UDP_CHECKSUM_COEXISTENCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_REVISION_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_CONNECTION_OFFLOAD_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TCP_CONNECTION_OFFLOAD_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PORT_AUTHENTICATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_DEFAULT_METHOD_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_OBJECT_TYPE_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_OBJECT_TYPE_METHOD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_OBJECT_TYPE_EVENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_OBJECT_TYPE_ENUM_ADAPTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_OBJECT_TYPE_OUTPUT_INFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_METHOD_HEADER_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_SET_HEADER_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_EVENT_HEADER_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_ENUM_ADAPTER_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_TYPE_ENDPOINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_COMBINE_ALL_HEADERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_CURRENT_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_CAPS_SUPPORTS_HEADER_DATA_SPLIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_CAPS_SUPPORTS_IPV4_OPTIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_CAPS_SUPPORTS_IPV6_EXTENSION_HEADERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_CAPS_SUPPORTS_TCP_OPTIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HD_SPLIT_ENABLE_HEADER_DATA_SPLIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_BITMAP_PATTERN_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_MAGIC_PACKET_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV4_TCP_SYN_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV6_TCP_SYN_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV4_DEST_ADDR_WILDCARD_SUPPORTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV6_DEST_ADDR_WILDCARD_SUPPORTED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_EAPOL_REQUEST_ID_MESSAGE_SUPPORTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_ARP_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_NS_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_80211_RSN_REKEY_SUPPORTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_ON_MEDIA_CONNECT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_ON_MEDIA_DISCONNECT_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_NLO_DISCOVERY_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_AP_ASSOCIATION_LOST_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_GTK_HANDSHAKE_ERROR_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_4WAY_HANDSHAKE_REQUEST_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_REGISTER_STATE_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_SMS_RECEIVE_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_USSD_RECEIVE_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_PACKET_STATE_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_UICC_CHANGE_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_PACKET_INDICATION_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_SELECTIVE_SUSPEND_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_BITMAP_PATTERN_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_MAGIC_PACKET_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV4_TCP_SYN_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV6_TCP_SYN_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV4_DEST_ADDR_WILDCARD_ENABLED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_IPV6_DEST_ADDR_WILDCARD_ENABLED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_EAPOL_REQUEST_ID_MESSAGE_ENABLED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_ARP_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_NS_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_80211_RSN_REKEY_ENABLED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_ON_LINK_CHANGE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_ON_MEDIA_DISCONNECT_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_SELECTIVE_SUSPEND_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_NLO_DISCOVERY_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_AP_ASSOCIATION_LOST_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_GTK_HANDSHAKE_ERROR_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_4WAY_HANDSHAKE_REQUEST_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_REGISTER_STATE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_SMS_RECEIVE_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_USSD_RECEIVE_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_PACKET_STATE_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WWAN_WAKE_ON_UICC_CHANGE_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PRIORITY_LOWEST => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PRIORITY_NORMAL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PRIORITY_HIGHEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_PRIORITY_LOWEST => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_PRIORITY_NORMAL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_PRIORITY_HIGHEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_MAX_STRING_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_CAPABILITIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EAPOL_REQUEST_ID_WOL_FLAG_MUST_ENCRYPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_MAX_PATTERN_ID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PRIVATE_PATTERN_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PATTERN_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PATTERN_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RSN_KCK_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RSN_KEK_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DOT11_RSN_MAX_CIPHER_KEY_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SIZEOF_NDIS_PM_PROTOCOL_OFFLOAD_REVISION_1 => 240

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_REASON_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WAKE_PACKET_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_PM_ADMIN_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_PM_ACTIVE_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IPV4_HEADER_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IPV6_HEADER_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_ARP_HEADER_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_UDP_HEADER_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_DEST_ADDR_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_SOURCE_ADDR_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_PROTOCOL_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_VLAN_ID_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_PRIORITY_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MAC_HEADER_PACKET_TYPE_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_ARP_HEADER_OPERATION_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_ARP_HEADER_SPA_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_ARP_HEADER_TPA_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IPV4_HEADER_PROTOCOL_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IPV6_HEADER_PROTOCOL_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_UDP_HEADER_DEST_PORT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_TEST_HEADER_FIELD_EQUAL_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_TEST_HEADER_FIELD_MASK_EQUAL_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_TEST_HEADER_FIELD_NOT_EQUAL_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MSI_X_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_VM_QUEUE_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_LOOKAHEAD_SPLIT_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_DYNAMIC_PROCESSOR_AFFINITY_CHANGE_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_INTERRUPT_VECTOR_COALESCING_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IMPLAT_MIN_OF_QUEUES_MODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_IMPLAT_SUM_OF_QUEUES_MODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PACKET_COALESCING_SUPPORTED_ON_DEFAULT_QUEUE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_ANY_VLAN_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_DYNAMIC_PROCESSOR_AFFINITY_CHANGE_FOR_DEFAULT_QUEUE_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_VMQ_FILTERS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PACKET_COALESCING_FILTERS_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_VM_QUEUES_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_CAPABILITIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_VLAN_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_PER_VPORT_INTERRUPT_MODERATION_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_ASYMMETRIC_QUEUE_PAIRS_FOR_NONDEFAULT_VPORT_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_VF_RSS_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_SINGLE_VPORT_POOL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PARAMETERS_PER_PF_VPORT_SUPPORTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_NIC_SWITCH_WITHOUT_IOV_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_ON_PF_VPORTS_SUPPORTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PER_PF_VPORT_INDIRECTION_TABLE_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PER_PF_VPORT_HASH_FUNCTION_SUPPORTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PER_PF_VPORT_HASH_TYPE_SUPPORTED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PER_PF_VPORT_HASH_KEY_SUPPORTED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPS_RSS_PER_PF_VPORT_INDIRECTION_TABLE_SIZE_RESTRICTED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPABILITIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_CAPABILITIES_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_GLOBAL_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEFAULT_RECEIVE_QUEUE_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEFAULT_RECEIVE_QUEUE_GROUP_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEFAULT_RECEIVE_FILTER_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_FIELD_MAC_HEADER_VLAN_UNTAGGED_OR_ZERO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_RESERVED => 254

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_FIELD_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_FIELD_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_FLAGS_RESERVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PACKET_ENCAPSULATION_GRE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PACKET_ENCAPSULATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_CLEAR_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_PER_QUEUE_RECEIVE_INDICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_LOOKAHEAD_SPLIT_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_FLAGS_CHANGED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_PROCESSOR_AFFINITY_CHANGED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_SUGGESTED_RECV_BUFFER_NUMBERS_CHANGED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_NAME_CHANGED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_INTERRUPT_COALESCING_DOMAIN_ID_CHANGED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_QOS_SQ_ID_CHANGED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_CHANGE_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_PARAMETERS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_FREE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_INFO_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_INFO_ARRAY_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_INFO_ARRAY_VPORT_ID_SPECIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_ALLOCATION_COMPLETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_QUEUE_ALLOCATION_COMPLETE_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_CAPABILITIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_CAPABILITIES_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_TCP_IPV4 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_TCP_IPV6 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_TCP_IPV6_EX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_UDP_IPV4 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_UDP_IPV6 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_HASH_TYPE_UDP_IPV6_EX => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_MESSAGE_SIGNALED_INTERRUPTS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_CLASSIFICATION_AT_ISR => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_CLASSIFICATION_AT_DPC => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_USING_MSI_X => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_RSS_AVAILABLE_ON_PORTS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_SUPPORTS_MSI_X => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_CAPS_SUPPORTS_INDEPENDENT_ENTRY_MOVE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_BASE_CPU_UNCHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_HASH_INFO_UNCHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_ITABLE_UNCHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_HASH_KEY_UNCHANGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_DISABLE_RSS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PARAM_FLAG_DEFAULT_PROCESSOR_UNCHANGED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_INDIRECTION_TABLE_SIZE_REVISION_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_HASH_SECRET_KEY_SIZE_REVISION_1 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAMETERS_REVISION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_INDIRECTION_TABLE_MAX_SIZE_REVISION_1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_HASH_SECRET_KEY_MAX_SIZE_REVISION_1 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_HASH_SECRET_KEY_MAX_SIZE_REVISION_2 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_HASH_SECRET_KEY_MAX_SIZE_REVISION_3 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAMETERS_V2_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAM_ENABLE_RSS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAM_HASH_INFO_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAM_HASH_KEY_CHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAM_NUMBER_OF_QUEUES_CHANGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_SCALE_PARAM_NUMBER_OF_ENTRIES_CHANGED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_SET_INDIRECTION_ENTRY_FLAG_PRIMARY_PROCESSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_SET_INDIRECTION_ENTRY_FLAG_DEFAULT_PROCESSOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_SET_INDIRECTION_ENTRIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_HASH_FLAG_ENABLE_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_HASH_FLAG_HASH_INFO_UNCHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_HASH_FLAG_HASH_KEY_UNCHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_HASH_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PROCESSOR_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RSS_PROCESSOR_INFO_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SYSTEM_PROCESSOR_INFO_EX_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HYPERVISOR_INFO_FLAG_HYPERVISOR_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HYPERVISOR_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_RECEIVE_QUEUE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WMI_RECEIVE_QUEUE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NDK_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NDK_SET_STATE => 4228121089

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NDK_STATISTICS => 4228121090

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NDK_CONNECTIONS => 4228121091

    /**
     * @type {Integer (UInt32)}
     */
    static OID_NDK_LOCAL_ENDPOINTS => 4228121092

    /**
     * @type {Guid}
     */
    static GUID_NDIS_NDK_CAPABILITIES => Guid("{7969ba4d-dd80-4bc7-b3e6-68043997e519}")

    /**
     * @type {Guid}
     */
    static GUID_NDIS_NDK_STATE => Guid("{530c69c9-2f51-49de-a1af-088d54ffa474}")

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NDK_STATISTICS_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NDK_CONNECTIONS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NDK_LOCAL_ENDPOINTS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_HARDWARE_CAPABILITIES => 4228186113

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_CURRENT_CAPABILITIES => 4228186114

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_PARAMETERS => 4228186115

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_OPERATIONAL_PARAMETERS => 4228186116

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QOS_REMOTE_PARAMETERS => 4228186117

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_MAXIMUM_PRIORITIES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_MAXIMUM_TRAFFIC_CLASSES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CAPABILITIES_STRICT_TSA_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CAPABILITIES_MACSEC_BYPASS_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CAPABILITIES_CEE_DCBX_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CAPABILITIES_IEEE_DCBX_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CLASSIFICATION_SET_BY_MINIPORT_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CLASSIFICATION_ENFORCED_BY_MINIPORT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_TCP_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_UDP_PORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_TCP_OR_UDP_PORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_ETHERTYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_NETDIRECT_PORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CONDITION_MAXIMUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_ACTION_PRIORITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_ACTION_MAXIMUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_CLASSIFICATION_ELEMENT_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_ETS_CHANGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_ETS_CONFIGURED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_PFC_CHANGED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_PFC_CONFIGURED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_CLASSIFICATION_CHANGED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_CLASSIFICATION_CONFIGURED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_WILLING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_TSA_STRICT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_TSA_CBS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_TSA_ETS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_TSA_MAXIMUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEFAULT_VPORT_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_DEFAULT_SWITCH_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_PARAMETERS_CHANGE_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_PARAMETERS_SWITCH_NAME_CHANGED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_PARAMETERS_DEFAULT_NUMBER_OF_QUEUE_PAIRS_FOR_DEFAULT_VPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_DELETE_SWITCH_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_LOOKAHEAD_SPLIT_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_PACKET_DIRECT_RX_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_ENFORCE_MAX_SG_LIST => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_CHANGE_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_FLAGS_CHANGED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_NAME_CHANGED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_INT_MOD_CHANGED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_STATE_CHANGED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_PROCESSOR_AFFINITY_CHANGED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_NDK_PARAMS_CHANGED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_QOS_SQ_ID_CHANGED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMS_NUM_QUEUE_PAIRS_CHANGED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_DELETE_VPORT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_LOOKAHEAD_SPLIT_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_PACKET_DIRECT_RX_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_GFT_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_ARRAY_ENUM_ON_SPECIFIC_FUNCTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_ARRAY_ENUM_ON_SPECIFIC_SWITCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VPORT_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VF_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_FREE_VF_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VF_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VF_INFO_ARRAY_ENUM_ON_SPECIFIC_SWITCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NIC_SWITCH_VF_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_CAPS_SRIOV_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_CAPS_PF_MINIPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_CAPS_VF_MINIPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_READ_VF_CONFIG_SPACE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_WRITE_VF_CONFIG_SPACE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_READ_VF_CONFIG_BLOCK_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_WRITE_VF_CONFIG_BLOCK_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_RESET_VF_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_SET_VF_POWER_STATE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_VF_VENDOR_DEVICE_ID_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_PROBED_BARS_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_RECEIVE_FILTER_MOVE_FILTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_BAR_RESOURCES_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_PF_LUID_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_VF_SERIAL_NUMBER_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_VF_INVALIDATE_CONFIG_BLOCK_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SRIOV_OVERLYING_ADAPTER_INFO_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ISOLATION_NAME_MAX_STRING_SIZE => 127

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ROUTING_DOMAIN_ISOLATION_ENTRY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ROUTING_DOMAIN_ENTRY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_ISOLATION_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_OBJECT_SERIALIZATION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_SECURITY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_SECURITY_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_VLAN_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_ISOLATION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_ROUTING_DOMAIN_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_CUSTOM_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_DELETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_ENUM_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PROPERTY_ENUM_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_FEATURE_STATUS_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_FEATURE_STATUS_CUSTOM_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PROPERTY_CUSTOM_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PROPERTY_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PROPERTY_DELETE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PROPERTY_ENUM_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PROPERTY_ENUM_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_FEATURE_STATUS_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_FEATURE_STATUS_CUSTOM_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PARAMETERS_FLAG_UNTRUSTED_INTERNAL_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PARAMETERS_FLAG_RESTORING_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_PORT_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_FLAGS_NIC_INITIALIZING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_FLAGS_NIC_SUSPENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_FLAGS_MAPPED_NIC_UPDATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_FLAGS_NIC_SUSPENDED_LM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_OID_REQUEST_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_SAVE_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SWITCH_NIC_SAVE_STATE_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PORT_STATE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PORT_CHAR_USE_DEFAULT_AUTH_SETTINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PORT_CHARACTERISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PORT_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ETHERNET_LENGTH_OF_ADDRESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_ETHERNET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_IPV4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_IPV6 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_TCP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_UDP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_ICMP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_NO_ENCAP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_IP_IN_IP_ENCAP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_IP_IN_GRE_ENCAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_NVGRE_ENCAP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_VXLAN_ENCAP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_PRESENT_ESP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_ENCAPSULATION_TYPE_NOT_ENCAPSULATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_ENCAPSULATION_TYPE_IP_IN_IP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_ENCAPSULATION_TYPE_IP_IN_GRE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_ENCAPSULATION_TYPE_NVGRE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_ENCAPSULATION_TYPE_VXLAN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_UNDEFINED_PROFILE_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_EXACT_MATCH_PROFILE_IS_TTL_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_EXACT_MATCH_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_EXACT_MATCH_PROFILE_RDMA_FLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_EXACT_MATCH_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_EXACT_MATCH_IS_TTL_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_EXACT_MATCH_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_WILDCARD_MATCH_PROFILE_IS_TTL_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_WILDCARD_MATCH_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_WILDCARD_MATCH_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_WILDCARD_MATCH_IS_TTL_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFP_HEADER_GROUP_WILDCARD_MATCH_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CAPS_RECEIVE_FILTER_COUNTERS_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CAPS_DRAIN_NOTIFICATIONS_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CAPS_NOTIFICATION_MODERATION_INTERVAL_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CAPS_NOTIFICATION_MODERATION_COUNT_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_PD_CONFIG_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_UNDEFINED_FLOW_ENTRY_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_UNDEFINED_TABLE_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_TABLE_INCLUDE_EXTERNAL_VPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_TABLE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_TABLE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_TABLE_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_DELETE_TABLE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_UNDEFINED_COUNTER_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_MAX_COUNTER_OBJECTS_PER_FLOW_ENTRY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_PARAMETERS_CLIENT_SPECIFIED_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FREE_COUNTER_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_VALUE_ARRAY_UPDATE_MEMORY_MAPPED_COUNTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_VALUE_ARRAY_GET_VALUES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_COUNTER_VALUE_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_STATISTICS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HEADER_GROUP_TRANSPOSITION_PROFILE_DECREMENT_TTL_IF_NOT_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HEADER_GROUP_TRANSPOSITION_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_UNDEFINED_CUSTOM_ACTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_RESERVED_CUSTOM_ACTIONS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_CUSTOM_ACTION_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_COPY_ALL_PACKETS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_COPY_FIRST_PACKET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_COPY_WHEN_TCP_FLAG_SET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_CUSTOM_ACTION_PRESENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HTP_META_ACTION_BEFORE_HEADER_TRANSPOSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HEADER_TRANSPOSITION_PROFILE_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HEADER_GROUP_TRANSPOSITION_DECREMENT_TTL_IF_NOT_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_HEADER_GROUP_TRANSPOSITION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_CUSTOM_ACTION_LAST_ACTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_CUSTOM_ACTION_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_ADD_IN_ACTIVATED_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_MATCH_AND_ACTION_MUST_BE_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_RDMA_FLOW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_ALL_PACKETS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_FIRST_PACKET => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_WHEN_TCP_FLAG_SET => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_CUSTOM_ACTION_PRESENT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_META_ACTION_BEFORE_HEADER_TRANSPOSITION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_AFTER_TCP_FIN_FLAG_SET => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_AFTER_TCP_RST_FLAG_SET => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COPY_CONDITION_CHANGED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_ALL_VPORT_FLOW_ENTRIES => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COUNTER_ALLOCATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COUNTER_MEMORY_MAPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COUNTER_CLIENT_SPECIFIED_ADDRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EMFE_COUNTER_TRACK_TCP_FLOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_EXACT_MATCH_FLOW_ENTRY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_ADD_IN_ACTIVATED_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_COPY_ALL_PACKETS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_CUSTOM_ACTION_PRESENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_COUNTER_ALLOCATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_COUNTER_MEMORY_MAPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WCFE_COUNTER_CLIENT_SPECIFIED_ADDRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_WILDCARD_MATCH_FLOW_ENTRY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_PROFILE_INFO_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_PROFILE_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_DELETE_PROFILE_ALL_PROFILES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_DELETE_PROFILE_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_INFO_ALL_FLOW_ENTRIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_INFO_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ALL_NIC_SWITCH_FLOW_ENTRIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ALL_TABLE_FLOW_ENTRIES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ALL_VPORT_FLOW_ENTRIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_RANGE_DEFINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ARRAY_DEFINED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ARRAY_COUNTER_VALUES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_FLOW_ENTRY_ID_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_PARAMETERS_ENABLE_OFFLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_PARAMETERS_CUSTOM_PROVIDER_RESERVED => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_ADD_FLOW_ENTRY_DEACTIVATED_PREFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_RATE_LIMITING_QUEUE_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_MEMORY_MAPPED_COUNTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_MEMORY_MAPPED_PAKCET_AND_BYTE_COUNTERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_PER_FLOW_ENTRY_COUNTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_PER_PACKET_COUNTER_UPDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_CLIENT_SPECIFIED_MEMORY_MAPPED_COUNTERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_INGRESS_AGGREGATE_COUNTERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EGRESS_AGGREGATE_COUNTERS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_TRACK_TCP_FLOW_STATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_COMBINED_COUNTER_AND_STATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_INGRESS_WILDCARD_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EGRESS_WILDCARD_MATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_INGRESS_EXACT_MATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EGRESS_EXACT_MATCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EXT_VPORT_INGRESS_WILDCARD_MATCH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EXT_VPORT_EGRESS_WILDCARD_MATCH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EXT_VPORT_INGRESS_EXACT_MATCH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_EXT_VPORT_EGRESS_EXACT_MATCH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_POP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_PUSH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_MODIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_IGNORE_ACTION_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_REDIRECT_TO_INGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_REDIRECT_TO_EGRESS_QUEUE_OF_VPORT_IF_TTL_IS_ONE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_COPY_ALL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_COPY_FIRST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_COPY_WHEN_TCP_FLAG_SET => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_SAMPLE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_META_ACTION_BEFORE_HEADER_TRANSPOSITION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_META_ACTION_AFTER_HEADER_TRANSPOSITION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_PER_VPORT_EXCEPTION_VPORT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_DESIGNATED_EXCEPTION_VPORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_DSCP_MASK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_8021P_PRIORITY_MASK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_ALLOW => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPS_DROP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_OFFLOAD_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PARSE_VXLAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PARSE_VXLAN_NOT_IN_SRC_PORT_RANGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_ENABLE_STATE_CHANGED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_EXCEPTION_VPORT_CHANGED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_SAMPLING_RATE_CHANGED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_MASK_CHANGED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PRIORITY_MASK_CHANGED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_VXLAN_SETTINGS_CHANGED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_FLAGS_CHANGED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PARAMS_CHANGE_MASK => 4293918720

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PARAMS_CUSTOM_PROVIDER_RESERVED => 1044480

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_MAX_DSCP_MASK_COUNTER_OBJECTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_MAX_PRIORITY_MASK_COUNTER_OBJECTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_GUARD_ENABLE_RX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_GUARD_ENABLE_TX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_MASK_ENABLE_RX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_DSCP_MASK_ENABLE_TX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_GFT_VPORT_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_DEFAULT_SQ_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_PARAMETERS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_PARAMETERS_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_TRANSMIT_CAP_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_TRANSMIT_RESERVATION_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_RECEIVE_CAP_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_PARAMETERS_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_ARRAY_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_OFFLOAD_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_OFFLOAD_CAPABILITIES_REVISION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_OFFLOAD_CAPS_STANDARD_SQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_OFFLOAD_CAPS_GFT_SQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_QOS_SQ_STATS_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_TIMESTAMP_CAPABILITIES_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TIMESTAMP_CAPABILITY => 10485761

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TIMESTAMP_CURRENT_CONFIG => 10485762

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_HARDWARE_CROSSTIMESTAMP_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OID_TIMESTAMP_GET_CROSSTIMESTAMP => 10485763
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<NDIS_RW_LOCK>} Lock 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisInitializeReadWriteLock(Lock) {
        DllCall("NDIS.sys\NdisInitializeReadWriteLock", "ptr", Lock)
    }

    /**
     * 
     * @param {Pointer<NDIS_RW_LOCK>} Lock 
     * @param {BOOLEAN} fWrite 
     * @param {Pointer<LOCK_STATE>} LockState 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisAcquireReadWriteLock(Lock, fWrite, LockState) {
        DllCall("NDIS.sys\NdisAcquireReadWriteLock", "ptr", Lock, "char", fWrite, "ptr", LockState)
    }

    /**
     * 
     * @param {Pointer<NDIS_RW_LOCK>} Lock 
     * @param {Pointer<LOCK_STATE>} LockState 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisReleaseReadWriteLock(Lock, LockState) {
        DllCall("NDIS.sys\NdisReleaseReadWriteLock", "ptr", Lock, "ptr", LockState)
    }

    /**
     * 
     * @param {Pointer<Integer>} pCpuUsage 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisGetCurrentProcessorCpuUsage(pCpuUsage) {
        pCpuUsageMarshal := pCpuUsage is VarRef ? "uint*" : "ptr"

        DllCall("NDIS.sys\NdisGetCurrentProcessorCpuUsage", pCpuUsageMarshal, pCpuUsage)
    }

    /**
     * 
     * @param {Pointer<Integer>} pIdleCount 
     * @param {Pointer<Integer>} pKernelAndUser 
     * @param {Pointer<Integer>} pIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisGetCurrentProcessorCounts(pIdleCount, pKernelAndUser, pIndex) {
        pIdleCountMarshal := pIdleCount is VarRef ? "uint*" : "ptr"
        pKernelAndUserMarshal := pKernelAndUser is VarRef ? "uint*" : "ptr"
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        DllCall("NDIS.sys\NdisGetCurrentProcessorCounts", pIdleCountMarshal, pIdleCount, pKernelAndUserMarshal, pKernelAndUser, pIndexMarshal, pIndex)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @param {Pointer<UNICODE_STRING>} SubKeyName 
     * @param {Pointer<Pointer<Void>>} SubKeyHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisOpenConfigurationKeyByName(Status, ConfigurationHandle, SubKeyName, SubKeyHandle) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"
        SubKeyHandleMarshal := SubKeyHandle is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisOpenConfigurationKeyByName", StatusMarshal, Status, ConfigurationHandleMarshal, ConfigurationHandle, "ptr", SubKeyName, SubKeyHandleMarshal, SubKeyHandle)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @param {Integer} Index 
     * @param {Pointer<UNICODE_STRING>} KeyName 
     * @param {Pointer<Pointer<Void>>} KeyHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisOpenConfigurationKeyByIndex(Status, ConfigurationHandle, Index, KeyName, KeyHandle) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"
        KeyHandleMarshal := KeyHandle is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisOpenConfigurationKeyByIndex", StatusMarshal, Status, ConfigurationHandleMarshal, ConfigurationHandle, "uint", Index, "ptr", KeyName, KeyHandleMarshal, KeyHandle)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Pointer<NDIS_CONFIGURATION_PARAMETER>>} ParameterValue 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @param {Pointer<UNICODE_STRING>} Keyword 
     * @param {Integer} ParameterType 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisReadConfiguration(Status, ParameterValue, ConfigurationHandle, Keyword, ParameterType) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        ParameterValueMarshal := ParameterValue is VarRef ? "ptr*" : "ptr"
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisReadConfiguration", StatusMarshal, Status, ParameterValueMarshal, ParameterValue, ConfigurationHandleMarshal, ConfigurationHandle, "ptr", Keyword, "int", ParameterType)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @param {Pointer<UNICODE_STRING>} Keyword 
     * @param {Pointer<NDIS_CONFIGURATION_PARAMETER>} ParameterValue 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisWriteConfiguration(Status, ConfigurationHandle, Keyword, ParameterValue) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisWriteConfiguration", StatusMarshal, Status, ConfigurationHandleMarshal, ConfigurationHandle, "ptr", Keyword, "ptr", ParameterValue)
    }

    /**
     * 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCloseConfiguration(ConfigurationHandle) {
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCloseConfiguration", ConfigurationHandleMarshal, ConfigurationHandle)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Pointer<Void>>} NetworkAddress 
     * @param {Pointer<Integer>} NetworkAddressLength 
     * @param {Pointer<Void>} ConfigurationHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisReadNetworkAddress(Status, NetworkAddress, NetworkAddressLength, ConfigurationHandle) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        NetworkAddressMarshal := NetworkAddress is VarRef ? "ptr*" : "ptr"
        NetworkAddressLengthMarshal := NetworkAddressLength is VarRef ? "uint*" : "ptr"
        ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisReadNetworkAddress", StatusMarshal, Status, NetworkAddressMarshal, NetworkAddress, NetworkAddressLengthMarshal, NetworkAddressLength, ConfigurationHandleMarshal, ConfigurationHandle)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Pointer<MDL>>} Buffer_R 
     * @param {Pointer<Void>} PoolHandle 
     * @param {Pointer<Void>} MemoryDescriptor 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCopyBuffer(Status, Buffer_R, PoolHandle, MemoryDescriptor, Offset, Length) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"
        PoolHandleMarshal := PoolHandle is VarRef ? "ptr" : "ptr"
        MemoryDescriptorMarshal := MemoryDescriptor is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCopyBuffer", StatusMarshal, Status, Buffer_RMarshal, Buffer_R, PoolHandleMarshal, PoolHandle, MemoryDescriptorMarshal, MemoryDescriptor, "uint", Offset, "uint", Length)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} VirtualAddress 
     * @param {Integer} Length 
     * @param {Integer} Tag 
     * @returns {Integer} 
     */
    static NdisAllocateMemoryWithTag(VirtualAddress, Length, Tag) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisAllocateMemoryWithTag", VirtualAddressMarshal, VirtualAddress, "uint", Length, "uint", Tag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} VirtualAddress 
     * @param {Integer} Length 
     * @param {Integer} MemoryFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisFreeMemory(VirtualAddress, Length, MemoryFlags) {
        DllCall("NDIS.sys\NdisFreeMemory", "ptr", VirtualAddress, "uint", Length, "uint", MemoryFlags)
    }

    /**
     * 
     * @param {Pointer<NDIS_EVENT>} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisInitializeEvent(Event) {
        DllCall("NDIS.sys\NdisInitializeEvent", "ptr", Event)
    }

    /**
     * 
     * @param {Pointer<NDIS_EVENT>} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisSetEvent(Event) {
        DllCall("NDIS.sys\NdisSetEvent", "ptr", Event)
    }

    /**
     * 
     * @param {Pointer<NDIS_EVENT>} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisResetEvent(Event) {
        DllCall("NDIS.sys\NdisResetEvent", "ptr", Event)
    }

    /**
     * 
     * @param {Pointer<NDIS_EVENT>} Event 
     * @param {Integer} MsToWait 
     * @returns {BOOLEAN} 
     */
    static NdisWaitEvent(Event, MsToWait) {
        result := DllCall("NDIS.sys\NdisWaitEvent", "ptr", Event, "uint", MsToWait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Pointer<Void>>} FileHandle 
     * @param {Pointer<Integer>} FileLength 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Integer} HighestAcceptableAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisOpenFile(Status, FileHandle, FileLength, FileName, HighestAcceptableAddress) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        FileHandleMarshal := FileHandle is VarRef ? "ptr*" : "ptr"
        FileLengthMarshal := FileLength is VarRef ? "uint*" : "ptr"

        DllCall("NDIS.sys\NdisOpenFile", StatusMarshal, Status, FileHandleMarshal, FileHandle, FileLengthMarshal, FileLength, "ptr", FileName, "int64", HighestAcceptableAddress)
    }

    /**
     * 
     * @param {Pointer<Void>} FileHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCloseFile(FileHandle) {
        FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCloseFile", FileHandleMarshal, FileHandle)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Pointer<Void>>} MappedBuffer 
     * @param {Pointer<Void>} FileHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMapFile(Status, MappedBuffer, FileHandle) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        MappedBufferMarshal := MappedBuffer is VarRef ? "ptr*" : "ptr"
        FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMapFile", StatusMarshal, Status, MappedBufferMarshal, MappedBuffer, FileHandleMarshal, FileHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} FileHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisUnmapFile(FileHandle) {
        FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisUnmapFile", FileHandleMarshal, FileHandle)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static NdisGetSharedDataAlignment() {
        result := DllCall("NDIS.sys\NdisGetSharedDataAlignment", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisAdapterHandle 
     * @param {Integer} ErrorCode 
     * @param {Integer} NumberOfErrorValues 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisWriteErrorLogEntry(NdisAdapterHandle, ErrorCode, NumberOfErrorValues) {
        NdisAdapterHandleMarshal := NdisAdapterHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisWriteErrorLogEntry", NdisAdapterHandleMarshal, NdisAdapterHandle, "uint", ErrorCode, "uint", NumberOfErrorValues, "CDecl ")
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Destination 
     * @param {Pointer<Integer>} Source 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisInitializeString(Destination, Source) {
        SourceMarshal := Source is VarRef ? "char*" : "ptr"

        DllCall("NDIS.sys\NdisInitializeString", "ptr", Destination, SourceMarshal, Source)
    }

    /**
     * 
     * @param {Pointer<NDIS_TIMER>} Timer 
     * @param {Pointer<PNDIS_TIMER_FUNCTION>} TimerFunction 
     * @param {Pointer<Void>} FunctionContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisInitializeTimer(Timer, TimerFunction, FunctionContext) {
        FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisInitializeTimer", "ptr", Timer, "ptr", TimerFunction, FunctionContextMarshal, FunctionContext)
    }

    /**
     * 
     * @param {Pointer<NDIS_TIMER>} Timer 
     * @param {Pointer<BOOLEAN>} TimerCancelled 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCancelTimer(Timer, TimerCancelled) {
        TimerCancelledMarshal := TimerCancelled is VarRef ? "char*" : "ptr"

        DllCall("NDIS.sys\NdisCancelTimer", "ptr", Timer, TimerCancelledMarshal, TimerCancelled)
    }

    /**
     * 
     * @param {Pointer<NDIS_TIMER>} Timer 
     * @param {Integer} MillisecondsToDelay 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisSetTimer(Timer, MillisecondsToDelay) {
        DllCall("NDIS.sys\NdisSetTimer", "ptr", Timer, "uint", MillisecondsToDelay)
    }

    /**
     * 
     * @param {Pointer<NDIS_TIMER>} NdisTimer 
     * @param {Integer} MillisecondsPeriod 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisSetPeriodicTimer(NdisTimer, MillisecondsPeriod) {
        DllCall("NDIS.sys\NdisSetPeriodicTimer", "ptr", NdisTimer, "uint", MillisecondsPeriod)
    }

    /**
     * 
     * @param {Pointer<NDIS_TIMER>} NdisTimer 
     * @param {Integer} MillisecondsToDelay 
     * @param {Pointer<Void>} FunctionContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisSetTimerEx(NdisTimer, MillisecondsToDelay, FunctionContext) {
        FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisSetTimerEx", "ptr", NdisTimer, "uint", MillisecondsToDelay, FunctionContextMarshal, FunctionContext)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static NdisSystemProcessorCount() {
        result := DllCall("NDIS.sys\NdisSystemProcessorCount", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} NdisRoutineName 
     * @returns {Pointer<Void>} 
     */
    static NdisGetRoutineAddress(NdisRoutineName) {
        result := DllCall("NDIS.sys\NdisGetRoutineAddress", "ptr", NdisRoutineName, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static NdisGetVersion() {
        result := DllCall("NDIS.sys\NdisGetVersion", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisProtocolHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisReEnumerateProtocolBindings(NdisProtocolHandle) {
        NdisProtocolHandleMarshal := NdisProtocolHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisReEnumerateProtocolBindings", NdisProtocolHandleMarshal, NdisProtocolHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @param {Integer} EventCode 
     * @param {Integer} UniqueEventValue 
     * @param {Integer} NumStrings 
     * @param {Pointer<Void>} StringsList 
     * @param {Integer} DataSize 
     * @param {Pointer} Data 
     * @returns {Integer} 
     */
    static NdisWriteEventLogEntry(LogHandle, EventCode, UniqueEventValue, NumStrings, StringsList, DataSize, Data) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"
        StringsListMarshal := StringsList is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisWriteEventLogEntry", LogHandleMarshal, LogHandle, "int", EventCode, "uint", UniqueEventValue, "ushort", NumStrings, StringsListMarshal, StringsList, "uint", DataSize, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
     * @param {Pointer<Void>} NdisBindingHandle 
     * @returns {Integer} 
     */
    static NdisQueryAdapterInstanceName(pAdapterInstanceName, NdisBindingHandle) {
        NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisQueryAdapterInstanceName", "ptr", pAdapterInstanceName, NdisBindingHandleMarshal, NdisBindingHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
     * @param {Pointer<Void>} BindingContext 
     * @returns {Integer} 
     */
    static NdisQueryBindInstanceName(pAdapterInstanceName, BindingContext) {
        BindingContextMarshal := BindingContext is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisQueryBindInstanceName", "ptr", pAdapterInstanceName, BindingContextMarshal, BindingContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<TDI_REGISTER_CALLBACK>} RegisterCallback 
     * @param {Pointer<TDI_PNP_HANDLER>} PnPHandler 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisRegisterTdiCallBack(RegisterCallback, PnPHandler) {
        DllCall("NDIS.sys\NdisRegisterTdiCallBack", "ptr", RegisterCallback, "ptr", PnPHandler)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisDeregisterTdiCallBack() {
        DllCall("NDIS.sys\NdisDeregisterTdiCallBack")
    }

    /**
     * 
     * @returns {Integer} 
     */
    static NdisGeneratePartialCancelId() {
        result := DllCall("NDIS.sys\NdisGeneratePartialCancelId", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} Length 
     * @param {BOOLEAN} Cached 
     * @param {Pointer<Void>} Context 
     * @returns {Integer} 
     */
    static NdisMAllocateSharedMemoryAsync(MiniportAdapterHandle, Length, Cached, Context) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMAllocateSharedMemoryAsync", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, "char", Cached, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Void>} NdisDmaHandle 
     * @param {Pointer<MDL>} Buffer_R 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisSetupDmaTransfer(Status, NdisDmaHandle, Buffer_R, Offset, Length, WriteToDevice) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        NdisDmaHandleMarshal := NdisDmaHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisSetupDmaTransfer", StatusMarshal, Status, NdisDmaHandleMarshal, NdisDmaHandle, "ptr", Buffer_R, "uint", Offset, "uint", Length, "char", WriteToDevice)
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @param {Pointer<Void>} NdisDmaHandle 
     * @param {Pointer<MDL>} Buffer_R 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCompleteDmaTransfer(Status, NdisDmaHandle, Buffer_R, Offset, Length, WriteToDevice) {
        StatusMarshal := Status is VarRef ? "int*" : "ptr"
        NdisDmaHandleMarshal := NdisDmaHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCompleteDmaTransfer", StatusMarshal, Status, NdisDmaHandleMarshal, NdisDmaHandle, "ptr", Buffer_R, "uint", Offset, "uint", Length, "char", WriteToDevice)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} MiniportDmaHandle 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} DmaChannel 
     * @param {BOOLEAN} Dma32BitAddresses 
     * @param {Pointer<NDIS_DMA_DESCRIPTION>} DmaDescription 
     * @param {Integer} MaximumLength 
     * @returns {Integer} 
     */
    static NdisMRegisterDmaChannel(MiniportDmaHandle, MiniportAdapterHandle, DmaChannel, Dma32BitAddresses, DmaDescription, MaximumLength) {
        MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr*" : "ptr"
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMRegisterDmaChannel", MiniportDmaHandleMarshal, MiniportDmaHandle, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", DmaChannel, "char", Dma32BitAddresses, "ptr", DmaDescription, "uint", MaximumLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportDmaHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMDeregisterDmaChannel(MiniportDmaHandle) {
        MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMDeregisterDmaChannel", MiniportDmaHandleMarshal, MiniportDmaHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportDmaHandle 
     * @returns {Integer} 
     */
    static NdisMReadDmaCounter(MiniportDmaHandle) {
        MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMReadDmaCounter", MiniportDmaHandleMarshal, MiniportDmaHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisAdapterHandle 
     * @param {Integer} Length 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Integer} PhysicalAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisUpdateSharedMemory(NdisAdapterHandle, Length, VirtualAddress, PhysicalAddress) {
        NdisAdapterHandleMarshal := NdisAdapterHandle is VarRef ? "ptr" : "ptr"
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisUpdateSharedMemory", NdisAdapterHandleMarshal, NdisAdapterHandle, "uint", Length, VirtualAddressMarshal, VirtualAddress, "int64", PhysicalAddress)
    }

    /**
     * 
     * @param {Pointer<Void>} DriverHandle 
     * @param {Pointer<Void>} ProtocolHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisIMAssociateMiniport(DriverHandle, ProtocolHandle) {
        DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"
        ProtocolHandleMarshal := ProtocolHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisIMAssociateMiniport", DriverHandleMarshal, DriverHandle, ProtocolHandleMarshal, ProtocolHandle)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PortOffset 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} InitialPort 
     * @param {Integer} NumberOfPorts 
     * @returns {Integer} 
     */
    static NdisMRegisterIoPortRange(PortOffset, MiniportAdapterHandle, InitialPort, NumberOfPorts) {
        PortOffsetMarshal := PortOffset is VarRef ? "ptr*" : "ptr"
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMRegisterIoPortRange", PortOffsetMarshal, PortOffset, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", InitialPort, "uint", NumberOfPorts, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} InitialPort 
     * @param {Integer} NumberOfPorts 
     * @param {Pointer<Void>} PortOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMDeregisterIoPortRange(MiniportAdapterHandle, InitialPort, NumberOfPorts, PortOffset) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        PortOffsetMarshal := PortOffset is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMDeregisterIoPortRange", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", InitialPort, "uint", NumberOfPorts, PortOffsetMarshal, PortOffset)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} VirtualAddress 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} PhysicalAddress 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static NdisMMapIoSpace(VirtualAddress, MiniportAdapterHandle, PhysicalAddress, Length) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMMapIoSpace", VirtualAddressMarshal, VirtualAddress, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "int64", PhysicalAddress, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Pointer} VirtualAddress 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMUnmapIoSpace(MiniportAdapterHandle, VirtualAddress, Length) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMUnmapIoSpace", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "ptr", VirtualAddress, "uint", Length)
    }

    /**
     * 
     * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
     * @param {Integer} MillisecondPeriod 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMSetPeriodicTimer(Timer, MillisecondPeriod) {
        DllCall("NDIS.sys\NdisMSetPeriodicTimer", "ptr", Timer, "uint", MillisecondPeriod)
    }

    /**
     * 
     * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Pointer<PNDIS_TIMER_FUNCTION>} TimerFunction 
     * @param {Pointer<Void>} FunctionContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMInitializeTimer(Timer, MiniportAdapterHandle, TimerFunction, FunctionContext) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMInitializeTimer", "ptr", Timer, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "ptr", TimerFunction, FunctionContextMarshal, FunctionContext)
    }

    /**
     * 
     * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
     * @param {Pointer<BOOLEAN>} TimerCancelled 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMCancelTimer(Timer, TimerCancelled) {
        TimerCancelledMarshal := TimerCancelled is VarRef ? "char*" : "ptr"

        DllCall("NDIS.sys\NdisMCancelTimer", "ptr", Timer, TimerCancelledMarshal, TimerCancelled)
    }

    /**
     * 
     * @param {Integer} MicrosecondsToSleep 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMSleep(MicrosecondsToSleep) {
        DllCall("NDIS.sys\NdisMSleep", "uint", MicrosecondsToSleep)
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @returns {Integer} 
     */
    static NdisMGetDmaAlignment(MiniportAdapterHandle) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMGetDmaAlignment", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} Length 
     * @param {BOOLEAN} Cached 
     * @param {Pointer<Pointer<Void>>} VirtualAddress 
     * @param {Pointer<Integer>} PhysicalAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMAllocateSharedMemory(MiniportAdapterHandle, Length, Cached, VirtualAddress, PhysicalAddress) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"
        PhysicalAddressMarshal := PhysicalAddress is VarRef ? "int64*" : "ptr"

        DllCall("NDIS.sys\NdisMAllocateSharedMemory", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, "char", Cached, VirtualAddressMarshal, VirtualAddress, PhysicalAddressMarshal, PhysicalAddress)
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} Length 
     * @param {BOOLEAN} Cached 
     * @param {Pointer} VirtualAddress 
     * @param {Integer} PhysicalAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMFreeSharedMemory(MiniportAdapterHandle, Length, Cached, VirtualAddress, PhysicalAddress) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMFreeSharedMemory", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, "char", Cached, "ptr", VirtualAddress, "int64", PhysicalAddress)
    }

    /**
     * 
     * @param {Pointer<Void>} DriverHandle 
     * @param {Pointer<UNICODE_STRING>} DriverInstance 
     * @param {Pointer<Void>} DeviceContext 
     * @returns {Integer} 
     */
    static NdisIMInitializeDeviceInstanceEx(DriverHandle, DriverInstance, DeviceContext) {
        DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"
        DeviceContextMarshal := DeviceContext is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisIMInitializeDeviceInstanceEx", DriverHandleMarshal, DriverHandle, "ptr", DriverInstance, DeviceContextMarshal, DeviceContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DriverHandle 
     * @param {Pointer<UNICODE_STRING>} DeviceInstance 
     * @returns {Integer} 
     */
    static NdisIMCancelInitializeDeviceInstance(DriverHandle, DeviceInstance) {
        DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisIMCancelInitializeDeviceInstance", DriverHandleMarshal, DriverHandle, "ptr", DeviceInstance, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisBindingHandle 
     * @returns {Pointer<Void>} 
     */
    static NdisIMGetBindingContext(NdisBindingHandle) {
        NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisIMGetBindingContext", NdisBindingHandleMarshal, NdisBindingHandle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisMiniportHandle 
     * @returns {Integer} 
     */
    static NdisIMDeInitializeDeviceInstance(NdisMiniportHandle) {
        NdisMiniportHandleMarshal := NdisMiniportHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisIMDeInitializeDeviceInstance", NdisMiniportHandleMarshal, NdisMiniportHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportHandle 
     * @returns {Integer} 
     */
    static NdisMRemoveMiniport(MiniportHandle) {
        MiniportHandleMarshal := MiniportHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMRemoveMiniport", MiniportHandleMarshal, MiniportHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Integer} Size 
     * @param {Pointer<Pointer<Void>>} LogHandle 
     * @returns {Integer} 
     */
    static NdisMCreateLog(MiniportAdapterHandle, Size, LogHandle) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        LogHandleMarshal := LogHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisMCreateLog", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Size, LogHandleMarshal, LogHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMCloseLog(LogHandle) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMCloseLog", LogHandleMarshal, LogHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @param {Pointer} LogBuffer 
     * @param {Integer} LogBufferSize 
     * @returns {Integer} 
     */
    static NdisMWriteLogData(LogHandle, LogBuffer, LogBufferSize) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMWriteLogData", LogHandleMarshal, LogHandle, "ptr", LogBuffer, "uint", LogBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMFlushLog(LogHandle) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMFlushLog", LogHandleMarshal, LogHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} PhysicalDeviceObject 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} FunctionalDeviceObject 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} NextDeviceObject 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResourcesTranslated 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMGetDeviceProperty(MiniportAdapterHandle, PhysicalDeviceObject, FunctionalDeviceObject, NextDeviceObject, AllocatedResources, AllocatedResourcesTranslated) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        PhysicalDeviceObjectMarshal := PhysicalDeviceObject is VarRef ? "ptr*" : "ptr"
        FunctionalDeviceObjectMarshal := FunctionalDeviceObject is VarRef ? "ptr*" : "ptr"
        NextDeviceObjectMarshal := NextDeviceObject is VarRef ? "ptr*" : "ptr"
        AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"
        AllocatedResourcesTranslatedMarshal := AllocatedResourcesTranslated is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisMGetDeviceProperty", MiniportAdapterHandleMarshal, MiniportAdapterHandle, PhysicalDeviceObjectMarshal, PhysicalDeviceObject, FunctionalDeviceObjectMarshal, FunctionalDeviceObject, NextDeviceObjectMarshal, NextDeviceObject, AllocatedResourcesMarshal, AllocatedResources, AllocatedResourcesTranslatedMarshal, AllocatedResourcesTranslated)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
     * @param {Pointer<Void>} MiniportHandle 
     * @returns {Integer} 
     */
    static NdisMQueryAdapterInstanceName(pAdapterInstanceName, MiniportHandle) {
        MiniportHandleMarshal := MiniportHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMQueryAdapterInstanceName", "ptr", pAdapterInstanceName, MiniportHandleMarshal, MiniportHandle, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMCoActivateVcComplete(Status, NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisMCoActivateVcComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisMCoDeactivateVcComplete(Status, NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisMCoDeactivateVcComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Pointer<CO_ADDRESS_FAMILY>} AddressFamily 
     * @param {Pointer<NDIS_CALL_MANAGER_CHARACTERISTICS>} CmCharacteristics 
     * @param {Integer} SizeOfCmCharacteristics 
     * @returns {Integer} 
     */
    static NdisMCmRegisterAddressFamily(MiniportAdapterHandle, AddressFamily, CmCharacteristics, SizeOfCmCharacteristics) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        CmCharacteristicsMarshal := CmCharacteristics is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisMCmRegisterAddressFamily", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "ptr", AddressFamily, CmCharacteristicsMarshal, CmCharacteristics, "uint", SizeOfCmCharacteristics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MiniportAdapterHandle 
     * @param {Pointer<Void>} NdisAfHandle 
     * @param {Pointer<Void>} MiniportVcContext 
     * @param {Pointer<Pointer<Void>>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisMCmCreateVc(MiniportAdapterHandle, NdisAfHandle, MiniportVcContext, NdisVcHandle) {
        MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
        MiniportVcContextMarshal := MiniportVcContext is VarRef ? "ptr" : "ptr"
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisMCmCreateVc", MiniportAdapterHandleMarshal, MiniportAdapterHandle, NdisAfHandleMarshal, NdisAfHandle, MiniportVcContextMarshal, MiniportVcContext, NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisMCmDeleteVc(NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMCmDeleteVc", NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    static NdisMCmActivateVc(NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisMCmActivateVc", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisMCmDeactivateVc(NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisMCmDeactivateVc", NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<UNICODE_STRING>} BaseInstanceName 
     * @param {Pointer<UNICODE_STRING>} VcInstanceName 
     * @returns {Integer} 
     */
    static NdisCoAssignInstanceName(NdisVcHandle, BaseInstanceName, VcInstanceName) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisCoAssignInstanceName", NdisVcHandleMarshal, NdisVcHandle, "ptr", BaseInstanceName, "ptr", VcInstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisBindingHandle 
     * @param {Pointer<Void>} NdisAfHandle 
     * @param {Pointer<Void>} ProtocolVcContext 
     * @param {Pointer<Pointer<Void>>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisCoCreateVc(NdisBindingHandle, NdisAfHandle, ProtocolVcContext, NdisVcHandle) {
        NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisCoCreateVc", NdisBindingHandleMarshal, NdisBindingHandle, NdisAfHandleMarshal, NdisAfHandle, ProtocolVcContextMarshal, ProtocolVcContext, NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisCoDeleteVc(NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisCoDeleteVc", NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<VAR_STRING>} TapiCallId 
     * @returns {Integer} 
     */
    static NdisCoGetTapiCallId(NdisVcHandle, TapiCallId) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisCoGetTapiCallId", NdisVcHandleMarshal, NdisVcHandle, "ptr", TapiCallId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisAfHandle 
     * @returns {Integer} 
     */
    static NdisClCloseAddressFamily(NdisAfHandle) {
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisClCloseAddressFamily", NdisAfHandleMarshal, NdisAfHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisAfHandle 
     * @param {Pointer<Void>} ProtocolSapContext 
     * @param {Pointer<CO_SAP>} Sap 
     * @param {Pointer<Pointer<Void>>} NdisSapHandle 
     * @returns {Integer} 
     */
    static NdisClRegisterSap(NdisAfHandle, ProtocolSapContext, Sap, NdisSapHandle) {
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
        ProtocolSapContextMarshal := ProtocolSapContext is VarRef ? "ptr" : "ptr"
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisClRegisterSap", NdisAfHandleMarshal, NdisAfHandle, ProtocolSapContextMarshal, ProtocolSapContext, "ptr", Sap, NdisSapHandleMarshal, NdisSapHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisSapHandle 
     * @returns {Integer} 
     */
    static NdisClDeregisterSap(NdisSapHandle) {
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisClDeregisterSap", NdisSapHandleMarshal, NdisSapHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @param {Pointer<Void>} ProtocolPartyContext 
     * @param {Pointer<Pointer<Void>>} NdisPartyHandle 
     * @returns {Integer} 
     */
    static NdisClMakeCall(NdisVcHandle, CallParameters, ProtocolPartyContext, NdisPartyHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"
        ProtocolPartyContextMarshal := ProtocolPartyContext is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisClMakeCall", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, ProtocolPartyContextMarshal, ProtocolPartyContext, NdisPartyHandleMarshal, NdisPartyHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static NdisClCloseCall(NdisVcHandle, NdisPartyHandle, Buffer_R, Size) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisClCloseCall", NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle, "ptr", Buffer_R, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    static NdisClModifyCallQoS(NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisClModifyCallQoS", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisClIncomingCallComplete(Status, NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisClIncomingCallComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<Void>} ProtocolPartyContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @param {Pointer<Pointer<Void>>} NdisPartyHandle 
     * @returns {Integer} 
     */
    static NdisClAddParty(NdisVcHandle, ProtocolPartyContext, CallParameters, NdisPartyHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        ProtocolPartyContextMarshal := ProtocolPartyContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisClAddParty", NdisVcHandleMarshal, NdisVcHandle, ProtocolPartyContextMarshal, ProtocolPartyContext, CallParametersMarshal, CallParameters, NdisPartyHandleMarshal, NdisPartyHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static NdisClDropParty(NdisPartyHandle, Buffer_R, Size) {
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisClDropParty", NdisPartyHandleMarshal, NdisPartyHandle, "ptr", Buffer_R, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {UNICODE_STRING} TapiCallId 
     * @param {Pointer<Pointer<Void>>} ProtocolVcContext 
     * @returns {Integer} 
     */
    static NdisClGetProtocolVcContextFromTapiCallId(TapiCallId, ProtocolVcContext) {
        ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisClGetProtocolVcContextFromTapiCallId", "ptr", TapiCallId, ProtocolVcContextMarshal, ProtocolVcContext, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisAfHandle 
     * @param {Pointer<Void>} CallMgrAfContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmOpenAddressFamilyComplete(Status, NdisAfHandle, CallMgrAfContext) {
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
        CallMgrAfContextMarshal := CallMgrAfContext is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmOpenAddressFamilyComplete", "int", Status, NdisAfHandleMarshal, NdisAfHandle, CallMgrAfContextMarshal, CallMgrAfContext)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisAfHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmCloseAddressFamilyComplete(Status, NdisAfHandle) {
        NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmCloseAddressFamilyComplete", "int", Status, NdisAfHandleMarshal, NdisAfHandle)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisSapHandle 
     * @param {Pointer<Void>} CallMgrSapContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmRegisterSapComplete(Status, NdisSapHandle, CallMgrSapContext) {
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"
        CallMgrSapContextMarshal := CallMgrSapContext is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmRegisterSapComplete", "int", Status, NdisSapHandleMarshal, NdisSapHandle, CallMgrSapContextMarshal, CallMgrSapContext)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisSapHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDeregisterSapComplete(Status, NdisSapHandle) {
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmDeregisterSapComplete", "int", Status, NdisSapHandleMarshal, NdisSapHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    static NdisCmActivateVc(NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisCmActivateVc", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {Integer} 
     */
    static NdisCmDeactivateVc(NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("NDIS.sys\NdisCmDeactivateVc", NdisVcHandleMarshal, NdisVcHandle, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer<Void>} CallMgrPartyContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmMakeCallComplete(Status, NdisVcHandle, NdisPartyHandle, CallMgrPartyContext, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"
        CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisCmMakeCallComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle, CallMgrPartyContextMarshal, CallMgrPartyContext, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmCloseCallComplete(Status, NdisVcHandle, NdisPartyHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmCloseCallComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer<Void>} CallMgrPartyContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmAddPartyComplete(Status, NdisPartyHandle, CallMgrPartyContext, CallParameters) {
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"
        CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisCmAddPartyComplete", "int", Status, NdisPartyHandleMarshal, NdisPartyHandle, CallMgrPartyContextMarshal, CallMgrPartyContext, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDropPartyComplete(Status, NdisPartyHandle) {
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmDropPartyComplete", "int", Status, NdisPartyHandleMarshal, NdisPartyHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} NdisSapHandle 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {Integer} 
     */
    static NdisCmDispatchIncomingCall(NdisSapHandle, NdisVcHandle, CallParameters) {
        NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        result := DllCall("NDIS.sys\NdisCmDispatchIncomingCall", NdisSapHandleMarshal, NdisSapHandle, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDispatchCallConnected(NdisVcHandle) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmDispatchCallConnected", NdisVcHandleMarshal, NdisVcHandle)
    }

    /**
     * 
     * @param {Integer} Status 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmModifyCallQoSComplete(Status, NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisCmModifyCallQoSComplete", "int", Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDispatchIncomingCallQoSChange(NdisVcHandle, CallParameters) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
        CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

        DllCall("NDIS.sys\NdisCmDispatchIncomingCallQoSChange", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
    }

    /**
     * 
     * @param {Integer} CloseStatus 
     * @param {Pointer<Void>} NdisVcHandle 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDispatchIncomingCloseCall(CloseStatus, NdisVcHandle, Buffer_R, Size) {
        NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmDispatchIncomingCloseCall", "int", CloseStatus, NdisVcHandleMarshal, NdisVcHandle, "ptr", Buffer_R, "uint", Size)
    }

    /**
     * 
     * @param {Integer} DropStatus 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    static NdisCmDispatchIncomingDropParty(DropStatus, NdisPartyHandle, Buffer_R, Size) {
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

        DllCall("NDIS.sys\NdisCmDispatchIncomingDropParty", "int", DropStatus, NdisPartyHandleMarshal, NdisPartyHandle, "ptr", Buffer_R, "uint", Size)
    }

;@endregion Methods
}
