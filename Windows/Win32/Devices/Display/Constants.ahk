#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Devices.Display
 */

;@region Constants

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_DISPLAY_ADAPTER := Guid("{5b45201d-f2f2-4f3b-85bb-30ff1f953599}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_MONITOR := Guid("{e6f07b5f-ee97-4a90-b076-33f57bf4eaa7}")

/**
 * @type {Guid}
 */
export global GUID_DISPLAY_DEVICE_ARRIVAL := Guid("{1ca05180-a699-450a-9a0c-de4fbe3ddd89}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_VIDEO_OUTPUT_ARRIVAL := Guid("{1ad9e4f0-f88d-4360-bab9-4c2d55e564cd}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_DISPLAYMUX := Guid("{93c33929-3180-46d3-8aab-008c84ad1e6e}")

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_IndirectDisplay := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_IndirectDisplay.fmtid),
    Guid.Ptr, Guid("{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}"),
    UInt32, 16)
DEVPKEY_IndirectDisplay.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_TerminalLuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_TerminalLuid.fmtid),
    Guid.Ptr, Guid("{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}"),
    UInt32, 16)
DEVPKEY_Device_TerminalLuid.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_AdapterLuid := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_AdapterLuid.fmtid),
    Guid.Ptr, Guid("{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}"),
    UInt32, 16)
DEVPKEY_Device_AdapterLuid.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_Device_ActivityId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_Device_ActivityId.fmtid),
    Guid.Ptr, Guid("{c50a3f10-aa5c-4247-b830-d6a6f8eaa310}"),
    UInt32, 16)
DEVPKEY_Device_ActivityId.pid := 4

/**
 * @type {Integer (UInt32)}
 */
export global INDIRECT_DISPLAY_INFO_FLAGS_CREATED_IDDCX_ADAPTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global INDIRECT_DISPLAY_INFO_FLAGS_SUPPORT_FP16 := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DisplayMux_InitStatus := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DisplayMux_InitStatus.fmtid),
    Guid.Ptr, Guid("{fefa7434-e0fd-4b2a-905a-7d0127a9f01c}"),
    UInt32, 16)
DEVPKEY_DisplayMux_InitStatus.pid := 1

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DisplayMux_SupportLevel := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DisplayMux_SupportLevel.fmtid),
    Guid.Ptr, Guid("{fefa7434-e0fd-4b2a-905a-7d0127a9f01c}"),
    UInt32, 16)
DEVPKEY_DisplayMux_SupportLevel.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DisplayMux_MuxTarget1 := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DisplayMux_MuxTarget1.fmtid),
    Guid.Ptr, Guid("{fefa7434-e0fd-4b2a-905a-7d0127a9f01c}"),
    UInt32, 16)
DEVPKEY_DisplayMux_MuxTarget1.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DisplayMux_MuxTarget2 := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DisplayMux_MuxTarget2.fmtid),
    Guid.Ptr, Guid("{fefa7434-e0fd-4b2a-905a-7d0127a9f01c}"),
    UInt32, 16)
DEVPKEY_DisplayMux_MuxTarget2.pid := 4

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DisplayMux_CurrentTarget := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DisplayMux_CurrentTarget.fmtid),
    Guid.Ptr, Guid("{fefa7434-e0fd-4b2a-905a-7d0127a9f01c}"),
    UInt32, 16)
DEVPKEY_DisplayMux_CurrentTarget.pid := 5

/**
 * @type {String}
 */
export global VIDEO_DEVICE_NAME := "DISPLAY%d"

/**
 * @type {String}
 */
