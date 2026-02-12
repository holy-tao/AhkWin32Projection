#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationTransitionInfo.ahk
#Include .\ISlideNavigationTransitionInfo.ahk
#Include .\ISlideNavigationTransitionInfo2.ahk
#Include .\ISlideNavigationTransitionInfoStatics2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the parameters for a slide navigation transition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.slidenavigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class SlideNavigationTransitionInfo extends NavigationTransitionInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISlideNavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISlideNavigationTransitionInfo.IID

    /**
     * Identifies the Effect dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.slidenavigationtransitioninfo.effectproperty
     * @type {DependencyProperty} 
     */
    static EffectProperty {
        get => SlideNavigationTransitionInfo.get_EffectProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EffectProperty() {
        if (!SlideNavigationTransitionInfo.HasProp("__ISlideNavigationTransitionInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SlideNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISlideNavigationTransitionInfoStatics2.IID)
            SlideNavigationTransitionInfo.__ISlideNavigationTransitionInfoStatics2 := ISlideNavigationTransitionInfoStatics2(factoryPtr)
        }

        return SlideNavigationTransitionInfo.__ISlideNavigationTransitionInfoStatics2.get_EffectProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of animation effect to play during the slide transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.slidenavigationtransitioninfo.effect
     * @type {Integer} 
     */
    Effect {
        get => this.get_Effect()
        set => this.put_Effect(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **SlideNavigationTransitionInfo** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.SlideNavigationTransitionInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Effect() {
        if (!this.HasProp("__ISlideNavigationTransitionInfo2")) {
            if ((queryResult := this.QueryInterface(ISlideNavigationTransitionInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlideNavigationTransitionInfo2 := ISlideNavigationTransitionInfo2(outPtr)
        }

        return this.__ISlideNavigationTransitionInfo2.get_Effect()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Effect(value) {
        if (!this.HasProp("__ISlideNavigationTransitionInfo2")) {
            if ((queryResult := this.QueryInterface(ISlideNavigationTransitionInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISlideNavigationTransitionInfo2 := ISlideNavigationTransitionInfo2(outPtr)
        }

        return this.__ISlideNavigationTransitionInfo2.put_Effect(value)
    }

;@endregion Instance Methods
}
