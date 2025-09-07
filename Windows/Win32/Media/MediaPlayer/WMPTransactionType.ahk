#Requires AutoHotkey v2.0.0 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPTransactionType enumeration represents a transaction type.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmptransactiontype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPTransactionType{

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
