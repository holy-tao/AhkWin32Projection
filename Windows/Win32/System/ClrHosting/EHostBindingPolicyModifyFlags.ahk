#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EHostBindingPolicyModifyFlags extends Win32Enum {

    /**
     * Native name: HOST_BINDING_POLICY_MODIFY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HOST_BINDING_POLICY_MODIFY_CHAIN
     * @type {Integer (Int32)}
     */
    static CHAIN => 1

    /**
     * Native name: HOST_BINDING_POLICY_MODIFY_REMOVE
     * @type {Integer (Int32)}
     */
    static REMOVE => 2

    /**
     * Native name: HOST_BINDING_POLICY_MODIFY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
