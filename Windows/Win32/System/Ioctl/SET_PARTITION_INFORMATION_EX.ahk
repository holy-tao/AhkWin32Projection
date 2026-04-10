#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PARTITION_STYLE.ahk
#Include .\SET_PARTITION_INFORMATION.ahk
#Include .\PARTITION_INFORMATION_GPT.ahk
#Include .\GPT_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SET_PARTITION_INFORMATION_EX extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {PARTITION_STYLE}
     */
    PartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {SET_PARTITION_INFORMATION}
     */
    Mbr {
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := SET_PARTITION_INFORMATION(8, this)
            return this.__Mbr
        }
    }

    /**
     * @type {PARTITION_INFORMATION_GPT}
     */
    Gpt {
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := PARTITION_INFORMATION_GPT(8, this)
            return this.__Gpt
        }
    }
}
