#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionViewBox.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a container that maps shape visual tree coordinates onto the visual.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionViewBox extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionViewBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionViewBox.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the horizontal alignment ratio of the view box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox.horizontalalignmentratio
     * @type {Float} 
     */
    HorizontalAlignmentRatio {
        get => this.get_HorizontalAlignmentRatio()
        set => this.put_HorizontalAlignmentRatio(value)
    }

    /**
     * Gets or sets the offset of the view box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox.offset
     * @type {Vector2} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * Gets or sets the height and width of the view box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox.size
     * @type {Vector2} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets or sets a value that specifies how content fits into the available space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets or sets the vertical alignment ratio of the view box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionviewbox.verticalalignmentratio
     * @type {Float} 
     */
    VerticalAlignmentRatio {
        get => this.get_VerticalAlignmentRatio()
        set => this.put_VerticalAlignmentRatio(value)
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
    get_HorizontalAlignmentRatio() {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.get_HorizontalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAlignmentRatio(value) {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.put_HorizontalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Offset() {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.get_Offset()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.put_Offset(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Size() {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.get_Size()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.put_Size(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.put_Stretch(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAlignmentRatio() {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.get_VerticalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalAlignmentRatio(value) {
        if (!this.HasProp("__ICompositionViewBox")) {
            if ((queryResult := this.QueryInterface(ICompositionViewBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionViewBox := ICompositionViewBox(outPtr)
        }

        return this.__ICompositionViewBox.put_VerticalAlignmentRatio(value)
    }

;@endregion Instance Methods
}
