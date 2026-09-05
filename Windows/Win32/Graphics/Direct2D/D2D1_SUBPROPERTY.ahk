#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the indices of the system sub-properties that may be present in any property.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_subproperty
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_SUBPROPERTY extends Win32Enum {

    /**
     * The name for the parent property.
     * Native name: D2D1_SUBPROPERTY_DISPLAYNAME
     * @type {Integer (Int32)}
     */
    static DISPLAYNAME => -2147483648

    /**
     * A Boolean indicating whether the parent property is writable.
     * Native name: D2D1_SUBPROPERTY_ISREADONLY
     * @type {Integer (Int32)}
     */
    static ISREADONLY => -2147483647

    /**
     * The minimum value that can be set to the parent property.
     * Native name: D2D1_SUBPROPERTY_MIN
     * @type {Integer (Int32)}
     */
    static MIN => -2147483646

    /**
     * The maximum value that can be set to the parent property.
     * Native name: D2D1_SUBPROPERTY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -2147483645

    /**
     * The default value of the parent property.
     * Native name: D2D1_SUBPROPERTY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => -2147483644

    /**
     * An array of name/index pairs that indicate the possible values that can be set to the parent property.
     * Native name: D2D1_SUBPROPERTY_FIELDS
     * @type {Integer (Int32)}
     */
    static FIELDS => -2147483643

    /**
     * An index sub-property used by the elements of the <b>D2D1_SUBPROPERTY_FIELDS</b> array.
     * Native name: D2D1_SUBPROPERTY_INDEX
     * @type {Integer (Int32)}
     */
    static INDEX => -2147483642
}
