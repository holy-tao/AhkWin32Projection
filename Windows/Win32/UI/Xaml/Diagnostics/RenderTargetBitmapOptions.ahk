#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify what parts of the visual tree should be rendered.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-rendertargetbitmapoptions
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class RenderTargetBitmapOptions{

    /**
     * Only the texture associated with the visual should be rendered.
     * @type {Integer (Int32)}
     */
    static RenderTarget => 0

    /**
     * The texture associated with the visual and its children should be rendered.
     * @type {Integer (Int32)}
     */
    static RenderTargetAndChildren => 1
}
