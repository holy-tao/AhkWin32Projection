#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class DEP_SYSTEM_POLICY_TYPE extends Win32Enum {

    /**
     * Native name: DEPPolicyAlwaysOff
     * @type {Integer (Int32)}
     */
    static AlwaysOff => 0

    /**
     * Native name: DEPPolicyAlwaysOn
     * @type {Integer (Int32)}
     */
    static AlwaysOn => 1

    /**
     * Native name: DEPPolicyOptIn
     * @type {Integer (Int32)}
     */
    static OptIn => 2

    /**
     * Native name: DEPPolicyOptOut
     * @type {Integer (Int32)}
     */
    static OptOut => 3

    /**
     * Native name: DEPTotalPolicyCount
     * @type {Integer (Int32)}
     */
    static TotalPolicyCount => 4
}
