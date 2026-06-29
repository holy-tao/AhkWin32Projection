#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */

;@region Constants

/**
 * @type {String}
 */
export global IDENTITY_KEYWORD_ASSOCIATED := "associated"

/**
 * @type {String}
 */
export global IDENTITY_KEYWORD_LOCAL := "local"

/**
 * @type {String}
 */
export global IDENTITY_KEYWORD_HOMEGROUP := "homegroup"

/**
 * @type {String}
 */
export global IDENTITY_KEYWORD_CONNECTED := "connected"

/**
 * @type {Guid}
 */
export global OID_OAssociatedIdentityProviderObject := Guid("{98c5a3dd-db68-4f1a-8d2b-9079cdfeaf61}")

/**
 * @type {String}
 */
export global STR_OUT_OF_BOX_EXPERIENCE := "OutOfBoxExperience"

/**
 * @type {String}
 */
export global STR_MODERN_SETTINGS_ADD_USER := "ModernSettingsAddUser"

/**
 * @type {String}
 */
export global STR_OUT_OF_BOX_UPGRADE_EXPERIENCE := "OutOfBoxUpgradeExperience"

/**
 * @type {String}
 */
export global STR_COMPLETE_ACCOUNT := "CompleteAccount"

/**
 * @type {String}
 */
export global STR_NTH_USER_FIRST_AUTH := "NthUserFirstAuth"

/**
 * @type {String}
 */
export global STR_USER_NAME := "Username"

/**
 * @type {String}
 */
export global STR_PROPERTY_STORE := "PropertyStore"
;@endregion Constants
