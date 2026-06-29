#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NET_SERVER_TYPE.ahk" { NET_SERVER_TYPE }

/**
 * The SERVER_INFO_101 structure contains information about the specified server, including name, platform, type of server, and associated software.
 * @remarks
 * To retrieve a value that indicates whether a share is the root volume in a Dfs tree structure, you must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> function and specify information level 1005.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_101
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_101 {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The information level to use for platform-specific information.
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
    sv101_platform_id : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the name of a server.
     */
    sv101_name : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version number and the server type. 
     * 
     * The major release version number of the operating system is specified in the least significant 4 bits. The server type is specified in the most significant 4 bits. The <b>MAJOR_VERSION_MASK</b> bitmask defined in the <i>Lmserver.h</i> header should be used by an  application to obtain the major version number from this member.
     */
    sv101_version_major : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor release version number of the operating system.
     */
    sv101_version_minor : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of software the computer is running. 
     * 
     * Possible values for this member are listed in the <i>Lmserver.h</i> header file.
     */
    sv101_type : NET_SERVER_TYPE

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying a comment describing the server. The comment can be null.
     */
    sv101_comment : PWSTR

}
