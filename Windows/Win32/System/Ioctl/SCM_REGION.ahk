#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_REGION extends Win32Struct {
    static sizeof => 96

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
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NfitHandle {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    LogicalDeviceGuid {
        get {
            if(!this.HasProp("__LogicalDeviceGuid"))
                this.__LogicalDeviceGuid := Guid(16, this)
            return this.__LogicalDeviceGuid
        }
    }

    /**
     * @type {Guid}
     */
    AddressRangeType {
        get {
            if(!this.HasProp("__AddressRangeType"))
                this.__AddressRangeType := Guid(32, this)
            return this.__AddressRangeType
        }
    }

    /**
     * @type {Integer}
     */
    AssociatedId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    StartingDPA {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    BaseSPA {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    SPAOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RegionOffset {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
