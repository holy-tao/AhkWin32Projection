#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the type of credential that a credential provider should return to associate with the &quot;Other user&quot; tile. Used by ICredentialProviderUserArray_GetAccountOptions.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_account_options
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
