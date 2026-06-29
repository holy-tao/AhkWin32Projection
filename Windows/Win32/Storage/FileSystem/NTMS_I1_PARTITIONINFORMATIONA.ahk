#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
class NTMS_I1_PARTITIONINFORMATIONA extends Win32Struct {
    static sizeof => 628

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
        get => StrGet(this.ptr + 299, 63, "UTF-8")
        set => StrPut(value, this.ptr + 299, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    szOmidLabelInfo {
        get => StrGet(this.ptr + 363, 255, "UTF-8")
        set => StrPut(value, this.ptr + 363, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 620, "uint")
        set => NumPut("uint", value, this, 620)
    }

    /**
     * @type {Integer}
     */
    dwAllocateCount {
        get => NumGet(this, 624, "uint")
        set => NumPut("uint", value, this, 624)
    }
}
