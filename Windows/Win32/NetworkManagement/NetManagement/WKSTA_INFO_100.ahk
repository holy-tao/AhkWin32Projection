#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a workstation environment, including platform-specific information, the names of the domain and the local computer, and information concerning the operating system.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_info_100
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_INFO_100 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

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
     * @type {Integer}
     */
    wki100_platform_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string specifying the name of the local computer.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wki100_computername{
        get {
            if(!this.HasProp("__wki100_computername"))
                this.__wki100_computername := PWSTR(this.ptr + 8)
            return this.__wki100_computername
        }
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string specifying the name of the domain to which the computer belongs.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wki100_langroup{
        get {
            if(!this.HasProp("__wki100_langroup"))
                this.__wki100_langroup := PWSTR(this.ptr + 16)
            return this.__wki100_langroup
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The major version number of the operating system running on the computer.
     * @type {Integer}
     */
    wki100_ver_major {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The minor version number of the operating system running on the computer.
     * @type {Integer}
     */
    wki100_ver_minor {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
