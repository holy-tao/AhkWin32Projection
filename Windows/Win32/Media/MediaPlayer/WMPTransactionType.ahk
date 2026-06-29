#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPTransactionType enumeration represents a transaction type.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmptransactiontype
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPTransactionType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No transaction.
     * @type {Integer (Int32)}
     */
    static wmpttNoTransaction => 0

    /**
     * A download transaction.
     * @type {Integer (Int32)}
     */
    static wmpttDownload => 1

    /**
     * A purchase transaction.
     * @type {Integer (Int32)}
     */
    static wmpttBuy => 2
}