export global WVIDEO_DEVICE_NAME := "DISPLAY%d"

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_DISABLE_VDM := 2293764

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_REGISTER_VDM := 2293768

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_OUTPUT_DEVICE_POWER_STATE := 2293772

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_GET_OUTPUT_DEVICE_POWER_STATE := 2293776

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_MONITOR_DEVICE := 2293780

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_ENUM_MONITOR_PDO := 2293784

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_INIT_WIN32K_CALLBACKS := 2293788

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_IS_VGA_DEVICE := 2293796

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_USE_DEVICE_IN_SESSION := 2293800

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_PREPARE_FOR_EARECOVERY := 2293804

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_ENABLE_VDM := 2293760

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SAVE_HARDWARE_STATE := 2294272

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_RESTORE_HARDWARE_STATE := 2294276

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_HANDLE_VIDEOPARAMETERS := 2293792

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_AVAIL_MODES := 2294784

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_NUM_AVAIL_MODES := 2294788

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_CURRENT_MODE := 2294792

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_CURRENT_MODE := 2294796

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_RESET_DEVICE := 2294800

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_LOAD_AND_SET_FONT := 2294804

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_PALETTE_REGISTERS := 2294808

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_COLOR_REGISTERS := 2294812

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_ENABLE_CURSOR := 2294816

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_DISABLE_CURSOR := 2294820

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_CURSOR_ATTR := 2294824

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_CURSOR_ATTR := 2294828

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_CURSOR_POSITION := 2294832

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_CURSOR_POSITION := 2294836

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_ENABLE_POINTER := 2294840

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_DISABLE_POINTER := 2294844

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_POINTER_ATTR := 2294848

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_POINTER_ATTR := 2294852

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_POINTER_POSITION := 2294856

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_POINTER_POSITION := 2294860

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_POINTER_CAPABILITIES := 2294864

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_GET_BANK_SELECT_CODE := 2294868

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_MAP_VIDEO_MEMORY := 2294872

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_UNMAP_VIDEO_MEMORY := 2294876

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_PUBLIC_ACCESS_RANGES := 2294880

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_FREE_PUBLIC_ACCESS_RANGES := 2294884

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_COLOR_CAPABILITIES := 2294888

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_POWER_MANAGEMENT := 2294892

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_GET_POWER_MANAGEMENT := 2294896

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SHARE_VIDEO_MEMORY := 2294900

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_UNSHARE_VIDEO_MEMORY := 2294904

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_COLOR_LUT_DATA := 2294908

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_GET_CHILD_STATE := 2294912

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_VALIDATE_CHILD_STATE_CONFIGURATION := 2294916

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_CHILD_STATE_CONFIGURATION := 2294920

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SWITCH_DUALVIEW := 2294924

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_BANK_POSITION := 2294928

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS := 2294932

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS := 2294936

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS := 2294940

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_COPY_FRAME_BUFFER := 3409920

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_WRITE_TO_FRAME_BUFFER := 3409924

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_REVERSE_MOUSE_POINTER := 3409928

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_SET_CURRENT_MODE := 3409932

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_SET_SCREEN_INFORMATION := 3409936

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_FSVIDEO_SET_CURSOR_POSITION := 3409940

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_QUERY_BRIGHTNESS_CAPS := 2296832

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_QUERY_BRIGHTNESS_RANGES := 2296836

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_GET_BRIGHTNESS := 2296840

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_SET_BRIGHTNESS := 2296844

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_SET_BRIGHTNESS_STATE := 2296848

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_SET_BACKLIGHT_OPTIMIZATION := 2296852

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_GET_BACKLIGHT_REDUCTION := 2296856

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_PANEL_GET_MANUFACTURING_MODE := 2296860

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_COLORSPACE_TRANSFORM_QUERY_TARGET_CAPS := 2297856

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_COLORSPACE_TRANSFORM_SET := 2297860

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_ACTIVE_COLOR_PROFILE_NAME := 2297864

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_GET_SCALAR_MULTIPLIER_CAPS := 2297868

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_SCALAR_MULTIPLIER := 2297872

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MIPI_DSI_QUERY_CAPS := 2298880

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MIPI_DSI_TRANSMISSION := 2298884

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MIPI_DSI_RESET := 2298888

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_WIN32K_PARAM_FLAG_UPDATEREGISTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_WIN32K_PARAM_FLAG_MODESWITCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global DXGK_WIN32K_PARAM_FLAG_DISABLEVIEW := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_DUALVIEW_REMOVABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_DUALVIEW_PRIMARY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_DUALVIEW_SECONDARY := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_DUALVIEW_WDDM_VGA := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_STATE_NON_STANDARD_VGA := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_STATE_UNEMULATED_VGA_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_STATE_PACKED_CHAIN4_MODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_NO_ZERO_MEMORY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_MAP_MEM_LINEAR := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_COLOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_GRAPHICS := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_PALETTE_DRIVEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_MANAGED_PALETTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_INTERLACED := 16

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_NO_OFF_SCREEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_NO_64_BIT_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_BANKED := 128

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_LINEAR := 256

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_ASYNC_POINTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_MONO_POINTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_COLOR_POINTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_ANIMATE_START := 8

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MODE_ANIMATE_UPDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PLANAR_HC := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_DEVICE_COLOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_OPTIONAL_GAMMET_TABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_COLOR_LUT_DATA_FORMAT_RGB256WORDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_COLOR_LUT_DATA_FORMAT_PRIVATEFORMAT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYPOLICY_AC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPLAYPOLICY_DC := 2

/**
 * @type {Integer (UInt32)}
 */
export global BITMAP_BITS_BYTE_ALIGN := 8

/**
 * @type {Integer (UInt32)}
 */
export global BITMAP_BITS_WORD_ALIGN := 16

/**
 * @type {Integer (UInt32)}
 */
export global BITMAP_ARRAY_BYTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global BITMAP_PLANES := 1

/**
 * @type {Integer (UInt32)}
 */
export global BITMAP_BITS_PIXEL := 1

/**
 * @type {String}
 */
export global DD_FULLSCREEN_VIDEO_DEVICE_NAME := "\Device\FSVideo"

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_POLICY1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_POLICY2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_POLICY3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_POLICY4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_LOCK := 5

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_FAILED_ROTATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_ALLOCATION := 6

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_SCRATCH := 8

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_REASON_CONFIGURATION := 9

/**
 * @type {Integer (UInt32)}
 */
export global VIDEO_MAX_REASON := 9

/**
 * @type {Integer (UInt32)}
 */
export global BRIGHTNESS_MAX_LEVEL_COUNT := 103

/**
 * @type {Integer (UInt32)}
 */
