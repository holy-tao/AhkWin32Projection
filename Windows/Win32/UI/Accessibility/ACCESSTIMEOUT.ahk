#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the time-out period associated with the accessibility features.
 * @remarks
 * Use an <b>ACCESSTIMEOUT</b> structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <i>uiAction</i> parameter set to the <b>SPI_GETACCESSTIMEOUT</b> or <b>SPI_SETACCESSTIMEOUT</b> value. When using <b>SPI_GETACCESSTIMEOUT</b>, you must specify the <b>cbSize</b> member of the <b>ACCESSTIMEOUT</b> structure; the <b>SystemParametersInfo</b> function fills in the remaining members. Specify all structure members when using the <b>SPI_SETACCESSTIMEOUT</b> value.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-accesstimeout
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ACCESSTIMEOUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
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
     * A set of bit flags that specify properties of the time-out behavior for accessibility features. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATF_ONOFFFEEDBACK"></a><a id="atf_onofffeedback"></a><dl>
     * <dt><b>ATF_ONOFFFEEDBACK</b></dt>
     * <dt>0x00000002
     * </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system plays a descending siren sound when the time-out period elapses and the accessibility features are turned off.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ATF_TIMEOUTON"></a><a id="atf_timeouton"></a><dl>
     * <dt><b>ATF_TIMEOUTON</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, a time-out period has been set for accessibility features. If this flag is not set, the features will not time out even though a time-out period is specified.
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
     * Specifies the time-out period, in milliseconds.
     * @type {Integer}
     */
    iTimeOutMSec {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 12
    }
}
