#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_ACTIVATION_POLICY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_RESUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_RESUMESAMEPARAMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACESAMEPARAMS => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_MULTISESSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACE_IGNOREFOREGROUND => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_UNKNOWN => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_INVALID => 7
}
