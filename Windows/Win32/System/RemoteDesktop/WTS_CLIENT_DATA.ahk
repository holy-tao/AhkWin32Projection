#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk
#Include .\WTS_SOCKADDR.ahk

/**
 * Contains information about the client connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_client_data
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CLIENT_DATA extends Win32Struct
{
    static sizeof => 3712

    static packingSize => 4

    /**
     * Specifies whether the logon (CTRL+ALT+DELETE) key sequence is disabled.
     * @type {BOOLEAN}
     */
    fDisableCtrlAltDel {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies whether the client can double-click.
     * @type {BOOLEAN}
     */
    fDoubleClickDetect {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies whether the Windows key is enabled.
     * @type {BOOLEAN}
     */
    fEnableWindowsKey {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies whether the title bar is hidden.
     * @type {BOOLEAN}
     */
    fHideTitleBar {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     * @type {BOOL}
     */
    fInheritAutoLogon {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     * @type {BOOLEAN}
     */
    fPromptForPassword {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     * @type {BOOLEAN}
     */
    fUsingSavedCreds {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * A string value that specifies the domain of the user. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    Domain {
        get => StrGet(this.ptr + 10, 255, "UTF-16")
        set => StrPut(value, this.ptr + 10, 255, "UTF-16")
    }

    /**
     * A string value that specifies the user name. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    UserName {
        get => StrGet(this.ptr + 522, 255, "UTF-16")
        set => StrPut(value, this.ptr + 522, 255, "UTF-16")
    }

    /**
     * A string value that specifies the user password. This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    Password {
        get => StrGet(this.ptr + 1034, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1034, 255, "UTF-16")
    }

    /**
     * Specifies that a smart card was used during the logon process. The smart card PIN is the password.  This value is used if <b>fInheritAutoLogon</b> is set to <b>TRUE</b>.
     * @type {BOOLEAN}
     */
    fPasswordIsScPin {
        get => NumGet(this, 1546, "char")
        set => NumPut("char", value, this, 1546)
    }

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     * @type {BOOL}
     */
    fInheritInitialProgram {
        get => NumGet(this, 1548, "int")
        set => NumPut("int", value, this, 1548)
    }

    /**
     * A string value that specifies the directory where the initial program resides. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 1552, 256, "UTF-16")
        set => StrPut(value, this.ptr + 1552, 256, "UTF-16")
    }

    /**
     * A string value that specifies the name of  the initial program. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 2066, 256, "UTF-16")
        set => StrPut(value, this.ptr + 2066, 256, "UTF-16")
    }

    /**
     * Specifies whether the initial program is displayed maximized. This value is used if <b>fInheritInitialProgram</b> is set to <b>TRUE</b>.
     * @type {BOOLEAN}
     */
    fMaximizeShell {
        get => NumGet(this, 2580, "char")
        set => NumPut("char", value, this, 2580)
    }

    /**
     * Specifies the encryption level.
     * @type {Integer}
     */
    EncryptionLevel {
        get => NumGet(this, 2581, "char")
        set => NumPut("char", value, this, 2581)
    }

    /**
     * Specifies a list of features that can be disabled to increase performance.
     * @type {Integer}
     */
    PerformanceFlags {
        get => NumGet(this, 2584, "uint")
        set => NumPut("uint", value, this, 2584)
    }

    /**
     * A string value that contains the protocol name.
     * @type {String}
     */
    ProtocolName {
        get => StrGet(this.ptr + 2588, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2588, 8, "UTF-16")
    }

    /**
     * Specifies the protocol type.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 2606, "ushort")
        set => NumPut("ushort", value, this, 2606)
    }

    /**
     * Specifies whether to inherit the monitor color depth. This value overwrites the  <b>fInheritColorDepth</b> listener registry value.
     * @type {BOOL}
     */
    fInheritColorDepth {
        get => NumGet(this, 2608, "int")
        set => NumPut("int", value, this, 2608)
    }

    /**
     * Specifies the client monitor horizontal resolution.
     * @type {Integer}
     */
    HRes {
        get => NumGet(this, 2612, "ushort")
        set => NumPut("ushort", value, this, 2612)
    }

    /**
     * Specifies the client monitor vertical resolution.
     * @type {Integer}
     */
    VRes {
        get => NumGet(this, 2614, "ushort")
        set => NumPut("ushort", value, this, 2614)
    }

    /**
     * Specifies the client monitor color depth. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure.
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 2616, "ushort")
        set => NumPut("ushort", value, this, 2616)
    }

    /**
     * A string value that specifies the name of the display driver to load.
     * @type {String}
     */
    DisplayDriverName {
        get => StrGet(this.ptr + 2618, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2618, 8, "UTF-16")
    }

    /**
     * A string value that specifies the name of the display device. For example, if a protocol creates a display device with the name "\\Device\VideoDev0", this field must contain the string "VideoDev".
     * @type {String}
     */
    DisplayDeviceName {
        get => StrGet(this.ptr + 2636, 19, "UTF-16")
        set => StrPut(value, this.ptr + 2636, 19, "UTF-16")
    }

    /**
     * Specifies whether mouse input is enabled.
     * @type {BOOLEAN}
     */
    fMouse {
        get => NumGet(this, 2676, "char")
        set => NumPut("char", value, this, 2676)
    }

    /**
     * Specifies the keyboard layout.
     * @type {Integer}
     */
    KeyboardLayout {
        get => NumGet(this, 2680, "uint")
        set => NumPut("uint", value, this, 2680)
    }

    /**
     * Specifies the keyboard type.
     * @type {Integer}
     */
    KeyboardType {
        get => NumGet(this, 2684, "uint")
        set => NumPut("uint", value, this, 2684)
    }

    /**
     * Specifies the keyboard subtype.
     * @type {Integer}
     */
    KeyboardSubType {
        get => NumGet(this, 2688, "uint")
        set => NumPut("uint", value, this, 2688)
    }

    /**
     * Specifies the function key.
     * @type {Integer}
     */
    KeyboardFunctionKey {
        get => NumGet(this, 2692, "uint")
        set => NumPut("uint", value, this, 2692)
    }

    /**
     * Specifies the input method editor name.
     * @type {String}
     */
    imeFileName {
        get => StrGet(this.ptr + 2696, 32, "UTF-16")
        set => StrPut(value, this.ptr + 2696, 32, "UTF-16")
    }

    /**
     * Specifies the input locale identifier. The low word contains a language identifier and the high word contains a device handle to the physical layout of the keyboard.
     * @type {Integer}
     */
    ActiveInputLocale {
        get => NumGet(this, 2764, "uint")
        set => NumPut("uint", value, this, 2764)
    }

    /**
     * Specifies whether to turn on audio. A value of <b>TRUE</b> specifies no audio.
     * @type {BOOLEAN}
     */
    fNoAudioPlayback {
        get => NumGet(this, 2768, "char")
        set => NumPut("char", value, this, 2768)
    }

    /**
     * Specifies whether to leave audio playback on the remote computer.
     * @type {BOOLEAN}
     */
    fRemoteConsoleAudio {
        get => NumGet(this, 2769, "char")
        set => NumPut("char", value, this, 2769)
    }

    /**
     * A string value that contains the name of the audio driver to load.
     * @type {String}
     */
    AudioDriverName {
        get => StrGet(this.ptr + 2770, 8, "UTF-16")
        set => StrPut(value, this.ptr + 2770, 8, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WTS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information.
     * @type {WTS_TIME_ZONE_INFORMATION}
     */
    ClientTimeZone{
        get {
            if(!this.HasProp("__ClientTimeZone"))
                this.__ClientTimeZone := WTS_TIME_ZONE_INFORMATION(2788, this)
            return this.__ClientTimeZone
        }
    }

    /**
     * A string value that contains the fully qualified name of the client computer.
     * @type {String}
     */
    ClientName {
        get => StrGet(this.ptr + 2960, 20, "UTF-16")
        set => StrPut(value, this.ptr + 2960, 20, "UTF-16")
    }

    /**
     * Client computer serial number.
     * @type {Integer}
     */
    SerialNumber {
        get => NumGet(this, 3004, "uint")
        set => NumPut("uint", value, this, 3004)
    }

    /**
     * The client IP address  family.
     * @type {Integer}
     */
    ClientAddressFamily {
        get => NumGet(this, 3008, "uint")
        set => NumPut("uint", value, this, 3008)
    }

    /**
     * A string value that contains the client IP address in dotted decimal format.
     * @type {String}
     */
    ClientAddress {
        get => StrGet(this.ptr + 3012, 30, "UTF-16")
        set => StrPut(value, this.ptr + 3012, 30, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_sockaddr">WTS_SOCKADDR</a> structure that contains information about the client socket.
     * @type {WTS_SOCKADDR}
     */
    ClientSockAddress{
        get {
            if(!this.HasProp("__ClientSockAddress"))
                this.__ClientSockAddress := WTS_SOCKADDR(3076, this)
            return this.__ClientSockAddress
        }
    }

    /**
     * A string value that contains the client directory.
     * @type {String}
     */
    ClientDirectory {
        get => StrGet(this.ptr + 3108, 256, "UTF-16")
        set => StrPut(value, this.ptr + 3108, 256, "UTF-16")
    }

    /**
     * Client build number.
     * @type {Integer}
     */
    ClientBuildNumber {
        get => NumGet(this, 3624, "uint")
        set => NumPut("uint", value, this, 3624)
    }

    /**
     * Client product ID.
     * @type {Integer}
     */
    ClientProductId {
        get => NumGet(this, 3628, "ushort")
        set => NumPut("ushort", value, this, 3628)
    }

    /**
     * Number of output buffers on the host computer.
     * @type {Integer}
     */
    OutBufCountHost {
        get => NumGet(this, 3630, "ushort")
        set => NumPut("ushort", value, this, 3630)
    }

    /**
     * Number of output buffers on the client computer.
     * @type {Integer}
     */
    OutBufCountClient {
        get => NumGet(this, 3632, "ushort")
        set => NumPut("ushort", value, this, 3632)
    }

    /**
     * Output buffer length.
     * @type {Integer}
     */
    OutBufLength {
        get => NumGet(this, 3634, "ushort")
        set => NumPut("ushort", value, this, 3634)
    }

    /**
     * Client session ID.
     * @type {Integer}
     */
    ClientSessionId {
        get => NumGet(this, 3636, "uint")
        set => NumPut("uint", value, this, 3636)
    }

    /**
     * A string value that contains a client product identifier.
     * @type {String}
     */
    ClientDigProductId {
        get => StrGet(this.ptr + 3640, 32, "UTF-16")
        set => StrPut(value, this.ptr + 3640, 32, "UTF-16")
    }

    /**
     * Specifies whether printer mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCpm {
        get => NumGet(this, 3706, "char")
        set => NumPut("char", value, this, 3706)
    }

    /**
     * Specifies whether drive mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCdm {
        get => NumGet(this, 3707, "char")
        set => NumPut("char", value, this, 3707)
    }

    /**
     * Specifies whether COM port  mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableCcm {
        get => NumGet(this, 3708, "char")
        set => NumPut("char", value, this, 3708)
    }

    /**
     * Specifies whether LPT printer redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableLPT {
        get => NumGet(this, 3709, "char")
        set => NumPut("char", value, this, 3709)
    }

    /**
     * Specifies whether clipboard redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisableClip {
        get => NumGet(this, 3710, "char")
        set => NumPut("char", value, this, 3710)
    }

    /**
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisablePNP {
        get => NumGet(this, 3711, "char")
        set => NumPut("char", value, this, 3711)
    }
}
