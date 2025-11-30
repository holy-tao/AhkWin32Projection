#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SYNC_CONSTRAINT_RESOLVE_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_DEFER => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_ACCEPT_DESTINATION_PROVIDER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_ACCEPT_SOURCE_PROVIDER => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_TRANSFER_AND_DEFER => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_MERGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_RENAME_SOURCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_RENAME_DESTINATION => 6
}
