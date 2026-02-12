#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IItemsPresenter.ahk
#Include .\IItemsPresenter2.ahk
#Include Primitives\IScrollSnapPointsInfo.ahk
#Include .\IItemsPresenterStatics2.ahk
#Include .\IItemsPresenterStatics.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Specifies where items are placed in a control, usually an [ItemsControl](itemscontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ItemsPresenter extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemsPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemsPresenter.IID

    /**
     * Identifies the [Footer](itemspresenter_footer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footerproperty
     * @type {DependencyProperty} 
     */
    static FooterProperty {
        get => ItemsPresenter.get_FooterProperty()
    }

    /**
     * Identifies the [FooterTemplate](itemspresenter_footertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footertemplateproperty
     * @type {DependencyProperty} 
     */
    static FooterTemplateProperty {
        get => ItemsPresenter.get_FooterTemplateProperty()
    }

    /**
     * Identifies the [FooterTransitions](itemspresenter_footertransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footertransitionsproperty
     * @type {DependencyProperty} 
     */
    static FooterTransitionsProperty {
        get => ItemsPresenter.get_FooterTransitionsProperty()
    }

    /**
     * Identifies the [Header](itemspresenter_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => ItemsPresenter.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](itemspresenter_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => ItemsPresenter.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [HeaderTransitions](itemspresenter_headertransitions.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.headertransitionsproperty
     * @type {DependencyProperty} 
     */
    static HeaderTransitionsProperty {
        get => ItemsPresenter.get_HeaderTransitionsProperty()
    }

    /**
     * Identifies the [Padding](itemspresenter_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => ItemsPresenter.get_PaddingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics2.IID)
            ItemsPresenter.__IItemsPresenterStatics2 := IItemsPresenterStatics2(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics2.get_FooterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterTemplateProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics2.IID)
            ItemsPresenter.__IItemsPresenterStatics2 := IItemsPresenterStatics2(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics2.get_FooterTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FooterTransitionsProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics2.IID)
            ItemsPresenter.__IItemsPresenterStatics2 := IItemsPresenterStatics2(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics2.get_FooterTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics.IID)
            ItemsPresenter.__IItemsPresenterStatics := IItemsPresenterStatics(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics.IID)
            ItemsPresenter.__IItemsPresenterStatics := IItemsPresenterStatics(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTransitionsProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics.IID)
            ItemsPresenter.__IItemsPresenterStatics := IItemsPresenterStatics(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics.get_HeaderTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!ItemsPresenter.HasProp("__IItemsPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IItemsPresenterStatics.IID)
            ItemsPresenter.__IItemsPresenterStatics := IItemsPresenterStatics(factoryPtr)
        }

        return ItemsPresenter.__IItemsPresenterStatics.get_PaddingProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content for the items header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](itemspresenter_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the items header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the header of an [ItemsPresenter](itemspresenter.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.headertransitions
     * @type {TransitionCollection} 
     */
    HeaderTransitions {
        get => this.get_HeaderTransitions()
        set => this.put_HeaderTransitions(value)
    }

    /**
     * Gets or sets the distance between the [ItemsPresenter](itemspresenter.md) and its child objects.
     * @remarks
     * A Padding value applies to presentation rendering of each presented item and also to the header (if one is specified).
     * 
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For [ItemsPresenter](itemspresenter.md) , margin and padding would typically blend together with the division between them not being apparent in the rendering. So it's typical to specify a [Margin](../windows.ui.xaml/frameworkelement_margin.md) or a Padding, but not both. For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets the content for the items footer.
     * @remarks
     * You can set a data template for the Footer by using the [FooterTemplate](itemspresenter_footertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footer
     * @type {IInspectable} 
     */
    Footer {
        get => this.get_Footer()
        set => this.put_Footer(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the items header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footertemplate
     * @type {DataTemplate} 
     */
    FooterTemplate {
        get => this.get_FooterTemplate()
        set => this.put_FooterTemplate(value)
    }

    /**
     * Gets or sets the collection of [Transition](../windows.ui.xaml.media.animation/transition.md) style elements that apply to the footer of an [ItemsPresenter](itemspresenter.md).
     * @remarks
     * > [!NOTE]
     * > Prior to Windows 10, version 1809 (SDK 17763), the XAML syntax for properties that have a [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) value requires that you declare an explicit [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) object element as the value, and then provide object elements as child elements of [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) for each of the transition animations you want to use. In Windows 10, version 1809 (SDK 17763) or later, [TransitionCollection](../windows.ui.xaml.media.animation/transitioncollection.md) supports the implicit collection usage, so you can omit the collection object element. For more info on implicit collections and XAML, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * 
     * Transition animations play a particular role in the UI design of your app. The basic idea is that when there is a change or transition, the animation draws the attention of the user to the change.
     * <!-- For more info, see  Transition animations and theme animations.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.footertransitions
     * @type {TransitionCollection} 
     */
    FooterTransitions {
        get => this.get_FooterTransitions()
        set => this.put_FooterTransitions(value)
    }

    /**
     * Gets a value that indicates whether the horizontal snap points for the [ItemsPresenter](itemspresenter.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that indicates whether the vertical snap points for the [ItemsPresenter](itemspresenter.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * Occurs when the horizontal snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnHorizontalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnHorizontalSnapPointsChanged")){
                this.__OnHorizontalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnHorizontalSnapPointsChangedToken := this.add_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChanged.iface)
            }
            return this.__OnHorizontalSnapPointsChanged
        }
    }

    /**
     * Occurs when the vertical snap points change.
     * @type {EventHandler<IInspectable>}
    */
    OnVerticalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnVerticalSnapPointsChanged")){
                this.__OnVerticalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnVerticalSnapPointsChangedToken := this.add_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChanged.iface)
            }
            return this.__OnVerticalSnapPointsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ItemsPresenter](itemspresenter.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ItemsPresenter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHorizontalSnapPointsChangedToken")) {
            this.remove_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChangedToken)
            this.__OnHorizontalSnapPointsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVerticalSnapPointsChangedToken")) {
            this.remove_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChangedToken)
            this.__OnVerticalSnapPointsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_HeaderTransitions() {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.get_HeaderTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_HeaderTransitions(value) {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.put_HeaderTransitions(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IItemsPresenter")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter := IItemsPresenter(outPtr)
        }

        return this.__IItemsPresenter.put_Padding(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Footer() {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.get_Footer()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Footer(value) {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.put_Footer(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_FooterTemplate() {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.get_FooterTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_FooterTemplate(value) {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.put_FooterTemplate(value)
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_FooterTransitions() {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.get_FooterTransitions()
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_FooterTransitions(value) {
        if (!this.HasProp("__IItemsPresenter2")) {
            if ((queryResult := this.QueryInterface(IItemsPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemsPresenter2 := IItemsPresenter2(outPtr)
        }

        return this.__IItemsPresenter2.put_FooterTransitions(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreHorizontalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreVerticalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreVerticalSnapPointsRegular()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HorizontalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_HorizontalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HorizontalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_HorizontalSnapPointsChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VerticalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_VerticalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VerticalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_VerticalSnapPointsChanged(token)
    }

    /**
     * Returns a read-only collection of numbers that represent the snap points for the specified orientation.
     * @param {Integer} orientation_ The orientation of the requested snap points.
     * @param {Integer} alignment The alignment used by the caller when applying the requested snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.getirregularsnappoints
     */
    GetIrregularSnapPoints(orientation_, alignment) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetIrregularSnapPoints(orientation_, alignment)
    }

    /**
     * Returns an original offset and interval for equidistant snap points for the specified orientation.
     * @param {Integer} orientation_ The orientation of the requested snap points.
     * @param {Integer} alignment The alignment used by the caller when applying the requested snap points.
     * @param {Pointer<Single>} offset The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemspresenter.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetRegularSnapPoints(orientation_, alignment, offset)
    }

;@endregion Instance Methods
}
