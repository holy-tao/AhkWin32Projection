#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.System.SideShow
 */

;@region Constants

/**
 * @type {Guid}
 */
export global SIDESHOW_ENDPOINT_SIMPLE_CONTENT_FORMAT := Guid("{a9a5353f-2d4b-47ce-93ee-759f3a7dda4f}")

/**
 * @type {Guid}
 */
export global SIDESHOW_ENDPOINT_ICAL := Guid("{4dff36b5-9dde-4f76-9a2a-96435047063d}")

/**
 * @type {Guid}
 */
export global SIDESHOW_CAPABILITY_DEVICE_PROPERTIES := Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}")

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_DEVICE_ID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_DEVICE_ID.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_DEVICE_ID.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SCREEN_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SCREEN_TYPE.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SCREEN_TYPE.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SCREEN_WIDTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SCREEN_WIDTH.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SCREEN_WIDTH.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SCREEN_HEIGHT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SCREEN_HEIGHT.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SCREEN_HEIGHT.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_COLOR_DEPTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_COLOR_DEPTH.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_COLOR_DEPTH.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_COLOR_TYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_COLOR_TYPE.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_COLOR_TYPE.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_DATA_CACHE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_DATA_CACHE.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_DATA_CACHE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SUPPORTED_LANGUAGES.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_CURRENT_LANGUAGE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_CURRENT_LANGUAGE.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_CURRENT_LANGUAGE.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SUPPORTED_THEMES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SUPPORTED_THEMES.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SUPPORTED_THEMES.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_SUPPORTED_IMAGE_FORMATS.pid := 14

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_CLIENT_AREA_WIDTH.pid := 15

/**
 * @type {PROPERTYKEY}
 */
export global SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT.fmtid),
    Guid.Ptr, Guid("{8abc88a8-857b-4ad7-a35a-b5942f492b99}"),
    UInt32, 16)
SIDESHOW_CAPABILITY_CLIENT_AREA_HEIGHT.pid := 16

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_SIDESHOW := Guid("{152e5811-feb9-4b00-90f4-d32947ae1681}")

/**
 * @type {Guid}
 */
export global SIDESHOW_CONTENT_MISSING_EVENT := Guid("{5007fba8-d313-439f-bea2-a50201d3e9a8}")

/**
 * @type {Guid}
 */
export global SIDESHOW_APPLICATION_EVENT := Guid("{4cb572fa-1d3b-49b3-a17a-2e6bff052854}")

/**
 * @type {Guid}
 */
export global SIDESHOW_USER_CHANGE_REQUEST_EVENT := Guid("{5009673c-3f7d-4c7e-9971-eaa2e91f1575}")

/**
 * @type {Guid}
 */
export global SIDESHOW_NEW_EVENT_DATA_AVAILABLE := Guid("{57813854-2fc1-411c-a59f-f24927608804}")

/**
 * @type {Integer (UInt32)}
 */
export global CONTENT_ID_GLANCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SIDESHOW_EVENTID_APPLICATION_ENTER := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global SIDESHOW_EVENTID_APPLICATION_EXIT := 4294901761

/**
 * @type {Integer (UInt32)}
 */
export global CONTENT_ID_HOME := 1

/**
 * @type {Integer (UInt32)}
 */
export global VERSION_1_WINDOWS_7 := 0
;@endregion Constants
