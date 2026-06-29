#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKENBINDING_KEY_PARAMETERS_TYPE.ahk" { TOKENBINDING_KEY_PARAMETERS_TYPE }

/**
 * Contains all of the combinations of types of token binding keys that a client device or server supports.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_key_types
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_KEY_TYPES {
    #StructPack 8

    /**
     * The number of elements in the array that the <b>key</b> member contains.
     */
    keyCount : UInt32

    keyType : TOKENBINDING_KEY_PARAMETERS_TYPE.Ptr

}
