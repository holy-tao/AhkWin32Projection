#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.InternetConnectionWizard
 */

;@region Constants

/**
 * @type {String}
 */
export global ICW_REGPATHSETTINGS := "Software\Microsoft\Internet Connection Wizard"

/**
 * @type {String}
 */
export global ICW_REGKEYCOMPLETED := "Completed"

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_ACCTNAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_PASSWORD := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_LOGONNAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_SERVERNAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_RASNAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_EMAILNAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MAX_EMAILADDR := 128

/**
 * @type {Integer (UInt32)}
 */
export global ICW_CHECKSTATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICW_LAUNCHFULL := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_LAUNCHMANUAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global ICW_USE_SHELLNEXT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ICW_FULL_SMARTSTART := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ICW_FULLPRESENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global ICW_MANUALPRESENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global ICW_ALREADYRUN := 4

/**
 * @type {Integer (UInt32)}
 */
export global ICW_LAUNCHEDFULL := 256

/**
 * @type {Integer (UInt32)}
 */
export global ICW_LAUNCHEDMANUAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global ICW_USEDEFAULTS := 1
;@endregion Constants
