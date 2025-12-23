#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible types for a token binding.
 * @remarks
 * More information about the use of these Token Binding types can be found in the <b>Token Binding over HTTP Internet</b> draft.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ne-tokenbinding-tokenbinding_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_TYPE extends Win32Enum{

    /**
     * This type of Token Binding is used to protect tokens issued by the Identity Provider for the client to present with subsequent requests back to this Identity Provider.
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_TYPE_PROVIDED => 0

    /**
     * This type of Token Binding is used to protect tokens issued by the Identity Provider for the client to present to a Relying Party.
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_TYPE_REFERRED => 1
}
