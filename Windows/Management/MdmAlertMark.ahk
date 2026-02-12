#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Values indicating priority or criticality of the MDM alert.
 * @remarks
 * These values are specified by the OMA-DM standard/
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalertmark
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmAlertMark extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Fatal => 1

    /**
     * @type {Integer (Int32)}
     */
    static Critical => 2

    /**
     * @type {Integer (Int32)}
     */
    static Warning => 3

    /**
     * @type {Integer (Int32)}
     */
    static Informational => 4
}
