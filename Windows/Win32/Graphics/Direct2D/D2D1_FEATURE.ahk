#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines capabilities of the underlying Direct3D device which may be queried using ID2D1EffectContext::CheckFeatureSupport.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_feature
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FEATURE{

    /**
     * A D2D1_FEATURE_DATA_DOUBLES structure should be filled.
     * @type {Integer (Int32)}
     */
    static D2D1_FEATURE_DOUBLES => 0

    /**
     * A D2D1_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS structure should be filled.
     * @type {Integer (Int32)}
     */
    static D2D1_FEATURE_D3D10_X_HARDWARE_OPTIONS => 1
}
