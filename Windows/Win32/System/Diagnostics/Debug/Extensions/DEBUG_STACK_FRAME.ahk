#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_STACK_FRAME extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InstructionOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ReturnOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FrameOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StackOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    FuncTableEntry {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<UInt64>}
     */
    Params{
        get {
            if(!this.HasProp("__ParamsProxyArray"))
                this.__ParamsProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "uint")
            return this.__ParamsProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 72, 6, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {BOOL}
     */
    Virtual {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    FrameNumber {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }
}
