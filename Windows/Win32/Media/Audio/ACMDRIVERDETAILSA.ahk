#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class ACMDRIVERDETAILSA extends Win32Struct
{
    static sizeof => 924

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fccType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    fccComp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    vdwACM {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    vdwDriver {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    fdwSupport {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cFormatTags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    cFilterTags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hicon {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * @type {String}
     */
    szShortName {
        get => StrGet(this.ptr + 44, 31, "UTF-8")
        set => StrPut(value, this.ptr + 44, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    szLongName {
        get => StrGet(this.ptr + 76, 127, "UTF-8")
        set => StrPut(value, this.ptr + 76, 127, "UTF-8")
    }

    /**
     * @type {String}
     */
    szCopyright {
        get => StrGet(this.ptr + 204, 79, "UTF-8")
        set => StrPut(value, this.ptr + 204, 79, "UTF-8")
    }

    /**
     * @type {String}
     */
    szLicensing {
        get => StrGet(this.ptr + 284, 127, "UTF-8")
        set => StrPut(value, this.ptr + 284, 127, "UTF-8")
    }

    /**
     * @type {String}
     */
    szFeatures {
        get => StrGet(this.ptr + 412, 511, "UTF-8")
        set => StrPut(value, this.ptr + 412, 511, "UTF-8")
    }
}
