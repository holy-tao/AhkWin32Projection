#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Describes a date and time stamp for a file.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_filetime
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_FILETIME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * A date and time value.
     * @type {FILETIME}
     */
    ft{
        get {
            if(!this.HasProp("__ft"))
                this.__ft := FILETIME(16, this)
            return this.__ft
        }
    }
}
