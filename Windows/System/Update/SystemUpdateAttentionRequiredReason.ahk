#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Reason why user attention is required.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdateattentionrequiredreason
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateAttentionRequiredReason extends Win32Enum{

    /**
     * No attention required.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Network connection requires attention.
     * @type {Integer (Int32)}
     */
    static NetworkRequired => 1

    /**
     * Insufficient disk space to download updates.
     * @type {Integer (Int32)}
     */
    static InsufficientDiskSpace => 2

    /**
     * Insufficient battery power to begin updating system.
     * @type {Integer (Int32)}
     */
    static InsufficientBattery => 3

    /**
     * Update cannot proceed.
     * @type {Integer (Int32)}
     */
    static UpdateBlocked => 4
}
