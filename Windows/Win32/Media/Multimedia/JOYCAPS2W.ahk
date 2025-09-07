#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class JOYCAPS2W extends Win32Struct
{
    static sizeof => 752

    static packingSize => 1

    /**
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    wXmin {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    wXmax {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    wYmin {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    wYmax {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    wZmin {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    wZmax {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    wNumButtons {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    wPeriodMin {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    wPeriodMax {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    wRmin {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    wRmax {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    wUmin {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    wUmax {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    wVmin {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    wVmax {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    wCaps {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    wMaxAxes {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    wNumAxes {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    wMaxButtons {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {String}
     */
    szRegKey {
        get => StrGet(this.ptr + 144, 31, "UTF-16")
        set => StrPut(value, this.ptr + 144, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    szOEMVxD {
        get => StrGet(this.ptr + 208, 259, "UTF-16")
        set => StrPut(value, this.ptr + 208, 259, "UTF-16")
    }

    /**
     * @type {Pointer<Guid>}
     */
    ManufacturerGuid {
        get => NumGet(this, 728, "ptr")
        set => NumPut("ptr", value, this, 728)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ProductGuid {
        get => NumGet(this, 736, "ptr")
        set => NumPut("ptr", value, this, 736)
    }

    /**
     * @type {Pointer<Guid>}
     */
    NameGuid {
        get => NumGet(this, 744, "ptr")
        set => NumPut("ptr", value, this, 744)
    }
}
