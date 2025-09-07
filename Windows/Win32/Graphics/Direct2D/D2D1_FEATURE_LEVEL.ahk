#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the minimum DirectX support required for hardware rendering by a render target.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_feature_level
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FEATURE_LEVEL{

    /**
     * Direct2D determines whether the video card provides adequate hardware rendering support.
     * @type {Integer (Int32)}
     */
    static D2D1_FEATURE_LEVEL_DEFAULT => 0

    /**
     * The video card must support DirectX 9.
     * @type {Integer (Int32)}
     */
    static D2D1_FEATURE_LEVEL_9 => 37120

    /**
     * The video card must support DirectX 10.
     * @type {Integer (Int32)}
     */
    static D2D1_FEATURE_LEVEL_10 => 40960
}
