#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSID.ahk" { PSID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a process running on a Remote Desktop Session Host (RD Session Host) server. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTS_PROCESS_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_process_infoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTS_PROCESS_INFOA {
    #StructPack 8

    /**
     * Remote Desktop Services session identifier for the session associated with the process.
     */
    SessionId : UInt32

    /**
     * Process identifier that uniquely identifies the process on the RD Session Host server.
     */
    ProcessId : UInt32

    /**
     * Pointer to a null-terminated string containing the name of the executable file associated with the process.
     */
    pProcessName : PSTR

    /**
     * Pointer to the user 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a> in the process's primary access token. For more information about SIDs and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     */
    pUserSid : PSID

}
