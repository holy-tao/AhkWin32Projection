#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the token binding information.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_token_binding
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_TOKEN_BINDING {
    #StructPack 2

    /**
     * The supported major version of the Token Binding protocol.
     */
    MajorVersion : Int8

    /**
     * The supported minor version of the Token Binding protocol.
     */
    MinorVersion : Int8

    /**
     * The size (in bytes) of the Token Binding key parameter IDs array.
     */
    KeyParametersSize : UInt16

    /**
     * The Token Binding key parameter IDs, most preferred first.
     */
    KeyParameters : Int8[1]

}