export global BRIGHTNESS_MAX_NIT_RANGE_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSI_PACKET_EMBEDDED_PAYLOAD_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PACKET_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global DSI_INVALID_PACKET_INDEX := 255

/**
 * @type {Integer (UInt32)}
 */
export global DSI_SOT_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSI_SOT_SYNC_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSI_EOT_SYNC_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSI_ESCAPE_MODE_ENTRY_COMMAND_ERROR := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSI_LOW_POWER_TRANSMIT_SYNC_ERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSI_PERIPHERAL_TIMEOUT_ERROR := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSI_FALSE_CONTROL_ERROR := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSI_CONTENTION_DETECTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global DSI_CHECKSUM_ERROR_CORRECTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSI_CHECKSUM_ERROR_NOT_CORRECTED := 512

/**
 * @type {Integer (UInt32)}
 */
export global DSI_LONG_PACKET_PAYLOAD_CHECKSUM_ERROR := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DSI_DSI_DATA_TYPE_NOT_RECOGNIZED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DSI_DSI_VC_ID_INVALID := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DSI_INVALID_TRANSMISSION_LENGTH := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DSI_DSI_PROTOCOL_VIOLATION := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_DEVICE_NOT_READY := 1

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_INTERFACE_RESET := 2

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_DEVICE_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_TRANSMISSION_CANCELLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_TRANSMISSION_DROPPED := 32

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_TRANSMISSION_TIMEOUT := 64

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_INVALID_TRANSMISSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_OS_REJECTED_PACKET := 512

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_DRIVER_REJECTED_PACKET := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HOST_DSI_BAD_TRANSMISSION_MODE := 4096

/**
 * @type {Guid}
 */
export global GUID_MONITOR_OVERRIDE_PSEUDO_SPECIALIZED := Guid("{f196c02f-f86f-4f9a-aa15-e9cebdfe3b96}")

/**
 * @type {Guid}
 */
export global GUID_MONITOR_OVERRIDE_TEST_SPECIALIZED := Guid("{0457e531-3cb9-4a07-83c1-a79146c64db3}")

/**
 * @type {Integer (UInt32)}
 */
export global FD_ERROR := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global DDI_ERROR := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global FDM_TYPE_BM_SIDE_CONST := 1

/**
 * @type {Integer (UInt32)}
 */
export global FDM_TYPE_MAXEXT_EQUAL_BM_SIDE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FDM_TYPE_CHAR_INC_EQUAL_BM_BASE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FDM_TYPE_ZERO_BEARINGS := 8

/**
 * @type {Integer (UInt32)}
 */
export global FDM_TYPE_CONST_BEARINGS := 16

/**
 * @type {Integer (UInt32)}
 */
export global GS_UNICODE_HANDLES := 1

/**
 * @type {Integer (UInt32)}
 */
export global GS_8BIT_HANDLES := 2

/**
 * @type {Integer (UInt32)}
 */
export global GS_16BIT_HANDLES := 4

/**
 * @type {Integer (UInt32)}
 */
export global FM_VERSION_NUMBER := 0

/**
 * @type {Integer (UInt32)}
 */
export global FM_TYPE_LICENSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FM_READONLY_EMBED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FM_EDITABLE_EMBED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FM_NO_EMBEDDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_TRUETYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_BITMAP := 2

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_STROKE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_OUTLINE_NOT_TRUETYPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_ARB_XFORMS := 16

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_1BPP := 32

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_4BPP := 64

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_8BPP := 128

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_16BPP := 256

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_24BPP := 512

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_32BPP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_INTEGER_WIDTH := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_CONSTANT_WIDTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_NOT_CONTIGUOUS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_MM := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_RETURNS_OUTLINES := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_RETURNS_STROKES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_RETURNS_BITMAPS := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_DSIG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_RIGHT_HANDED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_INTEGRAL_SCALING := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_90DEGREE_ROTATIONS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_OPTICALLY_FIXED_PITCH := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_DO_NOT_ENUMERATE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_ISOTROPIC_SCALING_ONLY := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_ANISOTROPIC_SCALING_ONLY := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_CFF := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_FAMILY_EQUIV := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_DBCS_FIXED_PITCH := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_NONNEGATIVE_AC := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_IGNORE_TC_RA_ABLE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global FM_INFO_TECH_TYPE1 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MAXCHARSETS := 16

/**
 * @type {Integer (UInt32)}
 */
export global FM_PANOSE_CULTURE_LATIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_ITALIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_UNDERSCORE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_NEGATIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_OUTLINED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_STRIKEOUT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_BOLD := 32

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_REGULAR := 64

/**
 * @type {Integer (UInt32)}
 */
export global FM_SEL_USE_TYPO_METRICS := 128

/**
 * @type {Integer (UInt32)}
 */
export global OPENGL_CMD := 4352

/**
 * @type {Integer (UInt32)}
 */
export global OPENGL_GETINFO := 4353

/**
 * @type {Integer (UInt32)}
 */
export global WNDOBJ_SETUP := 4354

/**
 * @type {Integer (UInt32)}
 */
