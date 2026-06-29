#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Usb
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_SPEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LowSpeed := 1

/**
 * @type {Integer (UInt32)}
 */
export global FullSpeed := 2

/**
 * @type {Integer (UInt32)}
 */
export global HighSpeed := 3

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_TRANSFER_IN := 2277389

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_TRANSFER_IN_APPEND_ZERO_PKT := 2277393

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_TRANSFER_OUT := 2277398

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_CONTROL_STATUS_HANDSHAKE_IN := 2277400

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_CONTROL_STATUS_HANDSHAKE_OUT := 2277404

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_GET_CLASS_INFO := 2277410

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_GET_PIPE_STATE := 2277414

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_SET_PIPE_STATE := 2277417

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_ACTIVATE_USB_BUS := 2277420

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_DEACTIVATE_USB_BUS := 2277424

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_BUS_EVENT_NOTIFICATION := 2277430

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_GET_CLASS_INFO_EX := 2277434

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_GET_INTERFACE_DESCRIPTOR_SET := 2277438

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GENERICUSBFN_REGISTER_USB_STRING := 2277441

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_CONTROLLER_INFO_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_CONTROLLER_DRIVER_KEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_PASS_THRU := 3

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_POWER_STATE_MAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_BANDWIDTH_INFORMATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_BUS_STATISTICS_0 := 6

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_ROOTHUB_SYMBOLIC_NAME := 7

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_USB_DRIVER_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_USB2_HW_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_USB_REFRESH_HCT_REG := 10

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_SEND_ONE_PACKET := 268435457

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_RAW_RESET_PORT := 536870913

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_OPEN_RAW_DEVICE := 536870914

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_CLOSE_RAW_DEVICE := 536870915

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_SEND_RAW_COMMAND := 536870916

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_SET_ROOTPORT_FEATURE := 536870917

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_CLEAR_ROOTPORT_FEATURE := 536870918

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_GET_ROOTPORT_STATUS := 536870919

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_INVALID_REQUEST := 4294967280

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_MASK_DEVONLY_API := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global USBUSER_OP_MASK_HCTEST_API := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_LOW_SPEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_FULL_SPEED := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_HIGH_SPEED := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_ASYNC_IN := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_ASYNC_OUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_ISO_IN := 32

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_ISO_OUT := 64

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_SETUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_TOGGLE0 := 256

/**
 * @type {Integer (UInt32)}
 */
export global USB_PACKETFLAG_TOGGLE1 := 512

/**
 * @type {Integer (UInt32)}
 */
export global USB_HC_FEATURE_FLAG_PORT_POWER_SWITCHING := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_HC_FEATURE_FLAG_SEL_SUSPEND := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_HC_FEATURE_LEGACY_BIOS := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_HC_FEATURE_TIME_SYNC_API := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUBMIT_URB := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_RESET_PORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_ROOTHUB_PDO := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_PORT_STATUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENABLE_PORT := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_COUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_CYCLE_PORT := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_NAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_IDLE_NOTIFICATION := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_RECORD_FAILURE := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_BUS_INFO := 264

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_CONTROLLER_NAME := 265

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_BUSGUID_INFO := 266

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_PARENT_HUB_INFO := 267

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_DEVICE_HANDLE := 268

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_DEVICE_HANDLE_EX := 269

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_TT_DEVICE_HANDLE := 270

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_TOPOLOGY_ADDRESS := 271

/**
 * @type {Integer (UInt32)}
 */
export global USB_IDLE_NOTIFICATION_EX := 272

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQ_GLOBAL_SUSPEND := 273

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQ_GLOBAL_RESUME := 274

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_CONFIG_INFO := 275

/**
 * @type {Integer (UInt32)}
 */
export global USB_FAIL_GET_STATUS := 280

/**
 * @type {Integer (UInt32)}
 */
export global USB_REGISTER_COMPOSITE_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_UNREGISTER_COMPOSITE_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_REMOTE_WAKE_NOTIFICATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global HCD_GET_STATS_1 := 255

/**
 * @type {Integer (UInt32)}
 */
export global HCD_DIAGNOSTIC_MODE_ON := 256

/**
 * @type {Integer (UInt32)}
 */
export global HCD_DIAGNOSTIC_MODE_OFF := 257

/**
 * @type {Integer (UInt32)}
 */
