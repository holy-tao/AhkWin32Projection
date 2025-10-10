#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Diffie Hellman algorithm that should be used for Quick Mode PFS (Perfect Forward Secrecy).
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ne-ipsectypes-ipsec_pfs_group
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_PFS_GROUP{

    /**
     * Specifies no Quick Mode PFS.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_NONE => 0

    /**
     * Specifies Diffie Hellman group 1.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_1 => 1

    /**
     * Specifies Diffie Hellman group 2.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_2 => 2

    /**
     * Specifies Diffie Hellman group 14.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_2048 => 3

    /**
     * Specifies Diffie Hellman group 14.
 * 
 * <div class="alert"><b>Note</b>  This group was called Diffie Hellman group 2048 when it was introduced.  The name has since been changed to match standard terminology.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012. </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_14 => 3

    /**
     * Specifies Diffie Hellman ECP group 256.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_ECP_256 => 4

    /**
     * Specifies Diffie Hellman ECP group 384.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_ECP_384 => 5

    /**
     * Use the same Diffie Hellman as the main mode that contains this quick mode.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_MM => 6

    /**
     * Specifies Diffie Hellman group 24.
 * 
 * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_24 => 7

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_PFS_MAX => 8
}
