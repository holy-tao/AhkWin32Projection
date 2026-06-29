#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NET_SERVER_TYPE.ahk" { NET_SERVER_TYPE }
#Import ".\SERVER_INFO_HIDDEN.ahk" { SERVER_INFO_HIDDEN }

/**
 * Contains information about the specified server, including name, platform, type of server, attributes, and associated software.
 * @remarks
 * To retrieve a value that indicates whether a share is the root volume in a Dfs tree structure, you must call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> function and specify information level 1005.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_102
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_102 {
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
    sv102_platform_id : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the name of a server.
     */
    sv102_name : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version number and the server type. 
     * 
     * The major release version number of the operating system is specified in the least significant 4 bits. The server type is specified in the most significant 4 bits. The <b>MAJOR_VERSION_MASK</b> bitmask defined in the <i>Lmserver.h</i> header should be used by an  application to obtain the major version number from this member.
     */
    sv102_version_major : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor release version number of the operating system.
     */
    sv102_version_minor : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of software the computer is running. 
     * 
     * Possible values for this member are listed in the <i>Lmserver.h</i> header file.
     */
    sv102_type : NET_SERVER_TYPE

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying a comment describing the server. The comment can be null.
     */
    sv102_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of users who can attempt to log on to the system server. Note that it is the license server that determines how many of these users can actually log on.
     */
    sv102_users : UInt32

    /**
     * Type: <b>LONG</b>
     * 
     * The auto-disconnect time, in minutes. A session is disconnected if it is idle longer than the period of time specified by the <b>sv102_disc</b> member. If the value of <b>sv102_disc</b> is SV_NODISC, auto-disconnect is not enabled.
     */
    sv102_disc : Int32

    /**
     * Type: <b>BOOL</b>
     */
    sv102_hidden : SERVER_INFO_HIDDEN

    /**
     * Type: <b>DWORD</b>
     * 
     * The network announce rate, in seconds. This rate determines how often the server is announced to other computers on the network. For more information about how much the announce rate can vary from the period of time specified by this member, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_info_1018">SERVER_INFO_1018</a>.
     */
    sv102_announce : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The delta value for the announce rate, in milliseconds. This value specifies how much the announce rate can vary from the period of time specified in the <b>sv102_announce</b> member.
     * 
     * The delta value allows randomly varied announce rates. For example, if the <b>sv102_announce</b> member has the value 10 and the <b>sv102_anndelta</b>  member has the value 1, the announce rate can vary from 9.999 seconds to 10.001 seconds.
     */
    sv102_anndelta : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of users per license. By default, this number is SV_USERS_PER_LICENSE.
     */
    sv102_licenses : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path to user directories.
     */
    sv102_userpath : PWSTR

}
