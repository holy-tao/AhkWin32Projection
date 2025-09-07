#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_URL_MAP_EX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszURL{
        get {
            if(!this.HasProp("__pszURL"))
                this.__pszURL := PSTR(this.ptr + 0)
            return this.__pszURL
        }
    }

    /**
     * @type {PSTR}
     */
    pszPhysicalPath{
        get {
            if(!this.HasProp("__pszPhysicalPath"))
                this.__pszPhysicalPath := PSTR(this.ptr + 8)
            return this.__pszPhysicalPath
        }
    }

    /**
     * @type {Integer}
     */
    cbPathBuff {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cchMatchingPath {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cchMatchingURL {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {PSTR}
     */
    pszScriptMapEntry{
        get {
            if(!this.HasProp("__pszScriptMapEntry"))
                this.__pszScriptMapEntry := PSTR(this.ptr + 32)
            return this.__pszScriptMapEntry
        }
    }
}
