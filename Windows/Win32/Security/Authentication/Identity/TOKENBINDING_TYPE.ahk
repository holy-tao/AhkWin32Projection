#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the possible types for a token binding.
 * @remarks
 * More information about the use of these Token Binding types can be found in the <b>Token Binding over HTTP Internet</b> draft.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ne-tokenbinding-tokenbinding_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
