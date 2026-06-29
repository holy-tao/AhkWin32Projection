#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }

/**
 * Contains data used by SHAddToRecentDocs to identify both an item�in this case by an absolute pointer to an item identifier list (PIDL)�and the process that it is associated with.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shardappidinfoidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHARDAPPIDINFOIDLIST {
    #StructPack 8

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * An absolute PIDL that gives the full path of the item in the Shell namespace.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b>PCWSTR</b>
     * 
     * The application-defined AppUserModelID associated with the item.
     */
    pszAppID : PWSTR

}
