#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class ERRORINFO extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {HRESULT}
     */
    hrError {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwMinor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(8, this)
            return this.__clsid
        }
    }

    /**
     * @type {Guid}
     */
    iid {
        get {
            if(!this.HasProp("__iid"))
                this.__iid := Guid(24, this)
            return this.__iid
        }
    }

    /**
     * @type {Integer}
     */
    dispid {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
