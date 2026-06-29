#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a message is required when receiving from a channel.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_receive_option
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_RECEIVE_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A message is required to be received.  If the channel does not have
     *                     any more messages, then the function will fail.
     * @type {Integer (Int32)}
     */
    static WS_RECEIVE_REQUIRED_MESSAGE => 1

    /**
     * The message is not required to be received.  If the channel does not have any more
     *                     messages, the function will return <b>WS_S_END</b>.
     *                 (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @type {Integer (Int32)}
     */
    static WS_RECEIVE_OPTIONAL_MESSAGE => 2
}
