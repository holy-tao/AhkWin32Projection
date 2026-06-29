#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WebDav
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_NTLM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_PASSPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_DIGEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_NEGOTIATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_CERT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DAV_AUTHN_SCHEME_FBA := 1048576
;@endregion Constants
