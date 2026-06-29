#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the specific SSP package to be used for Windows Integrated Authentication.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_windows_integrated_auth_package
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_WINDOWS_INTEGRATED_AUTH_PACKAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Kerberos package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_KERBEROS => 1

    /**
     * The NTLM package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_NTLM => 2

    /**
     * The SPNEGO package.
     * @type {Integer (Int32)}
     */
    static WS_WINDOWS_INTEGRATED_AUTH_PACKAGE_SPNEGO => 3
}
