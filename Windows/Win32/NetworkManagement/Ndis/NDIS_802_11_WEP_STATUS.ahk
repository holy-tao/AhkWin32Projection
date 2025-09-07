#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_WEP_STATUS{

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
