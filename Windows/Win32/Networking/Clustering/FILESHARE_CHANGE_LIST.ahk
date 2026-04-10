#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILESHARE_CHANGE.ahk
#Include .\FILESHARE_CHANGE_ENUM.ahk

/**
 * Describes an event notification list for file shares managed by the File Server resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-fileshare_change_list
 * @namespace Windows.Win32.Networking.Clustering
 */
class FILESHARE_CHANGE_LIST extends Win32Struct {
    static sizeof => 176

    static packingSize => 4

    /**
     * The number of entries the event notification list contains.
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An entry in the event notification list. The format of this member comes from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-fileshare_change">FILESHARE_CHANGE</a> structure.
     * @type {FILESHARE_CHANGE}
     */
    ChangeEntry {
        get {
            if(!this.HasProp("__ChangeEntryProxyArray"))
                this.__ChangeEntryProxyArray := Win32FixedArray(this.ptr + 4, 1, FILESHARE_CHANGE, "")
            return this.__ChangeEntryProxyArray
        }
    }
}
