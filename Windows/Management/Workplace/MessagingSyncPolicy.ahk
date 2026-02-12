#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration that indicates the messaging sync policy.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.messagingsyncpolicy
 * @namespace Windows.Management.Workplace
 * @version WindowsRuntime 1.4
 */
class MessagingSyncPolicy extends Win32Enum{

    /**
     * Message syncing is disallowed.
     * @type {Integer (Int32)}
     */
    static Disallowed => 0

    /**
     * Message syncing is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Message syncing is required.
     * @type {Integer (Int32)}
     */
    static Required => 2
}
