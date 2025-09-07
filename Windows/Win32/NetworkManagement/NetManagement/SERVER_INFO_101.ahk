#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_101 structure contains information about the specified server, including name, platform, type of server, and associated software.
 * @remarks
 * To retrieve a value that indicates whether a share is the root volume in a Dfs tree structure, you must call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> function and specify information level 1005.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_101
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_101 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
     * @type {Integer}
     */
    sv101_platform_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the name of a server.
     * @type {Pointer<Ptr>}
     */
    sv101_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version number and the server type. 
     * 
     * The major release version number of the operating system is specified in the least significant 4 bits. The server type is specified in the most significant 4 bits. The <b>MAJOR_VERSION_MASK</b> bitmask defined in the <i>Lmserver.h</i> header should be used by an  application to obtain the major version number from this member.
     * @type {Integer}
     */
    sv101_version_major {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor release version number of the operating system.
     * @type {Integer}
     */
    sv101_version_minor {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of software the computer is running. 
     * 
     * Possible values for this member are listed in the <i>Lmserver.h</i> header file.
     * @type {Integer}
     */
    sv101_type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying a comment describing the server. The comment can be null.
     * @type {Pointer<Ptr>}
     */
    sv101_comment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
