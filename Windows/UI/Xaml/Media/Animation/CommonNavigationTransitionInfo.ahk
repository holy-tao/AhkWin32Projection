#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationTransitionInfo.ahk
#Include .\ICommonNavigationTransitionInfo.ahk
#Include .\ICommonNavigationTransitionInfoStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides common parameters for navigation transition animations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class CommonNavigationTransitionInfo extends NavigationTransitionInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommonNavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommonNavigationTransitionInfo.IID

    /**
     * Identifies the [IsStaggeringEnabled](commonnavigationtransitioninfo_isstaggeringenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo.isstaggeringenabledproperty
     * @type {DependencyProperty} 
     */
    static IsStaggeringEnabledProperty {
        get => CommonNavigationTransitionInfo.get_IsStaggeringEnabledProperty()
    }

    /**
     * Identifies the [CommonNavigationTransitionInfo.IsStaggerElement](commonnavigationtransitioninfo_isstaggerelement.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo.isstaggerelementproperty
     * @type {DependencyProperty} 
     */
    static IsStaggerElementProperty {
        get => CommonNavigationTransitionInfo.get_IsStaggerElementProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStaggeringEnabledProperty() {
        if (!CommonNavigationTransitionInfo.HasProp("__ICommonNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommonNavigationTransitionInfoStatics.IID)
            CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics := ICommonNavigationTransitionInfoStatics(factoryPtr)
        }

        return CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics.get_IsStaggeringEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStaggerElementProperty() {
        if (!CommonNavigationTransitionInfo.HasProp("__ICommonNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommonNavigationTransitionInfoStatics.IID)
            CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics := ICommonNavigationTransitionInfoStatics(factoryPtr)
        }

        return CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics.get_IsStaggerElementProperty()
    }

    /**
     * Returns a Boolean value indicating if the specified **UIElement** is the stagger element for the navigation transition.
     * @remarks
     * This method supports XAML usage of the [CommonNavigationTransitionInfo.IsStaggerElement](commonnavigationtransitioninfo_isstaggerelement.md) attached property.
     * @param {UIElement} element The **UIElement** to check as being the stagger element.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo.getisstaggerelement
     */
    static GetIsStaggerElement(element) {
        if (!CommonNavigationTransitionInfo.HasProp("__ICommonNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommonNavigationTransitionInfoStatics.IID)
            CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics := ICommonNavigationTransitionInfoStatics(factoryPtr)
        }

        return CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics.GetIsStaggerElement(element)
    }

    /**
     * Sets a Boolean value indicating if the specified **UIElement** is the stagger element for the navigation transition.
     * @remarks
     * This method supports XAML usage of the [CommonNavigationTransitionInfo.IsStaggerElement](commonnavigationtransitioninfo_isstaggerelement.md) attached property.
     * @param {UIElement} element The **UIElement** about which to set the stagger element indicator.
     * @param {Boolean} value Set this value to **true** if *element* is the stagger element; otherwise set it to **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo.setisstaggerelement
     */
    static SetIsStaggerElement(element, value) {
        if (!CommonNavigationTransitionInfo.HasProp("__ICommonNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommonNavigationTransitionInfoStatics.IID)
            CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics := ICommonNavigationTransitionInfoStatics(factoryPtr)
        }

        return CommonNavigationTransitionInfo.__ICommonNavigationTransitionInfoStatics.SetIsStaggerElement(element, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a Boolean value indicating if staggering is enabled for the navigation transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.commonnavigationtransitioninfo.isstaggeringenabled
     * @type {Boolean} 
     */
    IsStaggeringEnabled {
        get => this.get_IsStaggeringEnabled()
        set => this.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CommonNavigationTransitionInfo](commonnavigationtransitioninfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.CommonNavigationTransitionInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStaggeringEnabled() {
        if (!this.HasProp("__ICommonNavigationTransitionInfo")) {
            if ((queryResult := this.QueryInterface(ICommonNavigationTransitionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonNavigationTransitionInfo := ICommonNavigationTransitionInfo(outPtr)
        }

        return this.__ICommonNavigationTransitionInfo.get_IsStaggeringEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStaggeringEnabled(value) {
        if (!this.HasProp("__ICommonNavigationTransitionInfo")) {
            if ((queryResult := this.QueryInterface(ICommonNavigationTransitionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommonNavigationTransitionInfo := ICommonNavigationTransitionInfo(outPtr)
        }

        return this.__ICommonNavigationTransitionInfo.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Methods
}
