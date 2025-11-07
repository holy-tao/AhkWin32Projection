#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how escape characters are displayed in a directory path.
 * @remarks
 * 
 * Special characters must be escaped when used for any unintended purposes. For example, LDAP special characters, the comma (,) and the equal sign (=), are intended as field separators in a distinguished name, "CN=user,CN=users,DC=Fabrikam,DC=com". When an attribute value uses such special characters, for example, "CN=users\,last name\=Smith", these special characters must be escaped as shown. This ensures that an LDAP-compliant directory, such as Active Directory, will parse the path properly. However, an escaped path string may not appear to be user-friendly on a display. In this case, you can set the <b>ADS_ESCAPE_MODE_ENUM</b> in such way that shows the path as an unescaped string, "CN=users,last name=Smith".
 * 
 * Similarly, the ADSI special character, slash mark (/), separates ADSI-specific elements, "LDAP://server/CN=Jeff Smith,CN=Users,DC=Fabrikam,DC=com". Although it must be escaped when used for any other purposes, for example, "LDAP://server/CN=Jeff Smith\/California,CN=Users,DC=Fabrikam,DC=com". You can choose an <b>ADS_ESCAPE_MODE_ENUM</b> option to display this escaped string in a human-readable form: "LDAP://server/CN=Jeff Smith/California,CN=Users,DC=Fabrikam,DC=com".
 * 
 * Presently, the slash mark (/) is the only ADSI special character. ADSI escaping and unescaping applies to ADSI special characters only. The operation will not affect any LDAP special characters, that is, they are neither escaped nor unescaped. For more information and  a list of  special characters defined by LDAP, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP Special Characters</a>.
 * 
 * To show unescaped path string, use 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspathname">IADsPathname</a> interface and its methods. All other ADSI APIs return the escaped path string.
 * 
 * To obtain correct behavior, the LDAP special characters must be escaped before the ADSI special characters are escaped. The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspathname">IADsPathname</a> interface will escape the characters in the correct sequence.
 * 
 * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, Visual Basic Scripting Edition (VBScript) applications do not recognize symbolic, as constants defined above. Instead, use the numerical constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants, write explicit declarations of such constants, as done here.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_escape_mode_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_ESCAPE_MODE_ENUM{

    /**
     * The default escape mode provides a convenient option to specify the escape mode. It has the effect of minimal escape operation appropriate for a chosen format. Thus, the default behavior depends on the value that  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_format_enum">ADS_FORMAT_ENUM</a> uses to retrieve the directory paths.
 * 
 * <table>
 * <tr>
 * <th>Retrieved path format</th>
 * <th>Default escaped mode</th>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_X500</b></td>
 * <td><b>ADS_ESCAPEDMODE_ON</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_X500_NO_SERVER</b></td>
 * <td><b>ADS_ESCAPEDMODE_ON</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_WINDOWS</b></td>
 * <td><b>ADS_ESCAPEDMODE_ON</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_WINDOWS_NO_SERVER</b></td>
 * <td><b>ADS_ESCAPEDMODE_ON</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_X500_DN</b></td>
 * <td><b>ADS_ESCAPEDMODE_OFF</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_X500_PARENT</b></td>
 * <td><b>ADS_ESCAPEDMODE_OFF</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_WINDOWS_DN</b></td>
 * <td><b>ADS_ESCAPEDMODE_OFF</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_WINDOWS_PARENT</b></td>
 * <td><b>ADS_ESCAPEDMODE_OFF</b></td>
 * </tr>
 * <tr>
 * <td><b>ADS_FORMAT_LEAF</b></td>
 * <td><b>ADS_ESCAPEDMODE_ON</b></td>
 * </tr>
 * </table>
     * @type {Integer (Int32)}
     */
    static ADS_ESCAPEDMODE_DEFAULT => 1

    /**
     * All special characters are displayed in the escape format; for example, "CN=date\=yy\/mm\/dd\,weekday" appears as is.
     * @type {Integer (Int32)}
     */
    static ADS_ESCAPEDMODE_ON => 2

    /**
     * ADSI special characters are displayed in the unescaped format; for example, "CN=date\=yy\/mm\/dd\,weekday" appears as "CN=date\=yy/mm/dd\,weekday".
     * @type {Integer (Int32)}
     */
    static ADS_ESCAPEDMODE_OFF => 3

    /**
     * ADSI and LDAP special characters are displayed in the  unescaped format; for example, "CN=date\=yy\/mm\/dd\,weekday" appears as "CN=date=yy/mm/dd,weekday".
     * @type {Integer (Int32)}
     */
    static ADS_ESCAPEDMODE_OFF_EX => 4
}
