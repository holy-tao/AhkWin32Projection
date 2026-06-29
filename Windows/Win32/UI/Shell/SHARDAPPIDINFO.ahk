#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IShellItem.ahk" { IShellItem }

/**
 * Contains data used by SHAddToRecentDocs to identify both an item�in this case as an IShellItem�and the process that it is associated with.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shardappidinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHARDAPPIDINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the object in the Shell namespace.
     */
    psi : IShellItem

    /**
     * Type: <b>PCWSTR</b>
     * 
     * The application-defined AppUserModelID associated with the item.
     */
    pszAppID : PWSTR

}
