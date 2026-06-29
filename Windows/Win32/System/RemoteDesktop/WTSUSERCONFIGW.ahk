#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains configuration information for a user on a domain controller or Remote Desktop Session Host (RD Session Host) server. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSUSERCONFIG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsuserconfigw
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTSUSERCONFIGW {
    #StructPack 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_source">WTS_CONFIG_SOURCE</a> enumeration type that specifies the  source of configuration information returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfiga">WTSQueryUserConfig</a> function.
     */
    Source : UInt32

    InheritInitialProgram : UInt32

    AllowLogonTerminalServer : UInt32

    /**
     * The maximum connection duration, in milliseconds. One minute before the connection expires, the server notifies the user about the pending disconnection. When the connection times out, the server takes the action specified by the  <b>BrokenTimeoutSettings</b> member. Every time the user logs on, the timer is reset. A value of zero indicates that the connection timer is disabled.
     */
    TimeoutSettingsConnections : UInt32

    /**
     * The maximum duration, in milliseconds, that the server retains a disconnected session before the logon is terminated. A value of zero indicates that the disconnection timer is disabled.
     */
    TimeoutSettingsDisconnections : UInt32

    /**
     * The amount of time, in milliseconds, that a connection can remain idle. If there is no keyboard or mouse activity for this period of time, the server takes the action specified by the <b>BrokenTimeoutSettings</b> member. A value of zero indicates that the idle timer is disabled.
     */
    TimeoutSettingsIdle : UInt32

    /**
     * This member is reserved.
     */
    DeviceClientDrives : UInt32

    DeviceClientPrinters : UInt32

    ClientDefaultPrinter : UInt32

    BrokenTimeoutSettings : UInt32

    ReconnectSettings : UInt32

    ShadowingSettings : UInt32

    TerminalServerRemoteHomeDir : UInt32

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     */
    InitialProgram : WCHAR[261]

    /**
     * A null-terminated string that contains the path of the working directory for the initial program.
     */
    WorkDirectory : WCHAR[261]

    /**
     * A null-terminated string that contains the profile path that is assigned to the user when the user connects to the server. The directory specified by the path must be created manually, and must exist prior to the logon.
     */
    TerminalServerProfilePath : WCHAR[261]

    /**
     * A null-terminated string that contains the path to the home folder of the user's Remote Desktop Services sessions. The folder can be a local folder or a network share.
     */
    TerminalServerHomeDir : WCHAR[261]

    /**
     * A null-terminated string that contains the drive name (a drive letter followed by a colon) to which the path specified in the <b>TerminalServerHomeDir</b> member is mapped. This member is only valid when the <b>TerminalServerRemoteHomeDir</b> member is set to one.
     */
    TerminalServerHomeDirDrive : WCHAR[4]

}
