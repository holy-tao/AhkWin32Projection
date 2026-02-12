#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkPresenterRuler.ahk
#Include .\IInkPresenterStencil.ahk
#Include .\IInkPresenterRuler2.ahk
#Include .\IInkPresenterRulerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a visual stencil, in the form of a straight rule for drawing straight lines, displayed as a semi-transparent overlay on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
  * 
  * 
  * The stencil transforms how an ink stroke is rendered:
  * 
  * + It snaps the ink stroke to the stencil edge if the pen tip is within a distance threshold (gutter).
  * + It acts as a mask and prevents the drawing of an ink stroke within the area obscured by the stencil.
  * 
  * 
  * The InkPresenterRuler can be manipulated both programmatically and by the user. It also scales and translates with the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * The opacity of the stencil is set at 75% when static, and 50% during manipulation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPresenterRuler extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkPresenterRuler

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkPresenterRuler.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [InkPresenterRuler](inkpresenterruler.md) class.
     * @param {InkPresenter} inkPresenter_ The ink presenter associated with the pen input.
     * @returns {InkPresenterRuler} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.#ctor
     */
    static Create(inkPresenter_) {
        if (!InkPresenterRuler.HasProp("__IInkPresenterRulerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkPresenterRuler")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkPresenterRulerFactory.IID)
            InkPresenterRuler.__IInkPresenterRulerFactory := IInkPresenterRulerFactory(factoryPtr)
        }

        return InkPresenterRuler.__IInkPresenterRulerFactory.Create(inkPresenter_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the length of the [InkPresenterRuler](inkpresenterruler.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.length
     * @type {Float} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * Gets or sets the width of the [InkPresenterRuler](inkpresenterruler.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.width
     * @type {Float} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * Gets the type of stencil to display on the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets or sets whether the [InkPresenterRuler](inkpresenterruler.md) is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * Gets or sets the background color of the [InkPresenterRuler](inkpresenterruler.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the color of the foreground elements on an [InkPresenterRuler](inkpresenterruler.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets the position and rotation angle of the ruler stencil within the 2-D coordinate space of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * 
     * Both position and rotation are based on the top left corner of the ruler relative to the origin of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.transform
     * @type {Matrix3x2} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

    /**
     * Gets or sets whether the tick marks are displayed on the ruler stencil. 
     * 
     * ![Ruler stencil](images\stencil-ruler.png)
     * 
     * Tick marks represent the distance marks on the ruler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.aretickmarksvisible
     * @type {Boolean} 
     */
    AreTickMarksVisible {
        get => this.get_AreTickMarksVisible()
        set => this.put_AreTickMarksVisible(value)
    }

    /**
     * Gets or sets whether a compass is displayed on the ruler stencil. 
     * 
     * ![Ruler stencil](images\stencil-ruler.png)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterruler.iscompassvisible
     * @type {Boolean} 
     */
    IsCompassVisible {
        get => this.get_IsCompassVisible()
        set => this.put_IsCompassVisible(value)
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
    get_Length() {
        if (!this.HasProp("__IInkPresenterRuler")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler := IInkPresenterRuler(outPtr)
        }

        return this.__IInkPresenterRuler.get_Length()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__IInkPresenterRuler")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler := IInkPresenterRuler(outPtr)
        }

        return this.__IInkPresenterRuler.put_Length(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Width() {
        if (!this.HasProp("__IInkPresenterRuler")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler := IInkPresenterRuler(outPtr)
        }

        return this.__IInkPresenterRuler.get_Width()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Width(value) {
        if (!this.HasProp("__IInkPresenterRuler")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler := IInkPresenterRuler(outPtr)
        }

        return this.__IInkPresenterRuler.put_Width(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.get_Kind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.get_IsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVisible(value) {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.put_IsVisible(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.get_BackgroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.put_BackgroundColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.get_ForegroundColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.put_ForegroundColor(value)
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_Transform() {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.get_Transform()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_Transform(value) {
        if (!this.HasProp("__IInkPresenterStencil")) {
            if ((queryResult := this.QueryInterface(IInkPresenterStencil.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterStencil := IInkPresenterStencil(outPtr)
        }

        return this.__IInkPresenterStencil.put_Transform(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTickMarksVisible() {
        if (!this.HasProp("__IInkPresenterRuler2")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler2 := IInkPresenterRuler2(outPtr)
        }

        return this.__IInkPresenterRuler2.get_AreTickMarksVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreTickMarksVisible(value) {
        if (!this.HasProp("__IInkPresenterRuler2")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler2 := IInkPresenterRuler2(outPtr)
        }

        return this.__IInkPresenterRuler2.put_AreTickMarksVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompassVisible() {
        if (!this.HasProp("__IInkPresenterRuler2")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler2 := IInkPresenterRuler2(outPtr)
        }

        return this.__IInkPresenterRuler2.get_IsCompassVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompassVisible(value) {
        if (!this.HasProp("__IInkPresenterRuler2")) {
            if ((queryResult := this.QueryInterface(IInkPresenterRuler2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterRuler2 := IInkPresenterRuler2(outPtr)
        }

        return this.__IInkPresenterRuler2.put_IsCompassVisible(value)
    }

;@endregion Instance Methods
}
