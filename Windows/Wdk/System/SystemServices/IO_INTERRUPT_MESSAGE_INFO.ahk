#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IO_INTERRUPT_MESSAGE_INFO_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_INTERRUPT_MESSAGE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UnifiedIrql {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MessageCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<IO_INTERRUPT_MESSAGE_INFO_ENTRY>}
     */
    MessageInfo{
        get {
            if(!this.HasProp("__MessageInfoProxyArray"))
                this.__MessageInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__MessageInfoProxyArray
        }
    }
}
