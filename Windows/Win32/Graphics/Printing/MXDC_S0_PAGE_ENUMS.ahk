#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MXDC\_S0\_PAGE\_ENUMS enumeration is used to specify types of resources that can be associated with pages in XPS documents and that can be processed, or passed unprocessed, by Microsoft XPS Document Converter (MXDC) to its output.
 * @remarks
 * This enumeration is primarily used as the **dwResourceType** member of the [**MXDC\_XPS\_S0PAGE\_RESOURCE\_T**](mxdcxpss0pageresource.md) structure.
 * @see https://learn.microsoft.com/windows/win32/printdocs/mxdcs0pageenums
 * @namespace Windows.Win32.Graphics.Printing
 */
class MXDC_S0_PAGE_ENUMS extends Win32Enum {

    /**
     * Native name: MXDC_RESOURCE_TTF
     * @type {Integer (Int32)}
     */
    static RESOURCE_TTF => 0

    /**
     * Native name: MXDC_RESOURCE_JPEG
     * @type {Integer (Int32)}
     */
    static RESOURCE_JPEG => 1

    /**
     * Native name: MXDC_RESOURCE_PNG
     * @type {Integer (Int32)}
     */
    static RESOURCE_PNG => 2

    /**
     * Native name: MXDC_RESOURCE_TIFF
     * @type {Integer (Int32)}
     */
    static RESOURCE_TIFF => 3

    /**
     * Native name: MXDC_RESOURCE_WDP
     * @type {Integer (Int32)}
     */
    static RESOURCE_WDP => 4

    /**
     * Native name: MXDC_RESOURCE_DICTIONARY
     * @type {Integer (Int32)}
     */
    static RESOURCE_DICTIONARY => 5

    /**
     * Native name: MXDC_RESOURCE_ICC_PROFILE
     * @type {Integer (Int32)}
     */
    static RESOURCE_ICC_PROFILE => 6

    /**
     * Native name: MXDC_RESOURCE_JPEG_THUMBNAIL
     * @type {Integer (Int32)}
     */
    static RESOURCE_JPEG_THUMBNAIL => 7

    /**
     * Native name: MXDC_RESOURCE_PNG_THUMBNAIL
     * @type {Integer (Int32)}
     */
    static RESOURCE_PNG_THUMBNAIL => 8

    /**
     * Native name: MXDC_RESOURCE_MAX
     * @type {Integer (Int32)}
     */
    static RESOURCE_MAX => 9
}
