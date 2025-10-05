#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains a handle to a token. This token is linked to the token being queried by the GetTokenInformation function or set by the SetTokenInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_linked_token
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_LINKED_TOKEN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A handle to the linked token.
     * 
     * When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @type {Pointer<Void>}
     */
    LinkedToken {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
