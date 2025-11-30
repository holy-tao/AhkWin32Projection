#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the layer contents should be prepared.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_layer_options1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LAYER_OPTIONS1 extends Win32BitflagEnum{

    /**
     * Default layer behavior. A premultiplied layer target is pushed and its contents are cleared to transparent black.
     * @type {Integer (Int32)}
     */
    static D2D1_LAYER_OPTIONS1_NONE => 0

    /**
     * The layer is not cleared to transparent black.
     * @type {Integer (Int32)}
     */
    static D2D1_LAYER_OPTIONS1_INITIALIZE_FROM_BACKGROUND => 1

    /**
     * The layer is always created as ignore alpha. All content rendered into the layer will be treated as opaque.
     * @type {Integer (Int32)}
     */
    static D2D1_LAYER_OPTIONS1_IGNORE_ALPHA => 2
}
