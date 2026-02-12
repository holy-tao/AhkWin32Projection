#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\ISwipeHintThemeAnimation.ahk
#Include .\ISwipeHintThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that indicates that a **Swipe** gesture is now possible.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SwipeHintThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeHintThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeHintThemeAnimation.IID

    /**
     * Identifies the [TargetName](swipehintthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => SwipeHintThemeAnimation.get_TargetNameProperty()
    }

    /**
     * Identifies the [ToHorizontalOffset](swipehintthemeanimation_tohorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.tohorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static ToHorizontalOffsetProperty {
        get => SwipeHintThemeAnimation.get_ToHorizontalOffsetProperty()
    }

    /**
     * Identifies the [ToVerticalOffset](swipehintthemeanimation_toverticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.toverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static ToVerticalOffsetProperty {
        get => SwipeHintThemeAnimation.get_ToVerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!SwipeHintThemeAnimation.HasProp("__ISwipeHintThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeHintThemeAnimationStatics.IID)
            SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics := ISwipeHintThemeAnimationStatics(factoryPtr)
        }

        return SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToHorizontalOffsetProperty() {
        if (!SwipeHintThemeAnimation.HasProp("__ISwipeHintThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeHintThemeAnimationStatics.IID)
            SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics := ISwipeHintThemeAnimationStatics(factoryPtr)
        }

        return SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics.get_ToHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ToVerticalOffsetProperty() {
        if (!SwipeHintThemeAnimation.HasProp("__ISwipeHintThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISwipeHintThemeAnimationStatics.IID)
            SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics := ISwipeHintThemeAnimationStatics(factoryPtr)
        }

        return SwipeHintThemeAnimation.__ISwipeHintThemeAnimationStatics.get_ToVerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.tohorizontaloffset
     * @type {Float} 
     */
    ToHorizontalOffset {
        get => this.get_ToHorizontalOffset()
        set => this.put_ToHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.swipehintthemeanimation.toverticaloffset
     * @type {Float} 
     */
    ToVerticalOffset {
        get => this.get_ToVerticalOffset()
        set => this.put_ToVerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SwipeHintThemeAnimation](swipehintthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SwipeHintThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.put_TargetName(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ToHorizontalOffset() {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.get_ToHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ToHorizontalOffset(value) {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.put_ToHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ToVerticalOffset() {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.get_ToVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ToVerticalOffset(value) {
        if (!this.HasProp("__ISwipeHintThemeAnimation")) {
            if ((queryResult := this.QueryInterface(ISwipeHintThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeHintThemeAnimation := ISwipeHintThemeAnimation(outPtr)
        }

        return this.__ISwipeHintThemeAnimation.put_ToVerticalOffset(value)
    }

;@endregion Instance Methods
}
