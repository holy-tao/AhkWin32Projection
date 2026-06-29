#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a software update.
 * @remarks
 * The most-significant unsigned long integer of a version number contains the major and minor version numbers. The least-significant unsigned long integer of the version number contains the custom version and build numbers.
 * @see https://learn.microsoft.com/windows/win32/api/urlmon/ns-urlmon-softdistinfo
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct SOFTDISTINFO {
    #StructPack 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    dwAdState : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the contents of the TITLE flag from the associated .cdf file.
     */
    szTitle : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the contents of the ABSTRACT flag from the associated .cdf file.
     */
    szAbstract : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A string that contains the URL of the webpage to advertise or install the update.
     */
    szHREF : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the installed version number.
     */
    dwInstalledVersionMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the installed version number.
     */
    dwInstalledVersionLS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the update version number.
     */
    dwUpdateVersionMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the update version number.
     */
    dwUpdateVersionLS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The most-significant unsigned long integer value of the advertised version number.
     */
    dwAdvertisedVersionMS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The least-significant unsigned long integer value of the advertised version number.
     */
    dwAdvertisedVersionLS : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved. Must be set to zero.
     */
    dwReserved : UInt32

}
