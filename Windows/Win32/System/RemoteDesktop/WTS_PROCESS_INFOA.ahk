#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a process running on a Remote Desktop Session Host (RD Session Host) server.
 * @remarks
 * 
 * > [!NOTE]
 * > The wtsapi32.h header defines WTS_PROCESS_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wts_process_infoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTS_PROCESS_INFOA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Remote Desktop Services session identifier for the session associated with the process.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Process identifier that uniquely identifies the process on the RD Session Host server.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a null-terminated string containing the name of the executable file associated with the process.
     * @type {PSTR}
     */
    pProcessName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the user 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a> in the process's primary access token. For more information about SIDs and access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @type {PSID}
     */
    pUserSid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
