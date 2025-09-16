#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICEDUMP_SECTION_HEADER extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    guidDeviceDataId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    sOrganizationID{
        get {
            if(!this.HasProp("__sOrganizationIDProxyArray"))
                this.__sOrganizationIDProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__sOrganizationIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFirmwareRevision {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    sModelNumber{
        get {
            if(!this.HasProp("__sModelNumberProxyArray"))
                this.__sModelNumberProxyArray := Win32FixedArray(this.ptr + 28, 32, Primitive, "char")
            return this.__sModelNumberProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    szDeviceManufacturingID{
        get {
            if(!this.HasProp("__szDeviceManufacturingIDProxyArray"))
                this.__szDeviceManufacturingIDProxyArray := Win32FixedArray(this.ptr + 60, 32, Primitive, "char")
            return this.__szDeviceManufacturingIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    bRestrictedPrivateDataVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwFirmwareIssueId {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Array<Byte>}
     */
    szIssueDescriptionString{
        get {
            if(!this.HasProp("__szIssueDescriptionStringProxyArray"))
                this.__szIssueDescriptionStringProxyArray := Win32FixedArray(this.ptr + 104, 132, Primitive, "char")
            return this.__szIssueDescriptionStringProxyArray
        }
    }
}
