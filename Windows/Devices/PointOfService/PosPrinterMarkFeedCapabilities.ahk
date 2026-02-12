#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the capabilities of a receipt printer station for handling mark-sensed paper.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintermarkfeedcapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterMarkFeedCapabilities extends Win32BitflagEnum{

    /**
     * The receipt printer station cannot feed the mark-sensed paper.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The receipt printer station can feed the mark-sensed paper to the paper take-up position.
     * @type {Integer (UInt32)}
     */
    static ToTakeUp => 1

    /**
     * The receipt printer station can feed the mark-sensed paper to the cutting position for the automatic cutter.
     * @type {Integer (UInt32)}
     */
    static ToCutter => 2

    /**
     * The receipt printer station can feed the mark-sensed paper to the top of the form for the present paper, reverse feeding the paper if required.
     * @type {Integer (UInt32)}
     */
    static ToCurrentTopOfForm => 4

    /**
     * The receipt printer station can feed the mark-sensed paper to the top of the form for the next paper.
     * @type {Integer (UInt32)}
     */
    static ToNextTopOfForm => 8
}
