#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_ISDBCAS_RESPONSEDATA extends Win32Struct
{
    static sizeof => 17

    static packingSize => 1

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulRequestID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulIsdbStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulIsdbDataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    argbIsdbCommandData{
        get {
            if(!this.HasProp("__argbIsdbCommandDataProxyArray"))
                this.__argbIsdbCommandDataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__argbIsdbCommandDataProxyArray
        }
    }
}
