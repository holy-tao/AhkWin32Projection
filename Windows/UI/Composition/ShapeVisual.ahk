#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContainerVisual.ahk
#Include .\IShapeVisual.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a visual tree node that is the root of a CompositionShape.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.shapevisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ShapeVisual extends ContainerVisual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShapeVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShapeVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of CompositionShapes that this shape visual tree is composed of.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.shapevisual.shapes
     * @type {CompositionShapeCollection} 
     */
    Shapes {
        get => this.get_Shapes()
    }

    /**
     * Gets or sets the CompositionViewBox that maps shape visual tree coordinates onto the visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.shapevisual.viewbox
     * @type {CompositionViewBox} 
     */
    ViewBox {
        get => this.get_ViewBox()
        set => this.put_ViewBox(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionShapeCollection} 
     */
    get_Shapes() {
        if (!this.HasProp("__IShapeVisual")) {
            if ((queryResult := this.QueryInterface(IShapeVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShapeVisual := IShapeVisual(outPtr)
        }

        return this.__IShapeVisual.get_Shapes()
    }

    /**
     * 
     * @returns {CompositionViewBox} 
     */
    get_ViewBox() {
        if (!this.HasProp("__IShapeVisual")) {
            if ((queryResult := this.QueryInterface(IShapeVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShapeVisual := IShapeVisual(outPtr)
        }

        return this.__IShapeVisual.get_ViewBox()
    }

    /**
     * 
     * @param {CompositionViewBox} value 
     * @returns {HRESULT} 
     */
    put_ViewBox(value) {
        if (!this.HasProp("__IShapeVisual")) {
            if ((queryResult := this.QueryInterface(IShapeVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShapeVisual := IShapeVisual(outPtr)
        }

        return this.__IShapeVisual.put_ViewBox(value)
    }

;@endregion Instance Methods
}
