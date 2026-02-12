#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGradientBrush.ahk
#Include .\ICompositionLinearGradientBrush.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a brush that paints an area with a linear gradient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlineargradientbrush
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionLinearGradientBrush extends CompositionGradientBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionLinearGradientBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionLinearGradientBrush.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the ending two-dimensional coordinates of the linear gradient.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlineargradientbrush.endpoint
     * @type {Vector2} 
     */
    EndPoint {
        get => this.get_EndPoint()
        set => this.put_EndPoint(value)
    }

    /**
     * Gets or sets the starting two-dimensional coordinates of the linear gradient.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlineargradientbrush.startpoint
     * @type {Vector2} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_EndPoint() {
        if (!this.HasProp("__ICompositionLinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionLinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLinearGradientBrush := ICompositionLinearGradientBrush(outPtr)
        }

        return this.__ICompositionLinearGradientBrush.get_EndPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_EndPoint(value) {
        if (!this.HasProp("__ICompositionLinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionLinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLinearGradientBrush := ICompositionLinearGradientBrush(outPtr)
        }

        return this.__ICompositionLinearGradientBrush.put_EndPoint(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_StartPoint() {
        if (!this.HasProp("__ICompositionLinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionLinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLinearGradientBrush := ICompositionLinearGradientBrush(outPtr)
        }

        return this.__ICompositionLinearGradientBrush.get_StartPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_StartPoint(value) {
        if (!this.HasProp("__ICompositionLinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ICompositionLinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLinearGradientBrush := ICompositionLinearGradientBrush(outPtr)
        }

        return this.__ICompositionLinearGradientBrush.put_StartPoint(value)
    }

;@endregion Instance Methods
}
