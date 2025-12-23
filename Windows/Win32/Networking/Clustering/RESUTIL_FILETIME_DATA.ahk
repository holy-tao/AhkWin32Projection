#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Describes the default, maximum, and minimum values allowed for a FILETIME.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resutil_filetime_data
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESUTIL_FILETIME_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * 
     * @type {FILETIME}
     */
    Default{
        get {
            if(!this.HasProp("__Default"))
                this.__Default := FILETIME(0, this)
            return this.__Default
        }
    }

    /**
     * 
     * @type {FILETIME}
     */
    Minimum{
        get {
            if(!this.HasProp("__Minimum"))
                this.__Minimum := FILETIME(8, this)
            return this.__Minimum
        }
    }

    /**
     * 
     * @type {FILETIME}
     */
    Maximum{
        get {
            if(!this.HasProp("__Maximum"))
                this.__Maximum := FILETIME(16, this)
            return this.__Maximum
        }
    }
}
