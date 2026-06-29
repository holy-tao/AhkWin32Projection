#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of hardware features, to be used when checking for feature support.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgifactory5-checkfeaturesupport">CheckFeatureSupport</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_feature
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_FEATURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The display supports tearing, a requirement of variable refresh rate displays.
     * @type {Integer (Int32)}
     */
    static DXGI_FEATURE_PRESENT_ALLOW_TEARING => 0
}
