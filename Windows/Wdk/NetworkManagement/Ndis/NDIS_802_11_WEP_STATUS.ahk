#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_WEP_STATUS {
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
    static Ndis802_11WEPEnabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption1Enabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11WEPDisabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11EncryptionDisabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11WEPKeyAbsent => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption1KeyAbsent => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11WEPNotSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11EncryptionNotSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption2Enabled => 4

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption2KeyAbsent => 5

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption3Enabled => 6

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Encryption3KeyAbsent => 7
}
