#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class ACMFILTERCHOOSEW extends Win32Struct
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
     * @type {PWSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PWSTR(this.ptr + 28)
            return this.__pszTitle
        }
    }

    /**
     * @type {String}
     */
    szFilterTag {
        get => StrGet(this.ptr + 36, 47, "UTF-16")
        set => StrPut(value, this.ptr + 36, 47, "UTF-16")
    }

    /**
     * @type {String}
     */
    szFilter {
        get => StrGet(this.ptr + 132, 127, "UTF-16")
        set => StrPut(value, this.ptr + 132, 127, "UTF-16")
    }

    /**
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 388)
            return this.__pszName
        }
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
     * @type {Pointer<WAVEFILTER>}
     */
    pwfltrEnum {
        get => NumGet(this, 404, "ptr")
        set => NumPut("ptr", value, this, 404)
    }

    /**
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 412)
            return this.__hInstance
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTemplateName{
        get {
            if(!this.HasProp("__pszTemplateName"))
                this.__pszTemplateName := PWSTR(this.ptr + 420)
            return this.__pszTemplateName
        }
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
