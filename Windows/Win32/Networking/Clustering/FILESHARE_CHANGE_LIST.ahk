#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILESHARE_CHANGE.ahk" { FILESHARE_CHANGE }
#Import ".\FILESHARE_CHANGE_ENUM.ahk" { FILESHARE_CHANGE_ENUM }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes an event notification list for file shares managed by the File Server resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-fileshare_change_list
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct FILESHARE_CHANGE_LIST {
    #StructPack 4

    /**
     * The number of entries the event notification list contains.
     */
    NumEntries : UInt32

    /**
     * An entry in the event notification list. The format of this member comes from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-fileshare_change">FILESHARE_CHANGE</a> structure.
     */
    ChangeEntry : FILESHARE_CHANGE[1]

}
