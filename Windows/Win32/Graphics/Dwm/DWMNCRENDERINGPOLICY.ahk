#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags used by the DwmSetWindowAttribute function to specify the non-client area rendering policy.
 * @remarks
 * 
  * To use a <b>DWMNCRENDERINGPOLICY</b> value, set the <i>dwAttribute</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a> function to <b>DWMWA_NCRENDERING_POLICY</b>. Set the <i>pvAttribute</i> parameter to the <b>DWMNCRENDERINGPOLICY</b> value.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ne-dwmapi-dwmncrenderingpolicy
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWMNCRENDERINGPOLICY{

    /**
     * The non-client rendering area is rendered based on the window style.
     * @type {Integer (Int32)}
     */
    static DWMNCRP_USEWINDOWSTYLE => 0

    /**
     * The non-client area rendering is disabled; the window style is ignored.
     * @type {Integer (Int32)}
     */
    static DWMNCRP_DISABLED => 1

    /**
     * The non-client area rendering is enabled; the window style is ignored.
     * @type {Integer (Int32)}
     */
    static DWMNCRP_ENABLED => 2

    /**
     * The maximum recognized <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/ne-dwmapi-dwmncrenderingpolicy">DWMNCRENDERINGPOLICY</a> value, used for validation purposes.
     * @type {Integer (Int32)}
     */
    static DWMNCRP_LAST => 3
}
