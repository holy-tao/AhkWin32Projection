#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the ToggleKeys accessibility feature.
 * @remarks
 * An application uses a <b>TOGGLEKEYS</b> structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <i>uiAction</i> parameter set to <b>SPI_GETTOGGLEKEYS</b> or <b>SPI_SETTOGGLEKEYS</b>. When using SPI_GETTOGGLEKEYS, an application must specify the <b>cbSize</b> member of the <b>TOGGLEKEYS</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify all structure members when using the <b>SPI_SETTOGGLEKEYS</b> value.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-togglekeys
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class TOGGLEKEYS extends Win32Struct
{
    static sizeof => 8

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
     * A set of bit flags that specify properties of the ToggleKeys feature. The following bit flag values are defined:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_AVAILABLE"></a><a id="tkf_available"></a><dl>
     * <dt><b>TKF_AVAILABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the ToggleKeys feature is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_CONFIRMHOTKEY"></a><a id="tkf_confirmhotkey"></a><dl>
     * <dt><b>TKF_CONFIRMHOTKEY</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 95/98, Windows 2000:</b> A confirmation dialog box appears when the ToggleKeys feature is activated by using the hot key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_HOTKEYACTIVE"></a><a id="tkf_hotkeyactive"></a><dl>
     * <dt><b>TKF_HOTKEYACTIVE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the user can turn the ToggleKeys feature on and off by holding down the NUM LOCK key for eight seconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_HOTKEYSOUND"></a><a id="tkf_hotkeysound"></a><dl>
     * <dt><b>TKF_HOTKEYSOUND</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the system plays a siren sound when the user turns the ToggleKeys feature on or off by using the hot key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_INDICATOR"></a><a id="tkf_indicator"></a><dl>
     * <dt><b>TKF_INDICATOR</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TKF_TOGGLEKEYSON"></a><a id="tkf_togglekeyson"></a><dl>
     * <dt><b>TKF_TOGGLEKEYSON</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the ToggleKeys feature is on.
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

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
