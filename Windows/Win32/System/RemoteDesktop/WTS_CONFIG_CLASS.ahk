#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the type of user configuration information to set or retrieve in a call to the WTSQueryUserConfig and WTSSetUserConfig functions.
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ne-wtsapi32-wts_config_class
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CONFIG_CLASS{

    /**
     * A null-terminated string that contains the path of the initial program that Remote Desktop Services runs when the 
     *       user logs on.
     * 
     * If the <b>WTSUserConfigfInheritInitialProgram</b> value is 1, the initial program can be 
     *        any program specified by the client.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigInitialProgram => 0

    /**
     * A null-terminated string that contains the path of the working directory for the initial program.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigWorkingDirectory => 1

    /**
     * A value that indicates whether the client can specify the initial program.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The client cannot specify the initial program. Instead, the 
     *          <b>WTSUserConfigInitialProgram</b> string identifies an initial program that runs 
     *          automatically when the user logs on to a remote computer. Remote Desktop Services logs the user off when the user 
     *          exits that program.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The client can specify the initial program.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfInheritInitialProgram => 2

    /**
     * A value that indicates whether the user account is permitted to log on to an RD Session Host server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The user cannot log on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The user can log on.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfAllowLogonTerminalServer => 3

    /**
     * A <b>DWORD</b> value that specifies the maximum connection duration, in milliseconds. 
     *       One minute before the connection time-out interval expires, the user is notified of the pending disconnection. 
     *       The user's session is disconnected or terminated depending on the 
     *       <b>WTSUserConfigBrokenTimeoutSettings</b> value. Every time the user logs on, the timer is 
     *       reset. A value of zero indicates that the connection timer is disabled.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTimeoutSettingsConnections => 4

    /**
     * A <b>DWORD</b> value that specifies the maximum duration, in milliseconds, that an 
     *       RD Session Host server retains a disconnected session before the logon is terminated. A value of zero indicates that the 
     *       disconnection timer is disabled.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTimeoutSettingsDisconnections => 5

    /**
     * A <b>DWORD</b> value that specifies the maximum idle time, in milliseconds. If there 
     *       is no keyboard or mouse activity for the specified interval, the user's session is disconnected or terminated 
     *       depending on the <b>WTSUserConfigBrokenTimeoutSettings</b> value. A value of zero 
     *       indicates that the idle timer is disabled.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTimeoutSettingsIdle => 6

    /**
     * This constant currently is not used by Remote Desktop Services.
     * 
     * A value that indicates whether the RD Session Host server automatically reestablishes 
     *       client drive mappings at logon.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The server does not automatically connect to previously mapped client drives.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The server automatically connects to previously mapped client drives at logon.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfDeviceClientDrives => 7

    /**
     * RDP 5.0 and later clients: A value that indicates whether the RD Session Host server 
     *       automatically reestablishes client printer mappings at logon.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The server does not automatically connect to previously mapped client printers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The server automatically connects to previously mapped client printers at logon.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfDeviceClientPrinters => 8

    /**
     * RDP 5.0 and later clients: A value that indicates whether the client printer 
     *       is the default printer.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The client printer is not the default printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The client printer is the default printer.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfDeviceClientDefaultPrinter => 9

    /**
     * A value that indicates what happens when the connection or idle timers expire or when a connection is lost 
     *       due to a connection error.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The session is disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The session is terminated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigBrokenTimeoutSettings => 10

    /**
     * A value that indicates how a disconnected session for this user can be reconnected.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The user can log on to any client computer to reconnect to a disconnected session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The user can reconnect to a disconnected session by logging on to the client computer used to establish 
     *          the disconnected session. If the user logs on from a different client computer, the user gets a new logon 
     *          session.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigReconnectSettings => 11

    /**
     * This constant currently is not used by Remote Desktop Services.
     * 
     * A value that indicates the configuration for dial-up connections in which the 
     *       RD Session Host server stops responding and then calls back the client to establish the connection.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Callback connections are disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The server prompts the user to enter a phone number and calls the user back at that phone number. You can 
     *          use the <b>WTSUserConfigModemCallbackPhoneNumber</b> value to specify a default phone 
     *          number.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 2
     * 
     * </td>
     * <td>
     * The server automatically calls the user back at the phone number specified by the
     *          <b>WTSUserConfigModemCallbackPhoneNumber</b> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigModemCallbackSettings => 12

    /**
     * This constant currently is not used by Remote Desktop Services.
     * 
     * A null-terminated string that contains the phone number to use for callback 
     *       connections.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigModemCallbackPhoneNumber => 13

    /**
     * RDP 5.0 and later clients: A value that indicates whether the user session 
     *       can be shadowed. Shadowing allows a user to remotely monitor the on-screen operations of another user.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Disable
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * Enable input, notify
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 2
     * 
     * </td>
     * <td>
     * Enable input, no notify
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 3
     * 
     * </td>
     * <td>
     * Enable no input, notify
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 4
     * 
     * </td>
     * <td>
     * Enable no input, no notify
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigShadowingSettings => 14

    /**
     * A null-terminated string that contains the path of the user's profile for RD Session Host server logon. The directory 
     *       the path identifies must be created manually, and must exist prior to the logon. 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetuserconfiga">WTSSetUserConfig</a> will not create the directory 
     *       if it does not already exist.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTerminalServerProfilePath => 15

    /**
     * A null-terminated string that contains the path of the user's root directory for RD Session Host server logon. This 
     *       string can specify a local path or a UNC path (<i>\\ComputerName\Share\Path</i>). For more information, see 
     *       <b>WTSUserConfigfTerminalServerRemoteHomeDir</b>.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTerminalServerHomeDir => 16

    /**
     * A null-terminated string that contains a drive name (a drive letter followed by a colon) to which the UNC 
     *       path specified in the <b>WTSUserConfigTerminalServerHomeDir</b> string is mapped. For more information, see
     *       <b>WTSUserConfigfTerminalServerRemoteHomeDir</b>.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigTerminalServerHomeDirDrive => 17

    /**
     * A value that indicates whether the user's root directory for RD Session Host server logon is a local path or a 
     *       mapped drive letter. Note that this value cannot be used with 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetuserconfiga">WTSSetUserConfig</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * The <b>WTSUserConfigTerminalServerHomeDir</b> string contains the local path of the 
     *          user's RD Session Host server logon root directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 1
     * 
     * </td>
     * <td>
     * The <b>WTSUserConfigTerminalServerHomeDir</b> string contains the UNC path of the 
     *          user's RD Session Host server logon root directory, and the 
     *          <b>WTSUserConfigTerminalServerHomeDirDrive</b> string contains a drive letter to which 
     *          the UNC path is mapped.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer (Int32)}
     */
    static WTSUserConfigfTerminalServerRemoteHomeDir => 18

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsuserconfiga">WTSUSERCONFIG</a> structure that contains configuration data for the session. 
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigUser => 19
}
