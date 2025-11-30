#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MetafileType enumeration specifies types of metafiles. The MetafileHeader::GetType method returns an element of this enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-metafiletype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class MetafileType extends Win32Enum{

    /**
     * Specifies a metafile format that is not recognized in GDI+.
     * @type {Integer (Int32)}
     */
    static MetafileTypeInvalid => 0

    /**
     * Specifies a WMF file. Such a file contains only GDI records.
     * @type {Integer (Int32)}
     */
    static MetafileTypeWmf => 1

    /**
     * Specifies a WMF file that has a placeable metafile header in front of it.
     * @type {Integer (Int32)}
     */
    static MetafileTypeWmfPlaceable => 2

    /**
     * Specifies an EMF file. Such a file contains only GDI records.
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmf => 3

    /**
     * Specifies an EMF+ file. Such a file contains only GDI+ records and must be displayed by using GDI+. Displaying the records using GDI may cause unpredictable results.
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmfPlusOnly => 4

    /**
     * Specifies an EMF+ Dual file. Such a file contains GDI+ records along with alternative GDI records and can be displayed by using either GDI or GDI+. Displaying the records using GDI may cause some quality degradation.
     * @type {Integer (Int32)}
     */
    static MetafileTypeEmfPlusDual => 5
}
