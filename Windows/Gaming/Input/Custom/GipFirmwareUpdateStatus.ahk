#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state of a firmware update operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdatestatus
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GipFirmwareUpdateStatus extends Win32Enum{

    /**
     * The update is complete.
     * @type {Integer (Int32)}
     */
    static Completed => 0

    /**
     * The firmware is already up to date.
     * @type {Integer (Int32)}
     */
    static UpToDate => 1

    /**
     * The update failed.
     * @type {Integer (Int32)}
     */
    static Failed => 2
}