export global HCD_GET_ROOT_HUB_NAME := 258

/**
 * @type {Integer (UInt32)}
 */
export global HCD_GET_DRIVERKEY_NAME := 265

/**
 * @type {Integer (UInt32)}
 */
export global HCD_GET_STATS_2 := 266

/**
 * @type {Integer (UInt32)}
 */
export global HCD_DISABLE_PORT := 268

/**
 * @type {Integer (UInt32)}
 */
export global HCD_ENABLE_PORT := 269

/**
 * @type {Integer (UInt32)}
 */
export global HCD_USER_REQUEST := 270

/**
 * @type {Integer (UInt32)}
 */
export global HCD_TRACE_READ_REQUEST := 275

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_INFORMATION := 258

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_INFORMATION := 259

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION := 260

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_NAME := 261

/**
 * @type {Integer (UInt32)}
 */
export global USB_DIAG_IGNORE_HUBS_ON := 262

/**
 * @type {Integer (UInt32)}
 */
export global USB_DIAG_IGNORE_HUBS_OFF := 263

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_DRIVERKEY_NAME := 264

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_CAPABILITIES := 271

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_ATTRIBUTES := 272

/**
 * @type {Integer (UInt32)}
 */
export global USB_HUB_CYCLE_PORT := 273

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_INFORMATION_EX := 274

/**
 * @type {Integer (UInt32)}
 */
export global USB_RESET_HUB := 275

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_CAPABILITIES_EX := 276

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_HUB_INFORMATION_EX := 277

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_PORT_CONNECTOR_PROPERTIES := 278

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_INFORMATION_EX_V2 := 279

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_TRANSPORT_CHARACTERISTICS := 281

/**
 * @type {Integer (UInt32)}
 */
export global USB_REGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE := 282

/**
 * @type {Integer (UInt32)}
 */
export global USB_NOTIFY_ON_TRANSPORT_CHARACTERISTICS_CHANGE := 283

/**
 * @type {Integer (UInt32)}
 */
export global USB_UNREGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE := 284

/**
 * @type {Integer (UInt32)}
 */
export global USB_START_TRACKING_FOR_TIME_SYNC := 285

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC := 286

/**
 * @type {Integer (UInt32)}
 */
export global USB_STOP_TRACKING_FOR_TIME_SYNC := 287

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_DEVICE_CHARACTERISTICS := 288

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_NODE_CONNECTION_SUPERSPEEDPLUS_INFORMATION := 289

/**
 * @type {Integer (UInt32)}
 */
