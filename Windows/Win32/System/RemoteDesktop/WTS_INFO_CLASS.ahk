#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the type of session information to retrieve in a call to the WTSQuerySessionInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_info_class
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_INFO_CLASS extends Win32Enum {

    /**
     * A null-terminated string that contains the name of the initial program that Remote Desktop Services runs when the 
     *       user logs on.
     * Native name: WTSInitialProgram
     * @type {Integer (Int32)}
     */
    static InitialProgram => 0

    /**
     * A null-terminated string that contains the published name of the application that the session is running.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This value is not supported
     * Native name: WTSApplicationName
     * @type {Integer (Int32)}
     */
    static ApplicationName => 1

    /**
     * A null-terminated string that contains the default directory used when launching the initial program.
     * Native name: WTSWorkingDirectory
     * @type {Integer (Int32)}
     */
    static WorkingDirectory => 2

    /**
     * This value is not used.
     * @type {Integer (Int32)}
     */
    static WTSOEMId => 3

    /**
     * A <b>ULONG</b> value that contains the session identifier.
     * Native name: WTSSessionId
     * @type {Integer (Int32)}
     */
    static SessionId => 4

    /**
     * A null-terminated string that contains the name of the user associated with the session.
     * Native name: WTSUserName
     * @type {Integer (Int32)}
     */
    static UserName => 5

    /**
     * A null-terminated string that contains the name of the Remote Desktop Services session.
     * 
     * <div class="alert"><b>Note</b>  Despite its name, specifying this type does not return the window station name. Rather, it returns the 
     *        name of the Remote Desktop Services session. Each Remote Desktop Services session is associated with an interactive window 
     *        station. Because the only supported window station name for an interactive window station is 
     *        "WinSta0", each session is associated with its own "WinSta0" window station. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/winstation/window-stations">Window Stations</a>.</div>
     * <div> </div>
     * Native name: WTSWinStationName
     * @type {Integer (Int32)}
     */
    static WinStationName => 6

    /**
     * A null-terminated string that contains the name of the domain to which the logged-on user belongs.
     * Native name: WTSDomainName
     * @type {Integer (Int32)}
     */
    static DomainName => 7

    /**
     * The session's current connection state. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a>.
     * Native name: WTSConnectState
     * @type {Integer (Int32)}
     */
    static ConnectState => 8

    /**
     * A <b>ULONG</b> value that contains the build number of the client.
     * Native name: WTSClientBuildNumber
     * @type {Integer (Int32)}
     */
    static ClientBuildNumber => 9

    /**
     * A null-terminated string that contains the name of the client.
     * Native name: WTSClientName
     * @type {Integer (Int32)}
     */
    static ClientName => 10

    /**
     * A null-terminated string that contains the directory in which the client is installed.
     * Native name: WTSClientDirectory
     * @type {Integer (Int32)}
     */
    static ClientDirectory => 11

    /**
     * A <b>USHORT</b> client-specific product identifier.
     * Native name: WTSClientProductId
     * @type {Integer (Int32)}
     */
    static ClientProductId => 12

    /**
     * A <b>ULONG</b> value that contains a client-specific hardware identifier. This option is reserved for future use. <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> will always return a value of 0.
     * Native name: WTSClientHardwareId
     * @type {Integer (Int32)}
     */
    static ClientHardwareId => 13

    /**
     * The network type and network address of the client. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a>.
     * 
     * The IP address is offset by two bytes from the start of the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a> 
     *          structure.
     * Native name: WTSClientAddress
     * @type {Integer (Int32)}
     */
    static ClientAddress => 14

    /**
     * Information about the display resolution of the client. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a>.
     * Native name: WTSClientDisplay
     * @type {Integer (Int32)}
     */
    static ClientDisplay => 15

    /**
     * A <b>USHORT</b> value that specifies information about the protocol type for the
     * Native name: WTSClientProtocolType
     * @type {Integer (Int32)}
     */
    static ClientProtocolType => 16

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * To caculate session idle time, use the <a href="https://learn.microsoft.com/en-us/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoa">LastInputTime</a> structure field.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSIdleTime
     * @type {Integer (Int32)}
     */
    static IdleTime => 17

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSLogonTime
     * @type {Integer (Int32)}
     */
    static LogonTime => 18

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSIncomingBytes
     * @type {Integer (Int32)}
     */
    static IncomingBytes => 19

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSOutgoingBytes
     * @type {Integer (Int32)}
     */
    static OutgoingBytes => 20

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSIncomingFrames
     * @type {Integer (Int32)}
     */
    static IncomingFrames => 21

    /**
     * This value returns <b>FALSE</b>. If you call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information, <b>GetLastError</b> returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not used.
     * Native name: WTSOutgoingFrames
     * @type {Integer (Int32)}
     */
    static OutgoingFrames => 22

    /**
     * Information about a Remote Desktop Connection (RDC) client. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsclienta">WTSCLIENT</a>.
     * Native name: WTSClientInfo
     * @type {Integer (Int32)}
     */
    static ClientInfo => 23

    /**
     * Information about a client session on a RD Session Host server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoa">WTSINFO</a>.
     * Native name: WTSSessionInfo
     * @type {Integer (Int32)}
     */
    static SessionInfo => 24

    /**
     * Extended information about a  session on a   RD Session Host server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoexa">WTSINFOEX</a>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * Native name: WTSSessionInfoEx
     * @type {Integer (Int32)}
     */
    static SessionInfoEx => 25

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsconfiginfoa">WTSCONFIGINFO</a> structure that contains information about the configuration of a RD Session Host server.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * Native name: WTSConfigInfo
     * @type {Integer (Int32)}
     */
    static ConfigInfo => 26

    /**
     * This value is not supported.
     * Native name: WTSValidationInfo
     * @type {Integer (Int32)}
     */
    static ValidationInfo => 27

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_address">WTS_SESSION_ADDRESS</a> structure that contains the IPv4 address assigned to the session.
     *      If the session does not have a virtual IP address, the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function  returns <b>ERROR_NOT_SUPPORTED</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * Native name: WTSSessionAddressV4
     * @type {Integer (Int32)}
     */
    static SessionAddressV4 => 28

    /**
     * Determines whether the current session is a remote session. The <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function returns a value of <b>TRUE</b> to indicate that the current session is a remote session, and <b>FALSE</b> to indicate that the current session is a local session. This value can only be used for the local machine, so the <i>hServer</i> parameter of the <b>WTSQuerySessionInformation</b> function must contain <b>WTS_CURRENT_SERVER_HANDLE</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported.
     * Native name: WTSIsRemoteSession
     * @type {Integer (Int32)}
     */
    static IsRemoteSession => 29

    /**
     * Native name: WTSSessionActivityId
     * @type {Integer (Int32)}
     */
    static SessionActivityId => 30

    /**
     * Native name: WTSCapabilityCheck
     * @type {Integer (Int32)}
     */
    static CapabilityCheck => 31
}
