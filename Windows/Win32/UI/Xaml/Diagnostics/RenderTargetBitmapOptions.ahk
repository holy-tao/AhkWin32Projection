#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify what parts of the visual tree should be rendered.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-rendertargetbitmapoptions
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct RenderTargetBitmapOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
