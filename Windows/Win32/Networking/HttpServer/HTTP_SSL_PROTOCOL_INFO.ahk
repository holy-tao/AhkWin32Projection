#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SSL_PROTOCOL_INFO {
    #StructPack 4

    Protocol : UInt32

    CipherType : UInt32

    CipherStrength : UInt32

    HashType : UInt32

    HashStrength : UInt32

    KeyExchangeType : UInt32

    KeyExchangeStrength : UInt32

}
