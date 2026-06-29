#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines conflict result information structure.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-confirm_conflict_result_info
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CONFIRM_CONFLICT_RESULT_INFO {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The new item name.
     */
    pszNewName : PWSTR

    /**
     * Type: <b>UINT</b>
     * 
     * The item index.
     */
    iItemIndex : UInt32

}
