#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\HDESK.ahk" { HDESK }

/**
 * Contains information about a window that denied a request from BroadcastSystemMessageEx.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-bsminfo
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct BSMINFO {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HDESK</b>
     * 
     * A desktop handle to the window specified by 
     * 					<b>hwnd</b>. This value is returned only if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-broadcastsystemmessageexa">BroadcastSystemMessageEx</a> specifies <b>BSF_RETURNHDESK</b> and <b>BSF_QUERY</b>.
     */
    hdesk : HDESK

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that denied the request. This value is returned if <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-broadcastsystemmessageexa">BroadcastSystemMessageEx</a> specifies <b>BSF_QUERY</b>.
     */
    hwnd : HWND

    /**
     * Type: <b>LUID</b>
     * 
     * A locally unique identifier (LUID) for the window.
     */
    luid : LUID

}
