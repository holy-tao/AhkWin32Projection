#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ADVANCEDDISK_PROP extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszId{
        get {
            if(!this.HasProp("__pwszId"))
                this.__pwszId := PWSTR(this.ptr + 0)
            return this.__pwszId
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszPathname{
        get {
            if(!this.HasProp("__pwszPathname"))
                this.__pwszPathname := PWSTR(this.ptr + 8)
            return this.__pwszPathname
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszLocation{
        get {
            if(!this.HasProp("__pwszLocation"))
                this.__pwszLocation := PWSTR(this.ptr + 16)
            return this.__pwszLocation
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszFriendlyName{
        get {
            if(!this.HasProp("__pwszFriendlyName"))
                this.__pwszFriendlyName := PWSTR(this.ptr + 24)
            return this.__pwszFriendlyName
        }
    }

    /**
     * @type {PWSTR}
     */
    pswzIdentifier{
        get {
            if(!this.HasProp("__pswzIdentifier"))
                this.__pswzIdentifier := PWSTR(this.ptr + 32)
            return this.__pswzIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    usIdentifierFormat {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulNumber {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {PWSTR}
     */
    pwszSerialNumber{
        get {
            if(!this.HasProp("__pwszSerialNumber"))
                this.__pwszSerialNumber := PWSTR(this.ptr + 48)
            return this.__pwszSerialNumber
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszFirmwareVersion{
        get {
            if(!this.HasProp("__pwszFirmwareVersion"))
                this.__pwszFirmwareVersion := PWSTR(this.ptr + 56)
            return this.__pwszFirmwareVersion
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszManufacturer{
        get {
            if(!this.HasProp("__pwszManufacturer"))
                this.__pwszManufacturer := PWSTR(this.ptr + 64)
            return this.__pwszManufacturer
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszModel{
        get {
            if(!this.HasProp("__pwszModel"))
                this.__pwszModel := PWSTR(this.ptr + 72)
            return this.__pwszModel
        }
    }

    /**
     * @type {Integer}
     */
    ullTotalSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ullAllocatedSize {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    ulLogicalSectorSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ulPhysicalSectorSize {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    ulPartitionCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    status {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    health {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DiskGuid {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwDeviceType {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
