#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\WTS_SOCKADDR.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk
#Include .\WRDS_LISTENER_SETTINGS_1.ahk
#Include .\WRDS_LISTENER_SETTING.ahk
#Include .\WRDS_LISTENER_SETTINGS.ahk

/**
 * Contains connection setting information for a remote session.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wrds_connection_settings_1
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_CONNECTION_SETTINGS_1 extends Win32Struct
{
    static sizeof => 3776

    static packingSize => 8

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     * @type {BOOLEAN}
     */
    fInheritInitialProgram{
        get {
            if(!this.HasProp("__fInheritInitialProgram"))
                this.__fInheritInitialProgram := BOOLEAN(this.ptr + 0)
            return this.__fInheritInitialProgram
        }
    }

    /**
     * Specifies whether to inherit the monitor color depth. This value overwrites the  <b>fInheritColorDepth</b> listener registry value.
     * @type {BOOLEAN}
     */
    fInheritColorDepth{
        get {
            if(!this.HasProp("__fInheritColorDepth"))
                this.__fInheritColorDepth := BOOLEAN(this.ptr + 1)
            return this.__fInheritColorDepth
        }
    }

    /**
     * Specifies whether the title bar is hidden.
     * @type {BOOLEAN}
     */
    fHideTitleBar{
        get {
            if(!this.HasProp("__fHideTitleBar"))
                this.__fHideTitleBar := BOOLEAN(this.ptr + 2)
            return this.__fHideTitleBar
        }
    }

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     * @type {BOOLEAN}
     */
    fInheritAutoLogon{
        get {
            if(!this.HasProp("__fInheritAutoLogon"))
                this.__fInheritAutoLogon := BOOLEAN(this.ptr + 3)
            return this.__fInheritAutoLogon
        }
    }

    /**
     * Specifies whether the initial program is displayed maximized. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {BOOLEAN}
     */
    fMaximizeShell{
        get {
            if(!this.HasProp("__fMaximizeShell"))
                this.__fMaximizeShell := BOOLEAN(this.ptr + 4)
            return this.__fMaximizeShell
        }
    }

    /**
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisablePNP{
        get {
            if(!this.HasProp("__fDisablePNP"))
                this.__fDisablePNP := BOOLEAN(this.ptr + 5)
            return this.__fDisablePNP
        }
    }

    /**
     * Specifies that a smart card was used during the logon process. The smart card PIN is the password.  This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {BOOLEAN}
     */
    fPasswordIsScPin{
        get {
            if(!this.HasProp("__fPasswordIsScPin"))
                this.__fPasswordIsScPin := BOOLEAN(this.ptr + 6)
            return this.__fPasswordIsScPin
        }
    }

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     * @type {BOOLEAN}
     */
    fPromptForPassword{
        get {
            if(!this.HasProp("__fPromptForPassword"))
                this.__fPromptForPassword := BOOLEAN(this.ptr + 7)
            return this.__fPromptForPassword
        }
    }

    /**
     * Specifies whether printer mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCpm{
        get {
            if(!this.HasProp("__fDisableCpm"))
                this.__fDisableCpm := BOOLEAN(this.ptr + 8)
            return this.__fDisableCpm
        }
    }

    /**
     * Specifies whether drive mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCdm{
        get {
            if(!this.HasProp("__fDisableCdm"))
                this.__fDisableCdm := BOOLEAN(this.ptr + 9)
            return this.__fDisableCdm
        }
    }

    /**
     * Specifies whether COM port  mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCcm{
        get {
            if(!this.HasProp("__fDisableCcm"))
                this.__fDisableCcm := BOOLEAN(this.ptr + 10)
            return this.__fDisableCcm
        }
    }

    /**
     * Specifies whether LPT printer redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableLPT{
        get {
            if(!this.HasProp("__fDisableLPT"))
                this.__fDisableLPT := BOOLEAN(this.ptr + 11)
            return this.__fDisableLPT
        }
    }

    /**
     * Specifies whether clipboard redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableClip{
        get {
            if(!this.HasProp("__fDisableClip"))
                this.__fDisableClip := BOOLEAN(this.ptr + 12)
            return this.__fDisableClip
        }
    }

    /**
     * Specifies the action the server takes when the connection or idle timers expire, or when a connection is lost due to a connection error.
     * @type {BOOLEAN}
     */
    fResetBroken{
        get {
            if(!this.HasProp("__fResetBroken"))
                this.__fResetBroken := BOOLEAN(this.ptr + 13)
            return this.__fResetBroken
        }
    }

    /**
     * Specifies whether to disable encryption for communication between the client and server.
     * @type {BOOLEAN}
     */
    fDisableEncryption{
        get {
            if(!this.HasProp("__fDisableEncryption"))
                this.__fDisableEncryption := BOOLEAN(this.ptr + 14)
            return this.__fDisableEncryption
        }
    }

    /**
     * Specifies whether to disable automatic reconnect of the client.
     * @type {BOOLEAN}
     */
    fDisableAutoReconnect{
        get {
            if(!this.HasProp("__fDisableAutoReconnect"))
                this.__fDisableAutoReconnect := BOOLEAN(this.ptr + 15)
            return this.__fDisableAutoReconnect
        }
    }

    /**
     * Specifies whether the Ctrl+Alt+Delete keyboard shortcut is disabled.
     * @type {BOOLEAN}
     */
    fDisableCtrlAltDel{
        get {
            if(!this.HasProp("__fDisableCtrlAltDel"))
                this.__fDisableCtrlAltDel := BOOLEAN(this.ptr + 16)
            return this.__fDisableCtrlAltDel
        }
    }

    /**
     * Specifies whether the client can double-click.
     * @type {BOOLEAN}
     */
    fDoubleClickDetect{
        get {
            if(!this.HasProp("__fDoubleClickDetect"))
                this.__fDoubleClickDetect := BOOLEAN(this.ptr + 17)
            return this.__fDoubleClickDetect
        }
    }

    /**
     * Specifies whether the Windows key is enabled.
     * @type {BOOLEAN}
     */
    fEnableWindowsKey{
        get {
            if(!this.HasProp("__fEnableWindowsKey"))
                this.__fEnableWindowsKey := BOOLEAN(this.ptr + 18)
            return this.__fEnableWindowsKey
        }
    }

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     * @type {BOOLEAN}
     */
    fUsingSavedCreds{
        get {
            if(!this.HasProp("__fUsingSavedCreds"))
                this.__fUsingSavedCreds := BOOLEAN(this.ptr + 19)
            return this.__fUsingSavedCreds
        }
    }

    /**
     * Specifies whether mouse input is enabled.
     * @type {BOOLEAN}
     */
    fMouse{
        get {
            if(!this.HasProp("__fMouse"))
                this.__fMouse := BOOLEAN(this.ptr + 20)
            return this.__fMouse
        }
    }

    /**
     * Specifies whether to turn on audio playback. A value of <b>TRUE</b> specifies no audio.
     * @type {BOOLEAN}
     */
    fNoAudioPlayback{
        get {
            if(!this.HasProp("__fNoAudioPlayback"))
                this.__fNoAudioPlayback := BOOLEAN(this.ptr + 21)
            return this.__fNoAudioPlayback
        }
    }

    /**
     * Specifies whether to leave audio playback on the remote computer.
     * @type {BOOLEAN}
     */
    fRemoteConsoleAudio{
        get {
            if(!this.HasProp("__fRemoteConsoleAudio"))
                this.__fRemoteConsoleAudio := BOOLEAN(this.ptr + 22)
            return this.__fRemoteConsoleAudio
        }
    }

    /**
     * Specifies the encryption level.
     * @type {Integer}
     */
    EncryptionLevel {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * Specifies the client monitor color depth. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure.
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Specifies the protocol type.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Specifies the client monitor horizontal resolution.
     * @type {Integer}
     */
    HRes {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Specifies the client monitor vertical resolution.
     * @type {Integer}
     */
    VRes {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * The client software product id.
     * @type {Integer}
     */
    ClientProductId {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The number of output buffers on the host.
     * @type {Integer}
     */
    OutBufCountHost {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * The number of output buffers on the client.
     * @type {Integer}
     */
    OutBufCountClient {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * The length of output buffers, in bytes.
     * @type {Integer}
     */
    OutBufLength {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * Specifies the keyboard layout.
     * @type {Integer}
     */
    KeyboardLayout {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The maximum duration of the Remote Desktop Services session, in minutes.
     * @type {Integer}
     */
    MaxConnectionTime {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The maximum amount of time, in minutes, that a disconnected Remote Desktop Services session remains active on the RD Session Host server.
     * @type {Integer}
     */
    MaxDisconnectionTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum amount of time, in minutes, that the Remote Desktop Services session can remain idle.
     * @type {Integer}
     */
    MaxIdleTime {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    PerformanceFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the keyboard type.
     * @type {Integer}
     */
    KeyboardType {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the keyboard subtype.
     * @type {Integer}
     */
    KeyboardSubType {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the function key.
     * @type {Integer}
     */
    KeyboardFunctionKey {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the input locale identifier. The low word contains a language identifier and the high word contains a device handle to the physical layout of the keyboard.
     * @type {Integer}
     */
    ActiveInputLocale {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The client computer's unique serial number.
     * @type {Integer}
     */
    SerialNumber {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The client IP address  family.
     * @type {Integer}
     */
    ClientAddressFamily {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The client build number.
     * @type {Integer}
     */
    ClientBuildNumber {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The client session Id.
     * @type {Integer}
     */
    ClientSessionId {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * A string that contains the directory where the initial program resides. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 92, 256, "UTF-16")
        set => StrPut(value, this.ptr + 92, 256, "UTF-16")
    }

    /**
     * A string value that specifies the name of  the initial program. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 606, 256, "UTF-16")
        set => StrPut(value, this.ptr + 606, 256, "UTF-16")
    }

    /**
     * A string that specifies the user name. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 1120, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1120, 255, "UTF-16")
    }

    /**
     * A string that specifies the domain of the user. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 1632, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1632, 255, "UTF-16")
    }

    /**
     * A string that specifies the user password. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    Password {
        get => StrGet(this.ptr + 2144, 255, "UTF-16")
        set => StrPut(value, this.ptr + 2144, 255, "UTF-16")
    }

    /**
     * A string that contains the protocol name.
     * @type {String}
     */
    ProtocolName {
        get => StrGet(this.ptr + 2656, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2656, 8, "UTF-16")
    }

    /**
     * A string that specifies the name of the display driver to load.
     * @type {String}
     */
    DisplayDriverName {
        get => StrGet(this.ptr + 2674, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2674, 8, "UTF-16")
    }

    /**
     * A string that specifies the name of the display device.
     * @type {String}
     */
    DisplayDeviceName {
        get => StrGet(this.ptr + 2692, 19, "UTF-16")
        set => StrPut(value, this.ptr + 2692, 19, "UTF-16")
    }

    /**
     * Specifies the input method editor name.
     * @type {String}
     */
    imeFileName {
        get => StrGet(this.ptr + 2732, 32, "UTF-16")
        set => StrPut(value, this.ptr + 2732, 32, "UTF-16")
    }

    /**
     * A string that contains the name of the audio driver to load.
     * @type {String}
     */
    AudioDriverName {
        get => StrGet(this.ptr + 2798, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2798, 8, "UTF-16")
    }

    /**
     * A string that contains the fully qualified name of the client computer.
     * @type {String}
     */
    ClientName {
        get => StrGet(this.ptr + 2816, 20, "UTF-16")
        set => StrPut(value, this.ptr + 2816, 20, "UTF-16")
    }

    /**
     * A string that contains the client IP address in dotted decimal format.
     * @type {String}
     */
    ClientAddress {
        get => StrGet(this.ptr + 2858, 30, "UTF-16")
        set => StrPut(value, this.ptr + 2858, 30, "UTF-16")
    }

    /**
     * The client directory.
     * 
     * A string that contains the client directory.
     * @type {String}
     */
    ClientDirectory {
        get => StrGet(this.ptr + 2920, 256, "UTF-16")
        set => StrPut(value, this.ptr + 2920, 256, "UTF-16")
    }

    /**
     * A string that contains a client product identifier.
     * @type {String}
     */
    ClientDigProductId {
        get => StrGet(this.ptr + 3434, 32, "UTF-16")
        set => StrPut(value, this.ptr + 3434, 32, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_sockaddr">WRDS_SOCKADDR</a> structure that contains socket address information.
     * @type {WTS_SOCKADDR}
     */
    ClientSockAddress{
        get {
            if(!this.HasProp("__ClientSockAddress"))
                this.__ClientSockAddress := WTS_SOCKADDR(this.ptr + 3504)
            return this.__ClientSockAddress
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WRDS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information.
     * @type {WTS_TIME_ZONE_INFORMATION}
     */
    ClientTimeZone{
        get {
            if(!this.HasProp("__ClientTimeZone"))
                this.__ClientTimeZone := WTS_TIME_ZONE_INFORMATION(this.ptr + 3544)
            return this.__ClientTimeZone
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings">WRDS_LISTENER_SETTINGS</a> structure that contains listener settings.
     * @type {WRDS_LISTENER_SETTINGS}
     */
    WRdsListenerSettings{
        get {
            if(!this.HasProp("__WRdsListenerSettings"))
                this.__WRdsListenerSettings := WRDS_LISTENER_SETTINGS(this.ptr + 3728)
            return this.__WRdsListenerSettings
        }
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    EventLogActivityId {
        get => NumGet(this, 3752, "ptr")
        set => NumPut("ptr", value, this, 3752)
    }

    /**
     * 
     * @type {Integer}
     */
    ContextSize {
        get => NumGet(this, 3760, "uint")
        set => NumPut("uint", value, this, 3760)
    }

    /**
     * An array of bytes that contains contextual data for the connection. The size of this array is specified in the <b>ContextSize</b> member.
     * @type {Pointer<Byte>}
     */
    ContextData {
        get => NumGet(this, 3768, "ptr")
        set => NumPut("ptr", value, this, 3768)
    }
}
