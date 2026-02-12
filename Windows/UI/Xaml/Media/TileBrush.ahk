#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Brush.ahk
#Include .\ITileBrush.ahk
#Include .\ITileBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Base class that describes a way to paint a region. Parent of [ImageBrush](imagebrush.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class TileBrush extends Brush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITileBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITileBrush.IID

    /**
     * Identifies the [AlignmentX](tilebrush_alignmentx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.alignmentxproperty
     * @type {DependencyProperty} 
     */
    static AlignmentXProperty {
        get => TileBrush.get_AlignmentXProperty()
    }

    /**
     * Identifies the [AlignmentY](tilebrush_alignmenty.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.alignmentyproperty
     * @type {DependencyProperty} 
     */
    static AlignmentYProperty {
        get => TileBrush.get_AlignmentYProperty()
    }

    /**
     * Identifies the [Stretch](tilebrush_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => TileBrush.get_StretchProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignmentXProperty() {
        if (!TileBrush.HasProp("__ITileBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TileBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileBrushStatics.IID)
            TileBrush.__ITileBrushStatics := ITileBrushStatics(factoryPtr)
        }

        return TileBrush.__ITileBrushStatics.get_AlignmentXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignmentYProperty() {
        if (!TileBrush.HasProp("__ITileBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TileBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileBrushStatics.IID)
            TileBrush.__ITileBrushStatics := ITileBrushStatics(factoryPtr)
        }

        return TileBrush.__ITileBrushStatics.get_AlignmentYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!TileBrush.HasProp("__ITileBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TileBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITileBrushStatics.IID)
            TileBrush.__ITileBrushStatics := ITileBrushStatics(factoryPtr)
        }

        return TileBrush.__ITileBrushStatics.get_StretchProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the horizontal alignment of content in the [TileBrush](tilebrush.md) base tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.alignmentx
     * @type {Integer} 
     */
    AlignmentX {
        get => this.get_AlignmentX()
        set => this.put_AlignmentX(value)
    }

    /**
     * Gets or sets the vertical alignment of content in the [TileBrush](tilebrush.md) base tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.alignmenty
     * @type {Integer} 
     */
    AlignmentY {
        get => this.get_AlignmentY()
        set => this.put_AlignmentY(value)
    }

    /**
     * Gets or sets a value that specifies how the content of this [TileBrush](tilebrush.md) stretches to fit its tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.tilebrush.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlignmentX() {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.get_AlignmentX()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlignmentX(value) {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.put_AlignmentX(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlignmentY() {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.get_AlignmentY()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlignmentY(value) {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.put_AlignmentY(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__ITileBrush")) {
            if ((queryResult := this.QueryInterface(ITileBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITileBrush := ITileBrush(outPtr)
        }

        return this.__ITileBrush.put_Stretch(value)
    }

;@endregion Instance Methods
}
