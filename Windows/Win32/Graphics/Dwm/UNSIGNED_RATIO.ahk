#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a data type used by the Desktop Window Manager (DWM) APIs. It represents a generic ratio and is used for different purposes and units even within a single API.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-unsigned_ratio
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct UNSIGNED_RATIO {
    #StructPack 4

    /**
     * The ratio numerator.
     */
    uiNumerator : UInt32

    /**
     * The ratio denominator.
     */
    uiDenominator : UInt32

}
