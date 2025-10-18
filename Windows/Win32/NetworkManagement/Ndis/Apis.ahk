#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class Ndis {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_COMPARTMENT_ID_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_COMPARTMENT_ID_PRIMARY => 1

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
    static NDIS_OBJECT_TYPE_OFFLOAD_ENCAPSULATION => 168

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
    static NDIS_OFFLOAD_PARAMETERS_REVISION_6 => 6

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
    static NDIS_OFFLOAD_REVISION_8 => 8

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
    static NDIS_WLAN_WAKE_ON_INCOMING_ACTION_FRAME_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_CLIENT_DRIVER_DIAGNOSTIC_SUPPORTED => 32

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
    static NDIS_WLAN_WAKE_ON_INCOMING_ACTION_FRAME_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_WLAN_WAKE_ON_CLIENT_DRIVER_DIAGNOSTIC_ENABLED => 32

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
     * @type {String}
     */
    static GUID_NDIS_NDK_CAPABILITIES => "{7969ba4d-dd80-4bc7-b3e6-68043997e519}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NDK_STATE => "{530c69c9-2f51-49de-a1af-088d54ffa474}"

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
    static NDIS_SRIOV_CONFIG_STATE_PARAMETERS_REVISION_1 => 1

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

    /**
     * @type {Integer (UInt32)}
     */
    static OID_QUIC_CONNECTION_ENCRYPTION => 4227924501

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
    static NDIS_SUPPORT_NDIS689 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_SUPPORT_NDIS688 => 1

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
     * @type {String}
     */
    static GUID_NDIS_LAN_CLASS => "{ad498944-762f-11d0-8dcb-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_NET => "{cac88484-7515-4c03-82e6-71a87abac361}"

    /**
     * @type {String}
     */
    static UNSPECIFIED_NETWORK_GUID => "{12ba5bde-143e-4c0d-b66d-2379bb141913}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_NETUIO => "{08336f60-0679-4c6c-85d2-ae7ced65fff7}"

    /**
     * @type {String}
     */
    static GUID_NDIS_ENUMERATE_ADAPTER => "{981f2d7f-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_ADAPTER_REMOVAL => "{981f2d80-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_ADAPTER_ARRIVAL => "{981f2d81-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_ENUMERATE_VC => "{981f2d82-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_VC_REMOVAL => "{981f2d79-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_VC_ARRIVAL => "{182f9e0c-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_BIND => "{5413531c-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_UNBIND => "{6e3ce1ec-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_WAKE_ON_MAGIC_PACKET_ONLY => "{a14f1c97-8839-4f8a-9996-a28996ebbf1d}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_DEVICE_POWER_ON => "{5f81cfd0-f046-4342-af61-895acedaefd9}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_DEVICE_POWER_OFF => "{81bc8189-b026-46ab-b964-f182e342934e}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_FILTER_REMOVAL => "{1f177cd9-5955-4721-9f6a-78ebdfaef889}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_FILTER_ARRIVAL => "{0b6d3c89-5917-43ca-b578-d01a7967c41c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_DEVICE_POWER_ON_EX => "{2b440188-92ac-4f60-9b2d-20a30cbb6bbe}"

    /**
     * @type {String}
     */
    static GUID_NDIS_NOTIFY_DEVICE_POWER_OFF_EX => "{4159353c-5cd7-42ce-8fe4-a45a2380cc4f}"

    /**
     * @type {String}
     */
    static GUID_NDIS_PM_ADMIN_CONFIG => "{1528d111-708a-4ca4-9215-c05771161cda}"

    /**
     * @type {String}
     */
    static GUID_NDIS_PM_ACTIVE_CAPABILITIES => "{b2cf76e3-b3ae-4394-a01f-338c9870e939}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RSS_ENABLED => "{9565cd55-3402-4e32-a5b6-2f143f2f2c30}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_HARDWARE_STATUS => "{5ec10354-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MEDIA_SUPPORTED => "{5ec10355-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MEDIA_IN_USE => "{5ec10356-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MAXIMUM_LOOKAHEAD => "{5ec10357-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MAXIMUM_FRAME_SIZE => "{5ec10358-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_LINK_SPEED => "{5ec10359-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_TRANSMIT_BUFFER_SPACE => "{5ec1035a-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_RECEIVE_BUFFER_SPACE => "{5ec1035b-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_TRANSMIT_BLOCK_SIZE => "{5ec1035c-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_RECEIVE_BLOCK_SIZE => "{5ec1035d-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_VENDOR_ID => "{5ec1035e-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_VENDOR_DESCRIPTION => "{5ec1035f-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CURRENT_PACKET_FILTER => "{5ec10360-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CURRENT_LOOKAHEAD => "{5ec10361-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_DRIVER_VERSION => "{5ec10362-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MAXIMUM_TOTAL_SIZE => "{5ec10363-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MAC_OPTIONS => "{5ec10365-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MEDIA_CONNECT_STATUS => "{5ec10366-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_MAXIMUM_SEND_PACKETS => "{5ec10367-a61a-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_VENDOR_DRIVER_VERSION => "{447956f9-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_VLAN_ID => "{765dc702-c5e8-4b67-843b-3f5a4ff2648b}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_PHYSICAL_MEDIUM => "{418ca16d-3937-4208-940a-ec6196278085}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_OFFLOAD_CURRENT_CONFIG => "{68542fed-5c74-461e-8934-91c6f9c60960}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_OFFLOAD_HARDWARE_CAPABILITIES => "{cd5f1102-590f-4ada-ab65-5b31b1dc0172}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_OFFLOAD_PARAMETERS => "{8ead9a22-7f69-4bc6-949a-c8187b074e61}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_CONNECTION_OFFLOAD_CURRENT_CONFIG => "{2ee6aef1-0851-458b-bf0d-792343d1cde1}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_CONNECTION_OFFLOAD_HARDWARE_CAPABILITIES => "{8ce71f2c-d63a-4390-a487-18fa47262ceb}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_SCALE_CAPABILITIES => "{26c28774-4252-48fe-a610-a58a398c0eb1}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_LINK_STATE => "{ba1f4c14-a945-4762-b916-0b5515b6f43a}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_LINK_PARAMETERS => "{8c7d3579-252b-4614-82c5-a650daa15049}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_STATISTICS => "{368c45b5-c129-43c1-939e-7edc2d7fe621}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_PORT_STATE => "{6fbf2a5f-8b8f-4920-8143-e6c460f52524}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_ENUMERATE_PORTS => "{f1d6abe8-15e4-4407-81b7-6b830c777cd9}"

    /**
     * @type {String}
     */
    static GUID_NDIS_ENUMERATE_ADAPTERS_EX => "{16716917-4306-4be4-9b5a-3809ae44b125}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_PORT_AUTHENTICATION_PARAMETERS => "{aab6ac31-86fb-48fb-8b48-63db235ace16}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_INTERRUPT_MODERATION => "{d9c8eea5-f16e-467c-84d5-6345a22ce213}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_INTERRUPT_MODERATION_PARAMETERS => "{d789adfa-9c56-433b-ad01-7574f3cedbe9}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_PCI_DEVICE_CUSTOM_PROPERTIES => "{aa39f5ab-e260-4d01-82b0-b737c880ea05}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_PHYSICAL_MEDIUM_EX => "{899e7782-035b-43f9-8bb6-2b58971612e5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_HD_SPLIT_CURRENT_CONFIG => "{81d1303c-ab00-4e49-80b1-5e6e0bf9be53}"

    /**
     * @type {String}
     */
    static GUID_NDIS_HD_SPLIT_PARAMETERS => "{8c048bea-2913-4458-b68e-17f6c1e5c60e}"

    /**
     * @type {String}
     */
    static GUID_NDIS_TCP_RSC_STATISTICS => "{83104445-9b5d-4ee6-a2a5-2bd3fb3c36af}"

    /**
     * @type {String}
     */
    static GUID_PM_HARDWARE_CAPABILITIES => "{ece5360d-3291-4a6e-8044-00511fed27ee}"

    /**
     * @type {String}
     */
    static GUID_PM_CURRENT_CAPABILITIES => "{3abdbd14-d44a-4a3f-9a63-a0a42a51b131}"

    /**
     * @type {String}
     */
    static GUID_PM_PARAMETERS => "{560245d2-e251-409c-a280-311935be3b28}"

    /**
     * @type {String}
     */
    static GUID_PM_ADD_WOL_PATTERN => "{6fc83ba7-52bc-4faa-ac51-7d2ffe63ba90}"

    /**
     * @type {String}
     */
    static GUID_PM_REMOVE_WOL_PATTERN => "{a037a915-c6ca-4322-b3e3-ef754ec498dc}"

    /**
     * @type {String}
     */
    static GUID_PM_WOL_PATTERN_LIST => "{4022be37-7ee2-47be-a5a5-050fc79afc75}"

    /**
     * @type {String}
     */
    static GUID_PM_ADD_PROTOCOL_OFFLOAD => "{0c06c112-0d93-439b-9e6d-26be130c9784}"

    /**
     * @type {String}
     */
    static GUID_PM_GET_PROTOCOL_OFFLOAD => "{a6435cd9-149f-498e-951b-2d94bea3e3a3}"

    /**
     * @type {String}
     */
    static GUID_PM_REMOVE_PROTOCOL_OFFLOAD => "{decd7be2-a6b0-43ca-ae45-d000d20e5265}"

    /**
     * @type {String}
     */
    static GUID_PM_PROTOCOL_OFFLOAD_LIST => "{736ec5ab-ca8f-4043-bb58-da402a48d9cc}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_HARDWARE_CAPABILITIES => "{3f2c1419-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_GLOBAL_PARAMETERS => "{3f2c141a-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_ENUM_QUEUES => "{3f2c141b-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_QUEUE_PARAMETERS => "{3f2c141c-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_ENUM_FILTERS => "{3f2c141d-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_RECEIVE_FILTER_PARAMETERS => "{3f2c141e-83bc-11dd-94b8-001d09162bc3}"

    /**
     * @type {String}
     */
    static GUID_RECEIVE_FILTER_CURRENT_CAPABILITIES => "{4054e80f-2bc1-4ccc-b033-4abc0c4a1e8c}"

    /**
     * @type {String}
     */
    static GUID_NIC_SWITCH_HARDWARE_CAPABILITIES => "{37cab40c-d1e8-4301-8c1d-58465e0c4c0f}"

    /**
     * @type {String}
     */
    static GUID_NIC_SWITCH_CURRENT_CAPABILITIES => "{e76fdaf3-0be7-4d95-87e9-5aead4b590e9}"

    /**
     * @type {String}
     */
    static GUID_NDIS_SWITCH_MICROSOFT_VENDOR_ID => "{202547fe-1c9c-40b9-bba1-08ada1f98b3c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_SWITCH_PORT_PROPERTY_PROFILE_ID_DEFAULT_EXTERNAL_NIC => "{0b347846-0a0c-470a-9b7a-0d965850698f}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_XMIT_OK => "{447956fa-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_RCV_OK => "{447956fb-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_XMIT_ERROR => "{447956fc-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_RCV_ERROR => "{447956fd-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_RCV_NO_BUFFER => "{447956fe-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_HARDWARE_STATUS => "{791ad192-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_MEDIA_SUPPORTED => "{791ad193-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_MEDIA_IN_USE => "{791ad194-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_LINK_SPEED => "{791ad195-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_VENDOR_ID => "{791ad196-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_VENDOR_DESCRIPTION => "{791ad197-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_DRIVER_VERSION => "{791ad198-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_MAC_OPTIONS => "{791ad19a-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_MEDIA_CONNECT_STATUS => "{791ad19b-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_VENDOR_DRIVER_VERSION => "{791ad19c-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_MINIMUM_LINK_SPEED => "{791ad19d-e35c-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_XMIT_PDUS_OK => "{0a214805-e35f-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_RCV_PDUS_OK => "{0a214806-e35f-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_XMIT_PDUS_ERROR => "{0a214807-e35f-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_RCV_PDUS_ERROR => "{0a214808-e35f-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_GEN_CO_RCV_PDUS_NO_BUFFER => "{0a214809-e35f-11d0-9692-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_PERMANENT_ADDRESS => "{447956ff-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_CURRENT_ADDRESS => "{44795700-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_MULTICAST_LIST => "{44795701-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_MAXIMUM_LIST_SIZE => "{44795702-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_MAC_OPTIONS => "{44795703-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_RCV_ERROR_ALIGNMENT => "{44795704-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_XMIT_ONE_COLLISION => "{44795705-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_3_XMIT_MORE_COLLISIONS => "{44795706-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_PERMANENT_ADDRESS => "{44795707-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_CURRENT_ADDRESS => "{44795708-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_CURRENT_FUNCTIONAL => "{44795709-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_CURRENT_GROUP => "{4479570a-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_LAST_OPEN_STATUS => "{4479570b-a61b-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_CURRENT_RING_STATUS => "{890a36ec-a61c-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_CURRENT_RING_STATE => "{acf14032-a61c-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_LINE_ERRORS => "{acf14033-a61c-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_5_LOST_FRAMES => "{acf14034-a61c-11d0-8dd4-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_BSSID => "{2504b6c2-1fa5-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_SSID => "{7d2a90ea-2041-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_NETWORK_TYPES_SUPPORTED => "{8531d6e6-2041-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_NETWORK_TYPE_IN_USE => "{857e2326-2041-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_POWER_MODE => "{85be837c-2041-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_TX_POWER_LEVEL => "{11e6ba76-2053-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_RSSI => "{1507db16-2053-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_RSSI_TRIGGER => "{155689b8-2053-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_BSSID_LIST => "{69526f9a-2062-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_INFRASTRUCTURE_MODE => "{697d5a7e-2062-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_FRAGMENTATION_THRESHOLD => "{69aaa7c4-2062-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_RTS_THRESHOLD => "{0134d07e-2064-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_NUMBER_OF_ANTENNAS => "{01779336-2064-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_RX_ANTENNA_SELECTED => "{01ac07a2-2064-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_TX_ANTENNA_SELECTED => "{01dbb74a-2064-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_SUPPORTED_RATES => "{49db8722-2068-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_DESIRED_RATES => "{452ee08e-2536-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_CONFIGURATION => "{4a4df982-2068-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_STATISTICS => "{42bb73b0-2129-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_ADD_WEP => "{4307bff0-2129-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_REMOVE_WEP => "{433c345c-2129-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_DISASSOCIATE => "{43671f40-2129-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_AUTHENTICATION_MODE => "{43920a24-2129-11d4-97eb-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_PRIVACY_FILTER => "{6733c4e9-4792-11d4-97f1-00c04f79c403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_BSSID_LIST_SCAN => "{0d9e01e1-ba70-11d4-b675-002048570337}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_WEP_STATUS => "{b027a21f-3cfa-4125-800b-3f7a18fddcdc}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_RELOAD_DEFAULTS => "{748b14e8-32ee-4425-b91b-c9848c58b55a}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_ADD_KEY => "{ab8b5a62-1d51-49d8-ba5c-fa980be03a1d}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_REMOVE_KEY => "{73cb28e9-3188-42d5-b553-b21237e6088c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_ASSOCIATION_INFORMATION => "{a08d4dd0-960e-40bd-8cf6-c538af98f2e3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_TEST => "{4b9ca16a-6a60-4e9d-920c-6335953fa0b5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_802_11_MEDIA_STREAM_MODE => "{0a56af66-d84b-49eb-a28d-5282cbb6d0cd}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_RESET_START => "{981f2d76-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_RESET_END => "{981f2d77-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_MEDIA_CONNECT => "{981f2d7d-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_MEDIA_DISCONNECT => "{981f2d7e-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_MEDIA_SPECIFIC_INDICATION => "{981f2d84-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_LINK_SPEED_CHANGE => "{981f2d85-b1f3-11d0-8dd7-00c04fc3358c}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_PACKET_FILTER => "{d47c5407-2e75-46dd-8146-1d7ed2d6ab1d}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_NETWORK_CHANGE => "{ca8a56f9-ce81-40e6-a70f-a067a476e9e9}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_TASK_OFFLOAD_CURRENT_CONFIG => "{45049fc6-54d8-40c8-9c3d-b011c4e715bc}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_TASK_OFFLOAD_HARDWARE_CAPABILITIES => "{b6b8158b-217c-4b2a-be86-6a04beea65b8}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_TCP_CONNECTION_OFFLOAD_CURRENT_CONFIG => "{f8edaeff-24e4-4ae6-a413-0b27f76b243d}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_TCP_CONNECTION_OFFLOAD_HARDWARE_CAPABILITIES => "{391969b6-402c-43bf-8922-39eae0da1bb5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_OPER_STATUS => "{f917b663-845e-4d3d-b6d4-15eb27af81c5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_LINK_STATE => "{64c6f797-878c-4311-9246-65dba89c3a61}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_PORT_STATE => "{1dac0dfe-43e5-44b7-b759-7bf46de32e81}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_EXTERNAL_CONNECTIVITY_CHANGE => "{fd306974-c420-4433-b0fe-4cf6a613f59f}"

    /**
     * @type {String}
     */
    static GUID_STATUS_MEDIA_SPECIFIC_INDICATION_EX => "{aaacfca7-954a-4632-a16e-a8a63793a9e5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_HD_SPLIT_CURRENT_CONFIG => "{6c744b0e-ee9c-4205-90a2-015f6d65f403}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_PM_WOL_PATTERN_REJECTED => "{f72cf68e-18d4-4d63-9a19-e69b13916b1a}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_PM_OFFLOAD_REJECTED => "{add1d481-711e-4d1a-92ca-a62db9329712}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_PM_WAKE_REASON => "{0933fd58-ca62-438f-83da-dfc1cccb8145}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_SCAN_CONFIRM => "{8500591e-a0c7-4efb-9342-b674b002cbe6}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_MPDU_MAX_LENGTH_CHANGED => "{1d6560ec-8e48-4a3e-9fd5-a01b698db6c5}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_ASSOCIATION_START => "{3927843b-6980-4b48-b15b-4de50977ac40}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_ASSOCIATION_COMPLETION => "{458bbea7-45a4-4ae2-b176-e51f96fc0568}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_CONNECTION_START => "{7b74299d-998f-4454-ad08-c5af28576d1b}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_CONNECTION_COMPLETION => "{96efd9c9-7f1b-4a89-bc04-3e9e271765f1}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_ROAMING_START => "{b2412d0d-26c8-4f4e-93df-f7b705a0b433}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_ROAMING_COMPLETION => "{dd9d47d1-282b-41e4-b924-66368817fcd3}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_DISASSOCIATION => "{3fbeb6fc-0fe2-43fd-b2ad-bd99b5f93e13}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_TKIPMIC_FAILURE => "{442c2ae4-9bc5-4b90-a889-455ef220f4ee}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_PMKID_CANDIDATE_LIST => "{26d8b8f6-db82-49eb-8bf3-4c130ef06950}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_PHY_STATE_CHANGED => "{deb45316-71b5-4736-bdef-0a9e9f4e62dc}"

    /**
     * @type {String}
     */
    static GUID_NDIS_STATUS_DOT11_LINK_QUALITY => "{a3285184-ea99-48ed-825e-a426b11c2754}"

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_IN_ORDER_DMA_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_RDMA_READ_SINK_NOT_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_CQ_INTERRUPT_MODERATION_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_MULTI_ENGINE_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_RDMA_READ_LOCAL_INVALIDATE_SUPPORTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_CQ_RESIZE_SUPPORTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NDK_ADAPTER_FLAG_LOOPBACK_CONNECTIONS_SUPPORTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OPER_STATUS_DOWN_NOT_AUTHENTICATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OPER_STATUS_DOWN_NOT_MEDIA_CONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OPER_STATUS_DORMANT_PAUSED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OPER_STATUS_DORMANT_LOW_POWER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OID_IF_ALIAS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OID_COMPARTMENT_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OID_NETWORK_GUID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IF_OID_IF_ENTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NET_SITEID_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NET_SITEID_MAXUSER => 134217727

    /**
     * @type {Integer (UInt32)}
     */
    static NET_SITEID_MAXSYSTEM => 268435455

    /**
     * @type {Integer (UInt32)}
     */
    static NET_IFLUID_UNSPECIFIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_HARDWARE_INTERFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_FILTER_INTERFACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_RESERVED1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_RESERVED2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_RESERVED3 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_WDM_INTERFACE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_ENDPOINT_INTERFACE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_ISCSI_INTERFACE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NIIF_NDIS_RESERVED4 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IF_MAX_STRING_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IF_MAX_PHYS_ADDRESS_LENGTH => 32
;@endregion Constants

;@region Methods
;@endregion Methods
}
