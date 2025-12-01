#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Remote Desktop Services listener. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSLISTENERCONFIG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTSLISTENERCONFIGA extends Win32Struct
{
    static sizeof => 728

    static packingSize => 4

    /**
     * This member is reserved.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    fEnableListener {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The maximum number of active connections that the listener accepts.
     * @type {Integer}
     */
    MaxConnectionCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    fPromptForPassword {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    fInheritColorDepth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    ColorDepth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    fInheritBrokenTimeoutSettings {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    BrokenTimeoutSettings {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisablePrinterRedirection {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableDriveRedirection {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableComPortRedirection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableLPTPortRedirection {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableClipboardRedirection {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableAudioRedirection {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisablePNPRedirection {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    fDisableDefaultMainClientPrinter {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The network adapter that the listener uses.
     * @type {Integer}
     */
    LanAdapter {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The port number of the listener.
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * 
     * @type {Integer}
     */
    fInheritShadowSettings {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Integer}
     */
    ShadowSettings {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The maximum connection duration, in milliseconds. Every time the user logs on, the timer is reset. A value of zero indicates that the connection timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsConnection {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The maximum duration, in milliseconds, that a server retains a disconnected session before the logon is terminated. A value of zero indicates that the disconnection timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsDisconnection {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The maximum idle time, in milliseconds. A value of zero indicates that the idle timer is disabled.
     * @type {Integer}
     */
    TimeoutSettingsIdle {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    SecurityLayer {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Encryption level of the listener.
     * @type {Integer}
     */
    MinEncryptionLevel {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    UserAuthentication {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * A null-terminated string that contains a description of the listener.
     * @type {String}
     */
    Comment {
        get => StrGet(this.ptr + 104, 60, "UTF-8")
        set => StrPut(value, this.ptr + 104, 60, "UTF-8")
    }

    /**
     * A null-terminated string that contains the user name used in automatic logon scenarios.
     * @type {String}
     */
    LogonUserName {
        get => StrGet(this.ptr + 165, 20, "UTF-8")
        set => StrPut(value, this.ptr + 165, 20, "UTF-8")
    }

    /**
     * A null-terminated string that contains the domain name used in automatic logon scenarios.
     * @type {String}
     */
    LogonDomain {
        get => StrGet(this.ptr + 186, 17, "UTF-8")
        set => StrPut(value, this.ptr + 186, 17, "UTF-8")
    }

    /**
     * A null-terminated string that contains the path of the working directory of  the initial program.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 204, 260, "UTF-8")
        set => StrPut(value, this.ptr + 204, 260, "UTF-8")
    }

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 465, 260, "UTF-8")
        set => StrPut(value, this.ptr + 465, 260, "UTF-8")
    }
}
