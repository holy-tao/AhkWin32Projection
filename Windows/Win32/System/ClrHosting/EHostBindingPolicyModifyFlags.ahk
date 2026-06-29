#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct EHostBindingPolicyModifyFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