export global DDI_DRIVER_VERSION_NT4 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DDI_DRIVER_VERSION_SP3 := 131075

/**
 * @type {Integer (UInt32)}
 */
export global DDI_DRIVER_VERSION_NT5 := 196608

/**
 * @type {Integer (UInt32)}
 */
export global DDI_DRIVER_VERSION_NT5_01 := 196864

/**
 * @type {Integer (UInt32)}
 */
export global DDI_DRIVER_VERSION_NT5_01_SP1 := 196865

/**
 * @type {Integer (UInt32)}
 */
export global GDI_DRIVER_VERSION := 16384

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEnablePDEV := 0

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvCompletePDEV := 1

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDisablePDEV := 2

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEnableSurface := 3

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDisableSurface := 4

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvAssertMode := 5

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvOffset := 6

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvResetPDEV := 7

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDisableDriver := 8

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvCreateDeviceBitmap := 10

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDeleteDeviceBitmap := 11

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvRealizeBrush := 12

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDitherColor := 13

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStrokePath := 14

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvFillPath := 15

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStrokeAndFillPath := 16

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvPaint := 17

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvBitBlt := 18

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvCopyBits := 19

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStretchBlt := 20

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSetPalette := 22

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvTextOut := 23

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEscape := 24

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDrawEscape := 25

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryFont := 26

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryFontTree := 27

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryFontData := 28

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSetPointerShape := 29

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvMovePointer := 30

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvLineTo := 31

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSendPage := 32

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStartPage := 33

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEndDoc := 34

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStartDoc := 35

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGetGlyphMode := 37

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSynchronize := 38

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSaveScreenBits := 40

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGetModes := 41

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvFree := 42

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDestroyFont := 43

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryFontCaps := 44

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvLoadFontFile := 45

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvUnloadFontFile := 46

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvFontManagement := 47

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryTrueTypeTable := 48

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryTrueTypeOutline := 49

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGetTrueTypeFile := 50

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryFontFile := 51

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvMovePanning := 52

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryAdvanceWidths := 53

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSetPixelFormat := 54

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDescribePixelFormat := 55

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSwapBuffers := 56

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStartBanding := 57

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvNextBand := 58

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGetDirectDrawInfo := 59

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEnableDirectDraw := 60

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDisableDirectDraw := 61

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQuerySpoolType := 62

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvIcmCreateColorTransform := 64

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvIcmDeleteColorTransform := 65

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvIcmCheckBitmapBits := 66

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvIcmSetDeviceGammaRamp := 67

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGradientFill := 68

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStretchBltROP := 69

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvPlgBlt := 70

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvAlphaBlend := 71

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSynthesizeFont := 72

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvGetSynthesizedFontFiles := 73

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvTransparentBlt := 74

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryPerBandInfo := 75

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryDeviceSupport := 76

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved1 := 77

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved2 := 78

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved3 := 79

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved4 := 80

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved5 := 81

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved6 := 82

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved7 := 83

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved8 := 84

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDeriveSurface := 85

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvQueryGlyphAttrs := 86

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvNotify := 87

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSynchronizeSurface := 88

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvResetDevice := 89

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved9 := 90

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved10 := 91

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvReserved11 := 92

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvRenderHint := 93

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvCreateDeviceBitmapEx := 94

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvDeleteDeviceBitmapEx := 95

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvAssociateSharedSurface := 96

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSynchronizeRedirectionBitmaps := 97

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvAccumulateD3DDirtyRect := 98

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvStartDxInterop := 99

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvEndDxInterop := 100

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvLockDisplayArea := 101

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvUnlockDisplayArea := 102

/**
 * @type {Integer (Int32)}
 */
export global INDEX_DrvSurfaceComplete := 103

/**
 * @type {Integer (Int32)}
 */
export global INDEX_LAST := 89

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_BEZIERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_GEOMETRICWIDE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ALTERNATEFILL := 4

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_WINDINGFILL := 8

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_HALFTONE := 16

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_COLOR_DITHER := 32

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_HORIZSTRIKE := 64

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_VERTSTRIKE := 128

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_OPAQUERECT := 256

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_VECTORFONT := 512

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_MONO_DITHER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ASYNCCHANGE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ASYNCMOVE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_DONTJOURNAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_DIRECTDRAW := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ARBRUSHOPAQUE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_PANNING := 65536

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_HIGHRESTEXT := 262144

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_PALMANAGED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_DITHERONREALIZE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_NO64BITMEMACCESS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_FORCEDITHER := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_GRAY16 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ICM := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_CMYKCOLOR := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_LAYERED := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_ARBRUSHTEXT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_SCREENPRECISION := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_FONT_RASTERIZER := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS_NUP := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_JPEGSRC := 1

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_xxxx := 2

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_PNGSRC := 8

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_CHANGEGAMMARAMP := 16

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_ALPHACURSOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_SYNCFLUSH := 64

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_SYNCTIMER := 128

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_ICD_MULTIMON := 256

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_MOUSETRAILS := 512

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_RESERVED1 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_REMOTEDRIVER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_EXCLUDELAYERED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_INCLUDEAPIBITMAPS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_SHOWHIDDENPOINTER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_CLEARTYPE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_ACC_DRIVER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global GCAPS2_BITMAPEXREUSE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global LA_GEOMETRIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global LA_ALTERNATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LA_STARTGAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global LA_STYLED := 8

