#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of hash algorithm used for integrity protection of Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) messages.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_integrity_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_INTEGRITY_TYPE{

    /**
     * Specifies MD5 hash algorithm.
     * @type {Integer (Int32)}
     */
    static IKEEXT_INTEGRITY_MD5 => 0

    /**
     * Specifies SHA1 hash algorithm.
     * @type {Integer (Int32)}
     */
    static IKEEXT_INTEGRITY_SHA1 => 1

    /**
     * Specifies a 256-bit SHA encryption.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_INTEGRITY_SHA_256 => 2

    /**
     * Specifies a 384-bit SHA encryption.
 * 
 * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_INTEGRITY_SHA_384 => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_INTEGRITY_TYPE_MAX => 4
}
