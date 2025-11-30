#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that identify the top level properties of the White Level Adjustment effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_whiteleveladjustment_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_WHITELEVELADJUSTMENT_PROP extends Win32Enum{

    /**
     * Identifies the `InputWhiteLevel` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_WHITELEVELADJUSTMENT_PROP_INPUT_WHITE_LEVEL => 0

    /**
     * Identifies the `OutputWhiteLevel` property of the effect. The property is of type FLOAT, and is specified in nits.
     * @type {Integer (Int32)}
     */
    static D2D1_WHITELEVELADJUSTMENT_PROP_OUTPUT_WHITE_LEVEL => 1
}
