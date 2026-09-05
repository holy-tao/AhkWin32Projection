#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_POLICY_FLAG extends Win32BitflagEnum {

    /**
     * Native name: IKEEXT_POLICY_FLAG_DISABLE_DIAGNOSTICS
     * @type {Integer (UInt32)}
     */
    static DISABLE_DIAGNOSTICS => 1

    /**
     * Native name: IKEEXT_POLICY_FLAG_NO_MACHINE_LUID_VERIFY
     * @type {Integer (UInt32)}
     */
    static NO_MACHINE_LUID_VERIFY => 2

    /**
     * Native name: IKEEXT_POLICY_FLAG_NO_IMPERSONATION_LUID_VERIFY
     * @type {Integer (UInt32)}
     */
    static NO_IMPERSONATION_LUID_VERIFY => 4

    /**
     * Native name: IKEEXT_POLICY_FLAG_ENABLE_OPTIONAL_DH
     * @type {Integer (UInt32)}
     */
    static ENABLE_OPTIONAL_DH => 8
}
