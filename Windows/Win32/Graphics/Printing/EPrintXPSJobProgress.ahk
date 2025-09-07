#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies what the spooler is currently doing as it processes an XPS print job.
 * @remarks
 * This enumeration is primarily used as a parameter for the [**ReportJobProcessingProgress**](reportjobprocessingprogress.md) function.
  * 
  * These values can refer to either the spooling or the rendering phase of a print job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/eprintxpsjobprogress
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EPrintXPSJobProgress{

    /**
     * @type {Integer (Int32)}
     */
    static kAddingDocumentSequence => 0

    /**
     * @type {Integer (Int32)}
     */
    static kDocumentSequenceAdded => 1

    /**
     * @type {Integer (Int32)}
     */
    static kAddingFixedDocument => 2

    /**
     * @type {Integer (Int32)}
     */
    static kFixedDocumentAdded => 3

    /**
     * @type {Integer (Int32)}
     */
    static kAddingFixedPage => 4

    /**
     * @type {Integer (Int32)}
     */
    static kFixedPageAdded => 5

    /**
     * @type {Integer (Int32)}
     */
    static kResourceAdded => 6

    /**
     * @type {Integer (Int32)}
     */
    static kFontAdded => 7

    /**
     * @type {Integer (Int32)}
     */
    static kImageAdded => 8

    /**
     * @type {Integer (Int32)}
     */
    static kXpsDocumentCommitted => 9
}
