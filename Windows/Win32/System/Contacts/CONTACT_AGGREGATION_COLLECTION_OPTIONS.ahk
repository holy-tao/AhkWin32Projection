#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct CONTACT_AGGREGATION_COLLECTION_OPTIONS {
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
    static CACO_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CACO_INCLUDE_EXTERNAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CACO_EXTERNAL_ONLY => 2
}
