#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include .\DEBUG_TYPED_DATA.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_TYPED_DATA extends Win32Struct
{
    static sizeof => 392

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DEBUG_TYPED_DATA}
     */
    InData{
        get {
            if(!this.HasProp("__InData"))
                this.__InData := DEBUG_TYPED_DATA(this.ptr + 8)
            return this.__InData
        }
    }

    /**
     * @type {DEBUG_TYPED_DATA}
     */
    OutData{
        get {
            if(!this.HasProp("__OutData"))
                this.__OutData := DEBUG_TYPED_DATA(this.ptr + 136)
            return this.__OutData
        }
    }

    /**
     * @type {Integer}
     */
    InStrIndex {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    In32 {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    Out32 {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    In64 {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    Out64 {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    StrBufferIndex {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    StrBufferChars {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }

    /**
     * @type {Integer}
     */
    StrCharsNeeded {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    DataBufferIndex {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * @type {Integer}
     */
    DataBufferBytes {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    DataBytesNeeded {
        get => NumGet(this, 316, "uint")
        set => NumPut("uint", value, this, 316)
    }

    /**
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 320, "int")
        set => NumPut("int", value, this, 320)
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 328, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
