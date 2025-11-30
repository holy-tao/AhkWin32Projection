#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of an IPsec security association (SA) transform.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ne-ipsectypes-ipsec_transform_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRANSFORM_TYPE extends Win32Enum{

    /**
     * Specifies Authentication Header (AH) transform.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_AH => 1

    /**
     * Specifies Encapsulating Security Payload (ESP)  authentication-only transform.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_ESP_AUTH => 2

    /**
     * Specifies ESP cipher transform.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_ESP_CIPHER => 3

    /**
     * Specifies ESP authentication and cipher transform.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_ESP_AUTH_AND_CIPHER => 4

    /**
     * Specifies that the first packet should be sent twice: once with ESP/AH encapsulation, and once in clear text. The entire session is then sent in clear text.
     * 
     * The initial packet will allow the existing firewall rules to apply to the connection.  The subsequent clear text data stream allows  intermediaries to modify the stream.
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008 R2, Windows 7, or later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_ESP_AUTH_FW => 5

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_TRANSFORM_TYPE_MAX => 6
}
