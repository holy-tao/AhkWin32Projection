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
     * @type {Pointer<PSTR>}
     */
    pszTitle {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Array<SByte>}
     */
    szFormatTag{
        get {
            if(!this.HasProp("__szFormatTagProxyArray"))
                this.__szFormatTagProxyArray := Win32FixedArray(this.ptr + 36, 48, Primitive, "char")
            return this.__szFormatTagProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szFormat{
        get {
            if(!this.HasProp("__szFormatProxyArray"))
                this.__szFormatProxyArray := Win32FixedArray(this.ptr + 84, 128, Primitive, "char")
            return this.__szFormatProxyArray
        }
    }

    /**
     * @type {Pointer<PSTR>}
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
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 236, "ptr")
        set => NumPut("ptr", value, this, 236)
    }

    /**
     * @type {Pointer<PSTR>}
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
     * @type {Pointer<ACMFORMATCHOOSEHOOKPROCA>}
     */
    pfnHook {
        get => NumGet(this, 260, "ptr")
        set => NumPut("ptr", value, this, 260)
    }
}
