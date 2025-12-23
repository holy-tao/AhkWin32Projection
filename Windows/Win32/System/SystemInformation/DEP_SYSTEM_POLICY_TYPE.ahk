#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class DEP_SYSTEM_POLICY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyAlwaysOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyAlwaysOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyOptIn => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyOptOut => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEPTotalPolicyCount => 4
}
