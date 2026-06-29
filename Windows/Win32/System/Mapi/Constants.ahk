#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Mapi
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_OLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_OLE_STATIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_ORIG := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_TO := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_CC := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_BCC := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_UNREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_RECEIPT_REQUESTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_SENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_LOGON_UI := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_PASSWORD_UI := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_NEW_SESSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_FORCE_DOWNLOAD := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_EXTENDED := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_DIALOG := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_FORCE_UNICODE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_UNREAD_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_GUARANTEE_FIFO := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_LONG_MSGID := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_PEEK := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_SUPPRESS_ATTACH := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_ENVELOPE_ONLY := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_BODY_AS_FILE := 512

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_AB_NOMODIFY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SUCCESS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_USER_ABORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_USER_ABORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_FAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_LOGON_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_LOGIN_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_DISK_FULL := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_INSUFFICIENT_MEMORY := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_ACCESS_DENIED := 6

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_TOO_MANY_SESSIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_TOO_MANY_FILES := 9

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_TOO_MANY_RECIPIENTS := 10

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_ATTACHMENT_NOT_FOUND := 11

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_ATTACHMENT_OPEN_FAILURE := 12

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_ATTACHMENT_WRITE_FAILURE := 13

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_UNKNOWN_RECIPIENT := 14

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_BAD_RECIPTYPE := 15

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_NO_MESSAGES := 16

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_INVALID_MESSAGE := 17

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_TEXT_TOO_LARGE := 18

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_INVALID_SESSION := 19

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_TYPE_NOT_SUPPORTED := 20

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_AMBIGUOUS_RECIPIENT := 21

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_AMBIG_RECIP := 21

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_MESSAGE_IN_USE := 22

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_NETWORK_FAILURE := 23

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_INVALID_EDITFIELDS := 24

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_INVALID_RECIPS := 25

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_NOT_SUPPORTED := 26

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_UNICODE_NOT_SUPPORTED := 27

/**
 * @type {Integer (UInt32)}
 */
export global MAPI_E_ATTACHMENT_TOO_LARGE := 28
;@endregion Constants
