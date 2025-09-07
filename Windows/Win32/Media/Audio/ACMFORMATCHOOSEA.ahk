#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

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
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 8)
            return this.__hwndOwner
        }
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
     * @type {PSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PSTR(this.ptr + 28)
            return this.__pszTitle
        }
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
     * @type {PSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PSTR(this.ptr + 212)
            return this.__pszName
        }
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
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 236)
            return this.__hInstance
        }
    }

    /**
     * @type {PSTR}
     */
    pszTemplateName{
        get {
            if(!this.HasProp("__pszTemplateName"))
                this.__pszTemplateName := PSTR(this.ptr + 244)
            return this.__pszTemplateName
        }
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
