#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationTransitionInfo.ahk
#Include .\IContinuumNavigationTransitionInfo.ahk
#Include .\IContinuumNavigationTransitionInfoStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Specifies the object that will fly between pages to provide context during a continuum transition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ContinuumNavigationTransitionInfo extends NavigationTransitionInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContinuumNavigationTransitionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContinuumNavigationTransitionInfo.IID

    /**
     * Identifies the [ExitElement](continuumnavigationtransitioninfo_exitelement.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.exitelementproperty
     * @type {DependencyProperty} 
     */
    static ExitElementProperty {
        get => ContinuumNavigationTransitionInfo.get_ExitElementProperty()
    }

    /**
     * Identifies the [ContinuumNavigationTransitionInfo.IsEntranceElement](continuumnavigationtransitioninfo_isentranceelement.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.isentranceelementproperty
     * @type {DependencyProperty} 
     */
    static IsEntranceElementProperty {
        get => ContinuumNavigationTransitionInfo.get_IsEntranceElementProperty()
    }

    /**
     * Identifies the [ContinuumNavigationTransitionInfo.IsExitElement](continuumnavigationtransitioninfo_isexitelement.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.isexitelementproperty
     * @type {DependencyProperty} 
     */
    static IsExitElementProperty {
        get => ContinuumNavigationTransitionInfo.get_IsExitElementProperty()
    }

    /**
     * Identifies the [ContinuumNavigationTransitionInfo.ExitElementContainer](continuumnavigationtransitioninfo_exitelementcontainer.md) attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.exitelementcontainerproperty
     * @type {DependencyProperty} 
     */
    static ExitElementContainerProperty {
        get => ContinuumNavigationTransitionInfo.get_ExitElementContainerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitElementProperty() {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.get_ExitElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsEntranceElementProperty() {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.get_IsEntranceElementProperty()
    }

    /**
     * Returns a Boolean value indicating if the specified **UIElement** is the entrance element for the continuum navigation.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.IsEntranceElement](continuumnavigationtransitioninfo_isentranceelement.md) attached property.
     * @param {UIElement} element The **UIElement** to check as being the entrance element.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.getisentranceelement
     */
    static GetIsEntranceElement(element) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.GetIsEntranceElement(element)
    }

    /**
     * Sets a Boolean value indicating if the specified **UIElement** is the entrance element for the continuum navigation.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.IsEntranceElement](continuumnavigationtransitioninfo_isentranceelement.md) attached property.
     * @param {UIElement} element The **UIElement** about which to set the entrance element indicator.
     * @param {Boolean} value Set this value to **true** if *element* is the entrance element; otherwise set it to **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.setisentranceelement
     */
    static SetIsEntranceElement(element, value) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.SetIsEntranceElement(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsExitElementProperty() {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.get_IsExitElementProperty()
    }

    /**
     * Returns a Boolean value indicating if the specified **UIElement** is the exit element of the continuum navigation.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.IsExitElement](continuumnavigationtransitioninfo_isexitelement.md) attached property.
     * @param {UIElement} element The **UIElement** to check as being the exit element.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.getisexitelement
     */
    static GetIsExitElement(element) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.GetIsExitElement(element)
    }

    /**
     * Sets a Boolean value indicating if the specified **UIElement** is the exit element for the continuum navigation.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.IsExitElement](continuumnavigationtransitioninfo_isexitelement.md) attached property.
     * @param {UIElement} element The **UIElement** about which to set the exit element indicator.
     * @param {Boolean} value Set this value to **true** if *element* is the exit element; otherwise set it to **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.setisexitelement
     */
    static SetIsExitElement(element, value) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.SetIsExitElement(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitElementContainerProperty() {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.get_ExitElementContainerProperty()
    }

    /**
     * Returns a Boolean value indicating if the specified element is the [ExitElement](continuumnavigationtransitioninfo_exitelement.md) container.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.ExitElementContainer](continuumnavigationtransitioninfo_exitelementcontainer.md) attached property.
     * @param {ListViewBase} element The element to be checked as being the container.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.getexitelementcontainer
     */
    static GetExitElementContainer(element) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.GetExitElementContainer(element)
    }

    /**
     * Sets a Boolean value indicating that the specified element is the exit element container for the continuum navigation.
     * @remarks
     * This method supports XAML usage of the [ContinuumNavigationTransitionInfo.ExitElementContainer](continuumnavigationtransitioninfo_exitelementcontainer.md) attached property.
     * @param {ListViewBase} element The element about which to set the exit element container indicator.
     * @param {Boolean} value Set this value to **true** if *element* is the exit element; otherwise set it to **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.setexitelementcontainer
     */
    static SetExitElementContainer(element, value) {
        if (!ContinuumNavigationTransitionInfo.HasProp("__IContinuumNavigationTransitionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContinuumNavigationTransitionInfoStatics.IID)
            ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics := IContinuumNavigationTransitionInfoStatics(factoryPtr)
        }

        return ContinuumNavigationTransitionInfo.__IContinuumNavigationTransitionInfoStatics.SetExitElementContainer(element, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the element that will fly between pages during a continuum navigation transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.continuumnavigationtransitioninfo.exitelement
     * @type {UIElement} 
     */
    ExitElement {
        get => this.get_ExitElement()
        set => this.put_ExitElement(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContinuumNavigationTransitionInfo](continuumnavigationtransitioninfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ContinuumNavigationTransitionInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_ExitElement() {
        if (!this.HasProp("__IContinuumNavigationTransitionInfo")) {
            if ((queryResult := this.QueryInterface(IContinuumNavigationTransitionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContinuumNavigationTransitionInfo := IContinuumNavigationTransitionInfo(outPtr)
        }

        return this.__IContinuumNavigationTransitionInfo.get_ExitElement()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_ExitElement(value) {
        if (!this.HasProp("__IContinuumNavigationTransitionInfo")) {
            if ((queryResult := this.QueryInterface(IContinuumNavigationTransitionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContinuumNavigationTransitionInfo := IContinuumNavigationTransitionInfo(outPtr)
        }

        return this.__IContinuumNavigationTransitionInfo.put_ExitElement(value)
    }

;@endregion Instance Methods
}
