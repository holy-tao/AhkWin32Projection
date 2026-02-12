#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current power source of the source device containing items to be imported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportpowersource
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportPowerSource extends Win32Enum{

    /**
     * The current power source is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The current power source is a battery.
     * @type {Integer (Int32)}
     */
    static Battery => 1

    /**
     * The current power source is external.
     * @type {Integer (Int32)}
     */
    static External => 2
}
