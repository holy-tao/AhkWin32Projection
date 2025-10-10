#Requires AutoHotkey v2.0.0 64-bit

/**
 * The EmfType enumeration specifies the nature of the records that are placed in an Enhanced Metafile (EMF) file. This enumeration is used by several constructors in the Metafile class.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-emftype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class EmfType{

    /**
     * Specifies that all of the records in the metafile are EMF records, which can be displayed by GDI or GDI+.
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfOnly => 3

    /**
     * Specifies that all of the records in the metafile are EMF+ records, which can be displayed by GDI+ but not by GDI.
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfPlusOnly => 4

    /**
     * Specifies that all EMF+ records in the metafile are associated with an alternate EMF record. Metafiles of type EmfTypeEmfPlusDual can be displayed by GDI or by GDI+.
     * @type {Integer (Int32)}
     */
    static EmfTypeEmfPlusDual => 5
}
