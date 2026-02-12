#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionTexture.ahk
#Include .\ICompositionTextureFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a raw Direct3D texture that can be bound to a composition visual as content. The object can be used anywhere that a generic composition surface can be used in those APIs today&mdash;for example, as the content of a sprite visual or a surface brush. The object exposes an available fence, which can be used to synchronize application rendering and composition work. Can also accept various attributes, such as an alpha mode, source rect, and color space, to more precisely define the content being displayed.
  * 
  * The composition textures API supports Direct3D 11 only.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontexture
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionTexture extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionTexture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionTexture.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the portion of an overall Direct3D texture that the composition texture represents (and samples from). This allows you to have multiple composition textures referencing the same Direct3D texture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontexture.sourcerect
     * @type {RectInt32} 
     */
    SourceRect {
        get => this.get_SourceRect()
        set => this.put_SourceRect(value)
    }

    /**
     * Informs the [Desktop Window Manager (DWM)](/windows/win32/dwm/dwm-overview) whether alpha pixels in the texture should be honored or ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontexture.alphamode
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
        set => this.put_AlphaMode(value)
    }

    /**
     * Informs the system of the color space that it should map the texture into.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiontexture.colorspace
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
        set => this.put_ColorSpace(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RectInt32} 
     */
    get_SourceRect() {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.get_SourceRect()
    }

    /**
     * 
     * @param {RectInt32} value 
     * @returns {HRESULT} 
     */
    put_SourceRect(value) {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.put_SourceRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.get_AlphaMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlphaMode(value) {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.put_AlphaMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.get_ColorSpace()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorSpace(value) {
        if (!this.HasProp("__ICompositionTexture")) {
            if ((queryResult := this.QueryInterface(ICompositionTexture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionTexture := ICompositionTexture(outPtr)
        }

        return this.__ICompositionTexture.put_ColorSpace(value)
    }

;@endregion Instance Methods
}
