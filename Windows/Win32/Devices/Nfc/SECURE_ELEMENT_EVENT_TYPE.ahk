#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_EVENT_TYPE {
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
    static ExternalReaderArrival => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExternalReaderDeparture => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApplicationSelected => 2

    /**
     * @type {Integer (Int32)}
     */
    static Transaction => 3

    /**
     * @type {Integer (Int32)}
     */
    static HceActivated => 4

    /**
     * @type {Integer (Int32)}
     */
    static HceDeactivated => 5

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFieldEnter => 6

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFieldExit => 7
}
