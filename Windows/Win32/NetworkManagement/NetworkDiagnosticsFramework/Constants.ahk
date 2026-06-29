#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NDF_ERROR_START := 63744

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_LENGTH_EXCEEDED := -2146895616

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_NOHELPERCLASS := -2146895615

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_CANCELLED := -2146895614

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_DISABLED := -2146895612

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_BAD_PARAM := -2146895611

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_VALIDATION := -2146895610

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_UNKNOWN := -2146895609

/**
 * @type {Integer (Int32)}
 */
export global NDF_E_PROBLEM_PRESENT := -2146895608

/**
 * @type {Integer (UInt32)}
 */
export global RF_WORKAROUND := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global RF_USER_ACTION := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global RF_USER_CONFIRMATION := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global RF_INFORMATION_ONLY := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global RF_UI_ONLY := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global RF_SHOW_EVENTS := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global RF_VALIDATE_HELPTOPIC := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global RF_REPRO := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global RF_CONTACT_ADMIN := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RF_RESERVED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RF_RESERVED_CA := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global RF_RESERVED_LNI := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RCF_ISLEAF := 1

/**
 * @type {Integer (UInt32)}
 */
export global RCF_ISCONFIRMED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RCF_ISTHIRDPARTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DF_IMPERSONATION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DF_TRACELESS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global NDF_INBOUND_FLAG_EDGETRAVERSAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global NDF_INBOUND_FLAG_HEALTHCHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global NDF_ADD_CAPTURE_TRACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global NDF_APPLY_INCLUSION_LIST_FILTER := 2
;@endregion Constants
