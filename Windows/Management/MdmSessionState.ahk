#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * The various states of an MDM session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmsessionstate
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmSessionState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * @type {Integer (Int32)}
     */
    static Starting => 1

    /**
     * @type {Integer (Int32)}
     */
    static Connecting => 2

    /**
     * @type {Integer (Int32)}
     */
    static Communicating => 3

    /**
     * @type {Integer (Int32)}
     */
    static AlertStatusAvailable => 4

    /**
     * @type {Integer (Int32)}
     */
    static Retrying => 5

    /**
     * @type {Integer (Int32)}
     */
    static Completed => 6
}
