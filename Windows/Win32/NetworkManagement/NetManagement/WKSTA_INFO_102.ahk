#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a workstation environment, including platform-specific information, the name of the domain and the local computer, and information concerning the operating system. (WKSTA_INFO_102)
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_info_102
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_INFO_102 {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The information level to use to retrieve platform-specific information. 
     * 
     * Possible values for this member are listed in the <i>Lmcons.h</i> header file.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLATFORM_ID_DOS"></a><a id="platform_id_dos"></a><dl>
     * <dt><b>PLATFORM_ID_DOS</b></dt>
     * <dt>300</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MS-DOS platform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLATFORM_ID_OS2"></a><a id="platform_id_os2"></a><dl>
     * <dt><b>PLATFORM_ID_OS2</b></dt>
     * <dt>400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The OS/2 platform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLATFORM_ID_NT"></a><a id="platform_id_nt"></a><dl>
     * <dt><b>PLATFORM_ID_NT</b></dt>
     * <dt>500</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows NT platform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLATFORM_ID_OSF"></a><a id="platform_id_osf"></a><dl>
     * <dt><b>PLATFORM_ID_OSF</b></dt>
     * <dt>600</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The OSF platform.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLATFORM_ID_VMS"></a><a id="platform_id_vms"></a><dl>
     * <dt><b>PLATFORM_ID_VMS</b></dt>
     * <dt>700</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VMS platform.
     * 
     * </td>
     * </tr>
     * </table>
     */
    wki102_platform_id : UInt32

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string specifying the name of the local computer.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wki102_computername : PWSTR

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string specifying the name of the domain to which the computer belongs.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wki102_langroup : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version number of the operating system running on the computer.
     */
    wki102_ver_major : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor version number of the operating system running on the computer.
     */
    wki102_ver_minor : UInt32

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the path to the LANMAN directory.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wki102_lanroot : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of users who are logged on to the local computer.
     */
    wki102_logged_on_users : UInt32

}
