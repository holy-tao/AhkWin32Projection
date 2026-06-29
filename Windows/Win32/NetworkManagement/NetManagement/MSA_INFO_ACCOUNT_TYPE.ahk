#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSA_INFO_ACCOUNT_TYPE {
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
    static MsaAccountFalse => 0

    /**
     * @type {Integer (Int32)}
     */
    static StandAloneManagedServiceAccount => 1

    /**
     * @type {Integer (Int32)}
     */
    static GroupManagedServiceAccount => 2

    /**
     * @type {Integer (Int32)}
     */
    static DelegatedManagedServiceAccount => 3
}
