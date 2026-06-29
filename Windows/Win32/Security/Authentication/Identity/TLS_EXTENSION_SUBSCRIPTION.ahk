#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TLS_EXTENSION_SUBSCRIPTION {
    #StructPack 2

    ExtensionType : UInt16

    HandshakeType : UInt16

}
