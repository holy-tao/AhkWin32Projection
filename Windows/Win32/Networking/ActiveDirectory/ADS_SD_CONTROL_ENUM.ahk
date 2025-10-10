#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_SD_CONTROL_ENUM enumeration specifies control flags for a security descriptor.
 * @remarks
 * 
  * For more information, see  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a> under Security in the Platform Software Development Kit (SDK).
  * 
  * Since VBScript cannot read information from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_sd_control_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SD_CONTROL_ENUM{

    /**
     * A default mechanism provides the owner security identifier (SID) of the security descriptor rather than the original provider of the security descriptor.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_OWNER_DEFAULTED => 1

    /**
     * A default mechanism provides the group SID of the security descriptor rather than the original provider of the security descriptor.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_GROUP_DEFAULTED => 2

    /**
     * The discretionary access-control list (DACL) is present in the security descriptor. If this flag is not set, or if this flag is set and the DACL is <b>NULL</b>, the security descriptor allows full access to everyone.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_DACL_PRESENT => 4

    /**
     * The security descriptor uses a default DACL built from the creator's access token.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_DACL_DEFAULTED => 8

    /**
     * The system access-control list (SACL) is present in the security descriptor.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SACL_PRESENT => 16

    /**
     * The security descriptor uses a default SACL built from the creator's access token.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SACL_DEFAULTED => 32

    /**
     * THE DACL of the security descriptor must be inherited.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_DACL_AUTO_INHERIT_REQ => 256

    /**
     * The SACL of the security descriptor must be inherited.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SACL_AUTO_INHERIT_REQ => 512

    /**
     * The DACL of the security descriptor supports automatic propagation of inheritable access-control entries (ACEs) to existing child objects.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_DACL_AUTO_INHERITED => 1024

    /**
     * The SACL of the security descriptor supports automatic propagation of inheritable ACEs to existing child objects.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SACL_AUTO_INHERITED => 2048

    /**
     * The security descriptor will not allow inheritable ACEs to modify the DACL.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_DACL_PROTECTED => 4096

    /**
     * The security descriptor will not allow inheritable ACEs to modify the SACL.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SACL_PROTECTED => 8192

    /**
     * The security descriptor is of self-relative format with all the security information in a continuous block of memory.
     * @type {Integer (Int32)}
     */
    static ADS_SD_CONTROL_SE_SELF_RELATIVE => 32768
}
