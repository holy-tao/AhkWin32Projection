#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGeometry.ahk
#Include .\ICompositionEllipseGeometry.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an ellipse with the specified center and radius.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionellipsegeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionEllipseGeometry extends CompositionGeometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionEllipseGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionEllipseGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the center point of the ellipse.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionellipsegeometry.center
     * @type {Vector2} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * Gets or sets the radius of the ellipse.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionellipsegeometry.radius
     * @type {Vector2} 
     */
    Radius {
        get => this.get_Radius()
        set => this.put_Radius(value)
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
    get_Center() {
        if (!this.HasProp("__ICompositionEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEllipseGeometry := ICompositionEllipseGeometry(outPtr)
        }

        return this.__ICompositionEllipseGeometry.get_Center()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        if (!this.HasProp("__ICompositionEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEllipseGeometry := ICompositionEllipseGeometry(outPtr)
        }

        return this.__ICompositionEllipseGeometry.put_Center(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Radius() {
        if (!this.HasProp("__ICompositionEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEllipseGeometry := ICompositionEllipseGeometry(outPtr)
        }

        return this.__ICompositionEllipseGeometry.get_Radius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Radius(value) {
        if (!this.HasProp("__ICompositionEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionEllipseGeometry := ICompositionEllipseGeometry(outPtr)
        }

        return this.__ICompositionEllipseGeometry.put_Radius(value)
    }

;@endregion Instance Methods
}
