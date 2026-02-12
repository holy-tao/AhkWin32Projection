#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkPresenterProtractor.ahk
#Include .\IInkPresenterStencil.ahk
#Include .\IInkPresenterProtractorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a visual stencil, in the form of a protractor for drawing arcs and curves, displayed as a semi-transparent overlay on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
  * 
  * The stencil transforms how an ink stroke is rendered:
  * 
  * - It snaps the ink stroke to the stencil edge if the pen tip is within a distance threshold (gutter).
  * - It acts as a mask and prevents the drawing of an ink stroke within the area obscured by the stencil.
  * 
  * 
  * The [InkPresenterRuler](inkpresenterruler.md) can be manipulated both programmatically and by the user. It also scales and translates with the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * The opacity of the stencil is set at 75% when static, and 50% during manipulation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPresenterProtractor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkPresenterProtractor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkPresenterProtractor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [InkPresenterProtractor](inkpresenterprotractor.md) class.
     * @param {InkPresenter} inkPresenter_ The ink presenter associated with the pen input.
     * @returns {InkPresenterProtractor} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.#ctor
     */
    static Create(inkPresenter_) {
        if (!InkPresenterProtractor.HasProp("__IInkPresenterProtractorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkPresenterProtractor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkPresenterProtractorFactory.IID)
            InkPresenterProtractor.__IInkPresenterProtractorFactory := IInkPresenterProtractorFactory(factoryPtr)
        }

        return InkPresenterProtractor.__IInkPresenterProtractorFactory.Create(inkPresenter_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the tick marks are displayed on the protractor stencil. 
     * 
     * ![Protractor stencil](images\stencil-protractor.png)
     * 
     * Tick marks represent the degree marks on the protractor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.aretickmarksvisible
     * @type {Boolean} 
     */
    AreTickMarksVisible {
        get => this.get_AreTickMarksVisible()
        set => this.put_AreTickMarksVisible(value)
    }

    /**
     * Gets or sets whether the rays are displayed on the protractor stencil. 
     * 
     * ![Protractor stencil](images\stencil-protractor.png)
     * 
     * Rays represent the angle of the drawn arc. They are visible only when ink is snapped to the protractor and the protractor has not been moved.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.areraysvisible
     * @type {Boolean} 
     */
    AreRaysVisible {
        get => this.get_AreRaysVisible()
        set => this.put_AreRaysVisible(value)
    }

    /**
     * Gets or sets whether the center mark is displayed on the protractor stencil. 
     * 
     * ![Protractor stencil](images\stencil-protractor.png)
     * 
     * The center mark represents the visual in the center of the protractor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.iscentermarkervisible
     * @type {Boolean} 
     */
    IsCenterMarkerVisible {
        get => this.get_IsCenterMarkerVisible()
        set => this.put_IsCenterMarkerVisible(value)
    }

    /**
     * Gets or sets whether the numerical angle is displayed on the protractor stencil. 
     * 
     * ![Protractor stencil](images\stencil-protractor.png)
     * 
     * The angle readout represents the numeric value for the angle of the drawn arc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.isanglereadoutvisible
     * @type {Boolean} 
     */
    IsAngleReadoutVisible {
        get => this.get_IsAngleReadoutVisible()
        set => this.put_IsAngleReadoutVisible(value)
    }

    /**
     * Gets or sets whether the protractor stencil can be resized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.isresizable
     * @type {Boolean} 
     */
    IsResizable {
        get => this.get_IsResizable()
        set => this.put_IsResizable(value)
    }

    /**
     * Gets or sets the radial size of the protractor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.radius
     * @type {Float} 
     */
    Radius {
        get => this.get_Radius()
        set => this.put_Radius(value)
    }

    /**
     * Gets or sets the color of the rays and horizontal marks for the protractor stencil. 
     * 
     * ![Protractor stencil](images\stencil-protractor.png)
     * 
     * Rays represent the angle of the drawn arc. They are visible only when ink is snapped to the protractor and the protractor has not been moved. 
     * 
     * Horizontal marks represent a horizontal line bisecting the protractor. The default positions are 3 and 9 o’clock, but a rotation transform can be applied to the protractor, which also rotates the marks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.accentcolor
     * @type {Color} 
     */
    AccentColor {
        get => this.get_AccentColor()
        set => this.put_AccentColor(value)
    }

    /**
     * Gets the type of stencil to display on the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets or sets whether the protractor stencil is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * Gets or sets the background color of the [InkPresenterProtractor](inkpresenterprotractor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets the color of the foreground elements on an [InkPresenterProtractor](inkpresenterprotractor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets the position and rotation angle of the protractor stencil within the 2-D coordinate space of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * 
     * Both position and rotation are based on the top left corner of the stencil relative to the origin of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterprotractor.transform
     * @type {Matrix3x2} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTickMarksVisible() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_AreTickMarksVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreTickMarksVisible(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_AreTickMarksVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreRaysVisible() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_AreRaysVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreRaysVisible(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_AreRaysVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCenterMarkerVisible() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_IsCenterMarkerVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCenterMarkerVisible(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_IsCenterMarkerVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAngleReadoutVisible() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_IsAngleReadoutVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAngleReadoutVisible(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_IsAngleReadoutVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResizable() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_IsResizable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsResizable(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_IsResizable(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Radius() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_Radius()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Radius(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_Radius(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AccentColor() {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.get_AccentColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_AccentColor(value) {
        if (!this.HasProp("__IInkPresenterProtractor")) {
            if ((queryResult := this.QueryInterface(IInkPresenterProtractor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenterProtractor := IInkPresenterProtractor(outPtr)
        }

        return this.__IInkPresenterProtractor.put_AccentColor(value)
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

;@endregion Instance Methods
}
