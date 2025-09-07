#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk

/**
 * Describes multiple NULL-terminated Unicode strings.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_sz
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_SZ extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Multiple null-terminated Unicode strings with the last string followed by an additional <b>NULL</b>-terminating character.
     * @type {String}
     */
    sz {
        get => StrGet(this.ptr + 16, 0, "UTF-16")
        set => StrPut(value, this.ptr + 16, 0, "UTF-16")
    }
}
