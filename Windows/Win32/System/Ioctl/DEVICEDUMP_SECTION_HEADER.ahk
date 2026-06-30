#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICEDUMP_SECTION_HEADER extends Win32Struct {
    static sizeof => 244

    static packingSize => 4

    /**
     * @type {Guid}
     */
    guidDeviceDataId {
        get {
            if(!this.HasProp("__guidDeviceDataId"))
                this.__guidDeviceDataId := Guid(0, this)
            return this.__guidDeviceDataId
        }
    }

    /**
     * @type {Array<Integer>}
     */
    sOrganizationID {
        get {
            if(!this.HasProp("__sOrganizationIDProxyArray"))
                this.__sOrganizationIDProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__sOrganizationIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFirmwareRevision {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    sModelNumber {
        get {
            if(!this.HasProp("__sModelNumberProxyArray"))
                this.__sModelNumberProxyArray := Win32FixedArray(this.ptr + 36, 32, Primitive, "char")
            return this.__sModelNumberProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    szDeviceManufacturingID {
        get {
            if(!this.HasProp("__szDeviceManufacturingIDProxyArray"))
                this.__szDeviceManufacturingIDProxyArray := Win32FixedArray(this.ptr + 68, 32, Primitive, "char")
            return this.__szDeviceManufacturingIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    bRestrictedPrivateDataVersion {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwFirmwareIssueId {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Array<Integer>}
     */
    szIssueDescriptionString {
        get {
            if(!this.HasProp("__szIssueDescriptionStringProxyArray"))
                this.__szIssueDescriptionStringProxyArray := Win32FixedArray(this.ptr + 112, 132, Primitive, "char")
            return this.__szIssueDescriptionStringProxyArray
        }
    }
}
