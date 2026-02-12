#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppBar.ahk
#Include .\ICommandBar.ahk
#Include .\ICommandBar2.ahk
#Include .\ICommandBar3.ahk
#Include .\ICommandBarStatics.ahk
#Include .\ICommandBarFactory.ahk
#Include .\ICommandBarStatics2.ahk
#Include .\ICommandBarStatics3.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CommandBar.ahk
#Include .\DynamicOverflowItemsChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a specialized app bar that provides layout for [AppBarButton](appbarbutton.md) and related command elements.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Command bar](/windows/uwp/design/controls-and-patterns/app-bars).
 * 
 * Use a CommandBar to provide users with quick access to your app's most common tasks. It's a general-purpose, flexible, light-weight control that can display both complex content, such as images, progress bars, or text blocks, as well as simple commands such as [AppBarButton](appbarbutton.md), [AppBarToggleButton](appbartogglebutton.md), and [AppBarSeparator](appbarseparator.md) controls.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBar extends AppBar {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBar.IID

    /**
     * Identifies the [PrimaryCommands](commandbar_primarycommands.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.primarycommandsproperty
     * @type {DependencyProperty} 
     */
    static PrimaryCommandsProperty {
        get => CommandBar.get_PrimaryCommandsProperty()
    }

    /**
     * Identifies the [SecondaryCommands](commandbar_secondarycommands.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.secondarycommandsproperty
     * @type {DependencyProperty} 
     */
    static SecondaryCommandsProperty {
        get => CommandBar.get_SecondaryCommandsProperty()
    }

    /**
     * Identifies the [CommandBarOverflowPresenterStyle](commandbar_commandbaroverflowpresenterstyle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.commandbaroverflowpresenterstyleproperty
     * @type {DependencyProperty} 
     */
    static CommandBarOverflowPresenterStyleProperty {
        get => CommandBar.get_CommandBarOverflowPresenterStyleProperty()
    }

    /**
     * Identifies the [DefaultLabelPosition](commandbar_defaultlabelposition.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.defaultlabelpositionproperty
     * @type {DependencyProperty} 
     */
    static DefaultLabelPositionProperty {
        get => CommandBar.get_DefaultLabelPositionProperty()
    }

    /**
     * Identifies the [OverflowButtonVisibility](commandbar_overflowbuttonvisibility.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.overflowbuttonvisibilityproperty
     * @type {DependencyProperty} 
     */
    static OverflowButtonVisibilityProperty {
        get => CommandBar.get_OverflowButtonVisibilityProperty()
    }

    /**
     * Identifies the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.isdynamicoverflowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsDynamicOverflowEnabledProperty {
        get => CommandBar.get_IsDynamicOverflowEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryCommandsProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics.IID)
            CommandBar.__ICommandBarStatics := ICommandBarStatics(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics.get_PrimaryCommandsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryCommandsProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics.IID)
            CommandBar.__ICommandBarStatics := ICommandBarStatics(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics.get_SecondaryCommandsProperty()
    }

    /**
     * 
     * @returns {CommandBar} 
     */
    static CreateInstance() {
        if (!CommandBar.HasProp("__ICommandBarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarFactory.IID)
            CommandBar.__ICommandBarFactory := ICommandBarFactory(factoryPtr)
        }

        return CommandBar.__ICommandBarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandBarOverflowPresenterStyleProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics2.IID)
            CommandBar.__ICommandBarStatics2 := ICommandBarStatics2(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics2.get_CommandBarOverflowPresenterStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultLabelPositionProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics3.IID)
            CommandBar.__ICommandBarStatics3 := ICommandBarStatics3(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics3.get_DefaultLabelPositionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OverflowButtonVisibilityProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics3.IID)
            CommandBar.__ICommandBarStatics3 := ICommandBarStatics3(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics3.get_OverflowButtonVisibilityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDynamicOverflowEnabledProperty() {
        if (!CommandBar.HasProp("__ICommandBarStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarStatics3.IID)
            CommandBar.__ICommandBarStatics3 := ICommandBarStatics3(factoryPtr)
        }

        return CommandBar.__ICommandBarStatics3.get_IsDynamicOverflowEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of primary command elements for the [CommandBar](commandbar.md).
     * @remarks
     * The PrimaryCommands collection can contain only [AppBarButton](appbarbutton.md), [AppBarToggleButton](appbartogglebutton.md), or [AppBarSeparator](appbarseparator.md) command elements. The primary commands are shown on the right side of the [CommandBar](commandbar.md), to the left of the More button (...) when the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is **LeftToRight**. The layout is reversed when the [FlowDirection](../windows.ui.xaml/frameworkelement_flowdirection.md) is **RightToLeft**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.primarycommands
     * @type {IObservableVector<ICommandBarElement>} 
     */
    PrimaryCommands {
        get => this.get_PrimaryCommands()
    }

    /**
     * Gets the collection of secondary command elements for the [CommandBar](commandbar.md).
     * @remarks
     * The SecondaryCommands collection can contain only [AppBarButton](appbarbutton.md), [AppBarToggleButton](appbartogglebutton.md), or [AppBarSeparator](appbarseparator.md) command elements. The secondary commands are shown in the overflow menu when the [CommandBar](commandbar.md) is open.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.secondarycommands
     * @type {IObservableVector<ICommandBarElement>} 
     */
    SecondaryCommands {
        get => this.get_SecondaryCommands()
    }

    /**
     * Gets or sets the [Style](../windows.ui.xaml/style.md) applied to the overflow content of the [CommandBar](commandbar.md).
     * @remarks
     * The [Style](../windows.ui.xaml/style.md) element you use for a [CommandBarOverflowPresenter](commandbaroverflowpresenter.md) value must specify `TargetType="CommandBarOverflowPresenter"`.
     * 
     * You can style the properties of the internal [CommandBarOverflowPresenter](commandbaroverflowpresenter.md) that is presenting the overflow content ([SecondaryCommands](commandbar_secondarycommands.md)) of a [CommandBar](commandbar.md). The properties that can be styled are the dependency properties of the base [ItemsControl](itemscontrol.md) class or [Control](control.md) class, such as [FontSize](control_fontsize.md) or [Padding](control_padding.md), or base element properties such as [FrameworkElement.Margin](../windows.ui.xaml/frameworkelement_margin.md) that the [CommandBarOverflowPresenter](commandbaroverflowpresenter.md) class inherits.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.commandbaroverflowpresenterstyle
     * @type {Style} 
     */
    CommandBarOverflowPresenterStyle {
        get => this.get_CommandBarOverflowPresenterStyle()
        set => this.put_CommandBarOverflowPresenterStyle(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for a [CommandBar](commandbar.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.commandbartemplatesettings
     * @type {CommandBarTemplateSettings} 
     */
    CommandBarTemplateSettings {
        get => this.get_CommandBarTemplateSettings()
    }

    /**
     * Gets or sets a value that indicates the placement and visibility of the labels on the command bar's buttons.
     * @remarks
     * By default, an app bar button's label is displayed below the icon. You can set this property to show labels to the right of the icon, or to hide labels.
     * 
     * You can set the [AppBarButton.LabelPosition](appbarbutton_labelposition.md) property to override this value and make the label always collapsed for a specific app bar button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.defaultlabelposition
     * @type {Integer} 
     */
    DefaultLabelPosition {
        get => this.get_DefaultLabelPosition()
        set => this.put_DefaultLabelPosition(value)
    }

    /**
     * Gets or sets a value that indicates when a command bar's overflow button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.overflowbuttonvisibility
     * @type {Integer} 
     */
    OverflowButtonVisibility {
        get => this.get_OverflowButtonVisibility()
        set => this.put_OverflowButtonVisibility(value)
    }

    /**
     * Gets or sets a value that indicates whether primary commands automatically move to the overflow menu when space is limited.
     * @remarks
     * For more info and guidelines, see the [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars) article.
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the IsDynamicOverflowEnabled property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbar.isdynamicoverflowenabled
     * @type {Boolean} 
     */
    IsDynamicOverflowEnabled {
        get => this.get_IsDynamicOverflowEnabled()
        set => this.put_IsDynamicOverflowEnabled(value)
    }

    /**
     * Occurs when items move into or out of the overflow menu.
     * @remarks
     * For event data, see [DynamicOverflowItemsChangingEventArgs](dynamicoverflowitemschangingeventargs.md).
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * @type {TypedEventHandler<CommandBar, DynamicOverflowItemsChangingEventArgs>}
    */
    OnDynamicOverflowItemsChanging {
        get {
            if(!this.HasProp("__OnDynamicOverflowItemsChanging")){
                this.__OnDynamicOverflowItemsChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{758990cd-a4a5-5c0a-aca5-64a629afdbcc}"),
                    CommandBar,
                    DynamicOverflowItemsChangingEventArgs
                )
                this.__OnDynamicOverflowItemsChangingToken := this.add_DynamicOverflowItemsChanging(this.__OnDynamicOverflowItemsChanging.iface)
            }
            return this.__OnDynamicOverflowItemsChanging
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDynamicOverflowItemsChangingToken")) {
            this.remove_DynamicOverflowItemsChanging(this.__OnDynamicOverflowItemsChangingToken)
            this.__OnDynamicOverflowItemsChanging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_PrimaryCommands() {
        if (!this.HasProp("__ICommandBar")) {
            if ((queryResult := this.QueryInterface(ICommandBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar := ICommandBar(outPtr)
        }

        return this.__ICommandBar.get_PrimaryCommands()
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_SecondaryCommands() {
        if (!this.HasProp("__ICommandBar")) {
            if ((queryResult := this.QueryInterface(ICommandBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar := ICommandBar(outPtr)
        }

        return this.__ICommandBar.get_SecondaryCommands()
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CommandBarOverflowPresenterStyle() {
        if (!this.HasProp("__ICommandBar2")) {
            if ((queryResult := this.QueryInterface(ICommandBar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar2 := ICommandBar2(outPtr)
        }

        return this.__ICommandBar2.get_CommandBarOverflowPresenterStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CommandBarOverflowPresenterStyle(value) {
        if (!this.HasProp("__ICommandBar2")) {
            if ((queryResult := this.QueryInterface(ICommandBar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar2 := ICommandBar2(outPtr)
        }

        return this.__ICommandBar2.put_CommandBarOverflowPresenterStyle(value)
    }

    /**
     * 
     * @returns {CommandBarTemplateSettings} 
     */
    get_CommandBarTemplateSettings() {
        if (!this.HasProp("__ICommandBar2")) {
            if ((queryResult := this.QueryInterface(ICommandBar2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar2 := ICommandBar2(outPtr)
        }

        return this.__ICommandBar2.get_CommandBarTemplateSettings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultLabelPosition() {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.get_DefaultLabelPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DefaultLabelPosition(value) {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.put_DefaultLabelPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverflowButtonVisibility() {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.get_OverflowButtonVisibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OverflowButtonVisibility(value) {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.put_OverflowButtonVisibility(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDynamicOverflowEnabled() {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.get_IsDynamicOverflowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDynamicOverflowEnabled(value) {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.put_IsDynamicOverflowEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CommandBar, DynamicOverflowItemsChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DynamicOverflowItemsChanging(handler) {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.add_DynamicOverflowItemsChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DynamicOverflowItemsChanging(token) {
        if (!this.HasProp("__ICommandBar3")) {
            if ((queryResult := this.QueryInterface(ICommandBar3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBar3 := ICommandBar3(outPtr)
        }

        return this.__ICommandBar3.remove_DynamicOverflowItemsChanging(token)
    }

;@endregion Instance Methods
}
