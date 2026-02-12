#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the ways the receipt printer station should feed the mark-sensed paper when you call the [ReceiptPrintJob.MarkFeed](receiptprintjob_markfeed_40048292.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprintermarkfeedkind
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterMarkFeedKind extends Win32Enum{

    /**
     * Feeds the mark-sensed paper to the paper take-up position.
     * @type {Integer (Int32)}
     */
    static ToTakeUp => 0

    /**
     * Feeds the mark-sensed paper to the cutting position for the automatic cutter.
     * @type {Integer (Int32)}
     */
    static ToCutter => 1

    /**
     * Feeds the mark-sensed paper to the top of the form for the present paper, reverse feeding the paper if required.
     * @type {Integer (Int32)}
     */
    static ToCurrentTopOfForm => 2

    /**
     * Feeds the mark-sensed paper to the top of the form for the next paper.
     * @type {Integer (Int32)}
     */
    static ToNextTopOfForm => 3
}
