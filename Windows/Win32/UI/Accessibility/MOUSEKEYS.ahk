#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the MouseKeys accessibility feature.
 * @remarks
 * An application uses a <b>MOUSEKEYS</b> structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <i>uiAction</i> parameter set to the <b>SPI_GETMOUSEKEYS</b> or <b>SPI_SETMOUSEKEYS</b> value. When using <b>SPI_GETMOUSEKEYS</b>, an application must specify the <b>cbSize</b> member of the <b>MOUSEKEYS</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify all structure members when using the <b>SPI_SETMOUSEKEYS</b> value.
 * 
 * If you call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> with the <b>SPI_SETMOUSEKEYS</b> value, the following flags are ignored:
 * 
 * <ul>
 * <li><b>MKF_LEFTBUTTONDOWN</b></li>
 * <li><b>MKF_LEFTBUTTONSEL</b></li>
 * <li><b>MKF_MOUSEMODE</b></li>
 * <li><b>MKF_RIGHTBUTTONDOWN</b></li>
 * <li><b>MKF_RIGHTBUTTONSEL</b></li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousekeys
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class MOUSEKEYS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * A set of bit-flags that specify properties of the FilterKeys feature. The following bit-flag values are defined:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_AVAILABLE"></a><a id="mkf_available"></a><dl>
     * <dt><b>MKF_AVAILABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the MouseKeys feature is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_CONFIRMHOTKEY"></a><a id="mkf_confirmhotkey"></a><dl>
     * <dt><b>MKF_CONFIRMHOTKEY</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> A confirmation dialog box appears when the MouseKeys feature is activated by using the hot key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_HOTKEYACTIVE"></a><a id="mkf_hotkeyactive"></a><dl>
     * <dt><b>MKF_HOTKEYACTIVE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the user can turn the MouseKeys feature on and off by using the hot key, which is LEFT ALT+LEFT SHIFT+NUM LOCK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_HOTKEYSOUND"></a><a id="mkf_hotkeysound"></a><dl>
     * <dt><b>MKF_HOTKEYSOUND</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the system plays a siren sound when the user turns the MouseKeys feature on or off by using the hot key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_INDICATOR"></a><a id="mkf_indicator"></a><dl>
     * <dt><b>MKF_INDICATOR</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> A visual indicator is displayed when the MouseKeys feature is on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_LEFTBUTTONDOWN"></a><a id="mkf_leftbuttondown"></a><dl>
     * <dt><b>MKF_LEFTBUTTONDOWN</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The left button is in the "down" state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_LEFTBUTTONSEL"></a><a id="mkf_leftbuttonsel"></a><dl>
     * <dt><b>MKF_LEFTBUTTONSEL</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The user has selected the left button for mouse-button actions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_MODIFIERS"></a><a id="mkf_modifiers"></a><dl>
     * <dt><b>MKF_MODIFIERS</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The CTRL key increases cursor speed by the value specified by the <b>iCtrlSpeed</b> member, and the SHIFT key causes the cursor to delay briefly after moving a single pixel, allowing fine positioning of the cursor. If this value is not specified, the CTRL and SHIFT keys are ignored while the user moves the mouse cursor using the arrow keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_MOUSEKEYSON"></a><a id="mkf_mousekeyson"></a><dl>
     * <dt><b>MKF_MOUSEKEYSON</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the MouseKeys feature is on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_MOUSEMODE"></a><a id="mkf_mousemode"></a><dl>
     * <dt><b>MKF_MOUSEMODE</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The system is processing numeric keypad input as mouse commands.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_REPLACENUMBERS"></a><a id="mkf_replacenumbers"></a><dl>
     * <dt><b>MKF_REPLACENUMBERS</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The numeric keypad moves the mouse when the NUM LOCK key is on. If this flag is not specified, the numeric keypad moves the mouse cursor when the NUM LOCK key is off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_RIGHTBUTTONDOWN"></a><a id="mkf_rightbuttondown"></a><dl>
     * <dt><b>MKF_RIGHTBUTTONDOWN</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The right button is in the "down" state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MKF_RIGHTBUTTONSEL"></a><a id="mkf_rightbuttonsel"></a><dl>
     * <dt><b>MKF_RIGHTBUTTONSEL</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> The user has selected the right button for mouse-button actions.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the maximum speed the mouse cursor attains when an arrow key is held down.
     * 
     * <b>Windows 95/98:</b> Range checking is not performed.
     * 
     * <b>Windows NT/2000:</b> Valid values are from 10 to 360.
     * @type {Integer}
     */
    iMaxSpeed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of time, in milliseconds, that it takes for the mouse cursor to reach maximum speed when an arrow key is held down. Valid values are from 1000 to 5000.
     * @type {Integer}
     */
    iTimeToMaxSpeed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the multiplier to apply to the mouse cursor speed when the user holds down the CTRL key while using the arrow keys to move the cursor. this value is ignored if MKF_MODIFIERS is not set.
     * @type {Integer}
     */
    iCtrlSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 28
    }
}
