#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\UCPTrieData.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCPTrie extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<UInt16>}
     */
    index {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {UCPTrieData}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := UCPTrieData(this.ptr + 8)
            return this.__data
        }
    }

    /**
     * @type {Integer}
     */
    indexLength {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dataLength {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    highStart {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    shifted12HighStart {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    valueWidth {
        get => NumGet(this, 55, "char")
        set => NumPut("char", value, this, 55)
    }

    /**
     * @type {Integer}
     */
    reserved32 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    reserved16 {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    index3NullOffset {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    dataNullOffset {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    nullValue {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
