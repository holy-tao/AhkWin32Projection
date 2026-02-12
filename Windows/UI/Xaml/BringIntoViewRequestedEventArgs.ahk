#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\IBringIntoViewRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [UIElement.BringIntoViewRequested](uielement_bringintoviewrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class BringIntoViewRequestedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBringIntoViewRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBringIntoViewRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the element that should be made visible in response to the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.targetelement
     * @type {UIElement} 
     */
    TargetElement {
        get => this.get_TargetElement()
        set => this.put_TargetElement(value)
    }

    /**
     * Gets or sets a value that specifies whether the scrolling should be animated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.animationdesired
     * @type {Boolean} 
     */
    AnimationDesired {
        get => this.get_AnimationDesired()
        set => this.put_AnimationDesired(value)
    }

    /**
     * Gets or sets the Rect in the TargetElement’s coordinate space to bring into view.
     * @remarks
     * If [StartBringIntoView](uielement_startbringintoview_1818344798.md) is called with a **null** TargetRect, then the TargetElement’s bounding rect is used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.targetrect
     * @type {RECT} 
     */
    TargetRect {
        get => this.get_TargetRect()
        set => this.put_TargetRect(value)
    }

    /**
     * Gets the requested horizontal alignment ratio which controls the alignment of the vertical axis of the TargetRect with respect to the vertical axis of the viewport.
     * @remarks
     * A value of NaN indicates that scrolling controls should do the minimum necessary to bring the element fully into view aligned to the nearest edge of the viewport.
     * 
     * > [!NOTE]
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * 
     * If the value is not NaN, then the range of possible value is clamped from 0.0 to 1.0 with 0.0 representing the left vertical edge and 1.0 representing the right vertical edge.
     * 
     * A value of 0.0 indicates the TargetRect should be left-aligned in the viewport. A value of 1.0 indicates it should be right-aligned. A value of 0.5 indicates the TargetRect should be horizontally centered in the viewport.
     * 
     * All scrolling controls that participate in bringing an element into view are expected to honor the alignment request to the extent possible. This value cannot be modified by event handlers as the event bubbles. If a control cannot fully satisfy the request then it should not alter the requested [HorizontalOffset](bringintoviewrequestedeventargs_horizontaloffset.md) property as it bubbles up.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.horizontalalignmentratio
     * @type {Float} 
     */
    HorizontalAlignmentRatio {
        get => this.get_HorizontalAlignmentRatio()
    }

    /**
     * Gets the requested vertical alignment ratio which controls the alignment of the horizontal axis of the TargetRect with respect to the horizontal axis of the viewport.
     * @remarks
     * A value of NaN indicates that scrolling controls should do the minimum necessary to bring the element fully into view aligned to the nearest edge of the viewport.
     * 
     * > [!NOTE]
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * 
     * If the value is not NaN, then the range of possible value is clamped from 0.0 to 1.0 with 0.0 representing the top horizontal edge and 1.0 representing the bottom horizontal edge.
     * 
     * A value of 0.0 indicates the TargetRect should be top-aligned in the viewport. A value of 1.0 indicates it should be bottom-aligned. A value of 0.5 indicates the TargetRect should be vertically centered in the viewport.
     * 
     * All scrolling controls that participate in bringing an element into view are expected to honor the alignment request to the extent possible. This value cannot be modified by event handlers as the event bubbles. If a control cannot fully satisfy the request then it should not alter the requested [VerticalOffset](bringintoviewrequestedeventargs_verticaloffset.md) property as it bubbles up.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.verticalalignmentratio
     * @type {Float} 
     */
    VerticalAlignmentRatio {
        get => this.get_VerticalAlignmentRatio()
    }

    /**
     * Gets or sets the horizontal distance to add to the viewport-relative position of the TargetRect after satisfying the requested [HorizontalAlignmentRatio](bringintoviewrequestedeventargs_horizontalalignmentratio.md).
     * @remarks
     * This value can be modified by event handlers as the event bubbles. A scrolling control that partially or fully satisfies the request will adjust the requested HorizontalOffset to reflect the remaining amount that it could not satisfy.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * Gets or sets the vertical distance to add to the viewport-relative position of the TargetRect after satisfying the requested [VerticalAlignmentRatio](bringintoviewrequestedeventargs_verticalalignmentratio.md).
     * @remarks
     * This value can be modified by event handlers as the event bubbles. A scrolling control that partially or fully satisfies the request will adjust the requested VerticalOffset to reflect the remaining amount that it could not satisfy.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_TargetElement() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_TargetElement()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_TargetElement(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_TargetElement(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AnimationDesired() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_AnimationDesired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AnimationDesired(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_AnimationDesired(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_TargetRect() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_TargetRect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_TargetRect(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_TargetRect(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAlignmentRatio() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_HorizontalAlignmentRatio()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAlignmentRatio() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_VerticalAlignmentRatio()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_HorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_HorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_VerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_VerticalOffset(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IBringIntoViewRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewRequestedEventArgs := IBringIntoViewRequestedEventArgs(outPtr)
        }

        return this.__IBringIntoViewRequestedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
