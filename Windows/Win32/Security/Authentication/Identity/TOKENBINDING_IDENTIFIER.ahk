#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the information for representing a token binding identifier that results from a token binding message exchange.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_identifier
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_IDENTIFIER {
    #StructPack 1

    keyType : Int8

}
