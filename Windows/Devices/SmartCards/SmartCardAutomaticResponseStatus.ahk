#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the status of the smart card readers automatic response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponsestatus
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardAutomaticResponseStatus extends Win32Enum{

    /**
     * No status provided.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Read was a success.
     * @type {Integer (Int32)}
     */
    static Success => 1

    /**
     * Read failed with an unidentified error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 2
}
