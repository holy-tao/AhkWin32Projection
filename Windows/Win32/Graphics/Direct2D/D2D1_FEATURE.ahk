#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines capabilities of the underlying Direct3D device which may be queried using ID2D1EffectContext::CheckFeatureSupport.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_feature
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_FEATURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