/**
 * @type {Integer (Int32)}
 */
export global JOIN_ROUND := 0

/**
 * @type {Integer (Int32)}
 */
export global JOIN_BEVEL := 1

/**
 * @type {Integer (Int32)}
 */
export global JOIN_MITER := 2

/**
 * @type {Integer (Int32)}
 */
export global ENDCAP_ROUND := 0

/**
 * @type {Integer (Int32)}
 */
export global ENDCAP_SQUARE := 1

/**
 * @type {Integer (Int32)}
 */
export global ENDCAP_BUTT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_ABC := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_ACB := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_BAC := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_BCA := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_CBA := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRIMARY_ORDER_CAB := 5

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_2x2 := 0

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_2x2_M := 1

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_4x4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_4x4_M := 3

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_6x6 := 4

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_6x6_M := 5

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_8x8 := 6

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_8x8_M := 7

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_10x10 := 8

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_10x10_M := 9

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_12x12 := 10

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_12x12_M := 11

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_14x14 := 12

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_14x14_M := 13

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_16x16 := 14

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_16x16_M := 15

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_SUPERCELL := 16

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_SUPERCELL_M := 17

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_USER := 18

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_MAX_INDEX := 18

/**
 * @type {Integer (UInt32)}
 */
export global HT_PATSIZE_DEFAULT := 17

/**
 * @type {Integer (UInt32)}
 */
export global HT_USERPAT_CX_MIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global HT_USERPAT_CX_MAX := 256

/**
 * @type {Integer (UInt32)}
 */
export global HT_USERPAT_CY_MIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global HT_USERPAT_CY_MAX := 256

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_1BPP := 0

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_4BPP := 2

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_4BPP_IRGB := 3

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_8BPP := 4

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_16BPP := 5

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_24BPP := 6

/**
 * @type {Integer (UInt32)}
 */
export global HT_FORMAT_32BPP := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINDDI_MAX_BROADCAST_CONTEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_SQUARE_DEVICE_PEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_HAS_BLACK_DYE := 2

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_ADDITIVE_PRIMS := 4

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_USE_8BPP_BITMASK := 8

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_HIGH_ABSORPTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_ABSORPTION_INDICES := 96

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_DO_DEVCLR_XFORM := 128

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_OUTPUT_CMY := 256

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_PRINT_DRAFT_MODE := 512

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INVERT_8BPP_BITMASK_IDX := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_8BPP_CMY332_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_ABSORPTION_IDX0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_ABSORPTION_IDX1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_ABSORPTION_IDX2 := 64

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_INK_ABSORPTION_IDX3 := 96

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_NORMAL_INK_ABSORPTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_LOW_INK_ABSORPTION := 32

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_LOWER_INK_ABSORPTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global HT_FLAG_LOWEST_INK_ABSORPTION := 96

/**
 * @type {Integer (UInt32)}
 */
export global PPC_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PPC_UNDEFINED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PPC_RGB_ORDER_VERTICAL_STRIPES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PPC_BGR_ORDER_VERTICAL_STRIPES := 3

/**
 * @type {Integer (UInt32)}
 */
export global PPC_RGB_ORDER_HORIZONTAL_STRIPES := 4

/**
 * @type {Integer (UInt32)}
 */
export global PPC_BGR_ORDER_HORIZONTAL_STRIPES := 5

/**
 * @type {Integer (UInt32)}
 */
export global PPG_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PPG_SRGB := 1

/**
 * @type {Integer (UInt32)}
 */
export global BR_DEVICE_ICM := 1

/**
 * @type {Integer (UInt32)}
 */
export global BR_HOST_ICM := 2

/**
 * @type {Integer (UInt32)}
 */
export global BR_CMYKCOLOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global BR_ORIGCOLOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global FO_SIM_BOLD := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FO_SIM_ITALIC := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FO_EM_HEIGHT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FO_GRAY16 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FO_NOGRAY16 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FO_NOHINTS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FO_NO_CHOICE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FO_CFF := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FO_POSTSCRIPT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FO_MULTIPLEMASTER := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FO_VERT_FACE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global FO_DBCS_FONT := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FO_NOCLEARTYPE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FO_CLEARTYPE_X := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FO_CLEARTYPE_Y := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FO_CLEARTYPENATURAL_X := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DC_TRIVIAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DC_RECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DC_COMPLEX := 3

/**
 * @type {Integer (UInt32)}
 */
export global FC_RECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FC_RECT4 := 2

/**
 * @type {Integer (UInt32)}
 */
export global FC_COMPLEX := 3

/**
 * @type {Integer (UInt32)}
 */
export global TC_RECTANGLES := 0

/**
 * @type {Integer (UInt32)}
 */
export global TC_PATHOBJ := 2

/**
 * @type {Integer (UInt32)}
 */
export global OC_BANK_CLIP := 1

/**
 * @type {Integer (Int32)}
 */
