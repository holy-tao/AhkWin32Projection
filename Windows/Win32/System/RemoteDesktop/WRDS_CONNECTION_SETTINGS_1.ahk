#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_LISTENER_SETTING_LEVEL.ahk" { WRDS_LISTENER_SETTING_LEVEL }
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_LISTENER_SETTINGS_1.ahk" { WRDS_LISTENER_SETTINGS_1 }
#Import ".\WRDS_LISTENER_SETTING.ahk" { WRDS_LISTENER_SETTING }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_SOCKADDR.ahk" { WTS_SOCKADDR }
#Import ".\WRDS_LISTENER_SETTINGS.ahk" { WRDS_LISTENER_SETTINGS }
#Import ".\WTS_TIME_ZONE_INFORMATION.ahk" { WTS_TIME_ZONE_INFORMATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains connection setting information for a remote session. (WRDS_CONNECTION_SETTINGS_1)
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_connection_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_CONNECTION_SETTINGS_1 {
    #StructPack 8

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     */
    fInheritInitialProgram : BOOLEAN

    /**
     * Specifies whether to inherit the monitor color depth. This value overwrites the  <b>fInheritColorDepth</b> listener registry value.
     */
    fInheritColorDepth : BOOLEAN

    /**
     * Specifies whether the title bar is hidden.
     */
    fHideTitleBar : BOOLEAN

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     */
    fInheritAutoLogon : BOOLEAN

    /**
     * Specifies whether the initial program is displayed maximized. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    fMaximizeShell : BOOLEAN

    /**
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisablePNP : BOOLEAN

    /**
     * Specifies that a smart card was used during the logon process. The smart card PIN is the password.  This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    fPasswordIsScPin : BOOLEAN

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     */
    fPromptForPassword : BOOLEAN

    /**
     * Specifies whether printer mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisableCpm : BOOLEAN

    /**
     * Specifies whether drive mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisableCdm : BOOLEAN

    /**
     * Specifies whether COM port  mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisableCcm : BOOLEAN

    /**
     * Specifies whether LPT printer redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisableLPT : BOOLEAN

    /**
     * Specifies whether clipboard redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisableClip : BOOLEAN

    /**
     * Specifies the action the server takes when the connection or idle timers expire, or when a connection is lost due to a connection error.
     */
    fResetBroken : BOOLEAN

    /**
     * Specifies whether to disable encryption for communication between the client and server.
     */
    fDisableEncryption : BOOLEAN

    /**
     * Specifies whether to disable automatic reconnect of the client.
     */
    fDisableAutoReconnect : BOOLEAN

    /**
     * Specifies whether the Ctrl+Alt+Delete keyboard shortcut is disabled.
     */
    fDisableCtrlAltDel : BOOLEAN

    /**
     * Specifies whether the client can double-click.
     */
    fDoubleClickDetect : BOOLEAN

    /**
     * Specifies whether the Windows key is enabled.
     */
    fEnableWindowsKey : BOOLEAN

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     */
    fUsingSavedCreds : BOOLEAN

    /**
     * Specifies whether mouse input is enabled.
     */
    fMouse : BOOLEAN

    /**
     * Specifies whether to turn on audio playback. A value of <b>TRUE</b> specifies no audio.
     */
    fNoAudioPlayback : BOOLEAN

    /**
     * Specifies whether to leave audio playback on the remote computer.
     */
    fRemoteConsoleAudio : BOOLEAN

    /**
     * Specifies the encryption level.
     */
    EncryptionLevel : Int8

    /**
     * Specifies the client monitor color depth. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure.
     */
    ColorDepth : UInt16

    /**
     * Specifies the protocol type.
     */
    ProtocolType : UInt16

    /**
     * Specifies the client monitor horizontal resolution.
     */
    HRes : UInt16

    /**
     * Specifies the client monitor vertical resolution.
     */
    VRes : UInt16

    /**
     * The client software product id.
     */
    ClientProductId : UInt16

    /**
     * The number of output buffers on the host.
     */
    OutBufCountHost : UInt16

    /**
     * The number of output buffers on the client.
     */
    OutBufCountClient : UInt16

    /**
     * The length of output buffers, in bytes.
     */
    OutBufLength : UInt16

    /**
     * Specifies the keyboard layout.
     */
    KeyboardLayout : UInt32

    /**
     * The maximum duration of the Remote Desktop Services session, in minutes.
     */
    MaxConnectionTime : UInt32

    /**
     * The maximum amount of time, in minutes, that a disconnected Remote Desktop Services session remains active on the RD Session Host server.
     */
    MaxDisconnectionTime : UInt32

    /**
     * The maximum amount of time, in minutes, that the Remote Desktop Services session can remain idle.
     */
    MaxIdleTime : UInt32

    PerformanceFlags : UInt32

    /**
     * Specifies the keyboard type.
     */
    KeyboardType : UInt32

    /**
     * Specifies the keyboard subtype.
     */
    KeyboardSubType : UInt32

    /**
     * Specifies the function key.
     */
    KeyboardFunctionKey : UInt32

    /**
     * Specifies the input locale identifier. The low word contains a language identifier and the high word contains a device handle to the physical layout of the keyboard.
     */
    ActiveInputLocale : UInt32

    /**
     * The client computer's unique serial number.
     */
    SerialNumber : UInt32

    /**
     * The client IP address  family.
     */
    ClientAddressFamily : UInt32

    /**
     * The client build number.
     */
    ClientBuildNumber : UInt32

    /**
     * The client session Id.
     */
    ClientSessionId : UInt32

    /**
     * A string that contains the directory where the initial program resides. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    WorkDirectory : WCHAR[257]

    /**
     * A string value that specifies the name of  the initial program. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    InitialProgram : WCHAR[257]

    /**
     * A string that specifies the user name. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    UserName : WCHAR[256]

    /**
     * A string that specifies the domain of the user. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    Domain : WCHAR[256]

    /**
     * A string that specifies the user password. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    Password : WCHAR[256]

    /**
     * A string that contains the protocol name.
     */
    ProtocolName : WCHAR[9]

    /**
     * A string that specifies the name of the display driver to load.
     */
    DisplayDriverName : WCHAR[9]

    /**
     * A string that specifies the name of the display device.
     */
    DisplayDeviceName : WCHAR[20]

    /**
     * Specifies the input method editor name.
     */
    imeFileName : WCHAR[33]

    /**
     * A string that contains the name of the audio driver to load.
     */
    AudioDriverName : WCHAR[9]

    /**
     * A string that contains the fully qualified name of the client computer.
     */
    ClientName : WCHAR[21]

    /**
     * A string that contains the client IP address in dotted decimal format.
     */
    ClientAddress : WCHAR[31]

    /**
     * The client directory.
     * 
     * A string that contains the client directory.
     */
    ClientDirectory : WCHAR[257]

    /**
     * A string that contains a client product identifier.
     */
    ClientDigProductId : WCHAR[33]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_sockaddr">WRDS_SOCKADDR</a> structure that contains socket address information.
     */
    ClientSockAddress : WTS_SOCKADDR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WRDS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information.
     */
    ClientTimeZone : WTS_TIME_ZONE_INFORMATION

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings">WRDS_LISTENER_SETTINGS</a> structure that contains listener settings.
     */
    WRdsListenerSettings : WRDS_LISTENER_SETTINGS

    EventLogActivityId : Guid

    ContextSize : UInt32

    /**
     * An array of bytes that contains contextual data for the connection. The size of this array is specified in the <b>ContextSize</b> member.
     */
    ContextData : IntPtr

}
