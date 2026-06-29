#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */

;@region Constants

/**
 * @type {String}
 */
export global WSD_DEFAULT_HOSTING_ADDRESS := "http://*:5357/"

/**
 * @type {String}
 */
export global WSD_DEFAULT_SECURE_HOSTING_ADDRESS := "https://*:5358/"

/**
 * @type {String}
 */
export global WSD_DEFAULT_EVENTING_ADDRESS := "http://*:5357/"

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_OPTION_MAX_INBOUND_MESSAGE_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_OPTION_TRACE_XML_TO_DEBUGGER := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_OPTION_TRACE_XML_TO_FILE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_APPLY_DEFAULT_CHECKS := 0

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_IGNORE_REVOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_IGNORE_EXPIRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_IGNORE_WRONG_USAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_IGNORE_UNKNOWN_CA := 8

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_SSL_CERT_IGNORE_INVALID_CN := 16

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_COMPACTSIG_ACCEPT_ALL_MESSAGES := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_ADDRESSFAMILY_IPV4 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSDAPI_ADDRESSFAMILY_IPV6 := 2
;@endregion Constants
