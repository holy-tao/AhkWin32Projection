#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WS-Security specification version to be used with message security and mixed-mode security.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_header_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_HEADER_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * WS-Security 1.0.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_VERSION_1_0 => 1

    /**
     * WS-Security 1.1.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_HEADER_VERSION_1_1 => 2
}
