#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains acceleration information for an up-down control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-udaccel
 * @namespace Windows.Win32.UI.Controls
 */
export default struct UDACCEL {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Amount of elapsed time, in seconds, before the position change increment specified by 
     * 					<b>nInc</b> is used.
     */
    nSec : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Position change increment to use after the time specified by 
     * 					<b>nSec</b> elapses.
     */
    nInc : UInt32

}
