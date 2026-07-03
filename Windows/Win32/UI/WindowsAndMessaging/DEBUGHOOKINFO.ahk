#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains debugging information passed to a WH_DEBUG hook procedure, DebugProc.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-debughookinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEBUGHOOKINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A handle to the thread containing the filter function.
     */
    idThread : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A handle to the thread that installed the debugging filter function.
     */
    idThreadInstaller : UInt32

    /**
     * Type: <b>LPARAM</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>lParam</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     */
    lParam : LPARAM

    /**
     * Type: <b>WPARAM</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>wParam</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     */
    wParam : WPARAM

    /**
     * Type: <b>int</b>
     * 
     * The value to be passed to the hook in the 
     * 					<i>nCode</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644978(v=vs.85)">DebugProc</a> callback function.
     */
    code : Int32

}
