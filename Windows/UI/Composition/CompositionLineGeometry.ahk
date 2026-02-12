#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionGeometry.ahk
#Include .\ICompositionLineGeometry.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a straight line between two points.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlinegeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionLineGeometry extends CompositionGeometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionLineGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionLineGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the starting point of the line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlinegeometry.start
     * @type {Vector2} 
     */
    Start {
        get => this.get_Start()
        set => this.put_Start(value)
    }

    /**
     * Gets or sets the end point of the line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionlinegeometry.end
     * @type {Vector2} 
     */
    End {
        get => this.get_End()
        set => this.put_End(value)
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
    get_Start() {
        if (!this.HasProp("__ICompositionLineGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionLineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLineGeometry := ICompositionLineGeometry(outPtr)
        }

        return this.__ICompositionLineGeometry.get_Start()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Start(value) {
        if (!this.HasProp("__ICompositionLineGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionLineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLineGeometry := ICompositionLineGeometry(outPtr)
        }

        return this.__ICompositionLineGeometry.put_Start(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_End() {
        if (!this.HasProp("__ICompositionLineGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionLineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLineGeometry := ICompositionLineGeometry(outPtr)
        }

        return this.__ICompositionLineGeometry.get_End()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_End(value) {
        if (!this.HasProp("__ICompositionLineGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionLineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionLineGeometry := ICompositionLineGeometry(outPtr)
        }

        return this.__ICompositionLineGeometry.put_End(value)
    }

;@endregion Instance Methods
}
