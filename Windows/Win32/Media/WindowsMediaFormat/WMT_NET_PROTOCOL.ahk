#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_STREAM_SELECTION enumeration type defines the types of protocols that the network sink supports.
 * @remarks
 * 
 * This enumeration is used in two methods, <b>GetNetworkProtocol</b> and <b>SetNetworkProtocol</b>, from the <b>IWMWriterNetworkSink</b> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_net_protocol
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_NET_PROTOCOL extends Win32Enum{

    /**
     * The network sink supports hypertext transfer protocol (HTTP).
     * @type {Integer (Int32)}
     */
    static WMT_PROTOCOL_HTTP => 0
}
