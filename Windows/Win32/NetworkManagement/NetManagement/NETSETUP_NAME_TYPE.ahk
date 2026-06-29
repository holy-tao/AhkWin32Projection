#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETSETUP_NAME_TYPE {
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
    static NetSetupUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupMachine => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupWorkgroup => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupNonExistentDomain => 4

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDnsMachine => 5
}
