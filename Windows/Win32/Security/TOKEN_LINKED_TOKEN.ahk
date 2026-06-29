#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains a handle to a token. This token is linked to the token being queried by the GetTokenInformation function or set by the SetTokenInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_linked_token
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_LINKED_TOKEN {
    #StructPack 8

    /**
     * A handle to the linked token.
     * 
     * When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     */
    LinkedToken : HANDLE

}
