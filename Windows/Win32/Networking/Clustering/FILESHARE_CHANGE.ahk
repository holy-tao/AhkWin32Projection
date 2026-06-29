#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILESHARE_CHANGE_ENUM.ahk" { FILESHARE_CHANGE_ENUM }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the format for an entry in an event notification list.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-fileshare_change
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct FILESHARE_CHANGE {
    #StructPack 4

    /**
     * Describes a change event. This value is taken from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-fileshare_change_enum">FILESHARE_CHANGE_ENUM</a> enumeration. The following 
     *        are the possible values for this member.
     */
    Change : FILESHARE_CHANGE_ENUM

    /**
     * The name of the file share resource specific to this entry in the event notification list.
     */
    ShareName : WCHAR[84]

}
