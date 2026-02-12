#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionColorGradientStop.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the location and color of a transition point in a gradient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorgradientstop
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionColorGradientStop extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionColorGradientStop

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionColorGradientStop.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the color of the gradient stop.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorgradientstop.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the location of the gradient stop within the gradient vector.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncolorgradientstop.offset
     * @type {Float} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__ICompositionColorGradientStop")) {
            if ((queryResult := this.QueryInterface(ICompositionColorGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorGradientStop := ICompositionColorGradientStop(outPtr)
        }

        return this.__ICompositionColorGradientStop.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ICompositionColorGradientStop")) {
            if ((queryResult := this.QueryInterface(ICompositionColorGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorGradientStop := ICompositionColorGradientStop(outPtr)
        }

        return this.__ICompositionColorGradientStop.put_Color(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionColorGradientStop")) {
            if ((queryResult := this.QueryInterface(ICompositionColorGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorGradientStop := ICompositionColorGradientStop(outPtr)
        }

        return this.__ICompositionColorGradientStop.get_Offset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionColorGradientStop")) {
            if ((queryResult := this.QueryInterface(ICompositionColorGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionColorGradientStop := ICompositionColorGradientStop(outPtr)
        }

        return this.__ICompositionColorGradientStop.put_Offset(value)
    }

;@endregion Instance Methods
}
