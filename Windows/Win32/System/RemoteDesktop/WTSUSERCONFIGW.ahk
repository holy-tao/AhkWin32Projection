#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains configuration information for a user on a domain controller or Remote Desktop Session Host (RD Session Host) server. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The wtsapi32.h header defines WTSUSERCONFIG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsuserconfigw
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTSUSERCONFIGW extends Win32Struct
{
    static sizeof => 2148

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_source">WTS_CONFIG_SOURCE</a> enumeration type that specifies the  source of configuration information returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfiga">WTSQueryUserConfig</a> function.
     * @type {Integer}
     */
    Source {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    InheritInitialProgram {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    AllowLogonTerminalServer {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum connection duration, in milliseconds. One minute before the connection expires, the server notifies the user about the pending disconnection. When the connection times out, the server takes the action specified by the  <b>BrokenTimeoutSettings</b> member. Every time the user logs on, the timer is reset. A value of zero indicates that the connection timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsConnections {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum duration, in milliseconds, that the server retains a disconnected session before the logon is terminated. A value of zero indicates that the disconnection timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsDisconnections {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The amount of time, in milliseconds, that a connection can remain idle. If there is no keyboard or mouse activity for this period of time, the server takes the action specified by the <b>BrokenTimeoutSettings</b> member. A value of zero indicates that the idle timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsIdle {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This member is reserved.
     * @type {Integer}
     */
    DeviceClientDrives {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    DeviceClientPrinters {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    ClientDefaultPrinter {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    BrokenTimeoutSettings {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * 
     * @type {Integer}
     */
    ReconnectSettings {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    ShadowingSettings {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    TerminalServerRemoteHomeDir {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 52, 260, "UTF-16")
        set => StrPut(value, this.ptr + 52, 260, "UTF-16")
    }

    /**
     * A null-terminated string that contains the path of the working directory for the initial program.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 574, 260, "UTF-16")
        set => StrPut(value, this.ptr + 574, 260, "UTF-16")
    }

    /**
     * A null-terminated string that contains the profile path that is assigned to the user when the user connects to the server. The directory specified by the path must be created manually, and must exist prior to the logon.
     * @type {String}
     */
    TerminalServerProfilePath {
        get => StrGet(this.ptr + 1096, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1096, 260, "UTF-16")
    }

    /**
     * A null-terminated string that contains the path to the home folder of the user's Remote Desktop Services sessions. The folder can be a local folder or a network share.
     * @type {String}
     */
    TerminalServerHomeDir {
        get => StrGet(this.ptr + 1618, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1618, 260, "UTF-16")
    }

    /**
     * A null-terminated string that contains the drive name (a drive letter followed by a colon) to which the path specified in the <b>TerminalServerHomeDir</b> member is mapped. This member is only valid when the <b>TerminalServerRemoteHomeDir</b> member is set to one.
     * @type {String}
     */
    TerminalServerHomeDirDrive {
        get => StrGet(this.ptr + 2140, 3, "UTF-16")
        set => StrPut(value, this.ptr + 2140, 3, "UTF-16")
    }
}
