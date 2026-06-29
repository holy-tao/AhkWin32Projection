#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global NETSH_ERROR_BASE := 15000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_ENTRIES := 15000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SYNTAX := 15001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROTOCOL_NOT_IN_TRANSPORT := 15002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_CHANGE := 15003

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CMD_NOT_FOUND := 15004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ENTRY_PT_NOT_FOUND := 15005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DLL_LOAD_FAILED := 15006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INIT_DISPLAY := 15007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TAG_ALREADY_PRESENT := 15008

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_OPTION_TAG := 15009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_TAG := 15010

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MISSING_OPTION := 15011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TRANSPORT_NOT_PRESENT := 15012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SHOW_USAGE := 15013

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_OPTION_VALUE := 15014

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_OKAY := 15015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONTINUE_IN_PARENT_CONTEXT := 15016

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_SUPPRESS_OUTPUT := 15017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HELPER_ALREADY_REGISTERED := 15018

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_CONTEXT_ALREADY_REGISTERED := 15019

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PARSING_FAILURE := 15020

/**
 * @type {Integer (UInt32)}
 */
export global NETSH_ERROR_END := 15019

/**
 * @type {String}
 */
export global NS_GET_EVENT_IDS_FN_NAME := "GetEventIds"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NAME_LEN := 48

/**
 * @type {Integer (UInt32)}
 */
export global NETSH_VERSION_50 := 20480

/**
 * @type {String}
 */
export global NETSH_ARG_DELIMITER := "="

/**
 * @type {String}
 */
export global NETSH_CMD_DELIMITER := " "

/**
 * @type {Integer (UInt32)}
 */
export global NETSH_MAX_TOKEN_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NETSH_MAX_CMD_TOKEN_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_CONTEXT_PRIORITY := 100

/**
 * @type {String}
 */
export global GET_RESOURCE_STRING_FN_NAME := "GetResourceString"
;@endregion Constants
