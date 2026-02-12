#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionMipmapSurface.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a drawing surface for mipmap textures.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionMipmapSurface extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionMipmapSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionMipmapSurface.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of texture levels in the mipmap.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface.levelcount
     * @type {Integer} 
     */
    LevelCount {
        get => this.get_LevelCount()
    }

    /**
     * Gets the alpha mode of the mipmap surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface.alphamode
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
    }

    /**
     * Gets the pixel format of the mipmap surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface.pixelformat
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * Gets the size of the mipmap surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface.sizeint32
     * @type {SizeInt32} 
     */
    SizeInt32 {
        get => this.get_SizeInt32()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LevelCount() {
        if (!this.HasProp("__ICompositionMipmapSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionMipmapSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMipmapSurface := ICompositionMipmapSurface(outPtr)
        }

        return this.__ICompositionMipmapSurface.get_LevelCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        if (!this.HasProp("__ICompositionMipmapSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionMipmapSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMipmapSurface := ICompositionMipmapSurface(outPtr)
        }

        return this.__ICompositionMipmapSurface.get_AlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        if (!this.HasProp("__ICompositionMipmapSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionMipmapSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMipmapSurface := ICompositionMipmapSurface(outPtr)
        }

        return this.__ICompositionMipmapSurface.get_PixelFormat()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SizeInt32() {
        if (!this.HasProp("__ICompositionMipmapSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionMipmapSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMipmapSurface := ICompositionMipmapSurface(outPtr)
        }

        return this.__ICompositionMipmapSurface.get_SizeInt32()
    }

    /**
     * Retrieves the texture at the specified level of the mipmap.
     * @param {Integer} level The level from which to retrieve the texture.
     * @returns {CompositionDrawingSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionmipmapsurface.getdrawingsurfaceforlevel
     */
    GetDrawingSurfaceForLevel(level) {
        if (!this.HasProp("__ICompositionMipmapSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionMipmapSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionMipmapSurface := ICompositionMipmapSurface(outPtr)
        }

        return this.__ICompositionMipmapSurface.GetDrawingSurfaceForLevel(level)
    }

;@endregion Instance Methods
}
