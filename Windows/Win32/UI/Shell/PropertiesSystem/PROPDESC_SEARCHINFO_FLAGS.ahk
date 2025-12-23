#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Determines whether and how a property is indexed by Windows Search.
 * @remarks
 * For third parties, the PDSIF_ALWAYSINCLUDE flag can be referred to in user-specified query strings, even though its value may not be retrievable from the index in query results. The meaning of the PDSIF_ALWAYSINCLUDE flag to the indexer when a third party sets the flag through a custom schema definition is that it enables users to refer to this property in query strings even though its value is not stored in the index.
 * 
 * Property mnemonics refers to a shortened name for a property.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-propdesc_searchinfo_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_SEARCHINFO_FLAGS extends Win32BitflagEnum{

    /**
     * The property is not indexed.
     * @type {Integer (Int32)}
     */
    static PDSIF_DEFAULT => 0

    /**
     * The property is in an inverted index to help speed searches.
     * @type {Integer (Int32)}
     */
    static PDSIF_ININVERTEDINDEX => 1

    /**
     * The property is indexed by Windows Search.
     * @type {Integer (Int32)}
     */
    static PDSIF_ISCOLUMN => 2

    /**
     * The property is indexed to save space for properties that are not present on all files.
     * @type {Integer (Int32)}
     */
    static PDSIF_ISCOLUMNSPARSE => 4

    /**
     * <b>Windows 7 and later</b>. The property mnemonics are recognized by AQS even if the property is not a column (PDSIF_ISCOLUMN).
     * @type {Integer (Int32)}
     */
    static PDSIF_ALWAYSINCLUDE => 8

    /**
     * Check this property for matches when looking for type ahead results.
     * @type {Integer (Int32)}
     */
    static PDSIF_USEFORTYPEAHEAD => 16
}
