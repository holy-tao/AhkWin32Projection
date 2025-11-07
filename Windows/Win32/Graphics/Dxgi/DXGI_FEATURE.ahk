#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a range of hardware features, to be used when checking for feature support.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgifactory5-checkfeaturesupport">CheckFeatureSupport</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/ne-dxgi1_5-dxgi_feature
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_FEATURE{

    /**
     * The display supports tearing, a requirement of variable refresh rate displays.
     * @type {Integer (Int32)}
     */
    static DXGI_FEATURE_PRESENT_ALLOW_TEARING => 0
}