export global CT_RECTANGLES := 0

/**
 * @type {Integer (Int32)}
 */
export global CD_RIGHTDOWN := 0

/**
 * @type {Integer (Int32)}
 */
export global CD_LEFTDOWN := 1

/**
 * @type {Integer (Int32)}
 */
export global CD_RIGHTUP := 2

/**
 * @type {Integer (Int32)}
 */
export global CD_LEFTUP := 3

/**
 * @type {Integer (Int32)}
 */
export global CD_ANY := 4

/**
 * @type {Integer (Int32)}
 */
export global CD_LEFTWARDS := 1

/**
 * @type {Integer (Int32)}
 */
export global CD_UPWARDS := 2

/**
 * @type {Integer (Int32)}
 */
export global FO_HGLYPHS := 0

/**
 * @type {Integer (Int32)}
 */
export global FO_GLYPHBITS := 1

/**
 * @type {Integer (Int32)}
 */
export global FO_PATHOBJ := 2

/**
 * @type {Integer (Int32)}
 */
export global FD_NEGATIVE_FONT := 1

/**
 * @type {Integer (Int32)}
 */
export global FO_DEVICE_FONT := 1

/**
 * @type {Integer (Int32)}
 */
export global FO_OUTLINE_CAPABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SO_FLAG_DEFAULT_PLACEMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SO_HORIZONTAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SO_VERTICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SO_REVERSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SO_ZERO_BEARINGS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SO_CHAR_INC_EQUAL_BM_BASE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SO_MAXEXT_EQUAL_BM_SIDE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SO_DO_NOT_SUBSTITUTE_DEVICE_FONT := 128

/**
 * @type {Integer (UInt32)}
 */
export global SO_GLYPHINDEX_TEXTOUT := 256

/**
 * @type {Integer (UInt32)}
 */
export global SO_ESC_NOT_ORIENT := 512

/**
 * @type {Integer (UInt32)}
 */
export global SO_DXDY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SO_CHARACTER_EXTRA := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SO_BREAK_EXTRA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FO_ATTR_MODE_ROTATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAL_INDEXED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAL_BITFIELDS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PAL_RGB := 4

/**
 * @type {Integer (UInt32)}
 */
export global PAL_BGR := 8

/**
 * @type {Integer (UInt32)}
 */
export global PAL_CMYK := 16

/**
 * @type {Integer (UInt32)}
 */
export global PO_BEZIERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_ELLIPSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_ALL_INTEGERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PO_ENUM_AS_INTEGERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global PO_WIDENED := 16

/**
 * @type {Integer (UInt32)}
 */
export global PD_BEGINSUBPATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PD_ENDSUBPATH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PD_RESETSTYLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PD_CLOSEFIGURE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PD_BEZIERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SGI_EXTRASPACE := 0

/**
 * @type {Integer (Int32)}
 */
export global STYPE_BITMAP := 0

/**
 * @type {Integer (Int32)}
 */
export global STYPE_DEVBITMAP := 3

/**
 * @type {Integer (Int32)}
 */
export global BMF_1BPP := 1

/**
 * @type {Integer (Int32)}
 */
export global BMF_4BPP := 2

/**
 * @type {Integer (Int32)}
 */
export global BMF_8BPP := 3

/**
 * @type {Integer (Int32)}
 */
export global BMF_16BPP := 4

/**
 * @type {Integer (Int32)}
 */
export global BMF_24BPP := 5

/**
 * @type {Integer (Int32)}
 */
export global BMF_32BPP := 6

/**
 * @type {Integer (Int32)}
 */
export global BMF_4RLE := 7

/**
 * @type {Integer (Int32)}
 */
export global BMF_8RLE := 8

/**
 * @type {Integer (Int32)}
 */
export global BMF_JPEG := 9

/**
 * @type {Integer (Int32)}
 */
export global BMF_PNG := 10

/**
 * @type {Integer (UInt32)}
 */
export global BMF_TOPDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global BMF_NOZEROINIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global BMF_DONTCACHE := 4

/**
 * @type {Integer (UInt32)}
 */
export global BMF_USERMEM := 8

/**
 * @type {Integer (UInt32)}
 */
export global BMF_KMSECTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global BMF_NOTSYSMEM := 32

/**
 * @type {Integer (UInt32)}
 */
export global BMF_WINDOW_BLT := 64

/**
 * @type {Integer (UInt32)}
 */
export global BMF_UMPDMEM := 128

/**
 * @type {Integer (UInt32)}
 */
export global BMF_TEMP_ALPHA := 256

/**
 * @type {Integer (UInt32)}
 */
export global BMF_ACC_NOTIFY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global BMF_RMT_ENTER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global BMF_RESERVED := 15872

/**
 * @type {Integer (Int32)}
 */
export global GX_IDENTITY := 0

/**
 * @type {Integer (Int32)}
 */
export global GX_OFFSET := 1

/**
 * @type {Integer (Int32)}
 */
export global GX_SCALE := 2

/**
 * @type {Integer (Int32)}
 */
export global GX_GENERAL := 3

/**
 * @type {Integer (Int32)}
 */
