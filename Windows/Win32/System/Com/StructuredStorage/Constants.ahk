#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETFLAG_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETFLAG_NONSIMPLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETFLAG_ANSI := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETFLAG_UNBUFFERED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETFLAG_CASE_SENSITIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PROPSET_BEHAVIOR_CASE_SENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PID_DICTIONARY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PID_CODEPAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PID_FIRST_USABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_FIRST_NAME_DEFAULT := 4095

/**
 * @type {Integer (UInt32)}
 */
export global PID_LOCALE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PID_MODIFY_TIME := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global PID_SECURITY := 2147483650

/**
 * @type {Integer (UInt32)}
 */
export global PID_BEHAVIOR := 2147483651

/**
 * @type {Integer (UInt32)}
 */
export global PID_ILLEGAL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global PID_MIN_READONLY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PID_MAX_READONLY := 3221225471

/**
 * @type {Integer (UInt32)}
 */
export global PRSPEC_INVALID := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global PROPSETHDR_OSVERSION_UNKNOWN := 4294967295

/**
 * @type {Integer (Int32)}
 */
export global PIDDI_THUMBNAIL := 2

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_TITLE := 2

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_SUBJECT := 3

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_AUTHOR := 4

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_KEYWORDS := 5

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_COMMENTS := 6

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_TEMPLATE := 7

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_LASTAUTHOR := 8

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_REVNUMBER := 9

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_EDITTIME := 10

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_LASTPRINTED := 11

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_CREATE_DTM := 12

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_LASTSAVE_DTM := 13

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_PAGECOUNT := 14

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_WORDCOUNT := 15

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_CHARCOUNT := 16

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_THUMBNAIL := 17

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_APPNAME := 18

/**
 * @type {Integer (Int32)}
 */
export global PIDSI_DOC_SECURITY := 19

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_CATEGORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_PRESFORMAT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_BYTECOUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_LINECOUNT := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_PARCOUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_SLIDECOUNT := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_NOTECOUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_HIDDENCOUNT := 9

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_MMCLIPCOUNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_SCALE := 11

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_HEADINGPAIR := 12

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_DOCPARTS := 13

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_MANAGER := 14

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_COMPANY := 15

/**
 * @type {Integer (UInt32)}
 */
export global PIDDSI_LINKSDIRTY := 16

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_EDITOR := 2

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_SUPPLIER := 3

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_SOURCE := 4

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_SEQUENCE_NO := 5

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_PROJECT := 6

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_STATUS := 7

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_OWNER := 8

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_RATING := 9

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_PRODUCTION := 10

/**
 * @type {Integer (Int32)}
 */
export global PIDMSI_COPYRIGHT := 11

/**
 * @type {Integer (UInt32)}
 */
export global CWCSTORAGENAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global STGOPTIONS_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CCH_MAX_PROPSTG_NAME := 31
;@endregion Constants
