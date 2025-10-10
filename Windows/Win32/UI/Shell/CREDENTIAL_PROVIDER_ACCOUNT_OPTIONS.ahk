#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of credential that a credential provider should return to associate with the &quot;Other user&quot; tile. Used by ICredentialProviderUserArray_GetAccountOptions.
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/ne-credentialprovider-credential_provider_account_options
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS{

    /**
     * Default. Do not return a credential to associate with the "Other user" tile.
     * @type {Integer (Int32)}
     */
    static CPAO_NONE => 0

    /**
     * Return a credential to associate with the "Other user" tile. This credential can only be used for a local account.
     * @type {Integer (Int32)}
     */
    static CPAO_EMPTY_LOCAL => 1

    /**
     * Return a credential to associate with the "Other user" tile. This credential can only be used for a Microsoft account.
     * @type {Integer (Int32)}
     */
    static CPAO_EMPTY_CONNECTED => 2
}
