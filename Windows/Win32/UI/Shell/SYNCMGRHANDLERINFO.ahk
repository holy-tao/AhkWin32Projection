#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Provides information about the handler for use in the ISyncMgrSynchronize::GetHandlerInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrhandlerinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRHANDLERINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HICON</b>
     * 
     * The icon for the handler.
     */
    hIcon : HICON

    /**
     * Type: <b>DWORD</b>
     * 
     * The value of the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrhandlerflags">SYNCMGRHANDLERFLAGS</a> enumeration.
     */
    SyncMgrHandlerFlags : UInt32

    /**
     * Type: <b>WCHAR[MAX_SYNCMGRHANDLERNAME]</b>
     * 
     * The name to use for the handler.
     */
    wszHandlerName : WCHAR[32]

}
