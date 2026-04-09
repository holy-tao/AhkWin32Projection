#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_ISDBCAS_REQUESTHEADER extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    bInstruction {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    bReserved {
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulDataLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    argbIsdbCommand {
        get {
            if(!this.HasProp("__argbIsdbCommandProxyArray"))
                this.__argbIsdbCommandProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__argbIsdbCommandProxyArray
        }
    }
}
