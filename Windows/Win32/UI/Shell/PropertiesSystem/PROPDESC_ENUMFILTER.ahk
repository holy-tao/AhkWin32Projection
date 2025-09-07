#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the filtered list of property descriptions that is returned.
 * @remarks
 * These values are defined in propsys.h and propsys.idl.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-propdesc_enumfilter
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_ENUMFILTER{

    /**
     * The list contains all property descriptions in the system.
     * @type {Integer (Int32)}
     */
    static PDEF_ALL => 0

    /**
     * The list contains system property descriptions only. It excludes third-party property descriptions that are registered on the computer.
     * @type {Integer (Int32)}
     */
    static PDEF_SYSTEM => 1

    /**
     * The list contains only third-party property descriptions that are registered on the computer.
     * @type {Integer (Int32)}
     */
    static PDEF_NONSYSTEM => 2

    /**
     * The list contains only viewable properties, where &lt;typeInfo isViewable="true"&gt;.
     * @type {Integer (Int32)}
     */
    static PDEF_VIEWABLE => 3

    /**
     * Deprecated in <b>Windows 7 and later</b>. The list contains only queryable properties, where &lt;typeInfo isViewable="true" isQueryable="true"&gt;.
     * @type {Integer (Int32)}
     */
    static PDEF_QUERYABLE => 4

    /**
     * <b>Deprecated in Windows 7 and later</b>. The list contains only properties to be included in full-text queries.
     * @type {Integer (Int32)}
     */
    static PDEF_INFULLTEXTQUERY => 5

    /**
     * The list contains only properties that are columns.
     * @type {Integer (Int32)}
     */
    static PDEF_COLUMN => 6
}
