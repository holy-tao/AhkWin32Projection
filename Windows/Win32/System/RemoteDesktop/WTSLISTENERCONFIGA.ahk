#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a Remote Desktop Services listener. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSLISTENERCONFIG as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTSLISTENERCONFIGA {
    #StructPack 4

    /**
     * This member is reserved.
     */
    version : UInt32

    fEnableListener : UInt32

    /**
     * The maximum number of active connections that the listener accepts.
     */
    MaxConnectionCount : UInt32

    fPromptForPassword : UInt32

    fInheritColorDepth : UInt32

    ColorDepth : UInt32

    fInheritBrokenTimeoutSettings : UInt32

    BrokenTimeoutSettings : UInt32

    fDisablePrinterRedirection : UInt32

    fDisableDriveRedirection : UInt32

    fDisableComPortRedirection : UInt32

    fDisableLPTPortRedirection : UInt32

    fDisableClipboardRedirection : UInt32

    fDisableAudioRedirection : UInt32

    fDisablePNPRedirection : UInt32

    fDisableDefaultMainClientPrinter : UInt32

    /**
     * The network adapter that the listener uses.
     */
    LanAdapter : UInt32

    /**
     * The port number of the listener.
     */
    PortNumber : UInt32

    fInheritShadowSettings : UInt32

    ShadowSettings : UInt32

    /**
     * The maximum connection duration, in milliseconds. Every time the user logs on, the timer is reset. A value of zero indicates that the connection timer is disabled.
     */
    TimeoutSettingsConnection : UInt32

    /**
     * The maximum duration, in milliseconds, that a server retains a disconnected session before the logon is terminated. A value of zero indicates that the disconnection timer is disabled.
     */
    TimeoutSettingsDisconnection : UInt32

    /**
     * The maximum idle time, in milliseconds. A value of zero indicates that the idle timer is disabled.
     */
    TimeoutSettingsIdle : UInt32

    SecurityLayer : UInt32

    /**
     * Encryption level of the listener.
     */
    MinEncryptionLevel : UInt32

    UserAuthentication : UInt32

    /**
     * A null-terminated string that contains a description of the listener.
     */
    Comment : CHAR[61]

    /**
     * A null-terminated string that contains the user name used in automatic logon scenarios.
     */
    LogonUserName : CHAR[21]

    /**
     * A null-terminated string that contains the domain name used in automatic logon scenarios.
     */
    LogonDomain : CHAR[18]

    /**
     * A null-terminated string that contains the path of the working directory of  the initial program.
     */
    WorkDirectory : CHAR[261]

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     */
    InitialProgram : CHAR[261]

}
