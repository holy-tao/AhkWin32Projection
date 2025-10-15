#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_ALLOCATE_BC_STREAM_INPUT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RequestsPerPeriod {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Period {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    RetryFailures{
        get {
            if(!this.HasProp("__RetryFailures"))
                this.__RetryFailures := BOOLEAN(this.ptr + 12)
            return this.__RetryFailures
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Discardable{
        get {
            if(!this.HasProp("__Discardable"))
                this.__Discardable := BOOLEAN(this.ptr + 13)
            return this.__Discardable
        }
    }

    /**
     * @type {Array<BOOLEAN>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 16, 2, BOOLEAN, "")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LowestByteOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    HighestByteOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    AccessMode {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
