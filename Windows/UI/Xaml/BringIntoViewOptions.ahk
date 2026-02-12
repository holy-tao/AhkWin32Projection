#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBringIntoViewOptions.ahk
#Include .\IBringIntoViewOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the options that can be applied when an element is brought into view.
 * @remarks
 * For more info, see the [UIElement.StartBringIntoView](uielement_startbringintoview_713992446.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class BringIntoViewOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBringIntoViewOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBringIntoViewOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether to use animation when the element is brought into view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.animationdesired
     * @type {Boolean} 
     */
    AnimationDesired {
        get => this.get_AnimationDesired()
        set => this.put_AnimationDesired(value)
    }

    /**
     * Gets or sets the area of an element to bring into view.
     * @remarks
     * Set the TargetRect to specify a particular part of an element to be brought into view. For example, if you need to scroll a large image into view, you could define a specific part of the image that should be made visible. If the TargetRect is **null**, the element's bounding rect is used as the target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.targetrect
     * @type {IReference<RECT>} 
     */
    TargetRect {
        get => this.get_TargetRect()
        set => this.put_TargetRect(value)
    }

    /**
     * Controls the positioning of the vertical axis of the TargetRect with respect to the vertical axis of the viewport. The value is clamped from 0.0f to 1.0f with 0.0f representing the left vertical edge and 1.0f representing the right vertical edge. By default this is set to 0.0f.
     * @remarks
     * A value of 0.0f indicate the TargetRect should be left-aligned in the viewport. A value of 1.0f indicates it should be right-aligned. A value of 0.5 indicates the TargetRect is horizontally centered in the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.horizontalalignmentratio
     * @type {Float} 
     */
    HorizontalAlignmentRatio {
        get => this.get_HorizontalAlignmentRatio()
        set => this.put_HorizontalAlignmentRatio(value)
    }

    /**
     * Controls the positioning of the horizontal axis of the TargetRect with respect to the horizontal axis of the viewport. The value is clamped from 0.0f to 1.0f with 0.0f representing the top horizontal edge and 1.0f representing the bottom horizontal edge. By default this is set to 0.0f.
     * @remarks
     * A value of 0.0f indicates the TargetRect should be top-aligned in the viewport. A value of 1.0f indicates it should be bottom-aligned. A value of 0.5 indicates the TargetRect is vertically centered in the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.verticalalignmentratio
     * @type {Float} 
     */
    VerticalAlignmentRatio {
        get => this.get_VerticalAlignmentRatio()
        set => this.put_VerticalAlignmentRatio(value)
    }

    /**
     * Gets or sets the horizontal distance to add to the viewport-relative position of the TargetRect after satisfying the requested [HorizontalAlignmentRatio](bringintoviewoptions_horizontalalignmentratio.md).
     * @remarks
     * This provides a simple way to position an element a certain amount from the left or right edge of the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
        set => this.put_HorizontalOffset(value)
    }

    /**
     * Gets or sets the vertical distance to add to the viewport-relative position of the TargetRect after satisfying the requested [VerticalAlignmentRatio](bringintoviewoptions_verticalalignmentratio.md).
     * @remarks
     * This provides a simple way to position an element a certain amount from the top or bottom edge of the viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bringintoviewoptions.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
        set => this.put_VerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BringIntoViewOptions](bringintoviewoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.BringIntoViewOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AnimationDesired() {
        if (!this.HasProp("__IBringIntoViewOptions")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions := IBringIntoViewOptions(outPtr)
        }

        return this.__IBringIntoViewOptions.get_AnimationDesired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AnimationDesired(value) {
        if (!this.HasProp("__IBringIntoViewOptions")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions := IBringIntoViewOptions(outPtr)
        }

        return this.__IBringIntoViewOptions.put_AnimationDesired(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_TargetRect() {
        if (!this.HasProp("__IBringIntoViewOptions")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions := IBringIntoViewOptions(outPtr)
        }

        return this.__IBringIntoViewOptions.get_TargetRect()
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_TargetRect(value) {
        if (!this.HasProp("__IBringIntoViewOptions")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions := IBringIntoViewOptions(outPtr)
        }

        return this.__IBringIntoViewOptions.put_TargetRect(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalAlignmentRatio() {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.get_HorizontalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalAlignmentRatio(value) {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.put_HorizontalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalAlignmentRatio() {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.get_VerticalAlignmentRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalAlignmentRatio(value) {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.put_VerticalAlignmentRatio(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalOffset() {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.get_HorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalOffset(value) {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.put_HorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.get_VerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalOffset(value) {
        if (!this.HasProp("__IBringIntoViewOptions2")) {
            if ((queryResult := this.QueryInterface(IBringIntoViewOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBringIntoViewOptions2 := IBringIntoViewOptions2(outPtr)
        }

        return this.__IBringIntoViewOptions2.put_VerticalOffset(value)
    }

;@endregion Instance Methods
}
