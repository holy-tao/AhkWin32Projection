#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PARTITION_INFORMATION_GPT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SET_PARTITION_INFORMATION_EX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Mbr {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {PARTITION_INFORMATION_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := PARTITION_INFORMATION_GPT(this.ptr + 8)
            return this.__Gpt
        }
    }
}
