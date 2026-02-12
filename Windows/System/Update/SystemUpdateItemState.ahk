#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * State of a [SystemUpdateItem](systemupdateitem.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateitemstate
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateItemState extends Win32Enum{

    /**
     * Update not started.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * Update item initializing.
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * Preparing update item.
     * @type {Integer (Int32)}
     */
    static Preparing => 2

    /**
     * Calculating update item actions.
     * @type {Integer (Int32)}
     */
    static Calculating => 3

    /**
     * Update item downloading.
     * @type {Integer (Int32)}
     */
    static Downloading => 4

    /**
     * Update item installing.
     * @type {Integer (Int32)}
     */
    static Installing => 5

    /**
     * Update completed.
     * @type {Integer (Int32)}
     */
    static Completed => 6

    /**
     * Reboot required.
     * @type {Integer (Int32)}
     */
    static RebootRequired => 7

    /**
     * Error encountered when trying to update&mdash;see [ExtendedError](systemupdateitem_extendederror.md)
     * @type {Integer (Int32)}
     */
    static Error => 8
}
