#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct OS_DEPLOYEMENT_STATE_VALUES {
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
    static OS_DEPLOYMENT_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static OS_DEPLOYMENT_COMPACT => 2
}
