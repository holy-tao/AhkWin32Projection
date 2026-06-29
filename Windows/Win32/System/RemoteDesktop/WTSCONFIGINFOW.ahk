#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a Remote Desktop Services session. (WTSCONFIGINFOW)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTSCONFIGINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsconfiginfow
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTSCONFIGINFOW {
    #StructPack 4

    /**
     * This member is reserved.
     */
    version : UInt32

    /**
     * This member is reserved.
     */
    fConnectClientDrivesAtLogon : UInt32

    /**
     * This member is reserved.
     */
    fConnectPrinterAtLogon : UInt32

    /**
     * Specifies whether the client can use printer redirection.
     */
    fDisablePrinterRedirection : UInt32

    /**
     * Specifies whether the printer connected to the client is the default printer for the user.
     */
    fDisableDefaultMainClientPrinter : UInt32

    ShadowSettings : UInt32

    /**
     * A null-terminated string that contains the user name used in automatic logon scenarios.
     */
    LogonUserName : WCHAR[21]

    /**
     * A null-terminated string that contains the domain name used in automatic logon scenarios.
     */
    LogonDomain : WCHAR[18]

    /**
     * A null-terminated string that contains the path of the working directory of  the initial program.
     */
    WorkDirectory : WCHAR[261]

    /**
     * A null-terminated string that contains the name of  the program to start immediately after the user logs on to the server.
     */
    InitialProgram : WCHAR[261]

    /**
     * This member is reserved.
     */
    ApplicationName : WCHAR[261]

}
