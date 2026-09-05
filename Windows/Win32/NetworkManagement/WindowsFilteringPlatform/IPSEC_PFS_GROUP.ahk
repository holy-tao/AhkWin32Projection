#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Diffie Hellman algorithm that should be used for Quick Mode PFS (Perfect Forward Secrecy).
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_pfs_group
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_PFS_GROUP extends Win32Enum {

    /**
     * Specifies no Quick Mode PFS.
     * Native name: IPSEC_PFS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Specifies Diffie Hellman group 1.
     * Native name: IPSEC_PFS_1
     * @type {Integer (Int32)}
     */
    static 1 => 1

    /**
     * Specifies Diffie Hellman group 2.
     * Native name: IPSEC_PFS_2
     * @type {Integer (Int32)}
     */
    static 2 => 2

    /**
     * Specifies Diffie Hellman group 14.
     * Native name: IPSEC_PFS_2048
     * @type {Integer (Int32)}
     */
    static 2048 => 3

    /**
     * Specifies Diffie Hellman group 14.
     * 
     * <div class="alert"><b>Note</b>  This group was called Diffie Hellman group 2048 when it was introduced.  The name has since been changed to match standard terminology.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012. </div>
     * <div> </div>
     * Native name: IPSEC_PFS_14
     * @type {Integer (Int32)}
     */
    static 14 => 3

    /**
     * Specifies Diffie Hellman ECP group 256.
     * Native name: IPSEC_PFS_ECP_256
     * @type {Integer (Int32)}
     */
    static ECP_256 => 4

    /**
     * Specifies Diffie Hellman ECP group 384.
     * Native name: IPSEC_PFS_ECP_384
     * @type {Integer (Int32)}
     */
    static ECP_384 => 5

    /**
     * Use the same Diffie Hellman as the main mode that contains this quick mode.
     * Native name: IPSEC_PFS_MM
     * @type {Integer (Int32)}
     */
    static MM => 6

    /**
     * Specifies Diffie Hellman group 24.
     * 
     * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * Native name: IPSEC_PFS_24
     * @type {Integer (Int32)}
     */
    static 24 => 7

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_PFS_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 8
}
