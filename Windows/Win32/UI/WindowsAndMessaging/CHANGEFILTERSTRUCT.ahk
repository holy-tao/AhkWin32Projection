#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended result information obtained by calling the ChangeWindowMessageFilterEx function.
 * @remarks
 * 
  * Certain messages whose value is smaller than <b>WM_USER</b> are required to pass through the filter, 
  * 		regardless of the filter setting. There will be no effect when you attempt to use this function to allow or 
  * 		block such messages.
  * 		
  * 
  * An application may use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changewindowmessagefilter">ChangeWindowMessageFilter</a> function to 
  * 		allow or block a message in a process-wide manner. 
  * 		If the message is allowed by either the process message filter 
  * 		or the window message filter, it will be delivered to the window.
  * 		
  * 
  * The following table lists the possible values returned in <b>ExtStatus</b>.
  * 
  * <table>
  * <tr>
  * <th>Message already allowed at higher scope</th>
  * <th>Message already allowed by window's message filter</th>
  * <th>Operation requested</th>
  * <th>Indicator returned in ExtStatus on success</th>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>No</td>
  * <td><b>MSGFLT_ALLOW</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>No</td>
  * <td><b>MSGFLT_DISALLOW</b></td>
  * <td><b>MSGFLTINFO_ALREADYDISALLOWED_FORWND</b></td>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>No</td>
  * <td><b>MSGFLT_RESET</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_ALLOW</b></td>
  * <td><b>MSGFLTINFO_ALREADYALLOWED_FORWND</b></td>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_DISALLOW</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>No</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_RESET</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>No</td>
  * <td><b>MSGFLT_ALLOW</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>No</td>
  * <td><b>MSGFLT_DISALLOW</b></td>
  * <td><b>MSGFLTINFO_ALLOWED_HIGHER</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>No</td>
  * <td><b>MSGFLT_RESET</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_ALLOW</b></td>
  * <td><b>MSGFLTINFO_ALREADYALLOWED_FORWND</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_DISALLOW</b></td>
  * <td><b>MSGFLTINFO_ALLOWED_HIGHER</b></td>
  * </tr>
  * <tr>
  * <td>Yes</td>
  * <td>Yes</td>
  * <td><b>MSGFLT_RESET</b></td>
  * <td><b>MSGFLTINFO_NONE</b></td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-changefilterstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CHANGEFILTERSTRUCT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. 
     * 				Must be set to <c>sizeof(CHANGEFILTERSTRUCT)</c>, otherwise the function fails with <b>ERROR_INVALID_PARAMETER</b>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    ExtStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
