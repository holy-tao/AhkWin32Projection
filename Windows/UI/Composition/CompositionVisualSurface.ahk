#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionVisualSurface.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a visual tree as an ICompositionSurface that can be used to paint a Visual using a CompositionBrush.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvisualsurface
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionVisualSurface extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionVisualSurface

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionVisualSurface.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the root of the visual tree that is the target of the visual surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvisualsurface.sourcevisual
     * @type {Visual} 
     */
    SourceVisual {
        get => this.get_SourceVisual()
        set => this.put_SourceVisual(value)
    }

    /**
     * Gets or sets the coordinates of the top-left corner of the part of the visual surface used for rendering.
     * @remarks
     * The coordinates are relative to the source visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvisualsurface.sourceoffset
     * @type {Vector2} 
     */
    SourceOffset {
        get => this.get_SourceOffset()
        set => this.put_SourceOffset(value)
    }

    /**
     * Gets or sets the the height and width of the part of the visual surface used for rendering.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionvisualsurface.sourcesize
     * @type {Vector2} 
     */
    SourceSize {
        get => this.get_SourceSize()
        set => this.put_SourceSize(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_SourceVisual() {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.get_SourceVisual()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_SourceVisual(value) {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.put_SourceVisual(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_SourceOffset() {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.get_SourceOffset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_SourceOffset(value) {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.put_SourceOffset(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_SourceSize() {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.get_SourceSize()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_SourceSize(value) {
        if (!this.HasProp("__ICompositionVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositionVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionVisualSurface := ICompositionVisualSurface(outPtr)
        }

        return this.__ICompositionVisualSurface.put_SourceSize(value)
    }

;@endregion Instance Methods
}
