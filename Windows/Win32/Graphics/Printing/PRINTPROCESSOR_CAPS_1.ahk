#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PRINTPROCESSOR\_CAPS\_1 structure is the format for the printer capability information that is returned by the GetPrinterData function in the buffer specified by the pData variable.
 * @remarks
 * Values for all structure members are supplied by the [**GetPrintProcessorCapabilities**](/windows-hardware/drivers/ddi/content/winsplp/nf-winsplp-getprintprocessorcapabilities) function, which is documented in the Windows Driver Kit (WDK).
 * 
 * The spooler calls a print processor's [**GetPrintProcessorCapabilities**](/windows-hardware/drivers/ddi/content/winsplp/nf-winsplp-getprintprocessorcapabilities) function when an application calls [**GetPrinterData**](getprinterdata.md), specifying a value name with a format of PrintProcCaps\_*datatype*, where *datatype* is the name of an input data type.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printprocessor-caps-1
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTPROCESSOR_CAPS_1 {
    #StructPack 4

    /**
     * The structure's version number. This value must be 1.
     */
    dwLevel : UInt32

    /**
     * A bit mask representing the various numbers of document pages the printer can print on a physical page. The least significant bit represents 1 document page per page, the next bit represents 2 document pages per page, and so on. For example, 0x0000810B indicates the printer supports 1, 2, 4, 9, and 16 document pages per physical page.
     */
    dwNupOptions : UInt32

    /**
     * The order in which pages will be printed. This value can be NORMAL\_PRINT, REVERSE\_PRINT, or BOOKLET\_PRINT.
     */
    dwPageOrderFlags : UInt32

    /**
     * The maximum number of copies the printer can handle.
     */
    dwNumberOfCopies : UInt32

}
