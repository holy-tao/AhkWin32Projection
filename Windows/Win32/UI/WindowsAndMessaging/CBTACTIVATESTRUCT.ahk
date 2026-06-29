#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information passed to a WH_CBT hook procedure, CBTProc, before a window is activated.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cbtactivatestruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct CBTACTIVATESTRUCT {
    #StructPack 8

    /**
     * Type: <b>BOOL</b>
     * 
     * This member is <b>TRUE</b> if a mouse click is causing the activation or <b>FALSE</b> if it is not.
     */
    fMouse : BOOL

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the active window.
     */
    hWndActive : HWND

}
