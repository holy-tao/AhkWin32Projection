#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASCONNA extends Win32Struct
{
    static sizeof => 720

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<HRASCONN>}
     */
    hrasconn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    szEntryName{
        get {
            if(!this.HasProp("__szEntryNameProxyArray"))
                this.__szEntryNameProxyArray := Win32FixedArray(this.ptr + 16, 257, Primitive, "char")
            return this.__szEntryNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceType{
        get {
            if(!this.HasProp("__szDeviceTypeProxyArray"))
                this.__szDeviceTypeProxyArray := Win32FixedArray(this.ptr + 273, 17, Primitive, "char")
            return this.__szDeviceTypeProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szDeviceName{
        get {
            if(!this.HasProp("__szDeviceNameProxyArray"))
                this.__szDeviceNameProxyArray := Win32FixedArray(this.ptr + 290, 129, Primitive, "char")
            return this.__szDeviceNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szPhonebook{
        get {
            if(!this.HasProp("__szPhonebookProxyArray"))
                this.__szPhonebookProxyArray := Win32FixedArray(this.ptr + 419, 260, Primitive, "char")
            return this.__szPhonebookProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwSubEntry {
        get => NumGet(this, 680, "uint")
        set => NumPut("uint", value, this, 680)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidEntry {
        get => NumGet(this, 688, "ptr")
        set => NumPut("ptr", value, this, 688)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 696, "uint")
        set => NumPut("uint", value, this, 696)
    }

    /**
     * @type {LUID}
     */
    luid{
        get {
            if(!this.HasProp("__luid"))
                this.__luid := LUID(this.ptr + 704)
            return this.__luid
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidCorrelationId {
        get => NumGet(this, 712, "ptr")
        set => NumPut("ptr", value, this, 712)
    }
}
