#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used by an IEnumExtraSearch enumerator object to return information on the search objects supported by a Shell Folder object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-extrasearch
 * @namespace Windows.Win32.UI.Shell
 */
export default struct EXTRASEARCH {
    #StructPack 4

    /**
     * Type: <b>GUID</b>
     * 
     * A search object's GUID.
     */
    guidSearch : Guid

    /**
     * Type: <b>WCHAR[80]</b>
     * 
     * A Unicode string containing the search object's friendly name. It will be used to identify the search engine on the Search Assistant menu.
     */
    wszFriendlyName : WCHAR[80]

    /**
     * Type: <b>WCHAR[2084]</b>
     * 
     * The URL that will be displayed in the search pane.
     */
    wszUrl : WCHAR[2084]

}
