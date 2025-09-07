#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_QUIC_STREAM_API_TIMINGS.ahk
#Include .\HTTP_QUIC_CONNECTION_API_TIMINGS.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_QUIC_API_TIMINGS extends Win32Struct
{
    static sizeof => 384

    static packingSize => 8

    /**
     * @type {HTTP_QUIC_CONNECTION_API_TIMINGS}
     */
    ConnectionTimings{
        get {
            if(!this.HasProp("__ConnectionTimings"))
                this.__ConnectionTimings := HTTP_QUIC_CONNECTION_API_TIMINGS(this.ptr + 0)
            return this.__ConnectionTimings
        }
    }

    /**
     * @type {HTTP_QUIC_STREAM_API_TIMINGS}
     */
    StreamTimings{
        get {
            if(!this.HasProp("__StreamTimings"))
                this.__StreamTimings := HTTP_QUIC_STREAM_API_TIMINGS(this.ptr + 240)
            return this.__StreamTimings
        }
    }
}
