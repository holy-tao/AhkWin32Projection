#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGeometry.ahk
#Include .\ICompositionRoundedRectangleGeometry.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a rectangle shape of the specified size with rounded corners.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionroundedrectanglegeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionRoundedRectangleGeometry extends CompositionGeometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionRoundedRectangleGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionRoundedRectangleGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the degree to which the corners are rounded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionroundedrectanglegeometry.cornerradius
     * @type {Vector2} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the offset of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionroundedrectanglegeometry.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * Gets or sets the height and width of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionroundedrectanglegeometry.size
     * @type {Vector2} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
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
    get_CornerRadius() {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.get_CornerRadius()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.put_Offset(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Size() {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.get_Size()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__ICompositionRoundedRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRoundedRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRoundedRectangleGeometry := ICompositionRoundedRectangleGeometry(outPtr)
        }

        return this.__ICompositionRoundedRectangleGeometry.put_Size(value)
    }

;@endregion Instance Methods
}
