#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a cipher algorithm used to encrypt and decrypt information on an ad hoc network.
 * @remarks
 * Authentication and cipher algorithms are used in pairs. The following table shows valid algorithm pairs for use on an ad hoc network.
  * 
  * <table>
  * <tr>
  * <th>Pair Name</th>
  * <th>DOT11_ADHOC_AUTH_ALGORITHM value</th>
  * <th>DOT11_ADHOC_CIPHER_ALGORITHM value</th>
  * </tr>
  * <tr>
  * <td>Open-None</td>
  * <td>DOT11_ADHOC_AUTH_ALGO_80211_OPEN</td>
  * <td>DOT11_ADHOC_CIPHER_ALGO_NONE</td>
  * </tr>
  * <tr>
  * <td>Open-WEP</td>
  * <td>DOT11_ADHOC_AUTH_ALGO_80211_OPEN</td>
  * <td>DOT11_ADHOC_CIPHER_ALGO_WEP</td>
  * </tr>
  * <tr>
  * <td>WPA2PSK</td>
  * <td>DOT11_ADHOC_AUTH_ALGO_RSNA_PSK</td>
  * <td>DOT11_ADHOC_CIPHER_ALGO_CCMP</td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_cipher_algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ADHOC_CIPHER_ALGORITHM{

    /**
     * The cipher algorithm specified is invalid.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CIPHER_ALGO_INVALID => -1

    /**
     * Specifies that no cipher algorithm is enabled or supported.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CIPHER_ALGO_NONE => 0

    /**
     * Specifies a Counter Mode with Cipher Block Chaining Message Authentication Code Protocol (CCMP) algorithm. The CCMP algorithm is specified in the IEEE 802.11i-2004 standard and RFC 3610. CCMP is used with the Advanced Encryption Standard (AES) encryption algorithm, as defined in FIPS PUB 197.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CIPHER_ALGO_CCMP => 4

    /**
     * Specifies a Wired Equivalent Privacy (WEP) algorithm of any length.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_CIPHER_ALGO_WEP => 257
}
