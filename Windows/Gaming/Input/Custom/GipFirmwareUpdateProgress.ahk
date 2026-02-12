#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the progress of a firmware update operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.gipfirmwareupdateprogress
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class GipFirmwareUpdateProgress extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Percentage of the operation that is complete.
     * @type {Float}
     */
    PercentCompleted {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The ID of the current component being updated.
     * @type {Integer}
     */
    CurrentComponentId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
