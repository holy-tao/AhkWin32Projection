#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IPopupThemeTransition.ahk
#Include .\IPopupThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior that applies to pop-in components of controls (for example, tooltip-like UI on an object) as they appear.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popupthemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PopupThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPopupThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPopupThemeTransition.IID

    /**
     * Identifies the [FromHorizontalOffset](popupthemetransition_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popupthemetransition.fromhorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromHorizontalOffsetProperty {
        get => PopupThemeTransition.get_FromHorizontalOffsetProperty()
    }

    /**
     * Identifies the [FromVerticalOffset](popupthemetransition_fromverticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popupthemetransition.fromverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromVerticalOffsetProperty {
        get => PopupThemeTransition.get_FromVerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromHorizontalOffsetProperty() {
        if (!PopupThemeTransition.HasProp("__IPopupThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopupThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupThemeTransitionStatics.IID)
            PopupThemeTransition.__IPopupThemeTransitionStatics := IPopupThemeTransitionStatics(factoryPtr)
        }

        return PopupThemeTransition.__IPopupThemeTransitionStatics.get_FromHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromVerticalOffsetProperty() {
        if (!PopupThemeTransition.HasProp("__IPopupThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopupThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopupThemeTransitionStatics.IID)
            PopupThemeTransition.__IPopupThemeTransitionStatics := IPopupThemeTransitionStatics(factoryPtr)
        }

        return PopupThemeTransition.__IPopupThemeTransitionStatics.get_FromVerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popupthemetransition.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
        set => this.put_FromHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popupthemetransition.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
        set => this.put_FromVerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PopUpThemeTransition](popupthemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopupThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
        if (!this.HasProp("__IPopupThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPopupThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupThemeTransition := IPopupThemeTransition(outPtr)
        }

        return this.__IPopupThemeTransition.get_FromHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromHorizontalOffset(value) {
        if (!this.HasProp("__IPopupThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPopupThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupThemeTransition := IPopupThemeTransition(outPtr)
        }

        return this.__IPopupThemeTransition.put_FromHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__IPopupThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPopupThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupThemeTransition := IPopupThemeTransition(outPtr)
        }

        return this.__IPopupThemeTransition.get_FromVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromVerticalOffset(value) {
        if (!this.HasProp("__IPopupThemeTransition")) {
            if ((queryResult := this.QueryInterface(IPopupThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupThemeTransition := IPopupThemeTransition(outPtr)
        }

        return this.__IPopupThemeTransition.put_FromVerticalOffset(value)
    }

;@endregion Instance Methods
}
