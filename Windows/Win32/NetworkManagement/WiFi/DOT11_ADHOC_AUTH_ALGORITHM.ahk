#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the authentication algorithm for user or machine authentication on an ad hoc network.
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
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_auth_algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ADHOC_AUTH_ALGORITHM extends Win32Enum{

    /**
     * The authentication algorithm specified is invalid.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_AUTH_ALGO_INVALID => -1

    /**
     * Specifies an IEEE 802.11 Open System authentication algorithm.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_AUTH_ALGO_80211_OPEN => 1

    /**
     * Specifies an IEEE 802.11i Robust Security Network Association (RSNA) algorithm that uses the pre-shared key (PSK) mode. IEEE 802.1X port authorization is performed by the supplicant and authenticator. Cipher keys are dynamically derived through a pre-shared key that is used on both the supplicant and authenticator.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_AUTH_ALGO_RSNA_PSK => 7
}
