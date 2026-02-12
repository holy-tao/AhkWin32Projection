#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\WinRT\Apis.ahk
#Include ..\..\..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class Provider {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static IDENTITY_KEYWORD_ASSOCIATED => "associated"

    /**
     * @type {HSTRING}
     */
    static IDENTITY_KEYWORD_LOCAL => "local"

    /**
     * @type {HSTRING}
     */
    static IDENTITY_KEYWORD_HOMEGROUP => "homegroup"

    /**
     * @type {HSTRING}
     */
    static IDENTITY_KEYWORD_CONNECTED => "connected"

    /**
     * @type {Guid}
     */
    static OID_OAssociatedIdentityProviderObject => Guid("{98c5a3dd-db68-4f1a-8d2b-9079cdfeaf61}")

    /**
     * @type {HSTRING}
     */
    static STR_OUT_OF_BOX_EXPERIENCE => "OutOfBoxExperience"

    /**
     * @type {HSTRING}
     */
    static STR_MODERN_SETTINGS_ADD_USER => "ModernSettingsAddUser"

    /**
     * @type {HSTRING}
     */
    static STR_OUT_OF_BOX_UPGRADE_EXPERIENCE => "OutOfBoxUpgradeExperience"

    /**
     * @type {HSTRING}
     */
    static STR_COMPLETE_ACCOUNT => "CompleteAccount"

    /**
     * @type {HSTRING}
     */
    static STR_NTH_USER_FIRST_AUTH => "NthUserFirstAuth"

    /**
     * @type {HSTRING}
     */
    static STR_USER_NAME => "Username"

    /**
     * @type {HSTRING}
     */
    static STR_PROPERTY_STORE => "PropertyStore"
;@endregion Constants

;@region Methods
;@endregion Methods
}