export global XF_LTOL := 0

/**
 * @type {Integer (Int32)}
 */
export global XF_INV_LTOL := 1

/**
 * @type {Integer (Int32)}
 */
export global XF_LTOFX := 2

/**
 * @type {Integer (Int32)}
 */
export global XF_INV_FXTOL := 3

/**
 * @type {Integer (UInt32)}
 */
export global XO_TRIVIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global XO_TABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global XO_TO_MONO := 4

/**
 * @type {Integer (UInt32)}
 */
export global XO_FROM_CMYK := 8

/**
 * @type {Integer (UInt32)}
 */
export global XO_DEVICE_ICM := 16

/**
 * @type {Integer (UInt32)}
 */
export global XO_HOST_ICM := 32

/**
 * @type {Integer (UInt32)}
 */
export global XO_SRCPALETTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global XO_DESTPALETTE := 2

/**
 * @type {Integer (UInt32)}
 */
export global XO_DESTDCPALETTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global XO_SRCBITFIELDS := 4

/**
 * @type {Integer (UInt32)}
 */
export global XO_DESTBITFIELDS := 5

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_BITBLT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_STRETCHBLT := 2

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_PLGBLT := 4

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_TEXTOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_PAINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_STROKEPATH := 32

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_FILLPATH := 64

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_STROKEANDFILLPATH := 128

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_LINETO := 256

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_COPYBITS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_MOVEPANNING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_SYNCHRONIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_STRETCHBLTROP := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_SYNCHRONIZEACCESS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_TRANSPARENTBLT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_ALPHABLEND := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_GRADIENTFILL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global HOOK_FLAGS := 243199

/**
 * @type {Integer (UInt32)}
 */
export global MS_NOTSYSTEMMEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MS_SHAREDACCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MS_CDDDEVICEBITMAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global MS_REUSEDDEVICEBITMAP := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRVQUERY_USERMODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HS_DDI_MAX := 6

/**
 * @type {Integer (UInt32)}
 */
export global DRD_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRD_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SS_SAVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SS_RESTORE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SS_FREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDBEX_REDIRECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CDBEX_DXINTEROP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CDBEX_NTSHAREDSURFACEHANDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CDBEX_CROSSADAPTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CDBEX_REUSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINDDI_MAXSETPALETTECOLORS := 256

/**
 * @type {Integer (UInt32)}
 */
export global WINDDI_MAXSETPALETTECOLORINDEX := 255

/**
 * @type {Integer (UInt32)}
 */
export global DM_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DM_MONOCHROME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCR_SOLID := 0

/**
 * @type {Integer (UInt32)}
 */
export global DCR_DRIVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DCR_HALFTONE := 2

/**
 * @type {Integer (Int32)}
 */
export global RB_DITHERCOLOR := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global QFT_LIGATURES := 1

/**
 * @type {Integer (Int32)}
 */
export global QFT_KERNPAIRS := 2

/**
 * @type {Integer (Int32)}
 */
export global QFT_GLYPHSET := 3

/**
 * @type {Integer (Int32)}
 */
export global QFD_GLYPHANDBITMAP := 1

/**
 * @type {Integer (Int32)}
 */
export global QFD_GLYPHANDOUTLINE := 2

/**
 * @type {Integer (Int32)}
 */
export global QFD_MAXEXTENTS := 3

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_GLYPHANDBITMAP := 4

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_GRAY1_BITMAP := 5

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_GRAY2_BITMAP := 6

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_GRAY4_BITMAP := 8

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_GRAY8_BITMAP := 9

/**
 * @type {Integer (Int32)}
 */
export global QFD_TT_MONO_BITMAP := 5

/**
 * @type {Integer (UInt32)}
 */
export global QC_OUTLINES := 1

/**
 * @type {Integer (UInt32)}
 */
export global QC_1BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global QC_4BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FF_SIGNATURE_VERIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FF_IGNORED_SIGNATURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global QAW_GETWIDTHS := 0

/**
 * @type {Integer (UInt32)}
 */
export global QAW_GETEASYWIDTHS := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTO_METRICS_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global TTO_QUBICS := 2

/**
 * @type {Integer (UInt32)}
 */
export global TTO_UNHINTED := 4

/**
 * @type {Integer (Int32)}
 */
export global QFF_DESCRIPTION := 1

/**
 * @type {Integer (Int32)}
 */
export global QFF_NUMFACES := 2

/**
 * @type {Integer (Int32)}
 */
export global FP_ALTERNATEMODE := 1

/**
 * @type {Integer (Int32)}
 */
export global FP_WINDINGMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPS_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global SPS_DECLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPS_ACCEPT_NOEXCLUDE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPS_ACCEPT_EXCLUDE := 3

/**
 * @type {Integer (UInt32)}
 */
export global SPS_ACCEPT_SYNCHRONOUS := 4

/**
 * @type {Integer (Int32)}
 */
export global SPS_CHANGE := 1

/**
 * @type {Integer (Int32)}
 */
export global SPS_ASYNCCHANGE := 2

/**
 * @type {Integer (Int32)}
 */
export global SPS_ANIMATESTART := 4

