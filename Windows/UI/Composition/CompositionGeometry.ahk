#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionGeometry.ahk
#Include .\ICompositionGeometryFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base class for composition geometries.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometry
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionGeometry extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionGeometry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the amount to trim the end of the geometry path.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometry.trimend
     * @type {Float} 
     */
    TrimEnd {
        get => this.get_TrimEnd()
        set => this.put_TrimEnd(value)
    }

    /**
     * Gets or sets the amount to offset trimming the geometry path.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometry.trimoffset
     * @type {Float} 
     */
    TrimOffset {
        get => this.get_TrimOffset()
        set => this.put_TrimOffset(value)
    }

    /**
     * Gets or sets the amount to trim the start of the geometry path.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositiongeometry.trimstart
     * @type {Float} 
     */
    TrimStart {
        get => this.get_TrimStart()
        set => this.put_TrimStart(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TrimEnd() {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.get_TrimEnd()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TrimEnd(value) {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.put_TrimEnd(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TrimOffset() {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.get_TrimOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TrimOffset(value) {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.put_TrimOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TrimStart() {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.get_TrimStart()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TrimStart(value) {
        if (!this.HasProp("__ICompositionGeometry")) {
            if ((queryResult := this.QueryInterface(ICompositionGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionGeometry := ICompositionGeometry(outPtr)
        }

        return this.__ICompositionGeometry.put_TrimStart(value)
    }

;@endregion Instance Methods
}
