#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EHostBindingPolicyModifyFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HOST_BINDING_POLICY_MODIFY_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HOST_BINDING_POLICY_MODIFY_CHAIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static HOST_BINDING_POLICY_MODIFY_REMOVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static HOST_BINDING_POLICY_MODIFY_MAX => 3
}
