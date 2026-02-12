#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IToggleSwitch.ahk
#Include .\IToggleSwitchOverrides.ahk
#Include .\IToggleSwitchStatics.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a switch that can be toggled between two states.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Toggle switches](/windows/uwp/design/controls-and-patterns/toggles).
 * 
 * ToggleSwitch is a control that can be toggled between 2 states.
 * 
 * <img alt="Toggle switch control" src="images/controls/ToggleSwitch.png" />
 * 
 * Use a ToggleSwitch control to let the user switch an option between on and off states. Use the [IsOn](toggleswitch_ison.md) property to determine the state of the switch. Handle the [Toggled](toggleswitch_toggled.md) event to respond to changes in the state.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToggleSwitch extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleSwitch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleSwitch.IID

    /**
     * Identifies the [IsOn](toggleswitch_ison.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.isonproperty
     * @type {DependencyProperty} 
     */
    static IsOnProperty {
        get => ToggleSwitch.get_IsOnProperty()
    }

    /**
     * Identifies the [Header](toggleswitch_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => ToggleSwitch.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](toggleswitch_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => ToggleSwitch.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [OnContent](toggleswitch_oncontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.oncontentproperty
     * @type {DependencyProperty} 
     */
    static OnContentProperty {
        get => ToggleSwitch.get_OnContentProperty()
    }

    /**
     * Identifies the [OnContentTemplate](toggleswitch_oncontenttemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.oncontenttemplateproperty
     * @type {DependencyProperty} 
     */
    static OnContentTemplateProperty {
        get => ToggleSwitch.get_OnContentTemplateProperty()
    }

    /**
     * Identifies the [OffContent](toggleswitch_offcontent.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.offcontentproperty
     * @type {DependencyProperty} 
     */
    static OffContentProperty {
        get => ToggleSwitch.get_OffContentProperty()
    }

    /**
     * Identifies the [OffContentTemplate](toggleswitch_offcontenttemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.offcontenttemplateproperty
     * @type {DependencyProperty} 
     */
    static OffContentTemplateProperty {
        get => ToggleSwitch.get_OffContentTemplateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsOnProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_IsOnProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OnContentProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_OnContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OnContentTemplateProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_OnContentTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffContentProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_OffContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffContentTemplateProperty() {
        if (!ToggleSwitch.HasProp("__IToggleSwitchStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSwitchStatics.IID)
            ToggleSwitch.__IToggleSwitchStatics := IToggleSwitchStatics(factoryPtr)
        }

        return ToggleSwitch.__IToggleSwitchStatics.get_OffContentTemplateProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that declares whether the state of the [ToggleSwitch](toggleswitch.md) is "On".
     * @remarks
     * "On" state uses the template from [OnContentTemplate](toggleswitch_oncontenttemplate.md). "Off" state uses the template from [OffContentTemplate](toggleswitch_offcontenttemplate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.ison
     * @type {Boolean} 
     */
    IsOn {
        get => this.get_IsOn()
        set => this.put_IsOn(value)
    }

    /**
     * Gets or sets the header content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Provides the object content that should be displayed using the [OnContentTemplate](toggleswitch_oncontenttemplate.md) when this [ToggleSwitch](toggleswitch.md) has state of "On".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.oncontent
     * @type {IInspectable} 
     */
    OnContent {
        get => this.get_OnContent()
        set => this.put_OnContent(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the control's content while in "On" state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.oncontenttemplate
     * @type {DataTemplate} 
     */
    OnContentTemplate {
        get => this.get_OnContentTemplate()
        set => this.put_OnContentTemplate(value)
    }

    /**
     * Provides the object content that should be displayed using the [OffContentTemplate](toggleswitch_offcontenttemplate.md) when this [ToggleSwitch](toggleswitch.md) has state of "Off".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.offcontent
     * @type {IInspectable} 
     */
    OffContent {
        get => this.get_OffContent()
        set => this.put_OffContent(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the control's content while in "Off" state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.offcontenttemplate
     * @type {DataTemplate} 
     */
    OffContentTemplate {
        get => this.get_OffContentTemplate()
        set => this.put_OffContentTemplate(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [ToggleSwitch](toggleswitch.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.templatesettings
     * @type {ToggleSwitchTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Occurs when "On"/"Off" state changes for this [ToggleSwitch](toggleswitch.md).
     * @type {RoutedEventHandler}
    */
    OnToggled {
        get {
            if(!this.HasProp("__OnToggled")){
                this.__OnToggled := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnToggledToken := this.add_Toggled(this.__OnToggled.iface)
            }
            return this.__OnToggled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the ToggleSwitch class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSwitch")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnToggledToken")) {
            this.remove_Toggled(this.__OnToggledToken)
            this.__OnToggled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOn() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_IsOn()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOn(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_IsOn(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_OnContent() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_OnContent()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_OnContent(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_OnContent(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_OnContentTemplate() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_OnContentTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_OnContentTemplate(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_OnContentTemplate(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_OffContent() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_OffContent()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_OffContent(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_OffContent(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_OffContentTemplate() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_OffContentTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_OffContentTemplate(value) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.put_OffContentTemplate(value)
    }

    /**
     * 
     * @returns {ToggleSwitchTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.get_TemplateSettings()
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Toggled(handler) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.add_Toggled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Toggled(token) {
        if (!this.HasProp("__IToggleSwitch")) {
            if ((queryResult := this.QueryInterface(IToggleSwitch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitch := IToggleSwitch(outPtr)
        }

        return this.__IToggleSwitch.remove_Toggled(token)
    }

    /**
     * Invoked before the [Toggled](toggleswitch_toggled.md) event is raised.
     * @remarks
     * Override this method to provide a class-based behavior that should be invoked each time that the [Toggled](toggleswitch_toggled.md) event is raised. The event data does not contain the state information, but you can determine the state from [IsOn](toggleswitch_ison.md), which represents the new value.
     * 
     * <!--Rolling the dice on this one because cannot see implementation. Would guess is class handler and not oldskool CLR event On*, despite lack of eventargs in signature.-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.ontoggled
     */
    OnToggled() {
        if (!this.HasProp("__IToggleSwitchOverrides")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchOverrides := IToggleSwitchOverrides(outPtr)
        }

        return this.__IToggleSwitchOverrides.OnToggled()
    }

    /**
     * Invoked when the content for [OnContent](toggleswitch_oncontent.md) changes.
     * @remarks
     * Override this method in order to add steps to behavior of a custom derived class, or to change the *oldContent* or *newContent* values before passing them on to base.
     * @param {IInspectable} oldContent The string or object content of the old content.
     * @param {IInspectable} newContent The string or object content of the new content that is about to display.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.ononcontentchanged
     */
    OnOnContentChanged(oldContent, newContent) {
        if (!this.HasProp("__IToggleSwitchOverrides")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchOverrides := IToggleSwitchOverrides(outPtr)
        }

        return this.__IToggleSwitchOverrides.OnOnContentChanged(oldContent, newContent)
    }

    /**
     * Invoked when the content for [OffContent](toggleswitch_offcontent.md) changes.
     * @remarks
     * Override this method in order to add steps to behavior of a custom derived class, or to change the *oldContent* or *newContent* values before passing them on to base.
     * @param {IInspectable} oldContent The string or object content of the old content.
     * @param {IInspectable} newContent The string or object content of the new content that is about to display.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.onoffcontentchanged
     */
    OnOffContentChanged(oldContent, newContent) {
        if (!this.HasProp("__IToggleSwitchOverrides")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchOverrides := IToggleSwitchOverrides(outPtr)
        }

        return this.__IToggleSwitchOverrides.OnOffContentChanged(oldContent, newContent)
    }

    /**
     * Invoked when the content for [Header](toggleswitch_header.md) changes.
     * @remarks
     * Override this method in order to add steps to behavior of a custom derived class, or to change the *oldContent* or *newContent* values before passing them on to base.
     * @param {IInspectable} oldContent The string or object content of the old content.
     * @param {IInspectable} newContent The string or object content of the new content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.toggleswitch.onheaderchanged
     */
    OnHeaderChanged(oldContent, newContent) {
        if (!this.HasProp("__IToggleSwitchOverrides")) {
            if ((queryResult := this.QueryInterface(IToggleSwitchOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSwitchOverrides := IToggleSwitchOverrides(outPtr)
        }

        return this.__IToggleSwitchOverrides.OnHeaderChanged(oldContent, newContent)
    }

;@endregion Instance Methods
}
