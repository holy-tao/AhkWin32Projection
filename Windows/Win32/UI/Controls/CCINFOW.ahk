#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class CCINFOW extends Win32Struct
{
    static sizeof => 704

    static packingSize => 8

    /**
     * @type {String}
     */
    szClass {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    flOptions {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {String}
     */
    szDesc {
        get => StrGet(this.ptr + 68, 31, "UTF-16")
        set => StrPut(value, this.ptr + 68, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    cxDefault {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    cyDefault {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    flStyleDefault {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    flExtStyleDefault {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    flCtrlTypeMask {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    cStyleFlags {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {Pointer<CCSTYLEFLAGW>}
     */
    aStyleFlags {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {String}
     */
    szTextDefault {
        get => StrGet(this.ptr + 168, 255, "UTF-16")
        set => StrPut(value, this.ptr + 168, 255, "UTF-16")
    }

    /**
     * @type {Pointer<LPFNCCSTYLEW>}
     */
    lpfnStyle {
        get => NumGet(this, 680, "ptr")
        set => NumPut("ptr", value, this, 680)
    }

    /**
     * @type {Pointer<LPFNCCSIZETOTEXTW>}
     */
    lpfnSizeToText {
        get => NumGet(this, 688, "ptr")
        set => NumPut("ptr", value, this, 688)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 696, "uint")
        set => NumPut("uint", value, this, 696)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 700, "uint")
        set => NumPut("uint", value, this, 700)
    }
}
