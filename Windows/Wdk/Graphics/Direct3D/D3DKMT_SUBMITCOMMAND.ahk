#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_SUBMITCOMMAND extends Win32Struct
{
    static sizeof => 392

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Commands {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CommandLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<D3DKMT_SUBMITCOMMANDFLAGS>}
     */
    Flags {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PresentHistoryToken {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    BroadcastContextCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<UInt32>}
     */
    BroadcastContext{
        get {
            if(!this.HasProp("__BroadcastContextProxyArray"))
                this.__BroadcastContextProxyArray := Win32FixedArray(this.ptr + 36, 64, Primitive, "uint")
            return this.__BroadcastContextProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pPrivateDriverData {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    PrivateDriverDataSize {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    NumPrimaries {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * @type {Array<UInt32>}
     */
    WrittenPrimaries{
        get {
            if(!this.HasProp("__WrittenPrimariesProxyArray"))
                this.__WrittenPrimariesProxyArray := Win32FixedArray(this.ptr + 312, 16, Primitive, "uint")
            return this.__WrittenPrimariesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NumHistoryBuffers {
        get => NumGet(this, 376, "uint")
        set => NumPut("uint", value, this, 376)
    }

    /**
     * @type {Pointer<Integer>}
     */
    HistoryBufferArray {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }
}
