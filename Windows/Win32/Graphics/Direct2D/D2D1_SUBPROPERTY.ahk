#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the indices of the system sub-properties that may be present in any property.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_subproperty
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SUBPROPERTY extends Win32Enum{

    /**
     * The name for the parent property.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_DISPLAYNAME => -2147483648

    /**
     * A Boolean indicating whether the parent property is writeable.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_ISREADONLY => -2147483647

    /**
     * The minimum value that can be set to the parent property.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_MIN => -2147483646

    /**
     * The maximum value that can be set to the parent property.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_MAX => -2147483645

    /**
     * The default value of the parent property.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_DEFAULT => -2147483644

    /**
     * An array of name/index pairs that indicate the possible values that can be set to the parent property.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_FIELDS => -2147483643

    /**
     * An index sub-property used by the elements of the <b>D2D1_SUBPROPERTY_FIELDS</b> array.
     * @type {Integer (Int32)}
     */
    static D2D1_SUBPROPERTY_INDEX => -2147483642
}
