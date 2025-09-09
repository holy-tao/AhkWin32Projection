#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PROCESS_COMMIT_USAGE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    ImageFileName{
        get {
            if(!this.HasProp("__ImageFileNameProxyArray"))
                this.__ImageFileNameProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__ImageFileNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ClientId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ProcessAddress {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CommitCharge {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    SharedCommitCharge {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ReleasedCommitDebt {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
