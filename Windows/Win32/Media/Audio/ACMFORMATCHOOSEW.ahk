#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class ACMFORMATCHOOSEW extends Win32Struct
{
    static sizeof => 448

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
    fdwStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbwfx {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {String}
     */
    szFormatTag {
        get => StrGet(this.ptr + 40, 47, "UTF-16")
        set => StrPut(value, this.ptr + 40, 47, "UTF-16")
    }

    /**
     * @type {String}
     */
    szFormat {
        get => StrGet(this.ptr + 136, 127, "UTF-16")
        set => StrPut(value, this.ptr + 136, 127, "UTF-16")
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszName {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    cchName {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    fdwEnum {
        get => NumGet(this, 404, "uint")
        set => NumPut("uint", value, this, 404)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxEnum {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pszTemplateName {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * @type {Pointer<ACMFORMATCHOOSEHOOKPROCW>}
     */
    pfnHook {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }
}
