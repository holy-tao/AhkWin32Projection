#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_QUIC_STREAM_REQUEST_STATS {
    #StructPack 8

    StreamWaitStart : Int64

    StreamWaitEnd : Int64

    RequestHeadersCompressionStart : Int64

    RequestHeadersCompressionEnd : Int64

    ResponseHeadersDecompressionStart : Int64

    ResponseHeadersDecompressionEnd : Int64

    RequestHeadersCompressedSize : Int64

    ResponseHeadersCompressedSize : Int64

}
