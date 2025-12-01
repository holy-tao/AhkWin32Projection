#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Option flags for transformed image sources.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_transformed_image_source_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS extends Win32BitflagEnum{

    /**
     * No option flags.
     * @type {Integer (Int32)}
     */
    static D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS_NONE => 0

    /**
     * Prevents the image source from being automatically scaled (by a ratio of the context DPI divided by 96) while drawn.
     * @type {Integer (Int32)}
     */
    static D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS_DISABLE_DPI_SCALE => 1
}
