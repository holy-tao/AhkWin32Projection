#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class Usb {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LowSpeed => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FullSpeed => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HighSpeed => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_TRANSFER_IN => 2277389

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_TRANSFER_IN_APPEND_ZERO_PKT => 2277393

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_TRANSFER_OUT => 2277398

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_CONTROL_STATUS_HANDSHAKE_IN => 2277400

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_CONTROL_STATUS_HANDSHAKE_OUT => 2277404

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_GET_CLASS_INFO => 2277410

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_GET_PIPE_STATE => 2277414

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_SET_PIPE_STATE => 2277417

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_ACTIVATE_USB_BUS => 2277420

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_DEACTIVATE_USB_BUS => 2277424

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_BUS_EVENT_NOTIFICATION => 2277430

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_GET_CLASS_INFO_EX => 2277434

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_GET_INTERFACE_DESCRIPTOR_SET => 2277438

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GENERICUSBFN_REGISTER_USB_STRING => 2277441

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_CONTROLLER_INFO_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_CONTROLLER_DRIVER_KEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_PASS_THRU => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_POWER_STATE_MAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_BANDWIDTH_INFORMATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_BUS_STATISTICS_0 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_ROOTHUB_SYMBOLIC_NAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_USB_DRIVER_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_USB2_HW_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_USB_REFRESH_HCT_REG => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_SEND_ONE_PACKET => 268435457

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_RAW_RESET_PORT => 536870913

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_OPEN_RAW_DEVICE => 536870914

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_CLOSE_RAW_DEVICE => 536870915

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_SEND_RAW_COMMAND => 536870916

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_SET_ROOTPORT_FEATURE => 536870917

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_CLEAR_ROOTPORT_FEATURE => 536870918

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_GET_ROOTPORT_STATUS => 536870919

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_INVALID_REQUEST => 4294967280

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_MASK_DEVONLY_API => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static USBUSER_OP_MASK_HCTEST_API => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_LOW_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_FULL_SPEED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_HIGH_SPEED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_ASYNC_IN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_ASYNC_OUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_ISO_IN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_ISO_OUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_SETUP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_TOGGLE0 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PACKETFLAG_TOGGLE1 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static USB_HC_FEATURE_FLAG_PORT_POWER_SWITCHING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_HC_FEATURE_FLAG_SEL_SUSPEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_HC_FEATURE_LEGACY_BIOS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_HC_FEATURE_TIME_SYNC_API => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUBMIT_URB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_RESET_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_ROOTHUB_PDO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_PORT_STATUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENABLE_PORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CYCLE_PORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_IDLE_NOTIFICATION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_RECORD_FAILURE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_BUS_INFO => 264

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_CONTROLLER_NAME => 265

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_BUSGUID_INFO => 266

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_PARENT_HUB_INFO => 267

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_DEVICE_HANDLE => 268

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_DEVICE_HANDLE_EX => 269

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_TT_DEVICE_HANDLE => 270

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_TOPOLOGY_ADDRESS => 271

    /**
     * @type {Integer (UInt32)}
     */
    static USB_IDLE_NOTIFICATION_EX => 272

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQ_GLOBAL_SUSPEND => 273

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQ_GLOBAL_RESUME => 274

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_CONFIG_INFO => 275

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FAIL_GET_STATUS => 280

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REGISTER_COMPOSITE_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_UNREGISTER_COMPOSITE_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_REMOTE_WAKE_NOTIFICATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_GET_STATS_1 => 255

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_DIAGNOSTIC_MODE_ON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_DIAGNOSTIC_MODE_OFF => 257

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_GET_ROOT_HUB_NAME => 258

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_GET_DRIVERKEY_NAME => 265

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_GET_STATS_2 => 266

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_DISABLE_PORT => 268

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_ENABLE_PORT => 269

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_USER_REQUEST => 270

    /**
     * @type {Integer (UInt32)}
     */
    static HCD_TRACE_READ_REQUEST => 275

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_INFORMATION => 258

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_INFORMATION => 259

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION => 260

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_NAME => 261

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DIAG_IGNORE_HUBS_ON => 262

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DIAG_IGNORE_HUBS_OFF => 263

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_DRIVERKEY_NAME => 264

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_CAPABILITIES => 271

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_ATTRIBUTES => 272

    /**
     * @type {Integer (UInt32)}
     */
    static USB_HUB_CYCLE_PORT => 273

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_INFORMATION_EX => 274

    /**
     * @type {Integer (UInt32)}
     */
    static USB_RESET_HUB => 275

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_CAPABILITIES_EX => 276

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_HUB_INFORMATION_EX => 277

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_PORT_CONNECTOR_PROPERTIES => 278

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_NODE_CONNECTION_INFORMATION_EX_V2 => 279

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_TRANSPORT_CHARACTERISTICS => 281

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE => 282

    /**
     * @type {Integer (UInt32)}
     */
    static USB_NOTIFY_ON_TRANSPORT_CHARACTERISTICS_CHANGE => 283

    /**
     * @type {Integer (UInt32)}
     */
    static USB_UNREGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE => 284

    /**
     * @type {Integer (UInt32)}
     */
    static USB_START_TRACKING_FOR_TIME_SYNC => 285

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC => 286

    /**
     * @type {Integer (UInt32)}
     */
    static USB_STOP_TRACKING_FOR_TIME_SYNC => 287

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_DEVICE_CHARACTERISTICS => 288

    /**
     * @type {Integer (UInt32)}
     */
    static USB_RESERVED_USER_BASE => 1024

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_USB_HUB => "{f18a0e88-c30c-11d0-8815-00a0c906bed8}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_USB_BILLBOARD => "{5e9adaef-f879-473f-b807-4e5ea77d1b1c}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_USB_DEVICE => "{a5dcbf10-6530-11d2-901f-00c04fb951ed}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_USB_HOST_CONTROLLER => "{3abf6f2d-71c4-462a-8a92-1e6861e6af27}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_STD_DATA => "{4e623b20-cb14-11d1-b331-00a0c959bbd2}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_STD_NOTIFICATION => "{4e623b20-cb14-11d1-b331-00a0c959bbd2}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_DEVICE_PERF_INFO => "{66c1aa3c-499f-49a0-a9a5-61e2359f6407}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_NODE_INFO => "{9c179357-dc7a-4f41-b66b-323b9ddcb5b1}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_TRACING => "{3a61881b-b4e6-4bf9-ae0f-3cd8f394e52f}"

    /**
     * @type {String}
     */
    static GUID_USB_TRANSFER_TRACING => "{681eb8aa-403d-452c-9f8a-f0616fac9540}"

    /**
     * @type {String}
     */
    static GUID_USB_PERFORMANCE_TRACING => "{d5de77a6-6ae9-425c-b1e2-f5615fd348a9}"

    /**
     * @type {String}
     */
    static GUID_USB_WMI_SURPRISE_REMOVAL_NOTIFICATION => "{9bbbf831-a2f2-43b4-96d1-86944b5914b3}"

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_USB => 34

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_HOST_TO_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_DEVICE_TO_HOST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_STANDARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_CLASS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_VENDOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_TO_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_TO_INTERFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_TO_ENDPOINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BMREQUEST_TO_OTHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_STATUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_CLEAR_FEATURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_FEATURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_ADDRESS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_DESCRIPTOR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_DESCRIPTOR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_CONFIGURATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_CONFIGURATION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_INTERFACE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_INTERFACE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SYNC_FRAME => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_FIRMWARE_STATUS => 26

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_FIRMWARE_STATUS => 27

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_FIRMWARE_ALLOWED_OR_DISALLOWED_STATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GET_FIRMWARE_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_FIRMWARE_HASH_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DISALLOW_FIRMWARE_UPDATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ALLOW_FIRMWARE_UPDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_SEL => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_ISOCH_DELAY => 49

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_DESCRIPTOR_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIGURATION_DESCRIPTOR_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_STRING_DESCRIPTOR_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_INTERFACE_DESCRIPTOR_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_DESCRIPTOR_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_OTHER_SPEED_CONFIGURATION_DESCRIPTOR_TYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_INTERFACE_POWER_DESCRIPTOR_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_OTG_DESCRIPTOR_TYPE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEBUG_DESCRIPTOR_TYPE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_INTERFACE_ASSOCIATION_DESCRIPTOR_TYPE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_BOS_DESCRIPTOR_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_DESCRIPTOR_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR_TYPE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPERSPEEDPLUS_ISOCH_ENDPOINT_COMPANION_DESCRIPTOR_TYPE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static USB_RESERVED_DESCRIPTOR_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_POWER_DESCRIPTOR_TYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_ENDPOINT_STALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_REMOTE_WAKEUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_TEST_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_FUNCTION_SUSPEND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_U1_ENABLE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_U2_ENABLE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_LTM_ENABLE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_LDM_ENABLE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_BATTERY_WAKE_MASK => 40

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_OS_IS_PD_AWARE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_POLICY_MODE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_CHARGING_POLICY => 54

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CHARGING_POLICY_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CHARGING_POLICY_ICCHPF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CHARGING_POLICY_ICCLPF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CHARGING_POLICY_NO_POWER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_STATUS_PORT_STATUS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_STATUS_PD_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_STATUS_EXT_PORT_STATUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GETSTATUS_SELF_POWERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GETSTATUS_REMOTE_WAKEUP_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GETSTATUS_U1_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GETSTATUS_U2_ENABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_GETSTATUS_LTM_ENABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_AUDIO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_COMMUNICATIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_HUMAN_INTERFACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_MONITOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_PHYSICAL_INTERFACE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_POWER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_IMAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_PRINTER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_STORAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_HUB => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_CDC_DATA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_SMART_CARD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_CONTENT_SECURITY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_VIDEO => 14

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_PERSONAL_HEALTHCARE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_AUDIO_VIDEO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_BILLBOARD => 17

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_DIAGNOSTIC_DEVICE => 220

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_WIRELESS_CONTROLLER => 224

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_MISCELLANEOUS => 239

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_APPLICATION_SPECIFIC => 254

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CLASS_VENDOR_SPECIFIC => 255

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_WIRELESS_USB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_USB20_EXTENSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_USB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_CONTAINER_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_PLATFORM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_POWER_DELIVERY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_BATTERY_INFO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_PD_CONSUMER_PORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_PD_PROVIDER_PORT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_PRECISION_TIME_MEASUREMENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_BILLBOARD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_FIRMWARE_STATUS => 17

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_USB20_EXTENSION_BMATTRIBUTES_RESERVED_MASK => 4294901985

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_BMATTRIBUTES_RESERVED_MASK => 253

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_BMATTRIBUTES_LTM_CAPABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_RESERVED_MASK => 65520

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_FULL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_HIGH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_SUPER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_U1_DEVICE_EXIT_MAX_VALUE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEED_U2_DEVICE_EXIT_MAX_VALUE => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_MAX_U1_LATENCY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_MAX_U2_LATENCY => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_BPS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_KBPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_MBPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_GBPS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_MODE_SYMMETRIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_MODE_ASYMMETRIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_DIR_RX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_DIR_TX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_PROTOCOL_SS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_PROTOCOL_SSP => 1

    /**
     * @type {String}
     */
    static GUID_USB_MSOS20_PLATFORM_CAPABILITY_ID => "{d8dd60df-4589-4cc7-9cd2-659d9e648a9f}"

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_POWERED_MASK => 192

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_BUS_POWERED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_SELF_POWERED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_REMOTE_WAKEUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USB_CONFIG_RESERVED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_DIRECTION_MASK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_ADDRESS_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_CONTROL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_BULK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_INTERRUPT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_BULK_RESERVED_MASK => 252

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_CONTROL_RESERVED_MASK => 252

    /**
     * @type {Integer (UInt32)}
     */
    static USB_20_ENDPOINT_TYPE_INTERRUPT_RESERVED_MASK => 252

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_RESERVED_MASK => 204

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_RESERVED_MASK => 192

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_MASK => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_PERIODIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_NOTIFICATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_RESERVED10 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_RESERVED11 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_MASK => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_NO_SYNCHRONIZATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_ASYNCHRONOUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_ADAPTIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_SYNCHRONOUS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_MASK => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_DATA_ENDOINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_FEEDBACK_ENDPOINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_IMPLICIT_FEEDBACK_DATA_ENDPOINT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_RESERVED => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_SUPERSPEED_BULK_MAX_PACKET_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_SUPERSPEED_CONTROL_MAX_PACKET_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_SUPERSPEED_ISO_MAX_PACKET_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static USB_ENDPOINT_SUPERSPEED_INTERRUPT_MAX_PACKET_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_USB_STRING_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPERSPEED_ISOCHRONOUS_MAX_MULTIPLIER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPERSPEEDPLUS_ISOCHRONOUS_MIN_BYTESPERINTERVAL => 49153

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPERSPEEDPLUS_ISOCHRONOUS_MAX_BYTESPERINTERVAL => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static USB_20_HUB_DESCRIPTOR_TYPE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static USB_30_HUB_DESCRIPTOR_TYPE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_CLEAR_TT_BUFFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_RESET_TT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_TT_STATE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_STOP_TT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_SET_HUB_DEPTH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REQUEST_GET_PORT_ERR_COUNT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_SUSPEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_OVER_CURRENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_RESET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_POWER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_LOW_SPEED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORT_STATUS_HIGH_SPEED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_U0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_U1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_U2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_U3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_RX_DETECT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_INACTIVE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_POLLING => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_RECOVERY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_HOT_RESET => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_COMPLIANCE_MODE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_LOOPBACK => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_LINK_STATE_TEST_MODE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_INTERFACE_POWER_D0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_INTERFACE_POWER_D1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_INTERFACE_POWER_D2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_FEATURE_INTERFACE_POWER_D3 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D0_COMMAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D1_COMMAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D2_COMMAND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D3_COMMAND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D1_WAKEUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USB_SUPPORT_D2_WAKEUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USBDI_VERSION => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_NO_CONNECTOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_SHARED_USB2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_MINI_CONNECTOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_OEM_CONNECTOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_OWNED_BY_CC => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static USB_PORTATTR_NO_OVERCURRENT_UI => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEFAULT_DEVICE_ADDRESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEFAULT_ENDPOINT_ADDRESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEFAULT_MAX_PACKET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SELECT_CONFIGURATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SELECT_INTERFACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_ABORT_PIPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_TAKE_FRAME_LENGTH_CONTROL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RELEASE_FRAME_LENGTH_CONTROL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_FRAME_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_FRAME_LENGTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_CURRENT_FRAME_NUMBER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CONTROL_TRANSFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_ISOCH_TRANSFER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_DESCRIPTOR_FROM_DEVICE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_DESCRIPTOR_TO_DEVICE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_FEATURE_TO_DEVICE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_FEATURE_TO_INTERFACE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_FEATURE_TO_ENDPOINT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLEAR_FEATURE_TO_DEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLEAR_FEATURE_TO_INTERFACE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLEAR_FEATURE_TO_ENDPOINT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_STATUS_FROM_DEVICE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_STATUS_FROM_INTERFACE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_STATUS_FROM_ENDPOINT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVED_0X0016 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_VENDOR_DEVICE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_VENDOR_INTERFACE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_VENDOR_ENDPOINT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLASS_DEVICE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLASS_INTERFACE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLASS_ENDPOINT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X001D => 29

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SYNC_RESET_PIPE_AND_CLEAR_STALL => 30

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLASS_OTHER => 31

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_VENDOR_OTHER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_STATUS_FROM_OTHER => 33

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLEAR_FEATURE_TO_OTHER => 34

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_FEATURE_TO_OTHER => 35

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_DESCRIPTOR_FROM_ENDPOINT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_DESCRIPTOR_TO_ENDPOINT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_CONFIGURATION => 38

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_INTERFACE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_DESCRIPTOR_FROM_INTERFACE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SET_DESCRIPTOR_TO_INTERFACE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X002B => 43

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X002C => 44

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X002D => 45

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X002E => 46

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X002F => 47

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_MS_FEATURE_DESCRIPTOR => 42

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SYNC_RESET_PIPE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_SYNC_CLEAR_STALL => 49

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CONTROL_TRANSFER_EX => 50

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X0033 => 51

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESERVE_0X0034 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_OPEN_STATIC_STREAMS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_CLOSE_STATIC_STREAMS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER_USING_CHAINED_MDL => 55

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_ISOCH_TRANSFER_USING_CHAINED_MDL => 56

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS => 61

    /**
     * @type {Integer (UInt32)}
     */
    static URB_FUNCTION_RESET_PIPE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_SHORT_TRANSFER_OK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_START_ISO_TRANSFER_ASAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_DEFAULT_PIPE_TRANSFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_TRANSFER_DIRECTION_OUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_TRANSFER_DIRECTION_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_TRANSFER_DIRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_ISO_START_FRAME_RANGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_DEFAULT_MAXIMUM_TRANSFER_SIZE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_CHANGE_MAX_PACKET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_SHORT_PACKET_OPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_ENABLE_RT_THREAD_ACCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_MAP_ADD_TRANSFERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_VIDEO_PRIORITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_VOICE_PRIORITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_INTERACTIVE_PRIORITY => 48

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_PRIORITY_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_HANDLES_SSP_HIGH_BANDWIDTH_ISOCH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PF_SSP_HIGH_BANDWIDTH_ISOCH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OS_STRING_DESCRIPTOR_INDEX => 238

    /**
     * @type {Integer (UInt32)}
     */
    static MS_GENRE_DESCRIPTOR_INDEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MS_POWER_DESCRIPTOR_INDEX => 2

    /**
     * @type {String}
     */
    static MS_OS_STRING_SIGNATURE => "MSFT100"

    /**
     * @type {Integer (UInt32)}
     */
    static MS_OS_FLAGS_CONTAINERID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static URB_OPEN_STATIC_STREAMS_VERSION_100 => 256

    /**
     * @type {String}
     */
    static KREGUSBFNENUMPATH => "\Registry\Machine\SYSTEM\CurrentControlSet\Control\USBFN\"

    /**
     * @type {String}
     */
    static UREGUSBFNENUMPATH => "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\USBFN\"

    /**
     * @type {String}
     */
    static KREGMANUSBFNENUMPATH => "\Registry\Machine\SYSTEM\CurrentControlSet\Control\ManufacturingMode\Current\USBFN\"

    /**
     * @type {String}
     */
    static UREGMANUSBFNENUMPATH => "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ManufacturingMode\Current\USBFN\"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NUM_USBFN_ENDPOINTS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CONFIGURATION_NAME_LENGTH => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_USB_STRING_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SUPPORTED_CONFIGURATIONS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static USBFN_INTERRUPT_ENDPOINT_SIZE_NOT_UPDATEABLE_MASK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TEST_MODE_TEST_J => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TEST_MODE_TEST_K => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TEST_MODE_TEST_SE0_NAK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TEST_MODE_TEST_PACKET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TEST_MODE_TEST_FORCE_ENABLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_INTERFACE_NAME_LENGTH => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ALTERNATE_NAME_LENGTH => 40

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ASSOCIATION_NAME_LENGTH => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_SUBMIT_URB => 2228227

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_RESET_PORT => 2228231

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_ROOTHUB_PDO => 2228239

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PORT_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USBD_PORT_CONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_PORT_STATUS => 2228243

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_ENABLE_PORT => 2228247

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_HUB_COUNT => 2228251

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_CYCLE_PORT => 2228255

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_HUB_NAME => 2228256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_BUS_INFO => 2229280

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_CONTROLLER_NAME => 2229284

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_BUSGUID_INFO => 2229288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_PARENT_HUB_INFO => 2229292

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_SUBMIT_IDLE_NOTIFICATION => 2228263

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_DEVICE_HANDLE => 2229299

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_NOTIFY_IDLE_READY => 2229315

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_REQ_GLOBAL_SUSPEND => 2229319

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_REQ_GLOBAL_RESUME => 2229323

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_RECORD_FAILURE => 2228267

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_DEVICE_HANDLE_EX => 2229303

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_TT_DEVICE_HANDLE => 2229307

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_TOPOLOGY_ADDRESS => 2229311

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_GET_DEVICE_CONFIG_INFO => 2229327

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_REGISTER_COMPOSITE_DEVICE => 4784131

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_UNREGISTER_COMPOSITE_DEVICE => 4784135

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_REQUEST_REMOTE_WAKE_NOTIFICATION => 4784139

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_USB_FAIL_GET_STATUS_FROM_DEVICE => 2229347

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_HCD_GET_STATS_1 => 2229244

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_HCD_GET_STATS_2 => 2229288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_HCD_DISABLE_PORT => 2229296

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_HCD_ENABLE_PORT => 2229300

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_DIAGNOSTIC_MODE_ON => 2229248

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_DIAGNOSTIC_MODE_OFF => 2229252

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_ROOT_HUB_NAME => 2229256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_HCD_DRIVERKEY_NAME => 2229284

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_INFORMATION => 2229256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_INFORMATION => 2229260

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION => 2229264

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_NAME => 2229268

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_DIAG_IGNORE_HUBS_ON => 2229272

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_DIAG_IGNORE_HUBS_OFF => 2229276

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_DRIVERKEY_NAME => 2229280

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_HUB_CAPABILITIES => 2229308

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_HUB_CYCLE_PORT => 2229316

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_ATTRIBUTES => 2229312

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX => 2229320

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_RESET_HUB => 2229324

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_HUB_CAPABILITIES_EX => 2229328

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_HUB_INFORMATION_EX => 2229332

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_PORT_CONNECTOR_PROPERTIES => 2229336

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX_V2 => 2229340

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_TRANSPORT_CHARACTERISTICS => 2229348

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_REGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE => 2229352

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_NOTIFY_ON_TRANSPORT_CHARACTERISTICS_CHANGE => 2229356

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_UNREGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE => 2229360

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_START_TRACKING_FOR_TIME_SYNC => 2229364

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC => 2229368

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_STOP_TRACKING_FOR_TIME_SYNC => 2229372

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_USB_GET_DEVICE_CHARACTERISTICS => 2229376

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_DRIVER_INFORMATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_DRIVER_NOTIFICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_POWER_DEVICE_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_HUB_NODE_INFORMATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_PERFORMANCE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_USB_DEVICE_NODE_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TRANSPORT_CHARACTERISTICS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TRANSPORT_CHARACTERISTICS_LATENCY_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_TRANSPORT_CHARACTERISTICS_BANDWIDTH_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REGISTER_FOR_TRANSPORT_LATENCY_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_REGISTER_FOR_TRANSPORT_BANDWIDTH_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CHARACTERISTICS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DEVICE_CHARACTERISTICS_MAXIMUM_PATH_DELAYS_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NUM_PIPES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BULKIN_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_USB_SCAN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INDEX => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_VERSION => 2147491840

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CANCEL_IO => 2147491844

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WAIT_ON_DEVICE_EVENT => 2147491848

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_READ_REGISTERS => 2147491852

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_WRITE_REGISTERS => 2147491856

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_CHANNEL_ALIGN_RQST => 2147491860

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_DEVICE_DESCRIPTOR => 2147491864

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_RESET_PIPE => 2147491868

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_USB_DESCRIPTOR => 2147491872

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SEND_USB_REQUEST => 2147491876

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_GET_PIPE_CONFIGURATION => 2147491880

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SET_TIMEOUT => 2147491884

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ABORT_PIPE => 2147491844

    /**
     * @type {String}
     */
    static WinUSB_TestGuid => "{da812bff-12c3-46a2-8e2b-dbd3b7834c43}"
