#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_ASSOCIATION_TYPE.ahk
#Include .\STORAGE_IDENTIFIER_CODE_SET.ahk
#Include .\STORAGE_IDENTIFIER_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_IDENTIFIER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {STORAGE_IDENTIFIER_CODE_SET}
     */
    CodeSet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {STORAGE_IDENTIFIER_TYPE}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    IdentifierSize {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NextOffset {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {STORAGE_ASSOCIATION_TYPE}
     */
    Association {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    Identifier {
        get {
            if(!this.HasProp("__IdentifierProxyArray"))
                this.__IdentifierProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__IdentifierProxyArray
        }
    }
}
