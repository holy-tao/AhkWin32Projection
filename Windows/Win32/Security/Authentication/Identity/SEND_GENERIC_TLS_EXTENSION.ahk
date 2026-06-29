#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEND_GENERIC_TLS_EXTENSION {
    #StructPack 4

    ExtensionType : UInt16

    HandshakeType : UInt16

    Flags : UInt32

    BufferSize : UInt16

    Buffer : Int8[1]

}
