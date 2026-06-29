#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct PENDING_REQUEST_DESIRED_PROPERTY {
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
    static XEPR_CADNS => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_CAFRIENDLYNAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_CANAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_HASH => 8

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_REQUESTID => 4
}
