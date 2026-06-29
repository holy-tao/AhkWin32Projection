#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS {
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
    static CA_CREATE_LOCAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CA_CREATE_EXTERNAL => 1
}
