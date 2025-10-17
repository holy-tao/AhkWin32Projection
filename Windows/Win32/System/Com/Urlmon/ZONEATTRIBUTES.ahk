#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class ZONEATTRIBUTES extends Win32Struct
{
    static sizeof => 1460

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    szDisplayName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 524, 199, "UTF-16")
        set => StrPut(value, this.ptr + 524, 199, "UTF-16")
    }

    /**
     * @type {String}
     */
    szIconPath {
        get => StrGet(this.ptr + 924, 259, "UTF-16")
        set => StrPut(value, this.ptr + 924, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwTemplateMinLevel {
        get => NumGet(this, 1444, "uint")
        set => NumPut("uint", value, this, 1444)
    }

    /**
     * @type {Integer}
     */
    dwTemplateRecommended {
        get => NumGet(this, 1448, "uint")
        set => NumPut("uint", value, this, 1448)
    }

    /**
     * @type {Integer}
     */
    dwTemplateCurrentLevel {
        get => NumGet(this, 1452, "uint")
        set => NumPut("uint", value, this, 1452)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 1456, "uint")
        set => NumPut("uint", value, this, 1456)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1460
    }
}
