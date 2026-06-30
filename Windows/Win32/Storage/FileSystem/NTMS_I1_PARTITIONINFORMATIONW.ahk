#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
class NTMS_I1_PARTITIONINFORMATIONW extends Win32Struct {
    static sizeof => 948

    static packingSize => 4

    /**
     * @type {Guid}
     */
    PhysicalMedia {
        get {
            if(!this.HasProp("__PhysicalMedia"))
                this.__PhysicalMedia := Guid(0, this)
            return this.__PhysicalMedia
        }
    }

    /**
     * @type {Guid}
     */
    LogicalMedia {
        get {
            if(!this.HasProp("__LogicalMedia"))
                this.__LogicalMedia := Guid(16, this)
            return this.__LogicalMedia
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Side {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwOmidLabelIdLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Integer>}
     */
    OmidLabelId {
        get {
            if(!this.HasProp("__OmidLabelIdProxyArray"))
                this.__OmidLabelIdProxyArray := Win32FixedArray(this.ptr + 44, 255, Primitive, "char")
            return this.__OmidLabelIdProxyArray
        }
    }

    /**
     * @type {String}
     */
    szOmidLabelType {
        get => StrGet(this.ptr + 300, 63, "UTF-16")
        set => StrPut(value, this.ptr + 300, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szOmidLabelInfo {
        get => StrGet(this.ptr + 428, 255, "UTF-16")
        set => StrPut(value, this.ptr + 428, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 940, "uint")
        set => NumPut("uint", value, this, 940)
    }

    /**
     * @type {Integer}
     */
    dwAllocateCount {
        get => NumGet(this, 944, "uint")
        set => NumPut("uint", value, this, 944)
    }
}
