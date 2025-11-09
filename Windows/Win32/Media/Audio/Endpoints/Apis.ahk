#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class Endpoints {

;@region Constants

    /**
     * @type {PROPERTYKEY}
     */
    static DEVPKEY_AudioEndpointPlugin_FactoryCLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{12d83bd7-cf12-46be-8540-812710d3021c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 1
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static DEVPKEY_AudioEndpointPlugin_DataFlow {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{12d83bd7-cf12-46be-8540-812710d3021c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static DEVPKEY_AudioEndpointPlugin_PnPInterface {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{12d83bd7-cf12-46be-8540-812710d3021c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {PROPERTYKEY}
     */
    static DEVPKEY_AudioEndpointPlugin2_FactoryCLSID {
        get {
            value := PROPERTYKEY()
            static fmtid_guid := Guid("{12d83bd7-cf12-46be-8540-812710d3021c}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }
;@endregion Constants

;@region Methods
;@endregion Methods
}
