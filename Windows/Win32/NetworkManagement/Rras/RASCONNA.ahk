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
     * @type {String}
     */
    szEntryName {
        get => StrGet(this.ptr + 16, 256, "UTF-8")
        set => StrPut(value, this.ptr + 16, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 273, 16, "UTF-8")
        set => StrPut(value, this.ptr + 273, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 290, 128, "UTF-8")
        set => StrPut(value, this.ptr + 290, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPhonebook {
        get => StrGet(this.ptr + 419, 259, "UTF-8")
        set => StrPut(value, this.ptr + 419, 259, "UTF-8")
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
