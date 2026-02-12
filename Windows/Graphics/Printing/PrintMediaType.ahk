#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the media types for the printed output.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printmediatype
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class PrintMediaType extends Win32Enum{

    /**
     * The default media type for the printed output.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A media type that is not available with the application or one that is not supported by the print device.
     * @type {Integer (Int32)}
     */
    static NotAvailable => 1

    /**
     * A custom media type that is specific to the print device.
     * @type {Integer (Int32)}
     */
    static PrinterCustom => 2

    /**
     * The option to auto select a media type.
     * @type {Integer (Int32)}
     */
    static AutoSelect => 3

    /**
     * The Archival media type.
     * @type {Integer (Int32)}
     */
    static Archival => 4

    /**
     * The BackPrintFilm media type.
     * @type {Integer (Int32)}
     */
    static BackPrintFilm => 5

    /**
     * The Bond media type.
     * @type {Integer (Int32)}
     */
    static Bond => 6

    /**
     * The CardStock media type.
     * @type {Integer (Int32)}
     */
    static CardStock => 7

    /**
     * The Continuous media type.
     * @type {Integer (Int32)}
     */
    static Continuous => 8

    /**
     * The EnvelopePlain media type.
     * @type {Integer (Int32)}
     */
    static EnvelopePlain => 9

    /**
     * The EnvelopeWindow media type.
     * @type {Integer (Int32)}
     */
    static EnvelopeWindow => 10

    /**
     * The Fabric media type.
     * @type {Integer (Int32)}
     */
    static Fabric => 11

    /**
     * The HighResolution media type.
     * @type {Integer (Int32)}
     */
    static HighResolution => 12

    /**
     * The Label media type.
     * @type {Integer (Int32)}
     */
    static Label => 13

    /**
     * The MultiLayerForm media type.
     * @type {Integer (Int32)}
     */
    static MultiLayerForm => 14

    /**
     * The MultiPartForm media type.
     * @type {Integer (Int32)}
     */
    static MultiPartForm => 15

    /**
     * The Photographic media type.
     * @type {Integer (Int32)}
     */
    static Photographic => 16

    /**
     * The PhotographicFilm media type.
     * @type {Integer (Int32)}
     */
    static PhotographicFilm => 17

    /**
     * The PhotographicGlossy media type.
     * @type {Integer (Int32)}
     */
    static PhotographicGlossy => 18

    /**
     * The PhotographicHighGloss media type.
     * @type {Integer (Int32)}
     */
    static PhotographicHighGloss => 19

    /**
     * The PhotographicMatte media type.
     * @type {Integer (Int32)}
     */
    static PhotographicMatte => 20

    /**
     * The PhotographicSatin media type.
     * @type {Integer (Int32)}
     */
    static PhotographicSatin => 21

    /**
     * The PhotographicSemiGloss media type.
     * @type {Integer (Int32)}
     */
    static PhotographicSemiGloss => 22

    /**
     * The Plain media type.
     * @type {Integer (Int32)}
     */
    static Plain => 23

    /**
     * The Screen media type.
     * @type {Integer (Int32)}
     */
    static Screen => 24

    /**
     * The ScreenPaged media type.
     * @type {Integer (Int32)}
     */
    static ScreenPaged => 25

    /**
     * The Stationery media type.
     * @type {Integer (Int32)}
     */
    static Stationery => 26

    /**
     * The TabStockFull media type.
     * @type {Integer (Int32)}
     */
    static TabStockFull => 27

    /**
     * The TabStockPreCut media type.
     * @type {Integer (Int32)}
     */
    static TabStockPreCut => 28

    /**
     * The Transparency media type.
     * @type {Integer (Int32)}
     */
    static Transparency => 29

    /**
     * The TShirtTransfer media type.
     * @type {Integer (Int32)}
     */
    static TShirtTransfer => 30

    /**
     * The option to indicate that a media type has not been selected.
     * @type {Integer (Int32)}
     */
    static None => 31
}
