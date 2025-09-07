#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the available options for examining security data of an object.
 * @remarks
 * The options defined in this enumeration are bit-masks. More than one option can be set using appropriate bitwise operations.
  * 
  * To read the security data for an object, use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsobjectoptions">IADsObjectOptions</a> interface, supplying the security data options listed in this enumeration.
  * 
  * The following list lists common flag combinations and their use.
  * 
  * <table>
  * <tr>
  * <th>Flag combination</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td><b>ADS_SECURITY_INFO_OWNER</b>, <b>ADS_SECURITY_INFO_GROUP</b>, and <b>ADS_SECURITY_INFO_DACL</b></td>
  * <td>Enable users to read the security data of the owner, group, or DACL of an object. This is the default setting when an object is created.</td>
  * </tr>
  * <tr>
  * <td><b>ADS_SECURITY_INFO_OWNER</b>, <b>ADS_SECURITY_INFO_GROUP</b>, <b>ADS_SECURITY_INFO_DACL</b>, and <b>ADS_SECURITY_INFO_SACL</b></td>
  * <td>Enable users to read the SACL. The <b>ADS_SECURITY_INFO_SACL</b> flag cannot be used by itself.</td>
  * </tr>
  * </table>
  *  
  * 
  * Presently, such options are available for Active Directory only.
  * 
  * Because Visual Basic Scripting Edition (VBScript) cannot read data from a type library, an application must use the appropriate numeric constants, instead of the symbolic constants, to set the appropriate flags. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_security_info_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SECURITY_INFO_ENUM{

    /**
     * Reads or sets the owner data.
     * @type {Integer (Int32)}
     */
    static ADS_SECURITY_INFO_OWNER => 1

    /**
     * Reads or sets the group data.
     * @type {Integer (Int32)}
     */
    static ADS_SECURITY_INFO_GROUP => 2

    /**
     * Reads or sets the discretionary access-control list data.
     * @type {Integer (Int32)}
     */
    static ADS_SECURITY_INFO_DACL => 4

    /**
     * Reads or sets the system access-control list data.
     * @type {Integer (Int32)}
     */
    static ADS_SECURITY_INFO_SACL => 8
}
