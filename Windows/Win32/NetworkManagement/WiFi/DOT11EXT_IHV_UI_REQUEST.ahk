#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11EXT_IHV_UI_REQUEST extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidUIRequest {
        get {
            if(!this.HasProp("__guidUIRequest"))
                this.__guidUIRequest := Guid(4, this)
            return this.__guidUIRequest
        }
    }

    /**
     * @type {Guid}
     */
    UIPageClsid {
        get {
            if(!this.HasProp("__UIPageClsid"))
                this.__UIPageClsid := Guid(20, this)
            return this.__UIPageClsid
        }
    }

    /**
     * @type {Integer}
     */
    dwByteCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pvUIRequest {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
