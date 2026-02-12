#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MenuFlyoutItemBase.ahk
#Include .\IMenuFlyoutItem.ahk
#Include .\IMenuFlyoutItem2.ahk
#Include .\IMenuFlyoutItem3.ahk
#Include .\IMenuFlyoutItemStatics2.ahk
#Include .\IMenuFlyoutItemFactory.ahk
#Include .\IMenuFlyoutItemStatics.ahk
#Include .\IMenuFlyoutItemStatics3.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a command in a [MenuFlyout](menuflyout.md) control.
 * @remarks
 * Use a [Flyout](flyout.md) control to display single items and a [MenuFlyout](menuflyout.md) control to show a menu of items.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutItem extends MenuFlyoutItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutItem.IID

    /**
     * Identifies the **Icon** dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => MenuFlyoutItem.get_IconProperty()
    }

    /**
     * Identifies the [Text](menuflyoutitem_text.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => MenuFlyoutItem.get_TextProperty()
    }

    /**
     * Identifies the [Command](menuflyoutitem_command.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.commandproperty
     * @type {DependencyProperty} 
     */
    static CommandProperty {
        get => MenuFlyoutItem.get_CommandProperty()
    }

    /**
     * Identifies the [CommandParameter](menuflyoutitem_commandparameter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.commandparameterproperty
     * @type {DependencyProperty} 
     */
    static CommandParameterProperty {
        get => MenuFlyoutItem.get_CommandParameterProperty()
    }

    /**
     * Identifies the [MenuFlyoutItem.KeyboardAcceleratorTextOverride](menuflyoutitem_keyboardacceleratortextoverride.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.keyboardacceleratortextoverrideproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorTextOverrideProperty {
        get => MenuFlyoutItem.get_KeyboardAcceleratorTextOverrideProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemStatics2.IID)
            MenuFlyoutItem.__IMenuFlyoutItemStatics2 := IMenuFlyoutItemStatics2(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemStatics2.get_IconProperty()
    }

    /**
     * 
     * @returns {MenuFlyoutItem} 
     */
    static CreateInstance() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemFactory.IID)
            MenuFlyoutItem.__IMenuFlyoutItemFactory := IMenuFlyoutItemFactory(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemStatics.IID)
            MenuFlyoutItem.__IMenuFlyoutItemStatics := IMenuFlyoutItemStatics(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemStatics.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandProperty() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemStatics.IID)
            MenuFlyoutItem.__IMenuFlyoutItemStatics := IMenuFlyoutItemStatics(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemStatics.get_CommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CommandParameterProperty() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemStatics.IID)
            MenuFlyoutItem.__IMenuFlyoutItemStatics := IMenuFlyoutItemStatics(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemStatics.get_CommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorTextOverrideProperty() {
        if (!MenuFlyoutItem.HasProp("__IMenuFlyoutItemStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutItemStatics3.IID)
            MenuFlyoutItem.__IMenuFlyoutItemStatics3 := IMenuFlyoutItemStatics3(factoryPtr)
        }

        return MenuFlyoutItem.__IMenuFlyoutItemStatics3.get_KeyboardAcceleratorTextOverrideProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text content of a [MenuFlyoutItem](menuflyoutitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the command to invoke when the item is pressed.
     * @remarks
     * The **ICommand** interface comes from a different source depending on whether the data source is implemented in Visual C++ component extensions (C++/CX) or for Microsoft .NET. Visual C++ component extensions (C++/CX) implements [Windows::UI::Xaml::Input::ICommand](../windows.ui.xaml.input/icommand.md). Microsoft .NET implements [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true). Both interfaces have the same template. Which interface you call from your app code is analogous: use [Windows::UI::Xaml::Input::ICommand](../windows.ui.xaml.input/icommand.md) for Visual C++ component extensions (C++/CX) code and [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET code.
     * 
     * The XAML syntax shown for Microsoft .NET's [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) type does not work for Windows Runtime XAML. You should always use a **Binding** reference. Constructs such as named commands and **x:Static** are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.command
     * @type {ICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

    /**
     * Gets or sets the parameter to pass to the [Command](menuflyoutitem_command.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.commandparameter
     * @type {IInspectable} 
     */
    CommandParameter {
        get => this.get_CommandParameter()
        set => this.put_CommandParameter(value)
    }

    /**
     * Gets or sets the graphic content of the menu flyout item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.icon
     * @type {IconElement} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

    /**
     * Gets or sets a string that overrides the default key combination string associated with a [keyboard accelerator](../windows.ui.xaml/uielement_keyboardaccelerators.md).
     * 
     * <img src="images/keyboard-accelerators.png" alt="Example of a menu showing keyboard accelerators for various menu items">
     * 
     * *Example of a menu showing keyboard accelerators for various menu items*
     * @remarks
     * Windows 10, version 1703, introduced [keyboard accelerator](../windows.ui.xaml/uielement_keyboardaccelerators.md) shortcuts. However, these shortcuts were not displayed with the UI of their corresponding controls.
     * 
     * Starting with Windows 10, version 1803, when [KeyboardAccelerators](../windows.ui.xaml/uielement_keyboardaccelerators.md) are declared, controls display the corresponding key combinations by default.
     * 
     * The override text is not be presented if the system cannot detect an attached keyboard (you can check this yourself through the [KeyboardPresent](../windows.devices.input/keyboardcapabilities_keyboardpresent.md) property).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.keyboardacceleratortextoverride
     * @type {HSTRING} 
     */
    KeyboardAcceleratorTextOverride {
        get => this.get_KeyboardAcceleratorTextOverride()
        set => this.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for a MenuFlyoutItem control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitem.templatesettings
     * @type {MenuFlyoutItemTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Occurs when a menu item is clicked.
     * @type {RoutedEventHandler}
    */
    OnClick {
        get {
            if(!this.HasProp("__OnClick")){
                this.__OnClick := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnClickToken := this.add_Click(this.__OnClick.iface)
            }
            return this.__OnClick
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClickToken")) {
            this.remove_Click(this.__OnClickToken)
            this.__OnClick.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.put_Text(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_Command() {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.get_Command()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.put_Command(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CommandParameter() {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.get_CommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CommandParameter(value) {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.put_CommandParameter(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Click(handler) {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.add_Click(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Click(token) {
        if (!this.HasProp("__IMenuFlyoutItem")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem := IMenuFlyoutItem(outPtr)
        }

        return this.__IMenuFlyoutItem.remove_Click(token)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__IMenuFlyoutItem2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem2 := IMenuFlyoutItem2(outPtr)
        }

        return this.__IMenuFlyoutItem2.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IMenuFlyoutItem2")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem2 := IMenuFlyoutItem2(outPtr)
        }

        return this.__IMenuFlyoutItem2.put_Icon(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyboardAcceleratorTextOverride() {
        if (!this.HasProp("__IMenuFlyoutItem3")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem3 := IMenuFlyoutItem3(outPtr)
        }

        return this.__IMenuFlyoutItem3.get_KeyboardAcceleratorTextOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorTextOverride(value) {
        if (!this.HasProp("__IMenuFlyoutItem3")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem3 := IMenuFlyoutItem3(outPtr)
        }

        return this.__IMenuFlyoutItem3.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * 
     * @returns {MenuFlyoutItemTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IMenuFlyoutItem3")) {
            if ((queryResult := this.QueryInterface(IMenuFlyoutItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMenuFlyoutItem3 := IMenuFlyoutItem3(outPtr)
        }

        return this.__IMenuFlyoutItem3.get_TemplateSettings()
    }

;@endregion Instance Methods
}