export global USB_RESERVED_USER_BASE := 1024

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_USB_HUB := Guid("{f18a0e88-c30c-11d0-8815-00a0c906bed8}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_USB_BILLBOARD := Guid("{5e9adaef-f879-473f-b807-4e5ea77d1b1c}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_USB_DEVICE := Guid("{a5dcbf10-6530-11d2-901f-00c04fb951ed}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_USB_HOST_CONTROLLER := Guid("{3abf6f2d-71c4-462a-8a92-1e6861e6af27}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_STD_DATA := Guid("{4e623b20-cb14-11d1-b331-00a0c959bbd2}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_STD_NOTIFICATION := Guid("{4e623b20-cb14-11d1-b331-00a0c959bbd2}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_DEVICE_PERF_INFO := Guid("{66c1aa3c-499f-49a0-a9a5-61e2359f6407}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_NODE_INFO := Guid("{9c179357-dc7a-4f41-b66b-323b9ddcb5b1}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_TRACING := Guid("{3a61881b-b4e6-4bf9-ae0f-3cd8f394e52f}")

/**
 * @type {Guid}
 */
export global GUID_USB_TRANSFER_TRACING := Guid("{681eb8aa-403d-452c-9f8a-f0616fac9540}")

/**
 * @type {Guid}
 */
export global GUID_USB_PERFORMANCE_TRACING := Guid("{d5de77a6-6ae9-425c-b1e2-f5615fd348a9}")

/**
 * @type {Guid}
 */
export global GUID_USB_WMI_SURPRISE_REMOVAL_NOTIFICATION := Guid("{9bbbf831-a2f2-43b4-96d1-86944b5914b3}")

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_USB := 34

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_HOST_TO_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_DEVICE_TO_HOST := 1

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_STANDARD := 0

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_CLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_VENDOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_TO_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_TO_INTERFACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_TO_ENDPOINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global BMREQUEST_TO_OTHER := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_STATUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_CLEAR_FEATURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_FEATURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_ADDRESS := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_DESCRIPTOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_DESCRIPTOR := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_CONFIGURATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_CONFIGURATION := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_INTERFACE := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_INTERFACE := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SYNC_FRAME := 12

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_FIRMWARE_STATUS := 26

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_FIRMWARE_STATUS := 27

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_FIRMWARE_ALLOWED_OR_DISALLOWED_STATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_GET_FIRMWARE_HASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_FIRMWARE_HASH_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global USB_DISALLOW_FIRMWARE_UPDATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_ALLOW_FIRMWARE_UPDATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_SEL := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_ISOCH_DELAY := 49

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_DESCRIPTOR_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIGURATION_DESCRIPTOR_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_STRING_DESCRIPTOR_TYPE := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_INTERFACE_DESCRIPTOR_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_DESCRIPTOR_TYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_OTHER_SPEED_CONFIGURATION_DESCRIPTOR_TYPE := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_INTERFACE_POWER_DESCRIPTOR_TYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EUSB2_ISOCH_ENDPOINT_COMPANION_DESCRIPTOR_TYPE := 18

/**
 * @type {Integer (UInt32)}
 */
export global USB_OTG_DESCRIPTOR_TYPE := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEBUG_DESCRIPTOR_TYPE := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_INTERFACE_ASSOCIATION_DESCRIPTOR_TYPE := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_BOS_DESCRIPTOR_TYPE := 15

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_DESCRIPTOR_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPERSPEED_ENDPOINT_COMPANION_DESCRIPTOR_TYPE := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPERSPEEDPLUS_ISOCH_ENDPOINT_COMPANION_DESCRIPTOR_TYPE := 49

/**
 * @type {Integer (UInt32)}
 */
export global USB_RESERVED_DESCRIPTOR_TYPE := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_POWER_DESCRIPTOR_TYPE := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_ENDPOINT_STALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_REMOTE_WAKEUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_TEST_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_FUNCTION_SUSPEND := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_U1_ENABLE := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_U2_ENABLE := 49

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_LTM_ENABLE := 50

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_LDM_ENABLE := 53

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_BATTERY_WAKE_MASK := 40

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_OS_IS_PD_AWARE := 41

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_POLICY_MODE := 42

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_CHARGING_POLICY := 54

/**
 * @type {Integer (UInt32)}
 */
export global USB_CHARGING_POLICY_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_CHARGING_POLICY_ICCHPF := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_CHARGING_POLICY_ICCLPF := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_CHARGING_POLICY_NO_POWER := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_STATUS_PORT_STATUS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_STATUS_PD_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_STATUS_EXT_PORT_STATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_GETSTATUS_SELF_POWERED := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_GETSTATUS_REMOTE_WAKEUP_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_GETSTATUS_U1_ENABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_GETSTATUS_U2_ENABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_GETSTATUS_LTM_ENABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_RESERVED := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_AUDIO := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_COMMUNICATIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_HUMAN_INTERFACE := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_MONITOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_PHYSICAL_INTERFACE := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_POWER := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_IMAGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_PRINTER := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_STORAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_HUB := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_CDC_DATA := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_SMART_CARD := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_CONTENT_SECURITY := 13

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_VIDEO := 14

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_PERSONAL_HEALTHCARE := 15

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_AUDIO_VIDEO := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_BILLBOARD := 17

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_DIAGNOSTIC_DEVICE := 220

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_WIRELESS_CONTROLLER := 224

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_MISCELLANEOUS := 239

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_APPLICATION_SPECIFIC := 254

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CLASS_VENDOR_SPECIFIC := 255

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_WIRELESS_USB := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_USB20_EXTENSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_USB := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_CONTAINER_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_PLATFORM := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_POWER_DELIVERY := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_BATTERY_INFO := 7

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_PD_CONSUMER_PORT := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_PD_PROVIDER_PORT := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_PRECISION_TIME_MEASUREMENT := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_BILLBOARD := 13

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_FIRMWARE_STATUS := 17

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_USB20_EXTENSION_BMATTRIBUTES_RESERVED_MASK := 4294901985

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_BMATTRIBUTES_RESERVED_MASK := 253

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_BMATTRIBUTES_LTM_CAPABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_RESERVED_MASK := 65520

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_LOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_FULL := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_HIGH := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_SPEEDS_SUPPORTED_SUPER := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_U1_DEVICE_EXIT_MAX_VALUE := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEED_U2_DEVICE_EXIT_MAX_VALUE := 2047

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_MAX_U1_LATENCY := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_MAX_U2_LATENCY := 2047

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_BPS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_KBPS := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_MBPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_LSE_GBPS := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_MODE_SYMMETRIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_MODE_ASYMMETRIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_DIR_RX := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_DIR_TX := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_PROTOCOL_SS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED_PROTOCOL_SSP := 1

/**
 * @type {Guid}
 */
export global GUID_USB_MSOS20_PLATFORM_CAPABILITY_ID := Guid("{d8dd60df-4589-4cc7-9cd2-659d9e648a9f}")

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_POWERED_MASK := 192

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_BUS_POWERED := 128

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_SELF_POWERED := 64

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_REMOTE_WAKEUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global USB_CONFIG_RESERVED := 31

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_DIRECTION_MASK := 128

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_ADDRESS_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_CONTROL := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_BULK := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_INTERRUPT := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_BULK_RESERVED_MASK := 252

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_CONTROL_RESERVED_MASK := 252

/**
 * @type {Integer (UInt32)}
 */
export global USB_20_ENDPOINT_TYPE_INTERRUPT_RESERVED_MASK := 252

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_RESERVED_MASK := 204

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_RESERVED_MASK := 192

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_MASK := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_PERIODIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_NOTIFICATION := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_RESERVED10 := 32

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_ENDPOINT_TYPE_INTERRUPT_USAGE_RESERVED11 := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_MASK := 12

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_NO_SYNCHRONIZATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_ASYNCHRONOUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_ADAPTIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_SYNCHRONIZATION_SYNCHRONOUS := 12

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_MASK := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_DATA_ENDOINT := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_FEEDBACK_ENDPOINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_IMPLICIT_FEEDBACK_DATA_ENDPOINT := 32

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_TYPE_ISOCHRONOUS_USAGE_RESERVED := 48

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_SUPERSPEED_BULK_MAX_PACKET_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_SUPERSPEED_CONTROL_MAX_PACKET_SIZE := 512

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_SUPERSPEED_ISO_MAX_PACKET_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global USB_ENDPOINT_SUPERSPEED_INTERRUPT_MAX_PACKET_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_USB_STRING_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPERSPEED_ISOCHRONOUS_MAX_MULTIPLIER := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPERSPEEDPLUS_ISOCHRONOUS_MIN_BYTESPERINTERVAL := 49153

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPERSPEEDPLUS_ISOCHRONOUS_MAX_BYTESPERINTERVAL := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global USB_HIGHSPEED_EUSB2_ISOCHRONOUS_MIN_BYTESPERINTERVAL := 3073

/**
 * @type {Integer (UInt32)}
 */
export global USB_HIGHSPEED_EUSB2_ISOCHRONOUS_MAX_BYTESPERINTERVAL := 6144

/**
 * @type {Integer (UInt32)}
 */
export global USB_20_HUB_DESCRIPTOR_TYPE := 41

/**
 * @type {Integer (UInt32)}
 */
export global USB_30_HUB_DESCRIPTOR_TYPE := 42

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_CLEAR_TT_BUFFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_RESET_TT := 9

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_TT_STATE := 10

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_STOP_TT := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_SET_HUB_DEPTH := 12

/**
 * @type {Integer (UInt32)}
 */
export global USB_REQUEST_GET_PORT_ERR_COUNT := 13

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_CONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_SUSPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_OVER_CURRENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_RESET := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_POWER := 256

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_LOW_SPEED := 512

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORT_STATUS_HIGH_SPEED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_U0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_U1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_U2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_U3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_DISABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_RX_DETECT := 5

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_INACTIVE := 6

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_POLLING := 7

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_RECOVERY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_HOT_RESET := 9

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_COMPLIANCE_MODE := 10

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_LOOPBACK := 11

/**
 * @type {Integer (UInt32)}
 */
export global PORT_LINK_STATE_TEST_MODE := 11

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_INTERFACE_POWER_D0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_INTERFACE_POWER_D1 := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_INTERFACE_POWER_D2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_FEATURE_INTERFACE_POWER_D3 := 5

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D0_COMMAND := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D1_COMMAND := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D2_COMMAND := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D3_COMMAND := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D1_WAKEUP := 16

/**
 * @type {Integer (UInt32)}
 */
export global USB_SUPPORT_D2_WAKEUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global USBDI_VERSION := 1536

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_NO_CONNECTOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_SHARED_USB2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_MINI_CONNECTOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_OEM_CONNECTOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_OWNED_BY_CC := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global USB_PORTATTR_NO_OVERCURRENT_UI := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEFAULT_DEVICE_ADDRESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEFAULT_ENDPOINT_ADDRESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEFAULT_MAX_PACKET := 64

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SELECT_CONFIGURATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SELECT_INTERFACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_ABORT_PIPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_TAKE_FRAME_LENGTH_CONTROL := 3

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RELEASE_FRAME_LENGTH_CONTROL := 4

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_FRAME_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_FRAME_LENGTH := 6

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_CURRENT_FRAME_NUMBER := 7

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CONTROL_TRANSFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER := 9

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_ISOCH_TRANSFER := 10

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_DESCRIPTOR_FROM_DEVICE := 11

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_DESCRIPTOR_TO_DEVICE := 12

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_FEATURE_TO_DEVICE := 13

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_FEATURE_TO_INTERFACE := 14

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_FEATURE_TO_ENDPOINT := 15

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLEAR_FEATURE_TO_DEVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLEAR_FEATURE_TO_INTERFACE := 17

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLEAR_FEATURE_TO_ENDPOINT := 18

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_STATUS_FROM_DEVICE := 19

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_STATUS_FROM_INTERFACE := 20

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_STATUS_FROM_ENDPOINT := 21

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVED_0X0016 := 22

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_VENDOR_DEVICE := 23

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_VENDOR_INTERFACE := 24

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_VENDOR_ENDPOINT := 25

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLASS_DEVICE := 26

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLASS_INTERFACE := 27

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLASS_ENDPOINT := 28

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X001D := 29

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SYNC_RESET_PIPE_AND_CLEAR_STALL := 30

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLASS_OTHER := 31

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_VENDOR_OTHER := 32

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_STATUS_FROM_OTHER := 33

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLEAR_FEATURE_TO_OTHER := 34

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_FEATURE_TO_OTHER := 35

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_DESCRIPTOR_FROM_ENDPOINT := 36

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_DESCRIPTOR_TO_ENDPOINT := 37

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_CONFIGURATION := 38

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_INTERFACE := 39

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_DESCRIPTOR_FROM_INTERFACE := 40

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SET_DESCRIPTOR_TO_INTERFACE := 41

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X002B := 43

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X002C := 44

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X002D := 45

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X002E := 46

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X002F := 47

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_MS_FEATURE_DESCRIPTOR := 42

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SYNC_RESET_PIPE := 48

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_SYNC_CLEAR_STALL := 49

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CONTROL_TRANSFER_EX := 50

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X0033 := 51

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESERVE_0X0034 := 52

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_OPEN_STATIC_STREAMS := 53

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_CLOSE_STATIC_STREAMS := 54

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_BULK_OR_INTERRUPT_TRANSFER_USING_CHAINED_MDL := 55

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_ISOCH_TRANSFER_USING_CHAINED_MDL := 56

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_GET_ISOCH_PIPE_TRANSFER_PATH_DELAYS := 61

/**
 * @type {Integer (UInt32)}
 */
export global URB_FUNCTION_RESET_PIPE := 30

/**
 * @type {Integer (UInt32)}
 */
export global USBD_SHORT_TRANSFER_OK := 2

/**
 * @type {Integer (UInt32)}
 */
export global USBD_START_ISO_TRANSFER_ASAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global USBD_DEFAULT_PIPE_TRANSFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global USBD_TRANSFER_DIRECTION_OUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global USBD_TRANSFER_DIRECTION_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global USBD_TRANSFER_DIRECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global USBD_ISO_START_FRAME_RANGE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global USBD_DEFAULT_MAXIMUM_TRANSFER_SIZE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_CHANGE_MAX_PACKET := 1

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_SHORT_PACKET_OPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_ENABLE_RT_THREAD_ACCESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_MAP_ADD_TRANSFERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_VIDEO_PRIORITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_VOICE_PRIORITY := 32

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_INTERACTIVE_PRIORITY := 48

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_PRIORITY_MASK := 240

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_HANDLES_SSP_HIGH_BANDWIDTH_ISOCH := 256

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PF_SSP_HIGH_BANDWIDTH_ISOCH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global OS_STRING_DESCRIPTOR_INDEX := 238

/**
 * @type {Integer (UInt32)}
 */
export global MS_GENRE_DESCRIPTOR_INDEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global MS_POWER_DESCRIPTOR_INDEX := 2

/**
 * @type {String}
 */
export global MS_OS_STRING_SIGNATURE := "MSFT100"

/**
 * @type {Integer (UInt32)}
 */
export global MS_OS_FLAGS_CONTAINERID := 2

/**
 * @type {Integer (UInt32)}
 */
export global URB_OPEN_STATIC_STREAMS_VERSION_100 := 256

/**
 * @type {Integer (UInt32)}
 */
export global USB4_MAX_DEPTH := 6

/**
 * @type {Integer (UInt32)}
 */
export global USB4_CONFIGURATION_REGISTERS_DW_LENGTH := 60

/**
 * @type {Guid}
 */
export global USB4_HRD_DEBUG_INTERFACE := Guid("{981fca05-60d3-4bb3-898e-497c580c4fb3}")

/**
 * @type {String}
 */
export global USB4_HRD_DEBUG_INTERFACE_REFERENCE_STRING := "\DEBUGINTERFACE"

/**
 * @type {Integer (UInt32)}
 */
export global USB4_HRD_DEBUG_FUNCTION_READ_CONFIGURATION_SPACE := 1131

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB4_HRD_DEBUG_READ_CONFIGURATION_SPACE := 6295980

/**
 * @type {String}
 */
export global KREGUSBFNENUMPATH := "\Registry\Machine\SYSTEM\CurrentControlSet\Control\USBFN\"

/**
 * @type {String}
 */
export global UREGUSBFNENUMPATH := "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\USBFN\"

/**
 * @type {String}
 */
export global KREGMANUSBFNENUMPATH := "\Registry\Machine\SYSTEM\CurrentControlSet\Control\ManufacturingMode\Current\USBFN\"

/**
 * @type {String}
 */
export global UREGMANUSBFNENUMPATH := "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ManufacturingMode\Current\USBFN\"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NUM_USBFN_ENDPOINTS := 15

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CONFIGURATION_NAME_LENGTH := 40

/**
 * @type {Integer (UInt32)}
 */
export global MAX_USB_STRING_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SUPPORTED_CONFIGURATIONS := 12

/**
 * @type {Integer (UInt32)}
 */
export global USBFN_INTERRUPT_ENDPOINT_SIZE_NOT_UPDATEABLE_MASK := 128

/**
 * @type {Integer (UInt32)}
 */
export global USB_TEST_MODE_TEST_J := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_TEST_MODE_TEST_K := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_TEST_MODE_TEST_SE0_NAK := 3

/**
 * @type {Integer (UInt32)}
 */
export global USB_TEST_MODE_TEST_PACKET := 4

/**
 * @type {Integer (UInt32)}
 */
export global USB_TEST_MODE_TEST_FORCE_ENABLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAX_INTERFACE_NAME_LENGTH := 40

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ALTERNATE_NAME_LENGTH := 40

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ASSOCIATION_NAME_LENGTH := 40

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_SUBMIT_URB := 2228227

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_RESET_PORT := 2228231

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_ROOTHUB_PDO := 2228239

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PORT_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global USBD_PORT_CONNECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_PORT_STATUS := 2228243

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_ENABLE_PORT := 2228247

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_HUB_COUNT := 2228251

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_CYCLE_PORT := 2228255

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_HUB_NAME := 2228256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_BUS_INFO := 2229280

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_CONTROLLER_NAME := 2229284

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_BUSGUID_INFO := 2229288

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_PARENT_HUB_INFO := 2229292

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_SUBMIT_IDLE_NOTIFICATION := 2228263

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_DEVICE_HANDLE := 2229299

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_NOTIFY_IDLE_READY := 2229315

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_REQ_GLOBAL_SUSPEND := 2229319

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_REQ_GLOBAL_RESUME := 2229323

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_RECORD_FAILURE := 2228267

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_DEVICE_HANDLE_EX := 2229303

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_TT_DEVICE_HANDLE := 2229307

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_TOPOLOGY_ADDRESS := 2229311

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_GET_DEVICE_CONFIG_INFO := 2229327

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_REGISTER_COMPOSITE_DEVICE := 4784131

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_UNREGISTER_COMPOSITE_DEVICE := 4784135

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_REQUEST_REMOTE_WAKE_NOTIFICATION := 4784139

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_USB_FAIL_GET_STATUS_FROM_DEVICE := 2229347

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_HCD_GET_STATS_1 := 2229244

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_HCD_GET_STATS_2 := 2229288

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_HCD_DISABLE_PORT := 2229296

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_HCD_ENABLE_PORT := 2229300

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_DIAGNOSTIC_MODE_ON := 2229248

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_DIAGNOSTIC_MODE_OFF := 2229252

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_ROOT_HUB_NAME := 2229256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_HCD_DRIVERKEY_NAME := 2229284

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_INFORMATION := 2229256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_INFORMATION := 2229260

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_DESCRIPTOR_FROM_NODE_CONNECTION := 2229264

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_NAME := 2229268

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_DIAG_IGNORE_HUBS_ON := 2229272

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_DIAG_IGNORE_HUBS_OFF := 2229276

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_DRIVERKEY_NAME := 2229280

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_HUB_CAPABILITIES := 2229308

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_HUB_CYCLE_PORT := 2229316

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_ATTRIBUTES := 2229312

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX := 2229320

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_RESET_HUB := 2229324

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_HUB_CAPABILITIES_EX := 2229328

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_HUB_INFORMATION_EX := 2229332

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_PORT_CONNECTOR_PROPERTIES := 2229336

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_INFORMATION_EX_V2 := 2229340

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_TRANSPORT_CHARACTERISTICS := 2229348

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_REGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE := 2229352

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_NOTIFY_ON_TRANSPORT_CHARACTERISTICS_CHANGE := 2229356

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_UNREGISTER_FOR_TRANSPORT_CHARACTERISTICS_CHANGE := 2229360

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_START_TRACKING_FOR_TIME_SYNC := 2229364

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC := 2229368

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_STOP_TRACKING_FOR_TIME_SYNC := 2229372

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_DEVICE_CHARACTERISTICS := 2229376

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_USB_GET_NODE_CONNECTION_SUPERSPEEDPLUS_INFORMATION := 2229380

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_DRIVER_INFORMATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_DRIVER_NOTIFICATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_POWER_DEVICE_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_HUB_NODE_INFORMATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_PERFORMANCE_INFORMATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMI_USB_DEVICE_NODE_INFORMATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_TRANSPORT_CHARACTERISTICS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_TRANSPORT_CHARACTERISTICS_LATENCY_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_TRANSPORT_CHARACTERISTICS_BANDWIDTH_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_REGISTER_FOR_TRANSPORT_LATENCY_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_REGISTER_FOR_TRANSPORT_BANDWIDTH_CHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CHARACTERISTICS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global USB_DEVICE_CHARACTERISTICS_MAXIMUM_PATH_DELAYS_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NUM_PIPES := 8

/**
 * @type {Integer (UInt32)}
 */
export global BULKIN_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_USB_SCAN := 32768

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INDEX := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_VERSION := 2147491840

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_CANCEL_IO := 2147491844

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_WAIT_ON_DEVICE_EVENT := 2147491848

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_READ_REGISTERS := 2147491852

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_WRITE_REGISTERS := 2147491856

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_CHANNEL_ALIGN_RQST := 2147491860

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_DEVICE_DESCRIPTOR := 2147491864

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_RESET_PIPE := 2147491868

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_USB_DESCRIPTOR := 2147491872

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SEND_USB_REQUEST := 2147491876

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_PIPE_CONFIGURATION := 2147491880

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_TIMEOUT := 2147491884

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ABORT_PIPE := 2147491844

/**
 * @type {Guid}
 */
export global WinUSB_TestGuid := Guid("{da812bff-12c3-46a2-8e2b-dbd3b7834c43}")
;@endregion Constants
