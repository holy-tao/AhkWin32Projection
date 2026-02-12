#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IEntranceThemeTransition.ahk
#Include .\IEntranceThemeTransitionStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior on controls when they first appear. You can use this on individual objects or on containers of objects. In the latter case, child elements will animate into view in sequence rather than all at the same time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EntranceThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEntranceThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEntranceThemeTransition.IID

    /**
     * Identifies the [FromHorizontalOffset](entrancethemetransition_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.fromhorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromHorizontalOffsetProperty {
        get => EntranceThemeTransition.get_FromHorizontalOffsetProperty()
    }

    /**
     * Identifies the [FromVerticalOffset](entrancethemetransition_fromverticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.fromverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromVerticalOffsetProperty {
        get => EntranceThemeTransition.get_FromVerticalOffsetProperty()
    }

    /**
     * Identifies the [IsStaggeringEnabled](entrancethemetransition_isstaggeringenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.isstaggeringenabledproperty
     * @type {DependencyProperty} 
     */
    static IsStaggeringEnabledProperty {
        get => EntranceThemeTransition.get_IsStaggeringEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromHorizontalOffsetProperty() {
        if (!EntranceThemeTransition.HasProp("__IEntranceThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceThemeTransitionStatics.IID)
            EntranceThemeTransition.__IEntranceThemeTransitionStatics := IEntranceThemeTransitionStatics(factoryPtr)
        }

        return EntranceThemeTransition.__IEntranceThemeTransitionStatics.get_FromHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromVerticalOffsetProperty() {
        if (!EntranceThemeTransition.HasProp("__IEntranceThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceThemeTransitionStatics.IID)
            EntranceThemeTransition.__IEntranceThemeTransitionStatics := IEntranceThemeTransitionStatics(factoryPtr)
        }

        return EntranceThemeTransition.__IEntranceThemeTransitionStatics.get_FromVerticalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStaggeringEnabledProperty() {
        if (!EntranceThemeTransition.HasProp("__IEntranceThemeTransitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceThemeTransitionStatics.IID)
            EntranceThemeTransition.__IEntranceThemeTransitionStatics := IEntranceThemeTransitionStatics(factoryPtr)
        }

        return EntranceThemeTransition.__IEntranceThemeTransitionStatics.get_IsStaggeringEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
        set => this.put_FromHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
        set => this.put_FromVerticalOffset(value)
    }

    /**
     * Gets or sets a value that determines whether the transition staggers rendering of multiple items, or renders all items at once.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancethemetransition.isstaggeringenabled
     * @type {Boolean} 
     */
    IsStaggeringEnabled {
        get => this.get_IsStaggeringEnabled()
        set => this.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EntranceThemeTransition](entrancethemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.get_FromHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromHorizontalOffset(value) {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.put_FromHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.get_FromVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromVerticalOffset(value) {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.put_FromVerticalOffset(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStaggeringEnabled() {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.get_IsStaggeringEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStaggeringEnabled(value) {
        if (!this.HasProp("__IEntranceThemeTransition")) {
            if ((queryResult := this.QueryInterface(IEntranceThemeTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEntranceThemeTransition := IEntranceThemeTransition(outPtr)
        }

        return this.__IEntranceThemeTransition.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Methods
}
