#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_LOGINFO_A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulGenLow {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulGenHigh {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    szBaseName{
        get {
            if(!this.HasProp("__szBaseNameProxyArray"))
                this.__szBaseNameProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__szBaseNameProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
