#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class ACMFILTERCHOOSEA extends Win32Struct
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
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(8, this)
            return this.__hwndOwner
        }
    }

    /**
     * @type {Pointer<WAVEFILTER>}
     */
    pwfltr {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbwfltr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {PSTR}
     */
    pszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {String}
     */
    szFilterTag {
        get => StrGet(this.ptr + 40, 47, "UTF-8")
        set => StrPut(value, this.ptr + 40, 47, "UTF-8")
    }

    /**
     * @type {String}
     */
    szFilter {
        get => StrGet(this.ptr + 88, 127, "UTF-8")
        set => StrPut(value, this.ptr + 88, 127, "UTF-8")
    }

    /**
     * @type {PSTR}
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
     * @type {Pointer<WAVEFILTER>}
     */
    pwfltrEnum {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(240, this)
            return this.__hInstance
        }
    }

    /**
     * @type {PSTR}
     */
    pszTemplateName {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<ACMFILTERCHOOSEHOOKPROCA>}
     */
    pfnHook {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }
}
