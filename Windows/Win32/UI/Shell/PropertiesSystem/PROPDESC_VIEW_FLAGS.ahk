#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * These flags describe properties in property description list strings.
 * @remarks
 * These values are defined in propsys.h and propsys.idl.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-propdesc_view_flags
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_VIEW_FLAGS extends Win32BitflagEnum{

    /**
     * Show this property by default.
     * @type {Integer (Int32)}
     */
    static PDVF_DEFAULT => 0

    /**
     * This property should be centered.
     * @type {Integer (Int32)}
     */
    static PDVF_CENTERALIGN => 1

    /**
     * This property should be right aligned.
     * @type {Integer (Int32)}
     */
    static PDVF_RIGHTALIGN => 2

    /**
     * Show this property as the beginning of the next collection of properties in the view.
     * @type {Integer (Int32)}
     */
    static PDVF_BEGINNEWGROUP => 4

    /**
     * Fill the remainder of the view area with the content of this property.
     * @type {Integer (Int32)}
     */
    static PDVF_FILLAREA => 8

    /**
     * Sort this property in reverse (descending) order. Applies to a property in a list of sorted properties.
     * @type {Integer (Int32)}
     */
    static PDVF_SORTDESCENDING => 16

    /**
     * Show this property only if it is present.
     * @type {Integer (Int32)}
     */
    static PDVF_SHOWONLYIFPRESENT => 32

    /**
     * This property should be shown by default in a view (where applicable).
     * @type {Integer (Int32)}
     */
    static PDVF_SHOWBYDEFAULT => 64

    /**
     * This property should be shown by default in the primary column selection UI.
     * @type {Integer (Int32)}
     */
    static PDVF_SHOWINPRIMARYLIST => 128

    /**
     * This property should be shown by default in the secondary column selection UI.
     * @type {Integer (Int32)}
     */
    static PDVF_SHOWINSECONDARYLIST => 256

    /**
     * Hide the label of this property if the view normally shows the label.
     * @type {Integer (Int32)}
     */
    static PDVF_HIDELABEL => 512

    /**
     * This property should not be displayed as a column in the UI.
     * @type {Integer (Int32)}
     */
    static PDVF_HIDDEN => 2048

    /**
     * This property can be wrapped to the next row.
     * @type {Integer (Int32)}
     */
    static PDVF_CANWRAP => 4096

    /**
     * A mask used to retrieve all flags.
     * @type {Integer (Int32)}
     */
    static PDVF_MASK_ALL => 7167
}
