#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Describes the default, maximum, and minimum values allowed for a FILETIME.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-resutil_filetime_data
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESUTIL_FILETIME_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {FILETIME}
     */
    Default{
        get {
            if(!this.HasProp("__Default"))
                this.__Default := FILETIME(this.ptr + 0)
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
                this.__Minimum := FILETIME(this.ptr + 8)
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
                this.__Maximum := FILETIME(this.ptr + 16)
            return this.__Maximum
        }
    }
}
