#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of hash algorithm used in an IPsec SA for data origin authentication and integrity protection.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_auth_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AUTH_TYPE extends Win32Enum{

    /**
     * Specifies MD5 hash algorithm. 
     * 
     * See <a href="https://www.ietf.org/rfc/rfc1321.txt">RFC 1321</a> for further information.
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_MD5 => 0

    /**
     * Specifies SHA 1 hash algorithm. 
     * 
     * See NIST, FIPS PUB 180-1 for more information.
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_SHA_1 => 1

    /**
     * Specifies SHA 256 hash algorithm.
     * 
     * See NIST, Draft FIPS PUB 180-2 for more information.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_SHA_256 => 2

    /**
     * Specifies 128-bit AES hash algorithm.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_AES_128 => 3

    /**
     * Specifies 192-bit AES hash algorithm.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_AES_192 => 4

    /**
     * Specifies 256-bit AES hash algorithm.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_AES_256 => 5

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IPSEC_AUTH_MAX => 6
}
