#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the status of a call to retrieve the system ticket.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemticketstatus
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdSystemTicketStatus extends Win32Enum{

    /**
     * The call to retrieve the system ticket was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * An unexpected error prevented the retrieval of the system ticket.
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * A network error prevented the retrieval of the system ticket.
     * @type {Integer (Int32)}
     */
    static ServiceConnectionError => 2
}
