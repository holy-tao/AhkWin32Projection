#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILESHARE_CHANGE_ENUM.ahk

/**
 * Describes the format for an entry in an event notification list.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-fileshare_change
 * @namespace Windows.Win32.Networking.Clustering
 */
class FILESHARE_CHANGE extends Win32Struct {
    static sizeof => 172

    static packingSize => 4

    /**
     * Describes a change event. This value is taken from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-fileshare_change_enum">FILESHARE_CHANGE_ENUM</a> enumeration. The following 
     *        are the possible values for this member.
     * @type {FILESHARE_CHANGE_ENUM}
     */
    Change {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The name of the file share resource specific to this entry in the event notification list.
     * @type {String}
     */
    ShareName {
        get => StrGet(this.ptr + 4, 83, "UTF-16")
        set => StrPut(value, this.ptr + 4, 83, "UTF-16")
    }
}
