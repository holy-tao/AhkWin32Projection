#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk
#Include .\KADDRESS_RANGE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KTRIAGE_DUMP_DATA_ARRAY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY(0, this)
            return this.__List
        }
    }

    /**
     * @type {Integer}
     */
    NumBlocksUsed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumBlocksTotal {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaxDataSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ComponentNameBufferLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ComponentName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Array<KADDRESS_RANGE>}
     */
    Blocks{
        get {
            if(!this.HasProp("__BlocksProxyArray"))
                this.__BlocksProxyArray := Win32FixedArray(this.ptr + 48, 1, Primitive, "ptr")
            return this.__BlocksProxyArray
        }
    }
}
