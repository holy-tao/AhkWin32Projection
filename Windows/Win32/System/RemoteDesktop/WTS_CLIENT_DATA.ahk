#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk
#Include .\WTS_SOCKADDR.ahk

/**
 * Contains information about the client connection.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wts_client_data
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CLIENT_DATA extends Win32Struct
{
    static sizeof => 3744

    static packingSize => 8

    /**
     * Specifies whether the logon (CTRL+ALT+DELETE) key sequence is disabled.
     * @type {Integer}
     */
    fDisableCtrlAltDel {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies whether the client can double-click.
     * @type {Integer}
     */
    fDoubleClickDetect {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies whether the Windows key is enabled.
     * @type {Integer}
     */
    fEnableWindowsKey {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies whether the title bar is hidden.
     * @type {Integer}
     */
    fHideTitleBar {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     * @type {Integer}
     */
    fInheritAutoLogon {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     * @type {Integer}
     */
    fPromptForPassword {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     * @type {Integer}
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
     * @type {Integer}
     */
    fPasswordIsScPin {
        get => NumGet(this, 1546, "char")
        set => NumPut("char", value, this, 1546)
    }

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     * @type {Integer}
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
     * @type {Integer}
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
     * @type {Integer}
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
     * @type {Integer}
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
     * @type {Integer}
     */
    fNoAudioPlayback {
        get => NumGet(this, 2768, "char")
        set => NumPut("char", value, this, 2768)
    }

    /**
     * Specifies whether to leave audio playback on the remote computer.
     * @type {Integer}
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
                this.__ClientTimeZone := WTS_TIME_ZONE_INFORMATION(this.ptr + 2792)
            return this.__ClientTimeZone
        }
    }

    /**
     * A string value that contains the fully qualified name of the client computer.
     * @type {String}
     */
    ClientName {
        get => StrGet(this.ptr + 2976, 20, "UTF-16")
        set => StrPut(value, this.ptr + 2976, 20, "UTF-16")
    }

    /**
     * Client computer serial number.
     * @type {Integer}
     */
    SerialNumber {
        get => NumGet(this, 3020, "uint")
        set => NumPut("uint", value, this, 3020)
    }

    /**
     * The client IP address  family.
     * @type {Integer}
     */
    ClientAddressFamily {
        get => NumGet(this, 3024, "uint")
        set => NumPut("uint", value, this, 3024)
    }

    /**
     * A string value that contains the client IP address in dotted decimal format.
     * @type {String}
     */
    ClientAddress {
        get => StrGet(this.ptr + 3028, 30, "UTF-16")
        set => StrPut(value, this.ptr + 3028, 30, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_sockaddr">WTS_SOCKADDR</a> structure that contains information about the client socket.
     * @type {WTS_SOCKADDR}
     */
    ClientSockAddress{
        get {
            if(!this.HasProp("__ClientSockAddress"))
                this.__ClientSockAddress := WTS_SOCKADDR(this.ptr + 3096)
            return this.__ClientSockAddress
        }
    }

    /**
     * A string value that contains the client directory.
     * @type {String}
     */
    ClientDirectory {
        get => StrGet(this.ptr + 3136, 256, "UTF-16")
        set => StrPut(value, this.ptr + 3136, 256, "UTF-16")
    }

    /**
     * Client build number.
     * @type {Integer}
     */
    ClientBuildNumber {
        get => NumGet(this, 3652, "uint")
        set => NumPut("uint", value, this, 3652)
    }

    /**
     * Client product ID.
     * @type {Integer}
     */
    ClientProductId {
        get => NumGet(this, 3656, "ushort")
        set => NumPut("ushort", value, this, 3656)
    }

    /**
     * Number of output buffers on the host computer.
     * @type {Integer}
     */
    OutBufCountHost {
        get => NumGet(this, 3658, "ushort")
        set => NumPut("ushort", value, this, 3658)
    }

    /**
     * Number of output buffers on the client computer.
     * @type {Integer}
     */
    OutBufCountClient {
        get => NumGet(this, 3660, "ushort")
        set => NumPut("ushort", value, this, 3660)
    }

    /**
     * Output buffer length.
     * @type {Integer}
     */
    OutBufLength {
        get => NumGet(this, 3662, "ushort")
        set => NumPut("ushort", value, this, 3662)
    }

    /**
     * Client session ID.
     * @type {Integer}
     */
    ClientSessionId {
        get => NumGet(this, 3664, "uint")
        set => NumPut("uint", value, this, 3664)
    }

    /**
     * A string value that contains a client product identifier.
     * @type {String}
     */
    ClientDigProductId {
        get => StrGet(this.ptr + 3668, 32, "UTF-16")
        set => StrPut(value, this.ptr + 3668, 32, "UTF-16")
    }

    /**
     * Specifies whether printer mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisableCpm {
        get => NumGet(this, 3734, "char")
        set => NumPut("char", value, this, 3734)
    }

    /**
     * Specifies whether drive mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisableCdm {
        get => NumGet(this, 3735, "char")
        set => NumPut("char", value, this, 3735)
    }

    /**
     * Specifies whether COM port  mapping is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisableCcm {
        get => NumGet(this, 3736, "char")
        set => NumPut("char", value, this, 3736)
    }

    /**
     * Specifies whether LPT printer redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisableLPT {
        get => NumGet(this, 3737, "char")
        set => NumPut("char", value, this, 3737)
    }

    /**
     * Specifies whether clipboard redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisableClip {
        get => NumGet(this, 3738, "char")
        set => NumPut("char", value, this, 3738)
    }

    /**
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {Integer}
     */
    fDisablePNP {
        get => NumGet(this, 3739, "char")
        set => NumPut("char", value, this, 3739)
    }
}
