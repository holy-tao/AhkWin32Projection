#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIAS_CHANGED_VALUE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    bChanged{
        get {
            if(!this.HasProp("__bChanged"))
                this.__bChanged := BOOL(this.ptr + 0)
            return this.__bChanged
        }
    }

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    lVal {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Float}
     */
    fltVal {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {BSTR}
     */
    bstrVal{
        get {
            if(!this.HasProp("__bstrVal"))
                this.__bstrVal := BSTR(this.ptr + 8)
            return this.__bstrVal
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidVal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
