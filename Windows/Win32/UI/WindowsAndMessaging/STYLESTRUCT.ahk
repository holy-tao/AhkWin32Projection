#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class STYLESTRUCT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The previous styles for a window. For more information, see the Remarks.
     * @type {Integer}
     */
    styleOld {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The new styles for a window. For more information, see the Remarks.
     * @type {Integer}
     */
    styleNew {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
