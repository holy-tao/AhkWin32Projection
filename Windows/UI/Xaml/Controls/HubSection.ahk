#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IHubSection.ahk
#Include .\IHubSectionStatics.ahk
#Include .\IHubSectionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a single group of content in a [Hub](hub.md).
 * @remarks
 * You put the content of your [Hub](hub.md) in various HubSection elements. Like the [Hub](hub.md), each HubSection has a [Header](hubsection_header.md) and [HeaderTemplate](hubsection_headertemplate.md) property that you can use to set an optional header for the section. You can also make the section header interactive. Typically, the user can tap an interactive header to navigate to the corresponding app section page. When its [IsHeaderInteractive](hubsection_isheaderinteractive.md) property is **true**, the default header includes a chevron glyph, and "Hover" and "Pressed" visual states, and it raises a [SectionHeaderClick](hub_sectionheaderclick.md) event.
 * 
 * You don't add content directly to a hub section; instead, you define the content of your HubSection in a [DataTemplate](../windows.ui.xaml/datatemplate.md). Content can be defined inline, or bound to a data source. Any valid XAML can be used in a hub section.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HubSection extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHubSection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHubSection.IID

    /**
     * Identifies the [Header](hubsection_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => HubSection.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](hubsection_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => HubSection.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [ContentTemplate](hubsection_contenttemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.contenttemplateproperty
     * @type {DependencyProperty} 
     */
    static ContentTemplateProperty {
        get => HubSection.get_ContentTemplateProperty()
    }

    /**
     * Identifies the [IsHeaderInteractive](hubsection_isheaderinteractive.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.isheaderinteractiveproperty
     * @type {DependencyProperty} 
     */
    static IsHeaderInteractiveProperty {
        get => HubSection.get_IsHeaderInteractiveProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!HubSection.HasProp("__IHubSectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionStatics.IID)
            HubSection.__IHubSectionStatics := IHubSectionStatics(factoryPtr)
        }

        return HubSection.__IHubSectionStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!HubSection.HasProp("__IHubSectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionStatics.IID)
            HubSection.__IHubSectionStatics := IHubSectionStatics(factoryPtr)
        }

        return HubSection.__IHubSectionStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentTemplateProperty() {
        if (!HubSection.HasProp("__IHubSectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionStatics.IID)
            HubSection.__IHubSectionStatics := IHubSectionStatics(factoryPtr)
        }

        return HubSection.__IHubSectionStatics.get_ContentTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHeaderInteractiveProperty() {
        if (!HubSection.HasProp("__IHubSectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionStatics.IID)
            HubSection.__IHubSectionStatics := IHubSectionStatics(factoryPtr)
        }

        return HubSection.__IHubSectionStatics.get_IsHeaderInteractiveProperty()
    }

    /**
     * 
     * @returns {HubSection} 
     */
    static CreateInstance() {
        if (!HubSection.HasProp("__IHubSectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HubSection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHubSectionFactory.IID)
            HubSection.__IHubSectionFactory := IHubSectionFactory(factoryPtr)
        }

        return HubSection.__IHubSectionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content for the hub section header.
     * @remarks
     * Add a header to let users know the context of your [Hub](hub.md) section. It's important to remember that although you can use arbitrary content in the header, the height of the header affects the amount of vertical space available for your hub section content. The section header scrolls with the hub section.
     * 
     * You can use a data template for the header by setting the [HeaderTemplate](hubsection_headertemplate.md) property.
     * 
     * You can make a section header interactive by setting the [IsHeaderInteractive](hubsection_isheaderinteractive.md) property to **true**. Typically, the user can tap an interactive header to navigate to the corresponding app section page.
     * 
     * You can respond to a tapped header by handling the [Hub.SectionHeaderClick](hub_sectionheaderclick.md) event. You get the section that was clicked from the [SectionHeaderClickEventArgs.Section](hubsectionheaderclickeventargs_section.md) property of the event data.
     * 
     * When its [IsHeaderInteractive](hubsection_isheaderinteractive.md) property is **true**, the default header includes the text, **See more**. When a user taps the **See more** text, the [SectionHeaderClick](hub_sectionheaderclick.md) event is raised. The text is rendered as a hyperlink, which uses the user selected system accent color by default.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the hub section header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the data template that is used to display the content of the [HubSection](hubsection.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.contenttemplate
     * @type {DataTemplate} 
     */
    ContentTemplate {
        get => this.get_ContentTemplate()
        set => this.put_ContentTemplate(value)
    }

    /**
     * Gets or sets a value that indicates whether the section header raises a [SectionHeaderClick](hub_sectionheaderclick.md) event on its containing [Hub](hub.md).
     * @remarks
     * You can make a section header interactive by setting the IsHeaderInteractive property to **true**. Typically, the user can tap an interactive header to navigate to the corresponding app section page.
     * 
     * You can respond to a tapped header by handling the [Hub.SectionHeaderClick](hub_sectionheaderclick.md) event. You get the section that was clicked from the [SectionHeaderClickEventArgs.Section](hubsectionheaderclickeventargs_section.md) property of the event data.
     * 
     * When its IsHeaderInteractive property is **true**, the default header includes the text, **See more**. When a user taps the **See more** text, the [SectionHeaderClick](hub_sectionheaderclick.md) event is raised. The text is rendered as a hyperlink, which uses the user selected system accent color by default.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hubsection.isheaderinteractive
     * @type {Boolean} 
     */
    IsHeaderInteractive {
        get => this.get_IsHeaderInteractive()
        set => this.put_IsHeaderInteractive(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_ContentTemplate() {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.get_ContentTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_ContentTemplate(value) {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.put_ContentTemplate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeaderInteractive() {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.get_IsHeaderInteractive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHeaderInteractive(value) {
        if (!this.HasProp("__IHubSection")) {
            if ((queryResult := this.QueryInterface(IHubSection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHubSection := IHubSection(outPtr)
        }

        return this.__IHubSection.put_IsHeaderInteractive(value)
    }

;@endregion Instance Methods
}