/**
 * @type {Integer (Int32)}
 */
export global SPS_ANIMATEUPDATE := 8

/**
 * @type {Integer (Int32)}
 */
export global SPS_ALPHA := 16

/**
 * @type {Integer (Int32)}
 */
export global SPS_RESERVED := 32

/**
 * @type {Integer (Int32)}
 */
export global SPS_RESERVED1 := 64

/**
 * @type {Integer (Int32)}
 */
export global SPS_FLAGSMASK := 255

/**
 * @type {Integer (Int32)}
 */
export global SPS_LENGTHMASK := 3840

/**
 * @type {Integer (Int32)}
 */
export global SPS_FREQMASK := 1044480

/**
 * @type {Integer (UInt32)}
 */
export global ED_ABORTDOC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IGRF_RGB_256BYTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global IGRF_RGB_256WORDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global QDS_CHECKJPEGFORMAT := 0

/**
 * @type {Integer (UInt32)}
 */
export global QDS_CHECKPNGFORMAT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSS_TIMER_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSS_FLUSH_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSS_RESERVED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSS_RESERVED1 := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSS_RESERVED2 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DN_ACCELERATION_LEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DN_DEVICE_ORIGIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DN_SLEEP_MODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DN_DRAWING_BEGIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DN_ASSOCIATE_WINDOW := 5

/**
 * @type {Integer (UInt32)}
 */
export global DN_COMPOSITION_CHANGED := 6

/**
 * @type {Integer (UInt32)}
 */
export global DN_DRAWING_BEGIN_APIBITMAP := 7

/**
 * @type {Integer (UInt32)}
 */
export global DN_SURFOBJ_DESTRUCTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global WOC_RGN_CLIENT_DELTA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WOC_RGN_CLIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WOC_RGN_SURFACE_DELTA := 4

/**
 * @type {Integer (UInt32)}
 */
export global WOC_RGN_SURFACE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WOC_CHANGED := 16

/**
 * @type {Integer (UInt32)}
 */
export global WOC_DELETE := 32

/**
 * @type {Integer (UInt32)}
 */
export global WOC_DRAWN := 64

/**
 * @type {Integer (UInt32)}
 */
export global WOC_SPRITE_OVERLAP := 128

/**
 * @type {Integer (UInt32)}
 */
export global WOC_SPRITE_NO_OVERLAP := 256

/**
 * @type {Integer (UInt32)}
 */
export global WOC_RGN_SPRITE := 512

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_CLIENT_DELTA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_CLIENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_SURFACE_DELTA := 4

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_SURFACE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_UPDATE_ALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_WINDOW := 32

/**
 * @type {Integer (UInt32)}
 */
export global WO_DRAW_NOTIFY := 64

/**
 * @type {Integer (UInt32)}
 */
export global WO_SPRITE_NOTIFY := 128

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_DESKTOP_COORD := 256

/**
 * @type {Integer (UInt32)}
 */
export global WO_RGN_SPRITE := 512

/**
 * @type {Integer (UInt32)}
 */
export global EHN_RESTORED := 0

/**
 * @type {Integer (UInt32)}
 */
export global EHN_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECS_TEARDOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECS_REDRAW := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEVHTADJF_COLOR_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVHTADJF_ADDITIVE_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FL_ZERO_MEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FL_NONPAGED_MEMORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FL_NON_SESSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global QSA_MMX := 256

/**
 * @type {Integer (UInt32)}
 */
export global QSA_SSE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global QSA_3DNOW := 16384

/**
 * @type {Integer (UInt32)}
 */
export global QSA_SSE1 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global QSA_SSE2 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global QSA_SSE3 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global ENG_FNT_CACHE_READ_FAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENG_FNT_CACHE_WRITE_FAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRH_APIBITMAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_MONITOR_TECHNOLOGY_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_BRIGHTNESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_CONTRAST := 4

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_COLOR_TEMPERATURE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_RED_GREEN_BLUE_GAIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_RED_GREEN_BLUE_DRIVE := 32

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_DEGAUSS := 64

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_DISPLAY_AREA_POSITION := 128

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_DISPLAY_AREA_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_RESTORE_FACTORY_DEFAULTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MC_CAPS_RESTORE_FACTORY_COLOR_DEFAULTS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MC_RESTORE_FACTORY_DEFAULTS_ENABLES_MONITOR_SETTINGS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_4000K := 1

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_5000K := 2

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_6500K := 4

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_7500K := 8

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_8200K := 16

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_9300K := 32

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_10000K := 64

/**
 * @type {Integer (UInt32)}
 */
export global MC_SUPPORTED_COLOR_TEMPERATURE_11500K := 128

/**
 * @type {Integer (UInt32)}
 */
export global PHYSICAL_MONITOR_DESCRIPTION_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global GETCONNECTEDIDS_TARGET := 0

/**
 * @type {Integer (UInt32)}
 */
export global GETCONNECTEDIDS_SOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global S_INIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SETCONFIGURATION_STATUS_APPLIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SETCONFIGURATION_STATUS_ADDITIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SETCONFIGURATION_STATUS_OVERRIDDEN := 2
;@endregion Constants
