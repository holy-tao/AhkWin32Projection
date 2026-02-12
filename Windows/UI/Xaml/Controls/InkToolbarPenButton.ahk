#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarToolButton.ahk
#Include .\IInkToolbarPenButton.ahk
#Include .\IInkToolbarPenButtonFactory.ahk
#Include .\IInkToolbarPenButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for all built-in and custom pen buttons on an [InkToolbar](inktoolbar.md).
 * @remarks
 * The InkToolbarPenButton class cannot be instantiated directly. Use the various built-in and custom [InkToolbar](inktoolbar.md) pen buttons instead.
 * 
 * You must create an [InkDrawingAttributes](inktoolbar_inkdrawingattributes.md) object based on the current stroke [Size](../windows.ui.input.inking/inkdrawingattributes_size.md) and [Brush](../windows.ui.xaml.media/brush.md).
 * 
 * The size of the pen stroke is obtained from the [InkDrawingAttributes](inktoolbar_inkdrawingattributes.md) setting for [Size](../windows.ui.input.inking/inkdrawingattributes_size.md). By default, the stroke height and width are set to [Width](../windows.foundation/size.md).
 * 
 * By default, the [InkToolbar](inktoolbar.md) contains the following built-in pen buttons:
 * 
 * Radio group toggle buttons
 * 
 * + [InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md)
 * + [InkToolbarPencilButton](inktoolbarpencilbutton.md)
 * + [InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarPenButton extends InkToolbarToolButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarPenButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarPenButton.IID

    /**
     * Identifies the [Palette](inktoolbarpenbutton_palette.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.paletteproperty
     * @type {DependencyProperty} 
     */
    static PaletteProperty {
        get => InkToolbarPenButton.get_PaletteProperty()
    }

    /**
     * Identifies the [MinStrokeWidth](inktoolbarpenbutton_minstrokewidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.minstrokewidthproperty
     * @type {DependencyProperty} 
     */
    static MinStrokeWidthProperty {
        get => InkToolbarPenButton.get_MinStrokeWidthProperty()
    }

    /**
     * Identifies the [MaxStrokeWidth](inktoolbarpenbutton_maxstrokewidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.maxstrokewidthproperty
     * @type {DependencyProperty} 
     */
    static MaxStrokeWidthProperty {
        get => InkToolbarPenButton.get_MaxStrokeWidthProperty()
    }

    /**
     * Identifies the [SelectedBrush](inktoolbarpenbutton_selectedbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedbrushproperty
     * @type {DependencyProperty} 
     */
    static SelectedBrushProperty {
        get => InkToolbarPenButton.get_SelectedBrushProperty()
    }

    /**
     * Identifies the [SelectedBrushIndex](inktoolbarpenbutton_selectedbrushindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedbrushindexproperty
     * @type {DependencyProperty} 
     */
    static SelectedBrushIndexProperty {
        get => InkToolbarPenButton.get_SelectedBrushIndexProperty()
    }

    /**
     * Identifies the [SelectedStrokeWidth](inktoolbarpenbutton_selectedstrokewidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedstrokewidthproperty
     * @type {DependencyProperty} 
     */
    static SelectedStrokeWidthProperty {
        get => InkToolbarPenButton.get_SelectedStrokeWidthProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaletteProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_PaletteProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinStrokeWidthProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_MinStrokeWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxStrokeWidthProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_MaxStrokeWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBrushProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_SelectedBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedBrushIndexProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_SelectedBrushIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectedStrokeWidthProperty() {
        if (!InkToolbarPenButton.HasProp("__IInkToolbarPenButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPenButtonStatics.IID)
            InkToolbarPenButton.__IInkToolbarPenButtonStatics := IInkToolbarPenButtonStatics(factoryPtr)
        }

        return InkToolbarPenButton.__IInkToolbarPenButtonStatics.get_SelectedStrokeWidthProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of brushes available on the ink stroke configuration flyout associated with the [InkToolbarPenButton](inktoolbarpenbutton.md). An "extension glyph" is displayed on the button to indicate the existence of the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.palette
     * @type {IVector<Brush>} 
     */
    Palette {
        get => this.get_Palette()
        set => this.put_Palette(value)
    }

    /**
     * Gets or sets the minimum possible [Size](../windows.ui.input.inking/inkdrawingattributes_size.md) of an ink stroke.
     * 
     * For ballpoint pen and pencil strokes, MinStrokeWidth specifies both the minimum [Height](../windows.foundation/size.md) and [Width](../windows.foundation/size.md) of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip.
     * 
     * For highlighter strokes, MinStrokeWidth specifies the minimum height of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip, while MinStrokeWidth/3 specifies the minimum width.
     * 
     * Custom pen stroke dimensions can be set as required.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.minstrokewidth
     * @type {Float} 
     */
    MinStrokeWidth {
        get => this.get_MinStrokeWidth()
        set => this.put_MinStrokeWidth(value)
    }

    /**
     * Gets or sets the maximum possible [Size](../windows.ui.input.inking/inkdrawingattributes_size.md) of an ink stroke.
     * 
     * For ballpoint pen and pencil strokes, MaxStrokeWidth specifies both the maximum [Height](../windows.foundation/size.md) and [Width](../windows.foundation/size.md) of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip.
     * 
     * For highlighter strokes, MaxStrokeWidth specifies the maximum height of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip, while MaxStrokeWidth/3 specifies the maximum width.
     * 
     * Custom pen stroke dimensions can be set as required.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.maxstrokewidth
     * @type {Float} 
     */
    MaxStrokeWidth {
        get => this.get_MaxStrokeWidth()
        set => this.put_MaxStrokeWidth(value)
    }

    /**
     * Gets the brush used to draw the ink stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedbrush
     * @type {Brush} 
     */
    SelectedBrush {
        get => this.get_SelectedBrush()
    }

    /**
     * Gets or sets the selected brush in the [Palette](inktoolbarpenbutton_palette.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedbrushindex
     * @type {Integer} 
     */
    SelectedBrushIndex {
        get => this.get_SelectedBrushIndex()
        set => this.put_SelectedBrushIndex(value)
    }

    /**
     * Gets or sets the value that specifies the [Size](../windows.ui.input.inking/inkdrawingattributes_size.md) of the pen tip used to draw the ink stroke.
     * 
     * For ballpoint pen and pencil strokes, the stroke width specifies both the [Height](../windows.foundation/size.md) and [Width](../windows.foundation/size.md) of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip.
     * 
     * For highlighter strokes, stroke width specifies the height of a [Rectangle](../windows.ui.input.inking/pentipshape.md) pen tip, while width/3 specifies the width.
     * 
     * Custom pen stroke dimensions can be set as required.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpenbutton.selectedstrokewidth
     * @type {Float} 
     */
    SelectedStrokeWidth {
        get => this.get_SelectedStrokeWidth()
        set => this.put_SelectedStrokeWidth(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Brush>} 
     */
    get_Palette() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_Palette()
    }

    /**
     * 
     * @param {IVector<Brush>} value 
     * @returns {HRESULT} 
     */
    put_Palette(value) {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.put_Palette(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinStrokeWidth() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_MinStrokeWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinStrokeWidth(value) {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.put_MinStrokeWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxStrokeWidth() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_MaxStrokeWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxStrokeWidth(value) {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.put_MaxStrokeWidth(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_SelectedBrush() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_SelectedBrush()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedBrushIndex() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_SelectedBrushIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedBrushIndex(value) {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.put_SelectedBrushIndex(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SelectedStrokeWidth() {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.get_SelectedStrokeWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SelectedStrokeWidth(value) {
        if (!this.HasProp("__IInkToolbarPenButton")) {
            if ((queryResult := this.QueryInterface(IInkToolbarPenButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarPenButton := IInkToolbarPenButton(outPtr)
        }

        return this.__IInkToolbarPenButton.put_SelectedStrokeWidth(value)
    }

;@endregion Instance Methods
}
