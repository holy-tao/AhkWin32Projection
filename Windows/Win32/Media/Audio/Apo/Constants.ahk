#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global APOERR_ALREADY_INITIALIZED := -2005073919

/**
 * @type {Integer (Int32)}
 */
export global APOERR_NOT_INITIALIZED := -2005073918

/**
 * @type {Integer (Int32)}
 */
export global APOERR_FORMAT_NOT_SUPPORTED := -2005073917

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_APO_CLSID := -2005073916

/**
 * @type {Integer (Int32)}
 */
export global APOERR_BUFFERS_OVERLAP := -2005073915

/**
 * @type {Integer (Int32)}
 */
export global APOERR_ALREADY_UNLOCKED := -2005073914

/**
 * @type {Integer (Int32)}
 */
export global APOERR_NUM_CONNECTIONS_INVALID := -2005073913

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_OUTPUT_MAXFRAMECOUNT := -2005073912

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_CONNECTION_FORMAT := -2005073911

/**
 * @type {Integer (Int32)}
 */
export global APOERR_APO_LOCKED := -2005073910

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_COEFFCOUNT := -2005073909

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_COEFFICIENT := -2005073908

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_CURVE_PARAM := -2005073907

/**
 * @type {Integer (Int32)}
 */
export global APOERR_INVALID_INPUTID := -2005073906

/**
 * @type {Float}
 */
export global AUDIO_MIN_FRAMERATE := 10

/**
 * @type {Float}
 */
export global AUDIO_MAX_FRAMERATE := 384000

/**
 * @type {Integer (UInt32)}
 */
export global AUDIO_MIN_CHANNELS := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUDIO_MAX_CHANNELS := 4096

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_Association := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_Association.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_Association.pid := 0

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_PreMixEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_PreMixEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_PreMixEffectClsid.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_PostMixEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_PostMixEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_PostMixEffectClsid.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_UserInterfaceClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_UserInterfaceClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_UserInterfaceClsid.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_FriendlyName := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_FriendlyName.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_FriendlyName.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_StreamEffectClsid.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ModeEffectClsid.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_EndpointEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_EndpointEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_EndpointEffectClsid.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_KeywordDetector_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_KeywordDetector_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_KeywordDetector_StreamEffectClsid.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_KeywordDetector_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_KeywordDetector_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_KeywordDetector_ModeEffectClsid.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_KeywordDetector_EndpointEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_KeywordDetector_EndpointEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_KeywordDetector_EndpointEffectClsid.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_Offload_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_Offload_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_Offload_StreamEffectClsid.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_Offload_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_Offload_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_Offload_ModeEffectClsid.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_StreamEffectClsid.pid := 13

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_ModeEffectClsid.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_EndpointEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_EndpointEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_EndpointEffectClsid.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_KeywordDetector_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_KeywordDetector_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_KeywordDetector_StreamEffectClsid.pid := 16

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_KeywordDetector_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_KeywordDetector_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_KeywordDetector_ModeEffectClsid.pid := 17

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_KeywordDetector_EndpointEffectClsid.pid := 18

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_Offload_StreamEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_Offload_StreamEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_Offload_StreamEffectClsid.pid := 19

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CompositeFX_Offload_ModeEffectClsid := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CompositeFX_Offload_ModeEffectClsid.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_CompositeFX_Offload_ModeEffectClsid.pid := 20

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_SupportAppLauncher := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_SupportAppLauncher.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_SupportAppLauncher.pid := 21

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_SupportedFormats := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_SupportedFormats.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_SupportedFormats.pid := 22

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_Enumerator := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_Enumerator.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_Enumerator.pid := 23

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_VersionMajor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_VersionMajor.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_VersionMajor.pid := 24

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_VersionMinor := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_VersionMinor.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_VersionMinor.pid := 25

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_Author := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_Author.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_Author.pid := 26

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ObjectId := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ObjectId.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ObjectId.pid := 27

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_State := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_State.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_State.pid := 28

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_EffectPackSchema_Version := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_EffectPackSchema_Version.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_EffectPackSchema_Version.pid := 29

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ApplyToBluetooth := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ApplyToBluetooth.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ApplyToBluetooth.pid := 30

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ApplyToUsb := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ApplyToUsb.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ApplyToUsb.pid := 31

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ApplyToRender := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ApplyToRender.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ApplyToRender.pid := 32

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_ApplyToCapture := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_ApplyToCapture.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_ApplyToCapture.pid := 33

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_RequestSetAsDefault := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_RequestSetAsDefault.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_RequestSetAsDefault.pid := 34

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_RequestSetAsDefaultPriority := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_RequestSetAsDefaultPriority.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_RequestSetAsDefaultPriority.pid := 35

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_FX_OEM_Preferred_EffectPack_Id := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_FX_OEM_Preferred_EffectPack_Id.fmtid),
    Guid.Ptr, Guid("{d04e05a6-594b-4fb6-a80d-01af5eed7d1d}"),
    UInt32, 16)
PKEY_FX_OEM_Preferred_EffectPack_Id.pid := 36

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SFX_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SFX_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_SFX_ProcessingModes_Supported_For_Streaming.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MFX_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MFX_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_MFX_ProcessingModes_Supported_For_Streaming.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_EFX_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_EFX_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_EFX_ProcessingModes_Supported_For_Streaming.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_SFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_MFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_EFX_KeywordDetector_ProcessingModes_Supported_For_Streaming.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_SFX_Offload_ProcessingModes_Supported_For_Streaming.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_MFX_Offload_ProcessingModes_Supported_For_Streaming.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_APO_SWFallback_ProcessingModes := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_APO_SWFallback_ProcessingModes.fmtid),
    Guid.Ptr, Guid("{d3993a3f-99c2-4402-b5ec-a92a0367664b}"),
    UInt32, 16)
PKEY_APO_SWFallback_ProcessingModes.pid := 13

/**
 * @type {Guid}
 */
export global PKEY_FX_EffectPack_Schema_V1 := Guid("{7abf23d9-727e-4d0b-86a3-dd501d260001}")

/**
 * @type {Guid}
 */
export global SID_AudioProcessingObjectRTQueue := Guid("{458c1a1f-6899-4c12-99ac-e2e6ac253104}")

/**
 * @type {Guid}
 */
export global SID_AudioProcessingObjectLoggingService := Guid("{8b8008af-09f9-456e-a173-bdb58499bce7}")

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_AudioEnvironment_SpatialAudioActive := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_AudioEnvironment_SpatialAudioActive.fmtid),
    Guid.Ptr, Guid("{4afb7b88-a653-44a5-99db-687fd74af0bb}"),
    UInt32, 16)
PKEY_AudioEnvironment_SpatialAudioActive.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUDIOMEDIATYPE_EQUAL_FORMAT_TYPES := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUDIOMEDIATYPE_EQUAL_FORMAT_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUDIOMEDIATYPE_EQUAL_FORMAT_USER_DATA := 8
;@endregion Constants
