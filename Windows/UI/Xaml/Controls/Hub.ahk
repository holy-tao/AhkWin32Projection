#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IHub.ahk
#Include .\ISemanticZoomInformation.ahk
#Include .\IHubStatics.ahk
#Include .\IHubFactory.ahk
#Include .\HubSectionHeaderClickEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\HubSectionHeaderClickEventArgs.ahk
#Include .\SectionsInViewChangedEventHandler.ahk
#Include .\SectionsInViewChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that displays groups of content in a panning view.
 * @remarks
 * **For Windows 10 and later: We recommend against using this control; use one of the other navigation controls instead. For a list, see the [Navigation basics](/windows/uwp/design/basics/navigation-basics) article.**
 * 
 * Use a Hub to show different collections of data, either from the same source or from different sources.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class Hub extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHub

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHub.IID

    /**
     * Identifies the [Header](hub_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => Hub.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](hub_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => Hub.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [Orientation](hub_orientation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.orientationproperty
     * @type {DependencyProperty} 
     */
    static OrientationProperty {
        get => Hub.get_OrientationProperty()
    }

    /**
     * Identifies the [DefaultSectionIndex](hub_defaultsectionindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.defaultsectionindexproperty
     * @type {DependencyProperty} 
     */
    static DefaultSectionIndexProperty {
        get => Hub.get_DefaultSectionIndexProperty()
    }

    /**
     * Identifies the [SemanticZoomOwner](hub_semanticzoomowner.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.semanticzoomownerproperty
     * @type {DependencyProperty} 
     */
    static SemanticZoomOwnerProperty {
        get => Hub.get_SemanticZoomOwnerProperty()
    }

    /**
     * Identifies the [IsActiveView](hub_isactiveview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.isactiveviewproperty
     * @type {DependencyProperty} 
     */
    static IsActiveViewProperty {
        get => Hub.get_IsActiveViewProperty()
    }

    /**
     * Identifies the [IsZoomedInView](hub_iszoomedinview.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.iszoomedinviewproperty
     * @type {DependencyProperty} 
     */
    static IsZoomedInViewProperty {
        get => Hub.get_IsZoomedInViewProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OrientationProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_OrientationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultSectionIndexProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_DefaultSectionIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SemanticZoomOwnerProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_SemanticZoomOwnerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsActiveViewProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_IsActiveViewProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomedInViewProperty() {
        if (!Hub.HasProp("__IHubStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubStatics.IID)
            Hub.__IHubStatics := IHubStatics(factoryPtr)
        }

        return Hub.__IHubStatics.get_IsZoomedInViewProperty()
    }

    /**
     * 
     * @returns {Hub} 
     */
    static CreateInstance() {
        if (!Hub.HasProp("__IHubFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Hub")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubFactory.IID)
            Hub.__IHubFactory := IHubFactory(factoryPtr)
        }

        return Hub.__IHubFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content for the hub header.
     * @remarks
     * Add a header to let users know the context of your [Hub](hub.md). This is often the name of your app. It's important to remember that although you can use arbitrary content in the header, the height of the header affects the amount of vertical space available for your hub section content. The header remains fixed in its position and doesn't scroll with the hub sections.
     * 
     * You can use a data template for the header by setting the [HeaderTemplate](hub_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the hub header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the orientation of a [Hub](hub.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.orientation
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the index of the hub section to show first when the [Hub](hub.md) is initialized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.defaultsectionindex
     * @type {Integer} 
     */
    DefaultSectionIndex {
        get => this.get_DefaultSectionIndex()
        set => this.put_DefaultSectionIndex(value)
    }

    /**
     * Gets all the hub sections in the [Hub](hub.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.sections
     * @type {IVector<HubSection>} 
     */
    Sections {
        get => this.get_Sections()
    }

    /**
     * Gets the hub sections currently on the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.sectionsinview
     * @type {IVector<HubSection>} 
     */
    SectionsInView {
        get => this.get_SectionsInView()
    }

    /**
     * Gets a collection of the headers of the hub sections.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.sectionheaders
     * @type {IObservableVector<IInspectable>} 
     */
    SectionHeaders {
        get => this.get_SectionHeaders()
    }

    /**
     * Gets or sets the [SemanticZoom](semanticzoom.md) instance that hosts the [Hub](hub.md).
     * @remarks
     * You don't set this property in XAML or in your app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.semanticzoomowner
     * @type {SemanticZoom} 
     */
    SemanticZoomOwner {
        get => this.get_SemanticZoomOwner()
        set => this.put_SemanticZoomOwner(value)
    }

    /**
     * Gets or sets a value that indicates whether the [Hub](hub.md) instance is the active view in its owning [SemanticZoom](semanticzoom.md).
     * @remarks
     * You typically don't set this property in XAML or in app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.isactiveview
     * @type {Boolean} 
     */
    IsActiveView {
        get => this.get_IsActiveView()
        set => this.put_IsActiveView(value)
    }

    /**
     * Gets or sets a value that indicates whether the [Hub](hub.md) instance is the zoomed-in view in its owning [SemanticZoom](semanticzoom.md).
     * @remarks
     * You typically don't set this property in XAML or in app code. The property is set implicitly when the view is set as either the [ZoomedInView](semanticzoom_zoomedinview.md) or [ZoomedOutView](semanticzoom_zoomedoutview.md) of a [SemanticZoom](semanticzoom.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.iszoomedinview
     * @type {Boolean} 
     */
    IsZoomedInView {
        get => this.get_IsZoomedInView()
        set => this.put_IsZoomedInView(value)
    }

    /**
     * Occurs when a section header is clicked and the section's [IsHeaderInteractive](hubsection_isheaderinteractive.md) property is **true**.
     * @remarks
     * You can make a section header interactive by setting the [IsHeaderInteractive](hubsection_isheaderinteractive.md) property to **true**. Typically, the user can tap an interactive header to navigate to the corresponding app section page.
     * 
     * You get the section that was clicked from the [SectionHeaderClickEventArgs.Section](hubsectionheaderclickeventargs_section.md) property of the event data.
     * 
     * When its [IsHeaderInteractive](hubsection_isheaderinteractive.md) property is **true**, the default header includes a chevron glyph, and "Hover" and "Pressed" visual states. If you use a custom [HeaderTemplate](hubsection_headertemplate.md), you should provide similar visual cues to indicate that the header is interactive.
     * @type {HubSectionHeaderClickEventHandler}
    */
    OnSectionHeaderClick {
        get {
            if(!this.HasProp("__OnSectionHeaderClick")){
                this.__OnSectionHeaderClick := WinRTEventHandler(
                    HubSectionHeaderClickEventHandler,
                    HubSectionHeaderClickEventHandler.IID,
                    IInspectable,
                    HubSectionHeaderClickEventArgs
                )
                this.__OnSectionHeaderClickToken := this.add_SectionHeaderClick(this.__OnSectionHeaderClick.iface)
            }
            return this.__OnSectionHeaderClick
        }
    }

    /**
     * Occurs when the [SectionsInView](hub_sectionsinview.md) collection changes.
     * @type {SectionsInViewChangedEventHandler}
    */
    OnSectionsInViewChanged {
        get {
            if(!this.HasProp("__OnSectionsInViewChanged")){
                this.__OnSectionsInViewChanged := WinRTEventHandler(
                    SectionsInViewChangedEventHandler,
                    SectionsInViewChangedEventHandler.IID,
                    IInspectable,
                    SectionsInViewChangedEventArgs
                )
                this.__OnSectionsInViewChangedToken := this.add_SectionsInViewChanged(this.__OnSectionsInViewChanged.iface)
            }
            return this.__OnSectionsInViewChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSectionHeaderClickToken")) {
            this.remove_SectionHeaderClick(this.__OnSectionHeaderClickToken)
            this.__OnSectionHeaderClick.iface.Dispose()
        }

        if(this.HasProp("__OnSectionsInViewChangedToken")) {
            this.remove_SectionsInViewChanged(this.__OnSectionsInViewChangedToken)
            this.__OnSectionsInViewChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_Orientation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.put_Orientation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSectionIndex() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_DefaultSectionIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DefaultSectionIndex(value) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.put_DefaultSectionIndex(value)
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_Sections() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_Sections()
    }

    /**
     * 
     * @returns {IVector<HubSection>} 
     */
    get_SectionsInView() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_SectionsInView()
    }

    /**
     * 
     * @returns {IObservableVector<IInspectable>} 
     */
    get_SectionHeaders() {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.get_SectionHeaders()
    }

    /**
     * 
     * @param {HubSectionHeaderClickEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SectionHeaderClick(handler) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.add_SectionHeaderClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SectionHeaderClick(token) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.remove_SectionHeaderClick(token)
    }

    /**
     * 
     * @param {SectionsInViewChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SectionsInViewChanged(handler) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.add_SectionsInViewChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SectionsInViewChanged(token) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.remove_SectionsInViewChanged(token)
    }

    /**
     * Scrolls the hub to bring the specified hub section into view.
     * @remarks
     * You use the ScrollToSection method to bring a section into view when the [Hub](hub.md) control is not used as a view in a [SemanticZoom](semanticzoom.md) control. To bring a section into view when the [Hub](hub.md) control is used in a [SemanticZoom](semanticzoom.md), use the [MakeVisible](hub_makevisible_1148837317.md) method instead.
     * 
     * 
     * <!--Add remarks/example showing how to get and specify the section. Hub.Sections index, etc.-->
     * @param {HubSection} section_ The hub section to bring into view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.scrolltosection
     */
    ScrollToSection(section_) {
        if (!this.HasProp("__IHub")) {
            if ((queryResult := this.QueryInterface(IHub.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHub := IHub(outPtr)
        }

        return this.__IHub.ScrollToSection(section_)
    }

    /**
     * 
     * @returns {SemanticZoom} 
     */
    get_SemanticZoomOwner() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_SemanticZoomOwner()
    }

    /**
     * 
     * @param {SemanticZoom} value 
     * @returns {HRESULT} 
     */
    put_SemanticZoomOwner(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_SemanticZoomOwner(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActiveView() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_IsActiveView()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActiveView(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_IsActiveView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomedInView() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.get_IsZoomedInView()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomedInView(value) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.put_IsZoomedInView(value)
    }

    /**
     * Initializes the changes to related aspects of presentation (such as scrolling UI or state) when the overall view for a [SemanticZoom](isemanticzoominformation.md) is about to change.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.initializeviewchange
     */
    InitializeViewChange() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.InitializeViewChange()
    }

    /**
     * Changes related aspects of presentation when the overall view for a [SemanticZoom](isemanticzoominformation.md) changes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.completeviewchange
     */
    CompleteViewChange() {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChange()
    }

    /**
     * Forces content in the view to scroll until the item that's specified by [SemanticZoomLocation](semanticzoomlocation.md) is visible. Also focuses the item if it finds the item.
     * @remarks
     * You use the MakeVisible method to bring an item into view when the [Hub](hub.md) control is used as a view in a [SemanticZoom](semanticzoom.md) control. To bring an item into view when the [Hub](hub.md) control is not used in a [SemanticZoom](semanticzoom.md), use the [ScrollToSection](hub_scrolltosection_614196066.md) method instead.
     * @param {SemanticZoomLocation} item The item in the view to scroll to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.makevisible
     */
    MakeVisible(item) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.MakeVisible(item)
    }

    /**
     * Initializes item-wise operations that are related to a view change when the [Hub](hub.md) instance is the source view and the pending destination view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.startviewchangefrom
     */
    StartViewChangeFrom(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.StartViewChangeFrom(source, destination)
    }

    /**
     * Initializes item-wise operations that are related to a view change when the source view is a different view and the pending destination view is the [Hub](hub.md) instance.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.startviewchangeto
     */
    StartViewChangeTo(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.StartViewChangeTo(source, destination)
    }

    /**
     * Completes item-wise operations that are related to a view change when the [Hub](hub.md) instance is the source view and the new view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.completeviewchangefrom
     */
    CompleteViewChangeFrom(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChangeFrom(source, destination)
    }

    /**
     * Completes item-wise operations that are related to a view change when the [Hub](hub.md) instance is the destination view and the source view is a potentially different implementing view.
     * @param {SemanticZoomLocation} source The view item as represented in the source view.
     * @param {SemanticZoomLocation} destination The view item as represented in the destination view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hub.completeviewchangeto
     */
    CompleteViewChangeTo(source, destination) {
        if (!this.HasProp("__ISemanticZoomInformation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomInformation := ISemanticZoomInformation(outPtr)
        }

        return this.__ISemanticZoomInformation.CompleteViewChangeTo(source, destination)
    }

;@endregion Instance Methods
}
