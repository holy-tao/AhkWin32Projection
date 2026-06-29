#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct AUTHENTICATION_LEVEL {
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
    static NO_AUTHENTICATION_REQUIRED => 0

    /**
     * @type {Integer (Int32)}
     */
    static INCOMING_AUTHENTICATION_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MUTUAL_AUTHENTICATION_REQUIRED => 2
}
