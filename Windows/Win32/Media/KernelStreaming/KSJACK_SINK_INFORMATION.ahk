#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * The KSJACK_SINK_INFORMATION structure stores information about an audio jack sink.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ns-devicetopology-ksjack_sink_information
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSJACK_SINK_INFORMATION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Specifies the type of connection. The connection type values are defined in the  <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-ksjack_sink_connectiontype">KSJACK_SINK_CONNECTIONTYPE</a> enumeration.
     * @type {Integer}
     */
    ConnType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the sink manufacturer identifier.
     * @type {Integer}
     */
    ManufacturerId {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies the sink product identifier.
     * @type {Integer}
     */
    ProductId {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Specifies the latency of the audio sink.
     * @type {Integer}
     */
    AudioLatency {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Specifies whether the sink supports High-bandwidth Digital Content Protection (HDCP).
     * @type {BOOL}
     */
    HDCPCapable{
        get {
            if(!this.HasProp("__HDCPCapable"))
                this.__HDCPCapable := BOOL(this.ptr + 12)
            return this.__HDCPCapable
        }
    }

    /**
     * Specifies whether the sink supports ACP Packet, ISRC1, or ISRC2.
     * @type {BOOL}
     */
    AICapable{
        get {
            if(!this.HasProp("__AICapable"))
                this.__AICapable := BOOL(this.ptr + 16)
            return this.__AICapable
        }
    }

    /**
     * Specifies the length of the string in the <b>SinkDescription</b> member.
     * @type {Integer}
     */
    SinkDescriptionLength {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * String containing the monitor sink name. The maximum length is defined by the constant <b>MAX_SINK_DESCRIPTION_NAME_LENGTH</b> (32 wide characters).
     * @type {String}
     */
    SinkDescription {
        get => StrGet(this.ptr + 22, 31, "UTF-16")
        set => StrPut(value, this.ptr + 22, 31, "UTF-16")
    }

    /**
     * Specifies the video port identifier in a <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/ns-devicetopology-luid">LUID</a> structure.
     * @type {LUID}
     */
    PortId{
        get {
            if(!this.HasProp("__PortId"))
                this.__PortId := LUID(this.ptr + 88)
            return this.__PortId
        }
    }
}
