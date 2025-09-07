#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains data about the result of generating a token binding or verifying one of the token bindings in a token binding message.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_result_data
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_RESULT_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    bindingType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/ns-tokenbinding-tokenbinding_identifier">TOKENBINDING_IDENTIFIER</a> structure that the <b>identifierData</b> member points to, in bytes.
     * @type {Integer}
     */
    identifierSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the token binding identifier for the token binding that was generated or verified.
     * @type {Pointer<Byte>}
     */
    identifierData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The format to use to interpret the data in the <i>extensionData</i> parameter. This value must be <b>TOKENBINDING_EXTENSION_FORMAT_UNDEFINED</b>.
     * @type {Integer}
     */
    extensionFormat {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The size of the buffer that the <b>extensionData</b> member points to, in bytes.
     * @type {Integer}
     */
    extensionSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to a buffer that contains extension data. The value of the <i>extensionFormat</i> parameter determines how to interpret this data.
     * @type {Pointer<Void>}
     */
    extensionData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
