#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include ..\..\Foundation\BOOL.ahk
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
     * @type {BOOLEAN}
     */
    fDisableCtrlAltDel{
        get {
            if(!this.HasProp("__fDisableCtrlAltDel"))
                this.__fDisableCtrlAltDel := BOOLEAN(this.ptr + 0)
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
                this.__fDoubleClickDetect := BOOLEAN(this.ptr + 1)
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
                this.__fEnableWindowsKey := BOOLEAN(this.ptr + 2)
            return this.__fEnableWindowsKey
        }
    }

    /**
     * Specifies whether the title bar is hidden.
     * @type {BOOLEAN}
     */
    fHideTitleBar{
        get {
            if(!this.HasProp("__fHideTitleBar"))
                this.__fHideTitleBar := BOOLEAN(this.ptr + 3)
            return this.__fHideTitleBar
        }
    }

    /**
     * Specifies whether the logon process is automatic. This value overwrites the  <b>fInheritAutoLogon</b> listener registry value.
     * @type {BOOL}
     */
    fInheritAutoLogon{
        get {
            if(!this.HasProp("__fInheritAutoLogon"))
                this.__fInheritAutoLogon := BOOL(this.ptr + 4)
            return this.__fInheritAutoLogon
        }
    }

    /**
     * Specifies whether to prompt the user for a password. If this value is <b>TRUE</b>, the user will be prompted even if the <b>fInheritAutoLogon</b> registry value is <b>TRUE</b> and the "Always ask for a password" policy is not set.
     * @type {BOOLEAN}
     */
    fPromptForPassword{
        get {
            if(!this.HasProp("__fPromptForPassword"))
                this.__fPromptForPassword := BOOLEAN(this.ptr + 8)
            return this.__fPromptForPassword
        }
    }

    /**
     * Specifies whether the client is using saved credentials during the logon process.
     * @type {BOOLEAN}
     */
    fUsingSavedCreds{
        get {
            if(!this.HasProp("__fUsingSavedCreds"))
                this.__fUsingSavedCreds := BOOLEAN(this.ptr + 9)
            return this.__fUsingSavedCreds
        }
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
    fPasswordIsScPin{
        get {
            if(!this.HasProp("__fPasswordIsScPin"))
                this.__fPasswordIsScPin := BOOLEAN(this.ptr + 1546)
            return this.__fPasswordIsScPin
        }
    }

    /**
     * Specifies whether the initial program to start in the Remote Desktop Services shell is inherited. This value overwrites the  <b>fInheritInitialProgram</b> listener registry value.
     * @type {BOOL}
     */
    fInheritInitialProgram{
        get {
            if(!this.HasProp("__fInheritInitialProgram"))
                this.__fInheritInitialProgram := BOOL(this.ptr + 1548)
            return this.__fInheritInitialProgram
        }
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
    fMaximizeShell{
        get {
            if(!this.HasProp("__fMaximizeShell"))
                this.__fMaximizeShell := BOOLEAN(this.ptr + 2580)
            return this.__fMaximizeShell
        }
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
    fInheritColorDepth{
        get {
            if(!this.HasProp("__fInheritColorDepth"))
                this.__fInheritColorDepth := BOOL(this.ptr + 2608)
            return this.__fInheritColorDepth
        }
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
    fMouse{
        get {
            if(!this.HasProp("__fMouse"))
                this.__fMouse := BOOLEAN(this.ptr + 2676)
            return this.__fMouse
        }
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
    fNoAudioPlayback{
        get {
            if(!this.HasProp("__fNoAudioPlayback"))
                this.__fNoAudioPlayback := BOOLEAN(this.ptr + 2768)
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
                this.__fRemoteConsoleAudio := BOOLEAN(this.ptr + 2769)
            return this.__fRemoteConsoleAudio
        }
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
     * @type {BOOLEAN}
     */
    fDisableCpm{
        get {
            if(!this.HasProp("__fDisableCpm"))
                this.__fDisableCpm := BOOLEAN(this.ptr + 3734)
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
                this.__fDisableCdm := BOOLEAN(this.ptr + 3735)
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
                this.__fDisableCcm := BOOLEAN(this.ptr + 3736)
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
                this.__fDisableLPT := BOOLEAN(this.ptr + 3737)
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
                this.__fDisableClip := BOOLEAN(this.ptr + 3738)
            return this.__fDisableClip
        }
    }

    /**
     * Specifies whether PNP redirection is enabled. This value is initially set from policy information. If you reset the value, the policy will be overwritten.
     * @type {BOOLEAN}
     */
    fDisablePNP{
        get {
            if(!this.HasProp("__fDisablePNP"))
                this.__fDisablePNP := BOOLEAN(this.ptr + 3739)
            return this.__fDisablePNP
        }
    }
}