;@endregion Constants

;@region Methods
    /**
     * The WinUsb_Initialize function creates a WinUSB handle for the device specified by a file handle.
     * @remarks
     * When <b>WinUsb_Initialize</b> is called,
     *    the policy settings of the interface are reset to the default values. 
     * 
     * The <b>WinUsb_Initialize</b> call queries the underlying USB stack for various descriptors and allocates enough memory to store the retrieved descriptor data. 
     * 
     * <b>WinUsb_Initialize</b> first retrieves the device descriptor and then gets the associated configuration descriptor. From the configuration descriptor, the call derives the associated interface descriptors and stores them in an array. The interfaces in the array are identified by zero-based indexes. An index value of 0 indicates the first interface (the default interface), a value of 1 indicates the second associated interface, and so on.
     *     <b>WinUsb_Initialize</b> parses the default interface descriptor for the endpoint descriptors and caches information such as the associated pipes or state specific data.
     * The handle received in the <i>InterfaceHandle</i> parameter is a pointer to the memory block allocated for the first interface in the array. 
     * 
     * If an application wants to use another interface on the device, it must call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>,  specify the index of the interface, and retrieve a handle to the  memory block allocated for the specified interface.
     * @param {Pointer<HANDLE>} DeviceHandle The handle to the device that <b>CreateFile</b> returned. WinUSB uses overlapped I/O, so FILE_FLAG_OVERLAPPED must be specified in the <i>dwFlagsAndAttributes</i> parameter of <b>CreateFile</b> call for <i>DeviceHandle</i> to have the characteristics necessary for <b>WinUsb_Initialize</b> to function properly.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle Receives an opaque handle to the first (default) interface on the device. This handle is required by other WinUSB routines that perform operations on the default interface. To release the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUSB_Free</a> function.
     * @returns {Integer} <b>WinUsb_Initialize</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> or an invalid handle in the  <i>DeviceHandle</i> parameter; FILE_FLAG_OVERLAPPED was not set in the file handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the default interface descriptor could not be found for the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_initialize
     */
    static WinUsb_Initialize(DeviceHandle, InterfaceHandle) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_Initialize", "ptr", DeviceHandle, "ptr", InterfaceHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_Free function releases all of the resources that WinUsb_Initialize allocated. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. That handle must be created by a previous call to  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @returns {Integer} <b>WinUsb_Free</b> returns <b>TRUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_free
     */
    static WinUsb_Free(InterfaceHandle) {
        result := DllCall("WINUSB.dll\WinUsb_Free", "ptr", InterfaceHandle, "int")
        return result
    }

    /**
     * The WinUsb_GetAssociatedInterface function retrieves a handle for an associated interface. This is a synchronous operation.
     * @remarks
     * The <b>WinUsb_GetAssociatedInterface</b> routine retrieves an opaque handle.
     * 
     * The <i>first associated interface</i> is the interface that immediately follows the interface whose handle the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> routine retrieves.
     * 
     * The handle that <b>WinUsb_GetAssociatedInterface</b> returns must be released by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUsb_Free</a>.
     * 
     * Callers of <b>WinUsb_GetAssociatedInterface</b> can retrieve only one handle for each interface. If a caller attempts to retrieve more than one handle for the same interface, the routine will fail with an error of ERROR_ALREADY_EXISTS.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the first (default) interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Integer} AssociatedInterfaceIndex An index that specifies the associated interface to retrieve. A value of 0 indicates the first associated interface, a value of 1 indicates the second associated interface, and so on.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} AssociatedInterfaceHandle A handle for the associated interface. Callers must pass this interface handle to <a href="https://docs.microsoft.com/windows/iot-core/learn-about-hardware/hardwarecompatlist">WinUSB Functions</a> exposed by Winusb.dll. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUsb_Free</a>.
     * @returns {Integer} <b>WinUsb_GetAssociatedInterface</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a> has already returned a handle for the interface that <i>AssociatedInterfaceIndex</i> specifies.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The passed <i>AssociatedInterfaceIndex</i> value failed an integer overflow check. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An interface does not exist for the specified <i>AssociatedInterfaceIndex</i> value<i>.</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getassociatedinterface
     */
    static WinUsb_GetAssociatedInterface(InterfaceHandle, AssociatedInterfaceIndex, AssociatedInterfaceHandle) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetAssociatedInterface", "ptr", InterfaceHandle, "char", AssociatedInterfaceIndex, "ptr", AssociatedInterfaceHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetDescriptor function returns the requested descriptor. This is a synchronous operation.
     * @remarks
     * If the output buffer pointed to by  the  <i>Buffer</i> parameter is large enough, <b>WinUsb_GetDescriptor</b> creates a copy of the specified descriptor into the output buffer. No data is copied if the buffer is not large enough to hold descriptor data.  The descriptor is created during the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> call or it may be retrieved at this point from the device.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. 
     * 
     * To retrieve the device or configuration descriptor, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * 
     * To retrieve the interface descriptor of the  first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * 
     * To retrieve the endpoint descriptor of an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * 
     * To retrieve descriptors of all other interfaces and their related endpoints, use the handle to the target interface, retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} DescriptorType A value that specifies the type of descriptor to return. This parameter corresponds to the <b>bDescriptorType</b> field of a standard device descriptor, whose values are described in the <i>Universal Serial Bus </i> specification. Some of these values are listed in the description of the <b>DescriptorType</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_urb_control_descriptor_request">_URB_CONTROL_DESCRIPTOR_REQUEST</a> structure.
     * @param {Integer} Index The descriptor index. For an explanation of the descriptor index, see the <i>Universal Serial Bus</i> specification (www.usb.org).
     * @param {Integer} LanguageID A value that specifies the language identifier, if the requested descriptor is a string descriptor.
     * @param {Pointer<Byte>} Buffer A caller-allocated buffer that receives the requested descriptor.
     * @param {Integer} BufferLength The length, in bytes, of <i>Buffer</i>.
     * @param {Pointer<UInt32>} LengthTransferred The number of bytes that were copied into <i>Buffer</i>.
     * @returns {Integer} <b>WinUsb_GetDescriptor</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getdescriptor
     */
    static WinUsb_GetDescriptor(InterfaceHandle, DescriptorType, Index, LanguageID, Buffer, BufferLength, LengthTransferred) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetDescriptor", "ptr", InterfaceHandle, "char", DescriptorType, "char", Index, "ushort", LanguageID, "ptr", Buffer, "uint", BufferLength, "ptr", LengthTransferred, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_QueryInterfaceSettings function retrieves the interface descriptor for the specified alternate interface settings for a particular interface handle.
     * @remarks
     * <b>WinUsb_QueryInterfaceSettings</b> parses the configuration descriptor previously retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For more information, see the Remarks section for <b>WinUsb_Initialize</b>. 
     * 
     * The <b>WinUsb_QueryInterfaceSettings</b> call searches the interface array for the alternate interface specified by the interface index passed by the caller in the <i>AlternateSettingNumber</i>. If the specified interface is found, the function populates the caller-allocated <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure. If the specified interface is not found, then the call fails with the ERROR_NO_MORE_ITEMS code.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. 
     * 
     * To retrieve the settings of the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} AlternateInterfaceNumber A value that indicates which alternate settings to return. A value of 0 indicates the first alternate setting, a value of 1 indicates the second alternate setting, and so on.
     * @param {Pointer<USB_INTERFACE_DESCRIPTOR>} UsbAltInterfaceDescriptor A pointer to a caller-allocated <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure that contains information about the interface that <i>AlternateSettingNumber</i> specified.
     * @returns {Integer} <b>WinUsb_QueryInterfaceSettings</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, it returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified alternate interface was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_queryinterfacesettings
     */
    static WinUsb_QueryInterfaceSettings(InterfaceHandle, AlternateInterfaceNumber, UsbAltInterfaceDescriptor) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_QueryInterfaceSettings", "ptr", InterfaceHandle, "char", AlternateInterfaceNumber, "ptr", UsbAltInterfaceDescriptor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_QueryDeviceInformation function gets information about the physical device that is associated with a WinUSB interface handle.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Integer} InformationType A value that specifies which interface information value to retrieve.
     * 
     * On input, <i>InformationType</i> must have the following value: DEVICE_SPEED (0x01).
     * @param {Pointer<UInt32>} BufferLength The maximum number of bytes to read. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>. On output, <i>BufferLength</i> is set to the actual number of bytes that were copied into <i>Buffer</i>.
     * @param {Pointer<Void>} Buffer A caller-allocated buffer that receives the requested value.
     * 
     * If <i>InformationType</i> is DEVICE_SPEED, on successful return, <i>Buffer</i> indicates the operating speed of the device. 0x03 indicates high-speed or higher; 0x01 indicates full-speed or lower.
     * @returns {Integer} <b>WinUsb_QueryDeviceInformation</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querydeviceinformation
     */
    static WinUsb_QueryDeviceInformation(InterfaceHandle, InformationType, BufferLength, Buffer) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_QueryDeviceInformation", "ptr", InterfaceHandle, "uint", InformationType, "ptr", BufferLength, "ptr", Buffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_SetCurrentAlternateSetting function sets the alternate setting of an interface.
     * @remarks
     * <b>WinUsb_SetCurrentAlternateSetting</b> fails if outstanding I/O requests are present on the interface.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface, which defines the alternate setting to set. 
     * 
     * To set an alternate setting in the first interface on the device, use the interface handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} SettingNumber The value that is contained in the <b>bAlternateSetting</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure. This structure is populated by the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_queryinterfacesettings">WinUsb_QueryInterfaceSettings</a> routine.
     * @returns {Integer} <b>WinUsb_SetCurrentAlternateSetting</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setcurrentalternatesetting
     */
    static WinUsb_SetCurrentAlternateSetting(InterfaceHandle, SettingNumber) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_SetCurrentAlternateSetting", "ptr", InterfaceHandle, "char", SettingNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetCurrentAlternateSetting function gets the current alternate interface setting for an interface. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. To get the current alternate setting in the first (default) interface on the device, use the interface handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Pointer<Byte>} SettingNumber A pointer to an unsigned character that receives an integer that indicates the current alternate setting.
     * @returns {Integer} <b>WinUsb_GetCurrentAlternateSetting</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentalternatesetting
     */
    static WinUsb_GetCurrentAlternateSetting(InterfaceHandle, SettingNumber) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetCurrentAlternateSetting", "ptr", InterfaceHandle, "ptr", SettingNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_QueryPipe function retrieves information about the specified endpoint and the associated pipe for an interface.
     * @remarks
     * The <b>WinUsb_QueryPipe</b> function does not retrieve information about the control pipe.
     * 
     * Each interface on the USB device can have multiple endpoints. To communicate with each of these endpoints, the bus driver creates pipes for each endpoint on the interface. The pipe indices are zero-based. Therefore for <i>n</i> number of endpoints, the pipes' indices are set from <i>n</i>-1. <b>WinUsb_QueryPipe</b> parses the configuration descriptor to get the interface specified by the caller.  It searches the interface descriptor  for the endpoint descriptor associated with the caller-specified pipe. If the endpoint is found, the function populates the caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure with information from the endpoint descriptor.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
     * 
     * To query the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} AlternateInterfaceNumber A value that specifies the alternate interface to return the information for.
     * @param {Integer} PipeIndex A value that specifies the pipe to return information about. This value is not the same as the <b>bEndpointAddress</b> field in the endpoint descriptor. A <i>PipeIndex </i> value of 0 signifies the first endpoint that is associated with the interface, a value of 1 signifies the second endpoint, and so on. <i>PipeIndex</i> must be less than the value in the <b>bNumEndpoints</b> field of the interface descriptor.
     * @param {Pointer<WINUSB_PIPE_INFORMATION>} PipeInformation A pointer, on output, to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure that contains pipe information.
     * @returns {Integer} <b>WinUsb_QueryPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>PipeInformation </i> parameter; interface descriptor could not be found for the handle specified in <i>InterfaceHandle</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in the <i>PipeIndex</i> parameter is greater than the  <b>bNumEndpoints</b> value of the interface descriptor; endpoint descriptor could not be found for the specified interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querypipe
     */
    static WinUsb_QueryPipe(InterfaceHandle, AlternateInterfaceNumber, PipeIndex, PipeInformation) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_QueryPipe", "ptr", InterfaceHandle, "char", AlternateInterfaceNumber, "char", PipeIndex, "ptr", PipeInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_QueryPipeEx function retrieves extended information about the specified endpoint and the associated pipe for an interface.
     * @remarks
     * The <b>WinUsb_QueryPipeEx</b> function does not retrieve information about the control pipe.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
     * 
     * To query the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} AlternateSettingNumber A value that specifies the alternate interface to return the information for.
     * @param {Integer} PipeIndex A value that specifies the pipe to return information about. This value is not the same as the <b>bEndpointAddress</b> field in the endpoint descriptor. A <i>PipeIndex </i> value of 0 signifies the first endpoint that is associated with the interface, a value of 1 signifies the second endpoint, and so on. <i>PipeIndex</i> must be less than the value in the <b>bNumEndpoints</b> field of the interface descriptor.
     * @param {Pointer<WINUSB_PIPE_INFORMATION_EX>} PipeInformationEx A pointer, on output, to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information_ex">WINUSB_PIPE_INFORMATION_EX</a> structure that contains pipe information.
     * @returns {Integer} <b>WinUsb_QueryPipeEx</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>PipeInformation </i> parameter; interface descriptor could not be found for the handle specified in <i>InterfaceHandle</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in the <i>PipeIndex</i> parameter is greater than the  <b>bNumEndpoints</b> value of the interface descriptor; endpoint descriptor could not be found for the specified interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querypipeex
     */
    static WinUsb_QueryPipeEx(InterfaceHandle, AlternateSettingNumber, PipeIndex, PipeInformationEx) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_QueryPipeEx", "ptr", InterfaceHandle, "char", AlternateSettingNumber, "char", PipeIndex, "ptr", PipeInformationEx, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_SetPipePolicy function sets the policy for a specific pipe associated with an endpoint on the device. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated. 
     * 
     * To set policy for the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID An 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @param {Integer} PolicyType A <b>ULONG</b> variable that specifies the policy parameter to change. The <i>Value</i> parameter contains the new value for the policy parameter, defined in <i>winusbio.h</i>. For information about how to use each of the pipe policies and the resulting behavior, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
     * @param {Integer} ValueLength The size, in bytes, of the buffer at <i>Value</i>.
     * @param {Pointer<Void>} Value The new value for the policy parameter that <i>PolicyType</i> specifies. The size of this input parameter depends on the policy to change. For information about the size of this parameter, see the description of the <i>PolicyType</i> parameter.
     * @returns {Integer} <b>WinUsb_SetPipePolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed an invalid size for the policy parameter buffer in the <i>ValueLength</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setpipepolicy
     */
    static WinUsb_SetPipePolicy(InterfaceHandle, PipeID, PolicyType, ValueLength, Value) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_SetPipePolicy", "ptr", InterfaceHandle, "char", PipeID, "uint", PolicyType, "uint", ValueLength, "ptr", Value, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetPipePolicy function retrieves the policy for a specific pipe associated with an endpoint on the device. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
     * 
     * To query the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID An 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @param {Integer} PolicyType A <b>ULONG</b> variable that specifies the policy parameter to retrieve. The current value for the policy parameter is retrieved the <i>Value</i> parameter. For information about the behavior of the pipe policies, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
     * @param {Pointer<UInt32>} ValueLength A pointer to the size, in bytes, of the buffer that <i>Value</i> points to. On output, <i>ValueLength</i> receives the size, in bytes, of the data that was copied into the <i>Value </i> buffer.
     * @param {Pointer<Void>} Value A pointer to a buffer that receives the specified pipe policy value.
     * @returns {Integer} <b>WinUsb_GetPipePolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getpipepolicy
     */
    static WinUsb_GetPipePolicy(InterfaceHandle, PipeID, PolicyType, ValueLength, Value) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetPipePolicy", "ptr", InterfaceHandle, "char", PipeID, "uint", PolicyType, "ptr", ValueLength, "ptr", Value, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_ReadPipe function reads data from the specified pipe.
     * @remarks
     * If the data returned by the device is greater than a maximum transfer length, WinUSB divides the request into smaller requests of maximum transfer length and submits them serially. If the transfer length is not a multiple of the endpoint's maximum packet size (retrievable through  the <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure's <b>MaximumPacketSize</b> member), WinUSB increases the size of the transfer to the next multiple of <b>MaximumPacketSize</b>.
     * 
     * USB packet size does not factor into the transfer for a read request. If the device responds with a packet that is too large for the client buffer, the behavior of the read request corresponds to the type of policy set on the pipe. If policy type for the pipe is ALLOW_PARTIAL_READS, WinUSB adds the remaining data to the beginning of the next transfer. If ALLOW_PARTIAL_READS is not set, the read request fails. For more information about policy types, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
     * 
     * If an application passes <b>NULL</b> in the <i>Overlapped</i> parameter (synchronous operation), the application must make sure that <i>LengthTransferred</i> is not <b>NULL</b>, even when the read  operation produces no output data.
     * 
     * If <i>Overlapped</i> is not <b>NULL</b> (asynchronous operation),  <i>LengthTransferred</i> can be set to <b>NULL</b>. For an overlapped operation (and if <i>LengthTransferred</i> is a non-<b>NULL</b> value), the value received in <i>LengthTransferred</i> after <b>WinUsb_ReadPipe</b> returns is meaningless until the overlapped operation has completed. To retrieve the actual number of bytes read from the pipe, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a>.
     * 
     * When no data is available in the endpoint (pipe is empty), <b>WinUsb_ReadPipe</b> does not return until there is data in the pipe. If an error condition occurs or the application-specified timeout expires,   <b>WinUsb_ReadPipe</b> always returns FALSE. To determine the actual reason for that return value, always call <b>GetLastError</b>. For example, in these cases the <b>GetLastError</b> error value indicates the actual reason: <ul>
     * <li>If the application specified a timeout value in the pipe policy and that timeout expires, <b>WinUsb_ReadPipe</b> returns  FALSE and <b>GetLastError</b> returns ERROR_SEM_TIMEOUT.</li>
     * <li>If an error condition occurs while reading data from the pipe, <b>WinUsb_ReadPipe</b> returns FALSE and <b>GetLastError</b> returns ERROR_GEN_FAILURE.</li>
     * </ul>
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
     * 
     * To read data from the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID <i>PipeID</i> corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor. For information about the layout of this field, see <b>Table 9-13</b> in "Universal Serial Bus Specification Revision 2.0" at <a href="https://www.microsoft.com/whdc/connect/usb/default.mspx">USB Technology</a>. In the <b>bEndpointAddress</b> field, Bit 7 indicates the direction of the endpoint: 0 for OUT; 1 for IN.
     * @param {Pointer<Byte>} Buffer A caller-allocated buffer that receives the data that is read.
     * @param {Integer} BufferLength The maximum number of bytes to read. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
     * @param {Pointer<UInt32>} LengthTransferred A pointer to a ULONG variable that receives the actual number of bytes that were copied into <i>Buffer</i>. For more information, see Remarks.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to an OVERLAPPED structure that is used for asynchronous operations. If this parameter is specified, <b>WinUsb_ReadPipe</b> returns immediately rather than waiting synchronously for the operation to complete before returning. An event is signaled when the operation is complete.
     * @returns {Integer} <b>WinUsb_ReadPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An overlapped I/O operation is in progress but has not completed.  If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_PENDING, indicating that the operation is executing in the background. Call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a> to check the success or failure of the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation initiated by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_readpipe">WinUsb_ReadPipe</a>  in the USB stack timed out before the operation could be completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readpipe
     */
    static WinUsb_ReadPipe(InterfaceHandle, PipeID, Buffer, BufferLength, LengthTransferred, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ReadPipe", "ptr", InterfaceHandle, "char", PipeID, "ptr", Buffer, "uint", BufferLength, "ptr", LengthTransferred, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_WritePipe function writes data to a pipe.
     * @remarks
     * To create a write request, your the application must allocate a buffer, fill it with the data that you want to write to the device, and send the buffer to the host controller by calling  <b>WinUsb_WritePipe</b>. 
     * 
     * The following restrictions apply to the size of the buffer if  RAW_IO is  set:
     * 
     * <ul>
     * <li>The buffer length must be a multiple of the maximum endpoint packet size.</li>
     * <li>The length must be less than or equal to the value of MAXIMUM_TRANSFER_SIZE retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getpipepolicy">WinUsb_GetPipePolicy</a>.</li>
     * </ul>
     * There are no restrictions on the size of the buffer if RAW_IO is not set as the pipe's policy type. If the size of the buffer is greater than the maximum transfer length reported by MAXIMUM_TRANSFER_SIZE, WinUSB divides the request into smaller requests and submits them serially to the host controller.
     * 
     * A write request that contains zero-length data is forwarded down the USB stack. 
     * 
     * If an application passes <b>NULL</b> in the <i>Overlapped</i> parameter (synchronous operation), it must ensure that <i>LengthTransferred</i> is not <b>NULL</b>, even when an operation produces no output data.
     * 
     * If <i>Overlapped</i> is not <b>NULL</b> (asynchronous operation),  <i>LengthTransferred</i> can be set to <b>NULL</b>. For an overlapped operation (and if <i>LengthTransferred</i> is a non-<b>NULL</b> value), the value received in <i>LengthTransferred</i> after <b>WinUsb_WritePipe</b> returns is meaningless until the overlapped operation has completed. To retrieve the actual number of bytes returned, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a>.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
     * 
     * To write to  a pipe that is associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID <i>PipeID</i> corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor. For information about the layout of this field, see <b>Table 9-13</b> in "Universal Serial Bus Specification Revision 2.0" at <a href="https://www.microsoft.com/whdc/connect/usb/default.mspx">USB Technology</a>. In the <b>bEndpointAddress</b> field, Bit 7 indicates the direction of the endpoint: 0 for OUT; 1 for IN.
     * @param {Pointer<Byte>} Buffer A caller-allocated buffer that contains the data to write.
     * @param {Integer} BufferLength The number of bytes to write. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
     * @param {Pointer<UInt32>} LengthTransferred A pointer to a ULONG variable that receives the actual number of bytes that were written to the pipe. For more information, see Remarks.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to an OVERLAPPED structure, which is used for asynchronous operations. If this parameter is specified, <b>WinUsb_WritePipe</b> immediately returns, and the event is signaled when the operation is complete.
     * @returns {Integer} <b>WinUsb_WritePipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that an overlapped I/O operation is in progress but has not completed.  If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_PENDING, indicating that the operation is executing in the background. Call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a> to check the success or failure of the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The write operation initiated by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_writepipe">WinUsb_WritePipe</a> in the USB stack timed out before the operation could be completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writepipe
     */
    static WinUsb_WritePipe(InterfaceHandle, PipeID, Buffer, BufferLength, LengthTransferred, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_WritePipe", "ptr", InterfaceHandle, "char", PipeID, "ptr", Buffer, "uint", BufferLength, "ptr", LengthTransferred, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_ControlTransfer function transmits control data over a default control endpoint.
     * @remarks
     * A control request is always sent by the host to the default endpoint of a USB device but the recipient of the request can be the entire device, an interface, or an endpoint in the selected alternate setting. In the <b>WinUsb_ControlTransfer</b> call, the application must indicate the recipient through two parameters: <i>InterfaceHandle</i> and <i>SetupPacket</i>. 
     * 
     * If the recipient of a control request is the entire device, the first interface, or any endpoint in that interface, the application must use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. If the recipient is any other interface or its endpoint, then the application must obtain the WinUSB handle that is associated with the target interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>, and then call <b>WinUsb_ControlTransfer</b> by specifying the obtained interface handle.
     * 
     * As per Section 9.3 of the official USB specification, the setup token of a control transfer contains information about the request. For a WinUSB application, that setup token is described by using the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a> structure. 
     * 
     * Within the setup token, <b>bmRequestType</b> and <b>wIndex</b> fields are used to indicate the recipient of the request. Those fields correspond to <b>RequestType</b> and <b>Index</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a>, respectively. 
     * 
     * The lowest two bits of <b>RequestType</b> indicate the recipient of the request. The recipient can be the device, an interface, endpoint, or other (for vendor request). Depending on the recipient, the lower byte of <b>Index</b> indicates the device-defined index of the recipient. The value of <b>Index</b> depends on the type of request. For example, for standard control requests, the value is 0, or indicates the interface or endpoint number. For certain types of standard requests, such as a GET_DESCRIPTOR request to obtain a string descriptor, the <b>Index</b> value indicates the Language ID. 
     * 
     * If the recipient is the device, the application must set <b>RequestType</b> and <b>Index</b> values.  The lowest two bits of <b>RequestType</b> value must be 0. The lower byte of <b>Index</b> value depends on the type of request. The <i>InterfaceHandle</i> must be the WinUSB handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * 
     * If the recipient of the request is an interface, the application must set the lowest two bits of <b>RequestType</b> to 0x01. The application is not required to set the lower byte of <b>Index</b> for any type of request. For  standard, class, and vendor requests,  Winusb.sys sets the value to the interface number of the target interface. The <i>InterfaceHandle</i> must be associated with the target interface. The application can obtain that handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * 
     * If the recipient is an endpoint, the application must set the lowest two bits of <b>RequestType</b> to 0x02 and lower byte of Index to the endpoint address. In this case, <i>InterfaceHandle</i> is associated with the interface that contains the endpoint. The application can obtain that handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. 
     * 
     * To specify the recipient of  a control request as the entire device or the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, obtain the handle to the target interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>, and then call <b>WinUsb_ControlTransfer</b> by specifying the obtained interface handle.
     * @param {Pointer} SetupPacket The 8-byte setup packet of type <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a>.
     * @param {Pointer<Byte>} Buffer A caller-allocated buffer that contains the data to transfer. The length of this buffer must not exceed 4KB.
     * @param {Integer} BufferLength The number of bytes to transfer, not including the setup packet. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
     * @param {Pointer<UInt32>} LengthTransferred A pointer to a ULONG variable that receives the actual number of transferred bytes. If the application does not expect any data to be transferred during the
     *         data phase (<i>BufferLength</i> is zero),  <i>LengthTransferred</i> can be <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped An optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, which is used for asynchronous operations. If this parameter is specified, <b>WinUsb_ControlTransfer</b> immediately returns, and the event is signaled when the operation is complete. If <i>Overlapped</i> is not supplied, the <b>WinUsb_ControlTransfer</b> function transfers data synchronously.
     * @returns {Integer} <b>WinUsb_ControlTransfer</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_controltransfer
     */
    static WinUsb_ControlTransfer(InterfaceHandle, SetupPacket, Buffer, BufferLength, LengthTransferred, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ControlTransfer", "ptr", InterfaceHandle, "ptr", SetupPacket, "ptr", Buffer, "uint", BufferLength, "ptr", LengthTransferred, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_ResetPipe function resets the data toggle and clears the stall condition on a pipe.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
     * 
     * To reset a pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists in a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @returns {Integer} <b>WinUsb_ResetPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_resetpipe
     */
    static WinUsb_ResetPipe(InterfaceHandle, PipeID) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ResetPipe", "ptr", InterfaceHandle, "char", PipeID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_AbortPipe function aborts all of the pending transfers for a pipe. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
     * 
     * To abort transfers on the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @returns {Integer} <b>WinUsb_AbortPipe</b> returns <b>TRUE</b> if  the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>. 
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_abortpipe
     */
    static WinUsb_AbortPipe(InterfaceHandle, PipeID) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_AbortPipe", "ptr", InterfaceHandle, "char", PipeID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_FlushPipe function discards any data that is cached in a pipe. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the interface with which the specified pipe's endpoint is associated. To clear data in a pipe that is associated with the endpoint on the first (default) interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @returns {Integer} <b>WinUsb_FlushPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_flushpipe
     */
    static WinUsb_FlushPipe(InterfaceHandle, PipeID) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_FlushPipe", "ptr", InterfaceHandle, "char", PipeID, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_SetPowerPolicy function sets the power policy for a device.
     * @remarks
     * The following list summarizes the effects of changes to power management states:
     * 
     * <ul>
     * <li>
     * All pipe handles, interface handles, locks, and alternate settings are preserved across power management events.
     * 
     * </li>
     * <li>
     * Any transfers that are in progress are suspended when a device transfers to a low power state, and they are resumed when the device is restored to a working state.
     * 
     * </li>
     * <li>
     * The device and system must be in a working state before the client can restore a device-specific configuration. Clients can determine whether the device and system are in a working state from the WM_POWERBROADCAST message.
     * 
     * </li>
     * <li>
     * The client can indicate that an interface is idle by calling <b>WinUsb_SetPowerPolicy</b>. 
     * 
     * </li>
     * </ul>
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the first (default) interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Integer} PolicyType A value that specifies the power policy to set. The following table describes symbolic constants that are defined in winusbio.h. 
     * 
     * <table>
     * <tr>
     * <th>Policy parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * AUTO_SUSPEND
     * 
     * (0x81)
     * 
     * </td>
     * <td>
     * Specifies the auto-suspend policy type; the power policy parameter must be specified by the caller in the <i>Value</i> parameter.
     * 
     * For auto-suspend, the <i>Value</i> parameter must point to a UCHAR variable.  
     * 
     * If <i>Value</i> is <b>TRUE</b> (nonzero), the USB stack suspends the device if the device is idle.  A device is idle if there are no transfers pending, or if the only pending transfers are IN transfers to interrupt or bulk endpoints.  
     * 
     * The default value is determined by the value set in the <b>DefaultIdleState</b> registry setting. By default, this value is <b>TRUE</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SUSPEND_DELAY
     * 
     * (0x83)
     * 
     * </td>
     * <td>
     * Specifies the suspend-delay policy type; the power policy parameter must be specified by the caller in the <i>Value</i> parameter.
     * 
     * For suspend-delay, <i>Value</i> must point to a ULONG variable.  
     * 
     * <i>Value</i> specifies the minimum amount of time, in milliseconds, that the WinUSB driver must wait post transfer before it can suspend the device. 
     * 
     * The default value is determined by the value set in the <b>DefaultIdleTimeout</b> registry setting. By default, this value is five seconds.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ValueLength The size, in bytes, of the buffer at <i>Value</i>.
     * @param {Pointer<Void>} Value The new value for the power policy parameter. Datatype and value for <i>Value</i> depends on the type of power policy passed in <i>PolicyType</i>. For more information, see <i>PolicyType</i>.
     * @returns {Integer} <b>WinUsb_SetPowerPolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed an invalid size for the policy parameter buffer in the <i>ValueLength</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that there is insufficient memory to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setpowerpolicy
     */
    static WinUsb_SetPowerPolicy(InterfaceHandle, PolicyType, ValueLength, Value) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_SetPowerPolicy", "ptr", InterfaceHandle, "uint", PolicyType, "uint", ValueLength, "ptr", Value, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetPowerPolicy function retrieves the power policy for a device. This is a synchronous operation.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Integer} PolicyType A value that specifies the power policy parameter to retrieve in <i>Value</i>. The following table describes symbolic constants that are defined in <i>Winusbio.h</i>. 
     * 
     * <table>
     * <tr>
     * <th>Policy type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * AUTO_SUSPEND
     * 
     * (0x81)
     * 
     * </td>
     * <td>
     * If the caller specifies a power policy of AUTO_SUSPEND, <b>WinUsb_GetPowerPolicy</b> returns the value of the auto suspend policy parameter in the <i>Value</i> parameter.
     * 
     * If <i>Value</i> is <b>TRUE</b> (that is, nonzero), the USB stack suspends the device when no transfers are pending or the only transfers pending are IN transfers on an interrupt or bulk endpoint. 
     * 
     * The value of the <b>DefaultIdleState</b> registry value determines the default value of the auto suspend policy parameter.
     * 
     * The <i>Value</i> parameter must point to a UCHAR variable.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SUSPEND_DELAY
     * 
     * (0x83)
     * 
     * </td>
     * <td>
     * If the caller specifies a power policy of SUSPEND_DELAY, <b>WinUsb_GetPowerPolicy</b> returns the value of the suspend delay policy parameter in <i>Value</i>.
     * 
     * The suspend delay policy parameter specifies the minimum amount of time, in milliseconds, that the WinUSB driver must wait after any transfer before it can suspend the device. 
     * 
     * <i>Value</i> must point to a ULONG variable.  
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} ValueLength A pointer to the size of the buffer that <i>Value</i>. On output, <i>ValueLength</i> receives the size of the data that was copied into the <i>Value </i> buffer.
     * @param {Pointer<Void>} Value A buffer that receives the specified power policy parameter. For more information, see <i>PolicyType</i>.
     * @returns {Integer} <b>WinUsb_GetPowerPolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getpowerpolicy
     */
    static WinUsb_GetPowerPolicy(InterfaceHandle, PolicyType, ValueLength, Value) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetPowerPolicy", "ptr", InterfaceHandle, "uint", PolicyType, "ptr", ValueLength, "ptr", Value, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetOverlappedResult function retrieves the results of an overlapped operation on the specified file.
     * @remarks
     * This function is like the Win32 API routine, <b>GetOverlappedResult</b>, with one difference—instead of passing a file handle that is returned from <b>CreateFile</b>, the caller passes an interface handle that is returned from <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. The caller can use either API routine, if the appropriate handle is passed. The <b>WinUsb_GetOverlappedResult </b> function extracts the file handle from the interface handle and then calls <b>GetOverlappedResult</b>.
     * 
     * The results that are reported by the <b>WinUsb_GetOverlappedResult</b> function are those from the specified handle's last overlapped operation to which the specified <b>OVERLAPPED</b> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns <b>FALSE</b>, and the <b>GetLastError</b> routine returns ERROR_IO_PENDING. When an I/O operation is pending, the function that started the operation resets the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure to the nonsignaled state. Then when the pending operation has been completed, the system sets the event object to the signaled state.
     * 
     * The caller can specify that an event object is manually reset in the <b>OVERLAPPED</b> structure. If an automatic reset event object is used, the event handle must not be specified in any other wait operation in the interval between starting the overlapped operation and the call to <b>WinUsb_GetOverlappedResult</b>. For example, the event object is sometimes specified in one of the wait routines to wait for the operation to be completed. When the wait routine returns, the system sets an auto-reset event's state to nonsignaled, and a successive call to <b>WinUsb_GetOverlappedResult</b> with the <i>bWait</i> parameter set to <b>TRUE</b> causes the function to be blocked indefinitely.
     * 
     * If the <i>bWait</i> parameter is <b>TRUE</b>, <b>WinUsb_GetOverlappedResult</b> determines whether the pending operation has been completed by waiting for the event object to be in the signaled state.
     * 
     * If the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure is <b>NULL</b>, the system uses the state of the file handle to signal when the operation has been completed. Do not use file handles for this purpose. It is better to use an event object because of the confusion that can occur when multiple concurrent overlapped operations are performed on the same file. In this situation, you cannot know which operation caused the state of the object to be signaled.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <b>OVERLAPPED</b> structure that was specified when the overlapped operation was started.
     * @param {Pointer<UInt32>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes that were actually transferred by a read or write operation.
     * @param {Integer} bWait If this parameter is <b>TRUE</b>, the function does not return until the operation has been completed. If this parameter is <b>FALSE</b> and the operation is still pending, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_INCOMPLETE.
     * @returns {Integer} If the function succeeds, the return value is any number other than zero. If the function fails, the return value is zero. To get extended error information, call <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getoverlappedresult
     */
    static WinUsb_GetOverlappedResult(InterfaceHandle, lpOverlapped, lpNumberOfBytesTransferred, bWait) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetOverlappedResult", "ptr", InterfaceHandle, "ptr", lpOverlapped, "ptr", lpNumberOfBytesTransferred, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<USB_CONFIGURATION_DESCRIPTOR>} ConfigurationDescriptor 
     * @param {Pointer<Void>} StartPosition 
     * @param {Integer} InterfaceNumber 
     * @param {Integer} AlternateSetting 
     * @param {Integer} InterfaceClass 
     * @param {Integer} InterfaceSubClass 
     * @param {Integer} InterfaceProtocol 
     * @returns {Pointer<USB_INTERFACE_DESCRIPTOR>} 
     */
    static WinUsb_ParseConfigurationDescriptor(ConfigurationDescriptor, StartPosition, InterfaceNumber, AlternateSetting, InterfaceClass, InterfaceSubClass, InterfaceProtocol) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ParseConfigurationDescriptor", "ptr", ConfigurationDescriptor, "ptr", StartPosition, "int", InterfaceNumber, "int", AlternateSetting, "int", InterfaceClass, "int", InterfaceSubClass, "int", InterfaceProtocol, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DescriptorBuffer 
     * @param {Integer} TotalLength 
     * @param {Pointer<Void>} StartPosition 
     * @param {Integer} DescriptorType 
     * @returns {Pointer<USB_COMMON_DESCRIPTOR>} 
     */
    static WinUsb_ParseDescriptors(DescriptorBuffer, TotalLength, StartPosition, DescriptorType) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ParseDescriptors", "ptr", DescriptorBuffer, "uint", TotalLength, "ptr", StartPosition, "int", DescriptorType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetCurrentFrameNumber function gets the current frame number for the bus.
     * @remarks
     * The caller may compare the PerformanceCount with the value returned by the Win32 function <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> to determine if there has been a delay in transitioning back to user-mode after the frame number was read.  The caller can then adjust the starting frame number as needed.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle The handle to the device that <b>CreateFile</b> returned.
     * @param {Pointer<UInt32>} CurrentFrameNumber The current frame number value.
     * @param {Pointer<Int64>} TimeStamp The time stamp value when the current frame was read.
     * @returns {Integer} <b>WinUsb_GetCurrentFrameNumber</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentframenumber
     * @since windows8.1
     */
    static WinUsb_GetCurrentFrameNumber(InterfaceHandle, CurrentFrameNumber, TimeStamp) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetCurrentFrameNumber", "ptr", InterfaceHandle, "ptr", CurrentFrameNumber, "ptr", TimeStamp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetAdjustedFrameNumber function computes what the current USB frame number should be based on the frame number value and timestamp.
     * @param {Pointer<UInt32>} CurrentFrameNumber The frame number to be adjusted.
     * @param {Integer} TimeStamp The timestamp recorded at the time the frame        number was returned.
     * @returns {Integer} <b>WinUsb_GetAdjustedFrameNumber</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getadjustedframenumber
     * @since windows8.1
     */
    static WinUsb_GetAdjustedFrameNumber(CurrentFrameNumber, TimeStamp) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetAdjustedFrameNumber", "ptr", CurrentFrameNumber, "int64", TimeStamp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_RegisterIsochBuffer function registers a buffer to be used for isochronous transfers.
     * @remarks
     * Prior to initiating isochronous transfers to or from a buffer, the caller must register the buffer with <b>WinUsb_RegisterIsochBuffer</b>.  This call allows the Winusb.sys to pre-map and lock the buffer after for all subsequent transfers using the buffer.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle to an interface in the selected configuration. That handle must be created by a previous call to  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
     * @param {Integer} PipeID Derived from Bit 3...0 of the <b>bEndpointAddress</b> field in the endpoint descriptor.
     * @param {Pointer<Byte>} Buffer Pointer to the transfer buffer to be registered.
     * @param {Integer} BufferLength Length, in bytes, of the transfer buffer pointed to by <i>Buffer</i>.
     * @param {Pointer<Void>} IsochBufferHandle Receives an opaque handle to the registered buffer. This handle is required by other WinUSB functions that perform isochronous transfers. To release the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_unregisterisochbuffer">WinUsb_UnregisterIsochBuffer</a> function.
     * @returns {Integer} <b>WinUsb_RegisterIsochBuffer</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_registerisochbuffer
     * @since windows8.1
     */
    static WinUsb_RegisterIsochBuffer(InterfaceHandle, PipeID, Buffer, BufferLength, IsochBufferHandle) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_RegisterIsochBuffer", "ptr", InterfaceHandle, "char", PipeID, "ptr", Buffer, "uint", BufferLength, "ptr", IsochBufferHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_UnregisterIsochBuffer function releases all of the resources that WinUsb_RegisterIsochBuffer allocated for isochronous transfers. This is a synchronous operation.
     * @remarks
     * The caller must ensure that there are no pending transfers that is currently using the buffer before calling <b>WinUsb_UnregisterIsochBuffer</b>.  If there are pending transfers, <b>WinUsb_UnregisterIsochBuffer</b> blocks until those transfers are complete.
     * @param {Pointer<Void>} IsochBufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
     * @returns {Integer} <b>WinUsb_UnregisterIsochBuffer</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_unregisterisochbuffer
     * @since windows8.1
     */
    static WinUsb_UnregisterIsochBuffer(IsochBufferHandle) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_UnregisterIsochBuffer", "ptr", IsochBufferHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_WriteIsochPipe function writes the contents of a caller-supplied buffer to an isochronous OUT endpoint, starting on a specified frame number.
     * @remarks
     * <b>WinUsb_WriteIsochPipe</b> packetizes the transfer buffer so that in each 1ms interval, the host can send the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
     * If the caller submits multiple write requests to stream data to the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
     * 
     * 
     * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
     * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
     * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
     * @param {Integer} Length Length in bytes of the transfer buffer.
     * @param {Pointer<UInt32>} FrameNumber On input, indicates the starting frame number for the transfer. On output, contains the frame number of the frame that follows the last frame used in the transfer.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
     * @returns {Integer} <b>WinUsb_WriteIsochPipe</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writeisochpipe
     * @since windows8.1
     */
    static WinUsb_WriteIsochPipe(BufferHandle, Offset, Length, FrameNumber, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_WriteIsochPipe", "ptr", BufferHandle, "uint", Offset, "uint", Length, "ptr", FrameNumber, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_ReadIsochPipe function reads data from an isochronous OUT endpoint.
     * @remarks
     * <b>WinUsb_ReadIsochPipe</b> packetizes the transfer buffer so that in each 1ms interval, the host can receive the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
     * If the caller submits multiple read requests to stream data from the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
     * 
     * 
     * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
     * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
     * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
     * @param {Integer} Length Length in bytes of the transfer buffer.
     * @param {Pointer<UInt32>} FrameNumber On input, indicates the starting frame number for the transfer. On output, contains the frame number of the frame that follows the last frame used in the transfer.
     * @param {Integer} NumberOfPackets Total number of isochronous packets required to hold the transfer buffer. Also indicates the number of elements in the array pointed to by <i>IsoPacketDescriptors</i>.
     * @param {Pointer<USBD_ISO_PACKET_DESCRIPTOR>} IsoPacketDescriptors An array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_usbd_iso_packet_descriptor">USBD_ISO_PACKET_DESCRIPTOR</a> structures.  After the transfer completes, each element contains the status and size of the isochronous packet.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
     * @returns {Integer} <b>WinUsb_ReadIsochPipe</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readisochpipe
     * @since windows8.1
     */
    static WinUsb_ReadIsochPipe(BufferHandle, Offset, Length, FrameNumber, NumberOfPackets, IsoPacketDescriptors, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ReadIsochPipe", "ptr", BufferHandle, "uint", Offset, "uint", Length, "ptr", FrameNumber, "uint", NumberOfPackets, "ptr", IsoPacketDescriptors, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_WriteIsochPipeAsap submits a request for writing the contents of a buffer to an isochronous OUT endpoint.
     * @remarks
     * <b>WinUsb_WriteIsochPipeAsap</b> allows the USB driver stack to choose the starting frame number for the transfer. If one or more transfers are already pending on the endpoint, the transfer will be scheduled for the frame number immediately following the last frame number of the last currently pending transfer.
     * 
     * 
     * <b>WinUsb_WriteIsochPipeAsap</b> packetizes the transfer buffer so that in each 1ms interval, the host can send the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
     * If the caller submits multiple write requests to stream data to the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
     * 
     * 
     * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
     * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
     * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
     * @param {Integer} Length Length in bytes of the transfer buffer.
     * @param {Integer} ContinueStream Indicates that the transfer should only be submitted if it can be scheduled in the first frame after the last pending transfer.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
     * @returns {Integer} <b>WinUsb_WriteIsochPipeAsap</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writeisochpipeasap
     * @since windows8.1
     */
    static WinUsb_WriteIsochPipeAsap(BufferHandle, Offset, Length, ContinueStream, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_WriteIsochPipeAsap", "ptr", BufferHandle, "uint", Offset, "uint", Length, "int", ContinueStream, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_ReadIsochPipeAsap function submits a request that reads data from an isochronous OUT endpoint.
     * @remarks
     * <b>WinUsb_ReadIsochPipeAsap</b> allows the USB driver stack to choose the starting frame number for the transfer. If one or more transfers are already pending on the endpoint, the transfer will be scheduled for the frame number immediately following the last frame number of the last currently pending transfer.
     * 
     * 
     * <b>WinUsb_ReadIsochPipeAsap</b> packetizes the transfer buffer so that in each interval,  the host can receive the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
     * If the caller submits multiple read requests to stream data from the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
     * 
     * 
     * 
     * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
     * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
     * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
     * @param {Integer} Length Length in bytes of the transfer buffer.
     * @param {Integer} ContinueStream Indicates that the transfer  should only be submitted if it can be scheduled in the first frame after the last pending transfer.
     * @param {Integer} NumberOfPackets Total number of isochronous packets required to hold the transfer buffer. Also indicates the number of elements in the array pointed to by <i>IsoPacketDescriptors</i>.
     * @param {Pointer<USBD_ISO_PACKET_DESCRIPTOR>} IsoPacketDescriptors An array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_usbd_iso_packet_descriptor">USBD_ISO_PACKET_DESCRIPTOR</a> that receives the details of each isochronous packet in the transfer.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
     * @returns {Integer} <b>WinUsb_ReadIsochPipeAsap</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readisochpipeasap
     * @since windows8.1
     */
    static WinUsb_ReadIsochPipeAsap(BufferHandle, Offset, Length, ContinueStream, NumberOfPackets, IsoPacketDescriptors, Overlapped) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_ReadIsochPipeAsap", "ptr", BufferHandle, "uint", Offset, "uint", Length, "int", ContinueStream, "uint", NumberOfPackets, "ptr", IsoPacketDescriptors, "ptr", Overlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_StartTrackingForTimeSync function starts the time synchronization feature in the USB driver stack that gets the associated system QPC time for USB bus frames and microframes.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Pointer<USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION>} StartTrackingInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_start_tracking_for_time_sync_information">USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION</a> structure. Set <b>TimeTrackingHandle</b> to INAVLID_HANDLE.
     * Set <b>IsStartupDelayTolerable</b> to TRUE if the initial startup latency of up to 2.048 seconds is tolerable. FALSE, the registration is delayed until the USB driver stack is able to detect a valid frame or microframe boundary.
     * @returns {Integer} <b>WinUsb_StartTrackingForTimeSync</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>StartTrackingInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_starttrackingfortimesync
     * @since windows10.0.10240
     */
    static WinUsb_StartTrackingForTimeSync(InterfaceHandle, StartTrackingInfo) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_StartTrackingForTimeSync", "ptr", InterfaceHandle, "ptr", StartTrackingInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_GetCurrentFrameNumberAndQpc function retrieves the system query performance counter (QPC) value synchronized with the frame and microframe.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Pointer<USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION>} FrameQpcInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_frame_number_and_qpc_for_time_sync_information">USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION</a> structure. On output, <b>CurrentQueryPerformanceCounter</b> set to the system QPC  value (in microseconds) predicted by the USB driver stack. Optionally, on input, the caller can specify a frame and microframe number for which to retrieve the QPC value. 
     * 
     * On output, the <b>QueryPerformanceCounterAtInputFrameOrMicroFrame</b> member  is set to the QPC value for that frame or microframe.
     * @returns {Integer} <b>WinUsb_GetCurrentFrameNumberAndQpc</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>FrameQpcInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentframenumberandqpc
     * @since windows10.0.10240
     */
    static WinUsb_GetCurrentFrameNumberAndQpc(InterfaceHandle, FrameQpcInfo) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_GetCurrentFrameNumberAndQpc", "ptr", InterfaceHandle, "ptr", FrameQpcInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinUsb_StopTrackingForTimeSync function tops the time synchronization feature in the USB driver stack that gets the associated system QPC time for USB bus frames and microframes.
     * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
     * @param {Pointer<HANDLE>} StopTrackingInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_stop_tracking_for_time_sync_information">USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION</a> structure. Set <b>TimeTrackingHandle</b> to the handle received in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_starttrackingfortimesync">WinUsb_StartTrackingForTimeSync</a>.
     * @returns {Integer} <b>WinUsb_StopTrackingForTimeSync</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
     * 
     * 
     * <b>GetLastError</b>    can return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>StopTrackingInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_stoptrackingfortimesync
     * @since windows10.0.10240
     */
    static WinUsb_StopTrackingForTimeSync(InterfaceHandle, StopTrackingInfo) {
        A_LastError := 0

        result := DllCall("WINUSB.dll\WinUsb_StopTrackingForTimeSync", "ptr", InterfaceHandle, "ptr", StopTrackingInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
