#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CVRC_TABLE {
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
    static CVRC_TABLE_ATTRIBUTES => 16384

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_CRL => 20480

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_EXTENSIONS => 12288

    /**
     * @type {Integer (Int32)}
     */
    static CVRC_TABLE_REQCERT => 0
}
