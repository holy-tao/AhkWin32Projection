#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SCRUB_DATA_INPUT extends Win32Struct
{
    static sizeof => 1232

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaximumIos {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<UInt32>}
     */
    ObjectId{
        get {
            if(!this.HasProp("__ObjectIdProxyArray"))
                this.__ObjectIdProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "uint")
            return this.__ObjectIdProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 28, 41, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ResumeContext{
        get {
            if(!this.HasProp("__ResumeContextProxyArray"))
                this.__ResumeContextProxyArray := Win32FixedArray(this.ptr + 192, 1040, Primitive, "char")
            return this.__ResumeContextProxyArray
        }
    }
}
