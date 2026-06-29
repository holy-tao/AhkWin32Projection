#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_VERSION_FLAG_FROM_FEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_VERSION_FLAG_HAS_BY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_SERIALIZE_REPLICA_KEY_MAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_FILTER_INFO_FLAG_ITEM_LIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_FILTER_INFO_FLAG_CUSTOM := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_FILTER_INFO_COMBINED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_CHANGE_FLAG_DELETED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_CHANGE_FLAG_DOES_NOT_EXIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_CHANGE_FLAG_GHOST := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCC_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCC_CAN_CREATE_WITHOUT_UI := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCC_CAN_MODIFY_WITHOUT_UI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCC_CREATE_NOT_SUPPORTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCC_MODIFY_NOT_SUPPORTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SPC_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_PROVIDER_STATE_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_PROVIDER_STATE_DIRTY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_PROVIDER_CONFIGURATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_PROVIDER_CONFIGUI_CONFIGURATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_32_BIT_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYNC_64_BIT_SUPPORTED := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_INSTANCEID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_INSTANCEID.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_INSTANCEID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_CLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_CLSID.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_CLSID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_CONFIGUI := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_CONFIGUI.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_CONFIGUI.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_CONTENTTYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_CONTENTTYPE.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_CONTENTTYPE.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_CAPABILITIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_CAPABILITIES.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_CAPABILITIES.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_SUPPORTED_ARCHITECTURE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_SUPPORTED_ARCHITECTURE.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_SUPPORTED_ARCHITECTURE.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_NAME.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_NAME.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_DESCRIPTION.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_TOOLTIPS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_TOOLTIPS.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_TOOLTIPS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_PROVIDER_ICON := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_PROVIDER_ICON.fmtid),
    Guid.Ptr, Guid("{84179e61-60f6-4c1c-88ed-f1c531b32bda}"),
    UInt32, 16)
PKEY_PROVIDER_ICON.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_INSTANCEID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_INSTANCEID.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_INSTANCEID.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_CLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_CLSID.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_CLSID.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_CONTENTTYPE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_CONTENTTYPE.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_CONTENTTYPE.pid := 4

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_CAPABILITIES := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_CAPABILITIES.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_CAPABILITIES.pid := 5

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_SUPPORTED_ARCHITECTURE.pid := 6

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_IS_GLOBAL := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_IS_GLOBAL.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_IS_GLOBAL.pid := 7

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_NAME := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_NAME.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_NAME.pid := 8

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_DESCRIPTION := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_DESCRIPTION.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_DESCRIPTION.pid := 9

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_TOOLTIPS := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_TOOLTIPS.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_TOOLTIPS.pid := 10

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_ICON := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_ICON.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_ICON.pid := 11

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_MENUITEM_NOUI := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_MENUITEM_NOUI.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_MENUITEM_NOUI.pid := 12

/**
 * @type {PROPERTYKEY}
 */
export global PKEY_CONFIGUI_MENUITEM := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(PKEY_CONFIGUI_MENUITEM.fmtid),
    Guid.Ptr, Guid("{554b24ea-e8e3-45ba-9352-dfb561e171e4}"),
    UInt32, 16)
PKEY_CONFIGUI_MENUITEM.pid := 13
;@endregion Constants
