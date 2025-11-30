#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Option flags controlling primary conversion performed by CreateImageSourceFromDxgi, if any.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ne-d2d1_3-d2d1_image_source_from_dxgi_options
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS extends Win32BitflagEnum{

    /**
     * No primary conversion is performed.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_NONE => 0

    /**
     * Low quality primary conversion is performed.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_LOW_QUALITY_PRIMARY_CONVERSION => 1
}
