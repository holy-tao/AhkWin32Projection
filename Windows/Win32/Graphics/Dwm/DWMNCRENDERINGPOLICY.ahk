#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags used by the DwmSetWindowAttribute function to specify the non-client area rendering policy.
 * @remarks
 * To use a <b>DWMNCRENDERINGPOLICY</b> value, set the <i>dwAttribute</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/dwmapi/nf-dwmapi-dwmsetwindowattribute">DwmSetWindowAttribute</a> function to <b>DWMWA_NCRENDERING_POLICY</b>. Set the <i>pvAttribute</i> parameter to the <b>DWMNCRENDERINGPOLICY</b> value.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwmncrenderingpolicy
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWMNCRENDERINGPOLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
