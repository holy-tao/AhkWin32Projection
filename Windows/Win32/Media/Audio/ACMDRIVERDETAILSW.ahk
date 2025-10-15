#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class ACMDRIVERDETAILSW extends Win32Struct
{
    static sizeof => 1808

    static packingSize => 8

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
     * @type {HICON}
     */
    hicon{
        get {
            if(!this.HasProp("__hicon"))
                this.__hicon := HICON(this.ptr + 40)
            return this.__hicon
        }
    }

    /**
     * @type {String}
     */
    szShortName {
        get => StrGet(this.ptr + 48, 31, "UTF-16")
        set => StrPut(value, this.ptr + 48, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    szLongName {
        get => StrGet(this.ptr + 112, 127, "UTF-16")
        set => StrPut(value, this.ptr + 112, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    szCopyright {
        get => StrGet(this.ptr + 368, 79, "UTF-16")
        set => StrPut(value, this.ptr + 368, 79, "UTF-16")
    }

    /**
     * @type {String}
     */
    szLicensing {
        get => StrGet(this.ptr + 528, 127, "UTF-16")
        set => StrPut(value, this.ptr + 528, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    szFeatures {
        get => StrGet(this.ptr + 784, 511, "UTF-16")
        set => StrPut(value, this.ptr + 784, 511, "UTF-16")
    }
}
