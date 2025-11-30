#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the default proxy locator will specify the connection settings to a proxy server.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfnet_proxysettings
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNET_PROXYSETTINGS extends Win32Enum{

    /**
     * The proxy locator bypasses all addresses.
     * @type {Integer (Int32)}
     */
    static MFNET_PROXYSETTING_NONE => 0

    /**
     * The proxy locator uses manual settings. The application must set the following properties:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxyhostname-property">MFNETSOURCE_PROXYHOSTNAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxyport-property">MFNETSOURCE_PROXYPORT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxybypassforlocal-property">MFNETSOURCE_PROXYBYPASSFORLOCAL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mfnetsource-proxyexceptionlist-property">MFNETSOURCE_PROXYEXCEPTIONLIST</a>
     * </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static MFNET_PROXYSETTING_MANUAL => 1

    /**
     * The proxy locator automatically discovers proxy servers by using the WinInet auto-proxy detection mechanism.
     * @type {Integer (Int32)}
     */
    static MFNET_PROXYSETTING_AUTO => 2

    /**
     * The proxy locator uses the proxy settings of the browser. By default, the proxy locator sets this value for HTTP.
     * @type {Integer (Int32)}
     */
    static MFNET_PROXYSETTING_BROWSER => 3
}
