#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains operating system version information. (Unicode)
 * @remarks
 * Relying on version information is not the best way to test for a feature. Instead, refer to the documentation for the feature of interest. For more information on common techniques for feature detection, see 
 * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/operating-system-version">Operating System Version</a>.
 * 
 * If you must require a particular operating system, be sure to use it as a minimum supported version, rather than design the test for the one operating system. This way, your detection code will continue to work on future versions of Windows.
 * 
 * The following table summarizes the values returned by supported versions of Windows. Use the information in the  column labeled "Other" to distinguish between operating systems with identical version numbers.
 * 
 * <table>
 * <tr>
 * <th>Operating system</th>
 * <th>Version number</th>
 * <th><b>dwMajorVersion</b></th>
 * <th><b>dwMinorVersion</b></th>
 * <th>Other</th>
 * </tr>
 * <tr>
 * <td>Windows 10</td>
 * <td>10.0*</td>
 * <td>10</td>
 * <td>0</td>
 * <td>OSVERSIONINFOEX.wProductType == VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2016</td>
 * <td>10.0*</td>
 * <td>10</td>
 * <td>0</td>
 * <td>OSVERSIONINFOEX.wProductType != VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows 8.1</td>
 * <td>6.3*</td>
 * <td>6</td>
 * <td>3</td>
 * <td>OSVERSIONINFOEX.wProductType == VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2012 R2</td>
 * <td>6.3*</td>
 * <td>6</td>
 * <td>3</td>
 * <td>OSVERSIONINFOEX.wProductType != VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows 8</td>
 * <td>6.2</td>
 * <td>6</td>
 * <td>2</td>
 * <td>OSVERSIONINFOEX.wProductType == VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2012</td>
 * <td>6.2</td>
 * <td>6</td>
 * <td>2</td>
 * <td>OSVERSIONINFOEX.wProductType != VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows 7</td>
 * <td>6.1</td>
 * <td>6</td>
 * <td>1</td>
 * <td>OSVERSIONINFOEX.wProductType == VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2008 R2</td>
 * <td>6.1</td>
 * <td>6</td>
 * <td>1</td>
 * <td>OSVERSIONINFOEX.wProductType != VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2008</td>
 * <td>6.0</td>
 * <td>6</td>
 * <td>0</td>
 * <td>OSVERSIONINFOEX.wProductType != VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Vista</td>
 * <td>6.0</td>
 * <td>6</td>
 * <td>0</td>
 * <td>OSVERSIONINFOEX.wProductType == VER_NT_WORKSTATION</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2003 R2</td>
 * <td>5.2</td>
 * <td>5</td>
 * <td>2</td>
 * <td>GetSystemMetrics(SM_SERVERR2) != 0</td>
 * </tr>
 * <tr>
 * <td>Windows Server 2003</td>
 * <td>5.2</td>
 * <td>5</td>
 * <td>2</td>
 * <td>GetSystemMetrics(SM_SERVERR2) == 0</td>
 * </tr>
 * <tr>
 * <td>Windows XP</td>
 * <td>5.1</td>
 * <td>5</td>
 * <td>1</td>
 * <td>Not applicable</td>
 * </tr>
 * <tr>
 * <td>Windows 2000</td>
 * <td>5.0</td>
 * <td>5</td>
 * <td>0</td>
 * <td>Not applicable</td>
 * </tr>
 * <tr>
 * <td colspan="5">
 * <b>*</b> For applications that have been manifested for Windows 8.1 or Windows 10. Applications not manifested for Windows 8.1 or Windows 10 will return the Windows 8 OS version value (6.2). To manifest your applications for Windows 8.1 or Windows 10, refer to <a href="https://docs.microsoft.com/windows/desktop/SysInfo/targeting-your-application-at-windows-8-1">Targeting your application for Windows</a>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-osversioninfow
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 * @charset Unicode
 */
class OSVERSIONINFOW extends Win32Struct
{
    static sizeof => 276

    static packingSize => 4

    /**
     * The size of this data structure, in bytes. Set this member to <c>sizeof(OSVERSIONINFO)</c>.
     * @type {Integer}
     */
    dwOSVersionInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The major version number of the operating system. For more information, see Remarks.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minor version number of the operating system. For more information, see Remarks.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The build number of the operating system.
     * @type {Integer}
     */
    dwBuildNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The operating system platform. This member can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VER_PLATFORM_WIN32_NT"></a><a id="ver_platform_win32_nt"></a><dl>
     * <dt><b>VER_PLATFORM_WIN32_NT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system is Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003, Windows XP, or Windows 2000.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwPlatformId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A null-terminated string, such as "Service Pack 3", that indicates the latest Service Pack installed on the system. If no Service Pack has been installed, the string is empty.
     * @type {String}
     */
    szCSDVersion {
        get => StrGet(this.ptr + 20, 127, "UTF-16")
        set => StrPut(value, this.ptr + 20, 127, "UTF-16")
    }
}
