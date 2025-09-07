#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXTSTACKTRACE32 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FramePointer {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProgramCounter {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ReturnAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    Args{
        get {
            if(!this.HasProp("__ArgsProxyArray"))
                this.__ArgsProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "uint")
            return this.__ArgsProxyArray
        }
    }
}
