#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the information for representing a token binding identifier that results from a token binding message exchange.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_identifier
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_IDENTIFIER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    keyType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
