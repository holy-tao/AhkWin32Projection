#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\KSJACK_SINK_CONNECTIONTYPE.ahk" { KSJACK_SINK_CONNECTIONTYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The KSJACK_SINK_INFORMATION structure stores information about an audio jack sink.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_sink_information
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSJACK_SINK_INFORMATION {
    #StructPack 4

    /**
     * Specifies the type of connection. The connection type values are defined in the  <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-ksjack_sink_connectiontype">KSJACK_SINK_CONNECTIONTYPE</a> enumeration.
     */
    ConnType : KSJACK_SINK_CONNECTIONTYPE

    /**
     * Specifies the sink manufacturer identifier.
     */
    ManufacturerId : UInt16

    /**
     * Specifies the sink product identifier.
     */
    ProductId : UInt16

    /**
     * Specifies the latency of the audio sink.
     */
    AudioLatency : UInt16

    /**
     * Specifies whether the sink supports High-bandwidth Digital Content Protection (HDCP).
     */
    HDCPCapable : BOOL

    /**
     * Specifies whether the sink supports ACP Packet, ISRC1, or ISRC2.
     */
    AICapable : BOOL

    /**
     * Specifies the length of the string in the <b>SinkDescription</b> member.
     */
    SinkDescriptionLength : Int8

    /**
     * String containing the monitor sink name. The maximum length is defined by the constant <b>MAX_SINK_DESCRIPTION_NAME_LENGTH</b> (32 wide characters).
     */
    SinkDescription : WCHAR[32]

    /**
     * Specifies the video port identifier in a <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/ns-devicetopology-luid">LUID</a> structure.
     */
    PortId : LUID

}
