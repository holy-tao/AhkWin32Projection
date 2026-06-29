#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_STREAM_SELECTION enumeration type defines the types of protocols that the network sink supports.
 * @remarks
 * This enumeration is used in two methods, <b>GetNetworkProtocol</b> and <b>SetNetworkProtocol</b>, from the <b>IWMWriterNetworkSink</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_net_protocol
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_NET_PROTOCOL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The network sink supports hypertext transfer protocol (HTTP).
     * @type {Integer (Int32)}
     */
    static WMT_PROTOCOL_HTTP => 0
}
