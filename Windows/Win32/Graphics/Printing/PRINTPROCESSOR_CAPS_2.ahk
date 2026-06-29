#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents printer capability information.
 * @remarks
 * Values for all structure members are supplied by the **GetPrintProcessorCapabilities** function which is documented in the Windows Driver Kit.
 * 
 * When an application calls [**GetPrinterData**](getprinterdata.md), the spooler calls a print processor's **GetPrintProcessorCapabilities** function and specifies a value name that has a format of **PrintProcCaps\_***datatype*, where *datatype* is the name of an input data type.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printprocessor-caps-2
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTPROCESSOR_CAPS_2 {
    #StructPack 4

    /**
     * A value that indicates the structure's version number.
     */
    dwLevel : UInt32

    /**
     * A bit mask representing the various numbers of document pages the printer can print on a single side of a physical sheet. The least significant bit represents one document page per side, the next bit represents 2 document pages per side, and so on. For example, 0x0000810B indicates the printer supports 1, 2, 4, 9, and 16 document pages per physical side.
     */
    dwNupOptions : UInt32

    /**
     * A flag value that indicates the order in which pages will be printed. It can be **NORMAL\_PRINT**, **REVERSE\_PRINT**, or **BOOKLET\_PRINT**.
     */
    dwPageOrderFlags : UInt32

    /**
     * The maximum number of copies the printer can handle.
     */
    dwNumberOfCopies : UInt32

    dwDuplexHandlingCaps : UInt32

    /**
     * The available patterns when multiple document pages are printed on the same side of a sheet of paper. The possible flags are the following:
     * 
     * 
     * 
     * | Value                     | Meaning                                                                                             |
     * |---------------------------|-----------------------------------------------------------------------------------------------------|
     * | PPCAPS\_RIGHT\_THEN\_DOWN | Pages appear in rows from right to left, each subsequent row below its predecessor.                 |
     * | PPCAPS\_DOWN\_THEN\_RIGHT | Pages appear in columns from top to bottom, each subsequent column to the right of its predecessor. |
     * | PPCAPS\_LEFT\_THEN\_DOWN  | Pages appear in rows from left to right, each subsequent row below its predecessor.                 |
     * | PPCAPS\_DOWN\_THEN\_LEFT  | Pages appear in columns from top to bottom, each subsequent column to the left of its predecessor.  |
     */
    dwNupDirectionCaps : UInt32

    /**
     * Can be only PPCAPS\_BORDER\_PRINT, indicating that, when multiple document pages are being printed on a single side of a physical sheet, the printer can be told whether or not to print a border around the imageable area of each document page.
     */
    dwNupBorderCaps : UInt32

    /**
     * Can only be PPCAPS\_BOOKLET\_EDGE, indicating that the printer can print booklet style.
     * 
     * 
     * | Value                                         | Meaning                                                                                                                                                                                                                                                                                          |
     * |-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | PPCAPS\_REVERSE\_PAGES\_FOR\_REVERSE\_DUPLEX  | When printing in reverse order and duplexing, the processor can print swap the order of each pair of pages, so instead of printing in order 4,3,2,1, they will print in the order 3,4,1,2.                                                                                                       |
     * | PPCAPS\_DONT\_SEND\_EXTRA\_PAGES\_FOR\_DUPLEX | When duplexing, the Print Processor can be told not to send an extra page when there is an odd number of document pages. The processor will honor the value as best as it can, but in cases where preventing an extra blank page would cause improper output, the extra pages may still be sent. |
     */
    dwBookletHandlingCaps : UInt32

    /**
     * Can only be PPCAPS\_SQUARE\_SCALING, indicating that the printer can scale the page image.
     */
    dwScalingCaps : UInt32

}
