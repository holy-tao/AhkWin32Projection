#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MXDC\_S0\_PAGE\_ENUMS enumeration is used to specify types of resources that can be associated with pages in XPS documents and that can be processed, or passed unprocessed, by Microsoft XPS Document Converter (MXDC) to its output.
 * @remarks
 * This enumeration is primarily used as the **dwResourceType** member of the [**MXDC\_XPS\_S0PAGE\_RESOURCE\_T**](mxdcxpss0pageresource.md) structure.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pageenums
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_S0_PAGE_ENUMS{

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_TTF => 0

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_JPEG => 1

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_PNG => 2

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_TIFF => 3

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_WDP => 4

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_DICTIONARY => 5

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_ICC_PROFILE => 6

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_JPEG_THUMBNAIL => 7

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_PNG_THUMBNAIL => 8

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_RESOURCE_MAX => 9
}
