#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class ACMFORMATCHOOSEW extends Win32Struct
{
    static sizeof => 444

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
    fdwStyle {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    pszTitle {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {String}
     */
    szFormatTag {
        get => StrGet(this.ptr + 36, 47, "UTF-16")
        set => StrPut(value, this.ptr + 36, 47, "UTF-16")
    }

    /**
     * @type {String}
     */
    szFormat {
        get => StrGet(this.ptr + 132, 127, "UTF-16")
        set => StrPut(value, this.ptr + 132, 127, "UTF-16")
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pszName {
        get => NumGet(this, 388, "ptr")
        set => NumPut("ptr", value, this, 388)
    }

    /**
     * @type {Integer}
     */
    cchName {
        get => NumGet(this, 396, "uint")
        set => NumPut("uint", value, this, 396)
    }

    /**
     * @type {Integer}
     */
    fdwEnum {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxEnum {
        get => NumGet(this, 404, "ptr")
        set => NumPut("ptr", value, this, 404)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hInstance {
        get => NumGet(this, 412, "ptr")
        set => NumPut("ptr", value, this, 412)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pszTemplateName {
        get => NumGet(this, 420, "ptr")
        set => NumPut("ptr", value, this, 420)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 428, "ptr")
        set => NumPut("ptr", value, this, 428)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnHook {
        get => NumGet(this, 436, "ptr")
        set => NumPut("ptr", value, this, 436)
    }
}
