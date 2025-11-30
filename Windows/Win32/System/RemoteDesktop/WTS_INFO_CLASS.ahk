#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the type of session information to retrieve in a call to the WTSQuerySessionInformation function.
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ne-wtsapi32-wts_info_class
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_INFO_CLASS extends Win32Enum{

    /**
     * A null-terminated string that contains the name of the initial program that Remote Desktop Services runs when the 
     *       user logs on.
     * @type {Integer (Int32)}
     */
    static WTSInitialProgram => 0

    /**
     * A null-terminated string that contains the published name of the application that the session is running.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This value is not supported
     * @type {Integer (Int32)}
     */
    static WTSApplicationName => 1

    /**
     * A null-terminated string that contains the default directory used when launching the initial program.
     * @type {Integer (Int32)}
     */
    static WTSWorkingDirectory => 2

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSOEMId => 3

    /**
     * A <b>ULONG</b> value that contains the session identifier.
     * @type {Integer (Int32)}
     */
    static WTSSessionId => 4

    /**
     * A null-terminated string that contains the name of the user associated with the session.
     * @type {Integer (Int32)}
     */
    static WTSUserName => 5

    /**
     * A null-terminated string that contains the name of the Remote Desktop Services session.
     * 
     * <div class="alert"><b>Note</b>  Despite its name, specifying this type does not return the window station name. Rather, it returns the 
     *        name of the Remote Desktop Services session. Each Remote Desktop Services session is associated with an interactive window 
     *        station. Because the only supported window station name for an interactive window station is 
     *        "WinSta0", each session is associated with its own "WinSta0" window station. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/winstation/window-stations">Window Stations</a>.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WTSWinStationName => 6

    /**
     * A null-terminated string that contains the name of the domain to which the logged-on user belongs.
     * @type {Integer (Int32)}
     */
    static WTSDomainName => 7

    /**
     * The session's current connection state. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a>.
     * @type {Integer (Int32)}
     */
    static WTSConnectState => 8

    /**
     * A <b>ULONG</b> value that contains the build number of the client.
     * @type {Integer (Int32)}
     */
    static WTSClientBuildNumber => 9

    /**
     * A null-terminated string that contains the name of the client.
     * @type {Integer (Int32)}
     */
    static WTSClientName => 10

    /**
     * A null-terminated string that contains the directory in which the client is installed.
     * @type {Integer (Int32)}
     */
    static WTSClientDirectory => 11

    /**
     * A <b>USHORT</b> client-specific product identifier.
     * @type {Integer (Int32)}
     */
    static WTSClientProductId => 12

    /**
     * A <b>ULONG</b> value that contains a client-specific hardware identifier. This option is reserved for future use. <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> will always return a value of 0.
     * @type {Integer (Int32)}
     */
    static WTSClientHardwareId => 13

    /**
     * The network type and network address of the client. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a>.
     * 
     * The IP address is offset by two bytes from the start of the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a> 
     *          structure.
     * @type {Integer (Int32)}
     */
    static WTSClientAddress => 14

    /**
     * Information about the display resolution of the client. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a>.
     * @type {Integer (Int32)}
     */
    static WTSClientDisplay => 15

    /**
     * A <b>USHORT</b> value that specifies information about the protocol type for the
     * @type {Integer (Int32)}
     */
    static WTSClientProtocolType => 16

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSIdleTime => 17

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSLogonTime => 18

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSIncomingBytes => 19

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSOutgoingBytes => 20

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSIncomingFrames => 21

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSOutgoingFrames => 22

    /**
     * Information about a Remote Desktop Connection (RDC) client. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsclienta">WTSCLIENT</a>.
     * @type {Integer (Int32)}
     */
    static WTSClientInfo => 23

    /**
     * Information about a client session on a RD Session Host server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoa">WTSINFO</a>.
     * @type {Integer (Int32)}
     */
    static WTSSessionInfo => 24

    /**
     * Extended information about a  session on a   RD Session Host server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoexa">WTSINFOEX</a>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSSessionInfoEx => 25

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsconfiginfoa">WTSCONFIGINFO</a> structure that contains information about the configuration of a RD Session Host server.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSConfigInfo => 26

    /**
     * This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSValidationInfo => 27

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_address">WTS_SESSION_ADDRESS</a> structure that contains the IPv4 address assigned to the session.
     *      If the session does not have a virtual IP address, the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function  returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSSessionAddressV4 => 28

    /**
     * Determines whether the current session is a remote session. The <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function returns a value of <b>TRUE</b> to indicate that the current session is a remote session, and <b>FALSE</b> to indicate that the current session is a local session. This value can only be used for the local machine, so the <i>hServer</i> parameter of the <b>WTSQuerySessionInformation</b> function must contain <b>WTS_CURRENT_SERVER_HANDLE</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static WTSIsRemoteSession => 29

    /**
     * @type {Integer (Int32)}
     */
    static WTSSessionActivityId => 30
}
