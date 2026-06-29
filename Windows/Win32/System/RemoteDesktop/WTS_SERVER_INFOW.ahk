#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a specific Remote Desktop Services server. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTS_SERVER_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_server_infow
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTS_SERVER_INFOW {
    #StructPack 8

    /**
     * Name of the server.
     */
    pServerName : PWSTR

}
