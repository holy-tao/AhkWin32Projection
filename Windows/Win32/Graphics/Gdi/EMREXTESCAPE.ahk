#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREXTESCAPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * @type {Integer}
     */
    iEscape {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbEscData {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    EscData{
        get {
            if(!this.HasProp("__EscDataProxyArray"))
                this.__EscDataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__EscDataProxyArray
        }
    }
}
