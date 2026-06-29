#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines how a message security binding attaches the security token corresponding to it to a message using WS-Security mechanisms.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_message_security_usage
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_MESSAGE_SECURITY_USAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The security token obtained security binding is used for client
     * authentication, but not message protection.  Message protection should
     * be provided by a transport security binding or a message security
     * binding with symmetric or asymmetric usage.
     * @type {Integer (Int32)}
     */
    static WS_SUPPORTING_MESSAGE_SECURITY_USAGE => 1
}
