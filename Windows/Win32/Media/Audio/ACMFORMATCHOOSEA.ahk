#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class ACMFORMATCHOOSEA extends Win32Struct
{
    static sizeof => 268

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
        get => StrGet(this.ptr + 36, 47, "UTF-8")
        set => StrPut(value, this.ptr + 36, 47, "UTF-8")
    }

    /**
     * @type {String}
     */
    szFormat {
        get => StrGet(this.ptr + 84, 127, "UTF-8")
        set => StrPut(value, this.ptr + 84, 127, "UTF-8")
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pszName {
        get => NumGet(this, 212, "ptr")
        set => NumPut("ptr", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    cchName {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    fdwEnum {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxEnum {
        get => NumGet(this, 228, "ptr")
        set => NumPut("ptr", value, this, 228)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hInstance {
        get => NumGet(this, 236, "ptr")
        set => NumPut("ptr", value, this, 236)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pszTemplateName {
        get => NumGet(this, 244, "ptr")
        set => NumPut("ptr", value, this, 244)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 252, "ptr")
        set => NumPut("ptr", value, this, 252)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnHook {
        get => NumGet(this, 260, "ptr")
        set => NumPut("ptr", value, this, 260)
    }
}
