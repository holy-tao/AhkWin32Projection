#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGeometry.ahk
#Include .\ICompositionRectangleGeometry.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!WARNING]
  * > This API contains a known issue in Windows 10, versions 2004 and below. Don't use this API in your code.
  * 
  * Represents a rectangle shape of the specified size. To obtain a **CompositionRectangleGeometry** instance, call [Compositor.CreateRectangleGeometry](/uwp/api/windows.ui.composition.compositor.createrectanglegeometry).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionrectanglegeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionRectangleGeometry extends CompositionGeometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionRectangleGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionRectangleGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the offset of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionrectanglegeometry.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * Gets or sets the height and width of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionrectanglegeometry.size
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
    get_Offset() {
        if (!this.HasProp("__ICompositionRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRectangleGeometry := ICompositionRectangleGeometry(outPtr)
        }

        return this.__ICompositionRectangleGeometry.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRectangleGeometry := ICompositionRectangleGeometry(outPtr)
        }

        return this.__ICompositionRectangleGeometry.put_Offset(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Size() {
        if (!this.HasProp("__ICompositionRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRectangleGeometry := ICompositionRectangleGeometry(outPtr)
        }

        return this.__ICompositionRectangleGeometry.get_Size()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__ICompositionRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionRectangleGeometry := ICompositionRectangleGeometry(outPtr)
        }

        return this.__ICompositionRectangleGeometry.put_Size(value)
    }

;@endregion Instance Methods
}
