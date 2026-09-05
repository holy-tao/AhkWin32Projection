#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ACTIVATION_POLICY extends Win32Enum {

    /**
     * Native name: PM_ACTIVATION_POLICY_RESUME
     * @type {Integer (Int32)}
     */
    static RESUME => 0

    /**
     * Native name: PM_ACTIVATION_POLICY_RESUMESAMEPARAMS
     * @type {Integer (Int32)}
     */
    static RESUMESAMEPARAMS => 1

    /**
     * Native name: PM_ACTIVATION_POLICY_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 2

    /**
     * Native name: PM_ACTIVATION_POLICY_REPLACESAMEPARAMS
     * @type {Integer (Int32)}
     */
    static REPLACESAMEPARAMS => 3

    /**
     * Native name: PM_ACTIVATION_POLICY_MULTISESSION
     * @type {Integer (Int32)}
     */
    static MULTISESSION => 4

    /**
     * Native name: PM_ACTIVATION_POLICY_REPLACE_IGNOREFOREGROUND
     * @type {Integer (Int32)}
     */
    static REPLACE_IGNOREFOREGROUND => 5

    /**
     * Native name: PM_ACTIVATION_POLICY_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 6

    /**
     * Native name: PM_ACTIVATION_POLICY_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 7
}
