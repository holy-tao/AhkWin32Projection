#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationTransitionInfo.ahk
#Include .\IEntranceNavigationTransitionInfo.ahk
#Include .\IEntranceNavigationTransitionInfoStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Specifies the animation to run when content appears on a [Page](../windows.ui.xaml.controls/page.md).
 * @remarks
 * The **EntranceNavigationTransitionInfo** class represents the page refresh animation. Page refresh is a combination of a slide up animation and a fade in animation for the incoming content. 
 * 
 * With Windows 10, version 1803, a Frame uses [NavigationThemeTransition](navigationthemetransition.md) to animate navigation between Pages. By default, the animation is *Page Refresh* because the [DefaultNavigationTransitionInfo](navigationthemetransition_defaultnavigationtransitioninfo.md) is EntranceNavigationTransitionInfo.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancenavigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EntranceNavigationTransitionInfo extends NavigationTransitionInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEntranceNavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEntranceNavigationTransitionInfo.IID

    /**
     * Identifies the [EntranceNavigationTransitionInfo.IsTargetElement](entrancenavigationtransitioninfo_istargetelement.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [EntranceNavigationTransitionInfo.IsTargetElement](entrancenavigationtransitioninfo_istargetelement.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancenavigationtransitioninfo.istargetelementproperty
     * @type {DependencyProperty} 
     */
    static IsTargetElementProperty {
        get => EntranceNavigationTransitionInfo.get_IsTargetElementProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTargetElementProperty() {
        if (!EntranceNavigationTransitionInfo.HasProp("__IEntranceNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceNavigationTransitionInfoStatics.IID)
            EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics := IEntranceNavigationTransitionInfoStatics(factoryPtr)
        }

        return EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics.get_IsTargetElementProperty()
    }

    /**
     * Gets the value of the [EntranceNavigationTransitionInfo.IsTargetElement](entrancenavigationtransitioninfo_istargetelement.md) XAML attached property for the target element.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancenavigationtransitioninfo.getistargetelement
     */
    static GetIsTargetElement(element) {
        if (!EntranceNavigationTransitionInfo.HasProp("__IEntranceNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceNavigationTransitionInfoStatics.IID)
            EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics := IEntranceNavigationTransitionInfoStatics(factoryPtr)
        }

        return EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics.GetIsTargetElement(element)
    }

    /**
     * Sets the value of the [EntranceNavigationTransitionInfo.IsTargetElement](entrancenavigationtransitioninfo_istargetelement.md) XAML attached property for a target element.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. **true** if the element is the animation target; otherwise, **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.entrancenavigationtransitioninfo.setistargetelement
     */
    static SetIsTargetElement(element, value) {
        if (!EntranceNavigationTransitionInfo.HasProp("__IEntranceNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEntranceNavigationTransitionInfoStatics.IID)
            EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics := IEntranceNavigationTransitionInfoStatics(factoryPtr)
        }

        return EntranceNavigationTransitionInfo.__IEntranceNavigationTransitionInfoStatics.SetIsTargetElement(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Initializes a new instance of the [EntranceNavigationTransitionInfo](entrancenavigationtransitioninfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EntranceNavigationTransitionInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
