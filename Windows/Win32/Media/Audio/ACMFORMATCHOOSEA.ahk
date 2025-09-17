#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class ACMFORMATCHOOSEA extends Win32Struct
{
    static sizeof => 272

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
     * @type {Pointer<Void>}
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
     * @type {Pointer<Byte>}
     */
    pszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {String}
     */
    szFormatTag {
        get => StrGet(this.ptr + 40, 47, "UTF-8")
        set => StrPut(value, this.ptr + 40, 47, "UTF-8")
    }

    /**
     * @type {String}
     */
    szFormat {
        get => StrGet(this.ptr + 88, 127, "UTF-8")
        set => StrPut(value, this.ptr + 88, 127, "UTF-8")
    }

    /**
     * @type {Pointer<Byte>}
     */
    pszName {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    cchName {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    fdwEnum {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Pointer<WAVEFORMATEX>}
     */
    pwfxEnum {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<Void>}
     */
    hInstance {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pszTemplateName {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<ACMFORMATCHOOSEHOOKPROCA>}
     */
    pfnHook {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }
}
