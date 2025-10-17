#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_POINTER_REPEAT_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_REPEAT_FORMAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FormatCode {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {NDR64_POINTER_REPEAT_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := NDR64_POINTER_REPEAT_FLAGS(1, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Increment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OffsetToArray {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfPointers {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
