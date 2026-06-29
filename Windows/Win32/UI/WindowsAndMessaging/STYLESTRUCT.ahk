#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the styles for a window.
 * @remarks
 * The styles in 
 * 				<b>styleOld</b> and 
 * 				<b>styleNew</b> can be either the window styles (<b>WS_*</b>) or the extended window styles (<b>WS_EX_*</b>), depending on the 
 * 				<i>wParam</i> of the message that includes <b>STYLESTRUCT</b>.
 * 
 * The 
 * 				<b>styleOld</b> and 
 * 				<b>styleNew</b> members indicate the styles through their bit pattern. Note that several styles are equal to zero; to detect these styles, test for the negation of their inverse style. For example, to see if <b>WS_EX_LEFT</b> is set, you test for ~<b>WS_EX_RIGHT</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-stylestruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct STYLESTRUCT {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The previous styles for a window. For more information, see the Remarks.
     */
    styleOld : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The new styles for a window. For more information, see the Remarks.
     */
    styleNew : UInt32

}
