#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WindowsAndMessaging\HICON.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shstockiconinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHSTOCKICONINFO extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(8, this)
            return this.__hIcon
        }
    }

    /**
     * @type {Integer}
     */
    iSysImageIndex {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    iIcon {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {String}
     */
    szPath {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 544
    }
}
