#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RangeBase.ahk
#Include .\IScrollBar.ahk
#Include .\IScrollBarStatics.ahk
#Include .\ScrollEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ScrollEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that provides a scroll bar that has a sliding [Thumb](thumb.md) whose position corresponds to a value.
 * @remarks
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ScrollBar extends RangeBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollBar.IID

    /**
     * Identifies the [Orientation](scrollbar_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => ScrollBar.get_OrientationProperty()
    }

    /**
     * Identifies the [ViewportSize](scrollbar_viewportsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.viewportsizeproperty
     * @type {DependencyProperty} 
     */
    static ViewportSizeProperty {
        get => ScrollBar.get_ViewportSizeProperty()
    }

    /**
     * Identifies the [IndicatorMode](scrollbar_indicatormode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.indicatormodeproperty
     * @type {DependencyProperty} 
     */
    static IndicatorModeProperty {
        get => ScrollBar.get_IndicatorModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!ScrollBar.HasProp("__IScrollBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ScrollBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollBarStatics.IID)
            ScrollBar.__IScrollBarStatics := IScrollBarStatics(factoryPtr)
        }

        return ScrollBar.__IScrollBarStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ViewportSizeProperty() {
        if (!ScrollBar.HasProp("__IScrollBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ScrollBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollBarStatics.IID)
            ScrollBar.__IScrollBarStatics := IScrollBarStatics(factoryPtr)
        }

        return ScrollBar.__IScrollBarStatics.get_ViewportSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IndicatorModeProperty() {
        if (!ScrollBar.HasProp("__IScrollBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ScrollBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScrollBarStatics.IID)
            ScrollBar.__IScrollBarStatics := IScrollBarStatics(factoryPtr)
        }

        return ScrollBar.__IScrollBarStatics.get_IndicatorModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [ScrollBar](scrollbar.md) is displayed horizontally or vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the amount of the scrollable content that is currently visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.viewportsize
     * @type {Float} 
     */
    ViewportSize {
        get => this.get_ViewportSize()
        set => this.put_ViewportSize(value)
    }

    /**
     * Gets or sets a value that results in different input indicator modes for the [ScrollBar](scrollbar.md).
     * @remarks
     * The value of this property influences transition animations that are part of the default template for [ScrollBar](scrollbar.md).
     * <!-- Does not appear that this gets set programmatically to either Mouse or Touch but does appear to get set programmatically to None.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrollbar.indicatormode
     * @type {Integer} 
     */
    IndicatorMode {
        get => this.get_IndicatorMode()
        set => this.put_IndicatorMode(value)
    }

    /**
     * Occurs one or more times as content scrolls in a [ScrollBar](scrollbar.md) when the user moves the [Thumb](thumb.md) by using the mouse.
     * @type {ScrollEventHandler}
    */
    OnScroll {
        get {
            if(!this.HasProp("__OnScroll")){
                this.__OnScroll := WinRTEventHandler(
                    ScrollEventHandler,
                    ScrollEventHandler.IID,
                    IInspectable,
                    ScrollEventArgs
                )
                this.__OnScrollToken := this.add_Scroll(this.__OnScroll.iface)
            }
            return this.__OnScroll
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScrollBar](scrollbar.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ScrollBar")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScrollToken")) {
            this.remove_Scroll(this.__OnScrollToken)
            this.__OnScroll.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.put_Orientation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ViewportSize() {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.get_ViewportSize()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ViewportSize(value) {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.put_ViewportSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IndicatorMode() {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.get_IndicatorMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IndicatorMode(value) {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.put_IndicatorMode(value)
    }

    /**
     * 
     * @param {ScrollEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Scroll(handler) {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.add_Scroll(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Scroll(token) {
        if (!this.HasProp("__IScrollBar")) {
            if ((queryResult := this.QueryInterface(IScrollBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollBar := IScrollBar(outPtr)
        }

        return this.__IScrollBar.remove_Scroll(token)
    }

;@endregion Instance Methods
}
