#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_QUIC_CONNECTION_API_TIMINGS.ahk" { HTTP_QUIC_CONNECTION_API_TIMINGS }
#Import ".\HTTP_QUIC_STREAM_API_TIMINGS.ahk" { HTTP_QUIC_STREAM_API_TIMINGS }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_QUIC_API_TIMINGS {
    #StructPack 8

    ConnectionTimings : HTTP_QUIC_CONNECTION_API_TIMINGS

    StreamTimings : HTTP_QUIC_STREAM_API_TIMINGS

}
