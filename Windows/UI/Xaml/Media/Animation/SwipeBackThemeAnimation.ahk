#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\ISwipeBackThemeAnimation.ahk
#Include .\ISwipeBackThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to controls when an element slides back into its layout slot after a **Swipe** interaction.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SwipeBackThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeBackThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeBackThemeAnimation.IID

    /**
     * Identifies the [TargetName](swipebackthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => SwipeBackThemeAnimation.get_TargetNameProperty()
    }

    /**
     * Identifies the [FromHorizontalOffset](swipebackthemeanimation_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.fromhorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromHorizontalOffsetProperty {
        get => SwipeBackThemeAnimation.get_FromHorizontalOffsetProperty()
    }

    /**
     * Identifies the [FromHorizontalOffset](swipebackthemeanimation_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.fromverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromVerticalOffsetProperty {
        get => SwipeBackThemeAnimation.get_FromVerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!SwipeBackThemeAnimation.HasProp("__ISwipeBackThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeBackThemeAnimationStatics.IID)
            SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics := ISwipeBackThemeAnimationStatics(factoryPtr)
        }

        return SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromHorizontalOffsetProperty() {
        if (!SwipeBackThemeAnimation.HasProp("__ISwipeBackThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeBackThemeAnimationStatics.IID)
            SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics := ISwipeBackThemeAnimationStatics(factoryPtr)
        }

        return SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics.get_FromHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromVerticalOffsetProperty() {
        if (!SwipeBackThemeAnimation.HasProp("__ISwipeBackThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeBackThemeAnimationStatics.IID)
            SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics := ISwipeBackThemeAnimationStatics(factoryPtr)
        }

        return SwipeBackThemeAnimation.__ISwipeBackThemeAnimationStatics.get_FromVerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
        set => this.put_FromHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipebackthemeanimation.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
        set => this.put_FromVerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SwipeBackThemeAnimation](swipebackthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeBackThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.put_TargetName(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.get_FromHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromHorizontalOffset(value) {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.put_FromHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.get_FromVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromVerticalOffset(value) {
        if (!this.HasProp("__ISwipeBackThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeBackThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeBackThemeAnimation := ISwipeBackThemeAnimation(outPtr)
        }

        return this.__ISwipeBackThemeAnimation.put_FromVerticalOffset(value)
    }

;@endregion Instance Methods
}
