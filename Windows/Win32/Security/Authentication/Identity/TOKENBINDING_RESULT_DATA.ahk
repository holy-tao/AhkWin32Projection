#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKENBINDING_EXTENSION_FORMAT.ahk" { TOKENBINDING_EXTENSION_FORMAT }
#Import ".\TOKENBINDING_IDENTIFIER.ahk" { TOKENBINDING_IDENTIFIER }
#Import ".\TOKENBINDING_TYPE.ahk" { TOKENBINDING_TYPE }

/**
 * Contains data about the result of generating a token binding or verifying one of the token bindings in a token binding message.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_result_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_RESULT_DATA {
    #StructPack 8

    bindingType : TOKENBINDING_TYPE

    /**
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/ns-tokenbinding-tokenbinding_identifier">TOKENBINDING_IDENTIFIER</a> structure that the <b>identifierData</b> member points to, in bytes.
     */
    identifierSize : UInt32

    /**
     * Pointer to the token binding identifier for the token binding that was generated or verified.
     */
    identifierData : TOKENBINDING_IDENTIFIER.Ptr

    /**
     * The format to use to interpret the data in the <i>extensionData</i> parameter. This value must be <b>TOKENBINDING_EXTENSION_FORMAT_UNDEFINED</b>.
     */
    extensionFormat : TOKENBINDING_EXTENSION_FORMAT

    /**
     * The size of the buffer that the <b>extensionData</b> member points to, in bytes.
     */
    extensionSize : UInt32

    /**
     * A pointer to a buffer that contains extension data. The value of the <i>extensionFormat</i> parameter determines how to interpret this data.
     */
    extensionData : IntPtr

}
