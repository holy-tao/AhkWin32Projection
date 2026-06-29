#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import ".\WTS_SOCKADDR.ahk" { WTS_SOCKADDR }
#Import ".\WTS_TIME_ZONE_INFORMATION.ahk" { WTS_TIME_ZONE_INFORMATION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about the client connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_client_data
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CLIENT_DATA {
    #StructPack 4

    /**
     * Specifies whether the logon (CTRL+ALT+DELETE) key sequence is disabled.
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
     * Specifies whether the title bar is hidden.
     */
    fHideTitleBar : BOOLEAN

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     */
    fInheritAutoLogon : BOOL

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     */
    fPromptForPassword : BOOLEAN

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     */
    fUsingSavedCreds : BOOLEAN

    /**
     * A string value that specifies the domain of the user. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    Domain : WCHAR[256]

    /**
     * A string value that specifies the user name. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    UserName : WCHAR[256]

    /**
     * A string value that specifies the user password. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    Password : WCHAR[256]

    /**
     * Specifies that a smart card was used during the logon process. The smart card PIN is the password.  This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     */
    fPasswordIsScPin : BOOLEAN

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     */
    fInheritInitialProgram : BOOL

    /**
     * A string value that specifies the directory where the initial program resides. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    WorkDirectory : WCHAR[257]

    /**
     * A string value that specifies the name of  the initial program. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    InitialProgram : WCHAR[257]

    /**
     * Specifies whether the initial program is displayed maximized. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     */
    fMaximizeShell : BOOLEAN

    /**
     * Specifies the encryption level.
     */
    EncryptionLevel : Int8

    /**
     * Specifies a list of features that can be disabled to increase performance.
     */
    PerformanceFlags : UInt32

    /**
     * A string value that contains the protocol name.
     */
    ProtocolName : WCHAR[9]

    /**
     * Specifies the protocol type.
     */
    ProtocolType : UInt16

    /**
     * Specifies whether to inherit the monitor color depth. This value overwrites the  <b>fInheritColorDepth</b> listener registry value.
     */
    fInheritColorDepth : BOOL

    /**
     * Specifies the client monitor horizontal resolution.
     */
    HRes : UInt16

    /**
     * Specifies the client monitor vertical resolution.
     */
    VRes : UInt16

    /**
     * Specifies the client monitor color depth. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure.
     */
    ColorDepth : UInt16

    /**
     * A string value that specifies the name of the display driver to load.
     */
    DisplayDriverName : WCHAR[9]

    /**
     * A string value that specifies the name of the display device. For example, if a protocol creates a display device with the name "\\Device\VideoDev0", this field must contain the string "VideoDev".
     */
    DisplayDeviceName : WCHAR[20]

    /**
     * Specifies whether mouse input is enabled.
     */
    fMouse : BOOLEAN

    /**
     * Specifies the keyboard layout.
     */
    KeyboardLayout : UInt32

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
     * Specifies the input method editor name.
     */
    imeFileName : WCHAR[33]

    /**
     * Specifies the input locale identifier. The low word contains a language identifier and the high word contains a device handle to the physical layout of the keyboard.
     */
    ActiveInputLocale : UInt32

    /**
     * Specifies whether to turn on audio. A value of <b>TRUE</b> specifies no audio.
     */
    fNoAudioPlayback : BOOLEAN

    /**
     * Specifies whether to leave audio playback on the remote computer.
     */
    fRemoteConsoleAudio : BOOLEAN

    /**
     * A string value that contains the name of the audio driver to load.
     */
    AudioDriverName : WCHAR[9]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WTS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information.
     */
    ClientTimeZone : WTS_TIME_ZONE_INFORMATION

    /**
     * A string value that contains the fully qualified name of the client computer.
     */
    ClientName : WCHAR[21]

    /**
     * Client computer serial number.
     */
    SerialNumber : UInt32

    /**
     * The client IP address  family.
     */
    ClientAddressFamily : UInt32

    /**
     * A string value that contains the client IP address in dotted decimal format.
     */
    ClientAddress : WCHAR[31]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_sockaddr">WTS_SOCKADDR</a> structure that contains information about the client socket.
     */
    ClientSockAddress : WTS_SOCKADDR

    /**
     * A string value that contains the client directory.
     */
    ClientDirectory : WCHAR[257]

    /**
     * Client build number.
     */
    ClientBuildNumber : UInt32

    /**
     * Client product ID.
     */
    ClientProductId : UInt16

    /**
     * Number of output buffers on the host computer.
     */
    OutBufCountHost : UInt16

    /**
     * Number of output buffers on the client computer.
     */
    OutBufCountClient : UInt16

    /**
     * Output buffer length.
     */
    OutBufLength : UInt16

    /**
     * Client session ID.
     */
    ClientSessionId : UInt32

    /**
     * A string value that contains a client product identifier.
     */
    ClientDigProductId : WCHAR[33]

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
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     */
    fDisablePNP : BOOLEAN

}
