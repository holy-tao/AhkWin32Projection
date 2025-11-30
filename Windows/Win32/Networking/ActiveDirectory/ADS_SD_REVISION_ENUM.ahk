#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the revision number of the access-control entry (ACE), or the access-control list (ACL), for Active Directory.
 * @remarks
 * 
 * The <b>ADS_SD_REVISION_DS</b> flag signifies that the related ACL contains object-specific ACEs.
 * 
 * Because VBScript cannot read data from a type library, VBScript applications cannot recognize the symbolic constants as defined above. Use the numerical constants instead to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript applications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_sd_revision_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SD_REVISION_ENUM extends Win32Enum{

    /**
     * The revision number of the ACE, or the ACL, for Active Directory.
     * @type {Integer (Int32)}
     */
    static ADS_SD_REVISION_DS => 4
}
