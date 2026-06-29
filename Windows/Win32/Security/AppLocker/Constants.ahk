#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.AppLocker
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_SCOPEID_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_SCOPEID_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVELID_FULLYTRUSTED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVELID_NORMALUSER := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVELID_CONSTRAINED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVELID_UNTRUSTED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVELID_DISALLOWED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_LEVEL_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_MAX_FRIENDLYNAME_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_MAX_DESCRIPTION_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_MAX_HASH_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_IMAGEPATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_NOSIGNEDHASH := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_IMAGEHASH := 4

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_AUTHENTICODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_URLZONE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_APPX_PACKAGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_CRITERIA_IMAGEPATH_NT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_JOBID_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_JOBID_CONSTRAINED := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_JOBID_UNTRUSTED := 50331648

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_ONLY_EXES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_SANDBOX_INERT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_HASH_DUPLICATE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_ONLY_AUDIT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_BLOCK_CLIENT_UI := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_UIFLAGS_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_UIFLAGS_INFORMATION_PROMPT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_UIFLAGS_OPTION_PROMPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SAFER_POLICY_UIFLAGS_HIDDEN := 4

/**
 * @type {String}
 */
export global SRP_POLICY_EXE := "EXE"

/**
 * @type {String}
 */
export global SRP_POLICY_DLL := "DLL"

/**
 * @type {String}
 */
export global SRP_POLICY_MSI := "MSI"

/**
 * @type {String}
 */
export global SRP_POLICY_SCRIPT := "SCRIPT"

/**
 * @type {String}
 */
export global SRP_POLICY_SHELL := "SHELL"

/**
 * @type {String}
 */
export global SRP_POLICY_NOV2 := "IGNORESRPV2"

/**
 * @type {String}
 */
export global SRP_POLICY_APPX := "APPX"

/**
 * @type {String}
 */
export global SRP_POLICY_WLDPMSI := "WLDPMSI"

/**
 * @type {String}
 */
export global SRP_POLICY_WLDPSCRIPT := "WLDPSCRIPT"

/**
 * @type {String}
 */
export global SRP_POLICY_WLDPCONFIGCI := "WLDPCONFIGCI"

/**
 * @type {String}
 */
export global SRP_POLICY_MANAGEDINSTALLER := "MANAGEDINSTALLER"
;@endregion Constants
