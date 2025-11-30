#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of Diffie Hellman group used for Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) key generation.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_dh_group
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_DH_GROUP extends Win32Enum{

    /**
     * Specifies no Diffie Hellman group. Available only for AuthIP.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_NONE => 0

    /**
     * Specifies  Diffie Hellman group 1.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_1 => 1

    /**
     * Specifies  Diffie Hellman group 2.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_2 => 2

    /**
     * Specifies  Diffie Hellman group 14.
     * 
     * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012. </div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_14 => 3

    /**
     * Specifies  Diffie Hellman group 14.
     * 
     * <div class="alert"><b>Note</b>  This group was called Diffie Hellman group 2048 when it was introduced.  The name has since been changed to match standard terminology.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_2048 => 3

    /**
     * Specifies Diffie Hellman ECP group 256.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_ECP_256 => 4

    /**
     * Specifies Diffie Hellman ECP group 384.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_ECP_384 => 5

    /**
     * Specifies  Diffie Hellman group 24.
     * 
     * <div class="alert"><b>Note</b>  Available only for Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_24 => 6

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_DH_GROUP_MAX => 7
}
