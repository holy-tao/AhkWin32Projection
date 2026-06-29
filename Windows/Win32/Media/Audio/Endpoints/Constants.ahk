#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */

;@region Constants

/**
 * @type {PROPERTYKEY}
 */
export global DEVPKEY_AudioEndpointPlugin_FactoryCLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_AudioEndpointPlugin_FactoryCLSID.fmtid),
    Guid.Ptr, Guid("{12d83bd7-cf12-46be-8540-812710d3021c}"),
    UInt32, 16)
DEVPKEY_AudioEndpointPlugin_FactoryCLSID.pid := 1

/**
 * @type {PROPERTYKEY}
 */
export global DEVPKEY_AudioEndpointPlugin_DataFlow := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_AudioEndpointPlugin_DataFlow.fmtid),
    Guid.Ptr, Guid("{12d83bd7-cf12-46be-8540-812710d3021c}"),
    UInt32, 16)
DEVPKEY_AudioEndpointPlugin_DataFlow.pid := 2

/**
 * @type {PROPERTYKEY}
 */
export global DEVPKEY_AudioEndpointPlugin_PnPInterface := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_AudioEndpointPlugin_PnPInterface.fmtid),
    Guid.Ptr, Guid("{12d83bd7-cf12-46be-8540-812710d3021c}"),
    UInt32, 16)
DEVPKEY_AudioEndpointPlugin_PnPInterface.pid := 3

/**
 * @type {PROPERTYKEY}
 */
export global DEVPKEY_AudioEndpointPlugin2_FactoryCLSID := PROPERTYKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_AudioEndpointPlugin2_FactoryCLSID.fmtid),
    Guid.Ptr, Guid("{12d83bd7-cf12-46be-8540-812710d3021c}"),
    UInt32, 16)
DEVPKEY_AudioEndpointPlugin2_FactoryCLSID.pid := 4
;@endregion Constants
