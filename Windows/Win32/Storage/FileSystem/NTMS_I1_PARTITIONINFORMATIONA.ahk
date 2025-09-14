#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_PARTITIONINFORMATIONA extends Win32Struct
{
    static sizeof => 616

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    PhysicalMedia {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogicalMedia {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Side {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwOmidLabelIdLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    OmidLabelId{
        get {
            if(!this.HasProp("__OmidLabelIdProxyArray"))
                this.__OmidLabelIdProxyArray := Win32FixedArray(this.ptr + 28, 255, Primitive, "char")
            return this.__OmidLabelIdProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szOmidLabelType{
        get {
            if(!this.HasProp("__szOmidLabelTypeProxyArray"))
                this.__szOmidLabelTypeProxyArray := Win32FixedArray(this.ptr + 283, 64, Primitive, "char")
            return this.__szOmidLabelTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szOmidLabelInfo{
        get {
            if(!this.HasProp("__szOmidLabelInfoProxyArray"))
                this.__szOmidLabelInfoProxyArray := Win32FixedArray(this.ptr + 347, 256, Primitive, "char")
            return this.__szOmidLabelInfoProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 604, "uint")
        set => NumPut("uint", value, this, 604)
    }

    /**
     * @type {Integer}
     */
    dwAllocateCount {
        get => NumGet(this, 608, "uint")
        set => NumPut("uint", value, this, 608)
    }
}
