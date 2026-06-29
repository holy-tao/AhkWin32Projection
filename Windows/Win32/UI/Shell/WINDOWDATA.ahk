#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }

/**
 * Stores window data.
 * @see https://learn.microsoft.com/windows/win32/api/tlogstg/ns-tlogstg-windowdata
 * @namespace Windows.Win32.UI.Shell
 */
export default struct WINDOWDATA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The window ID.
     */
    dwWindowID : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The codepage of the current entry.
     */
    uiCP : UInt32

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * The current PIDL.
     */
    pidl : ITEMIDLIST.Ptr

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window URL.
     */
    lpszUrl : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window URL Location (local anchor).
     */
    lpszUrlLocation : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window title.
     */
    lpszTitle : PWSTR

}
