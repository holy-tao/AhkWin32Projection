#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\ISettingsFlyout.ahk
#Include .\ISettingsFlyoutFactory.ahk
#Include .\ISettingsFlyoutStatics.ahk
#Include .\BackClickEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\BackClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * > [!NOTE]
  * > SettingsFlyout is not supported for use in Universal Windows Platform (UWP) app for Windows 10. Instead, use a [Flyout](flyout.md).
  * 
  * > [!NOTE]
  * > SettingsFlyout is supported only for use with the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) in Windows 8. While the SettingsFlyout type is visible in Windows Phone projects, [SettingsPane](../windows.ui.applicationsettings/settingspane.md) is not present on Windows Phone, so use of SettingsFlyout is not supported.
  * 
  * Represents a control that provides in-context access to settings that affect the current app. (Not recommended for Universal Windows Platform (UWP) app.)
 * @remarks
 * A SettingsFlyout control isn't intended to be a composite part of a page or general app UI. Instead, a SettingsFlyout control is typically defined as a separate XAML file, where the class you're defining is a SettingsFlyout subclass that's unique to your project, using a SettingsFlyout object element as a XAML file root. In Microsoft Visual Studio, you can use the **Add New Item** menu options for a project to add the files to your project using a basic starting template. This starting template sets styles for items contained by the SettingsFlyout control that reference existing pre-defined styles. For example, there's a style for a section header that references the `TitleTextBlockStyle` style that's defined by the Windows Runtime as a XAML resource. The generated XAML also provides some initial attribute values that are intended to be replaced. For example it sets the initial [Title](settingsflyout_title.md) value to use the class name. You'll also want to add controls or other UI to the content section to replace the templated UI it starts with.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SettingsFlyout extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsFlyout.IID

    /**
     * Identifies the [Title](settingsflyout_title.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => SettingsFlyout.get_TitleProperty()
    }

    /**
     * Identifies the [HeaderBackground](settingsflyout_headerbackground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.headerbackgroundproperty
     * @type {DependencyProperty} 
     */
    static HeaderBackgroundProperty {
        get => SettingsFlyout.get_HeaderBackgroundProperty()
    }

    /**
     * Identifies the [HeaderForeground](settingsflyout_headerforeground.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.headerforegroundproperty
     * @type {DependencyProperty} 
     */
    static HeaderForegroundProperty {
        get => SettingsFlyout.get_HeaderForegroundProperty()
    }

    /**
     * Identifies the [IconSource](settingsflyout_iconsource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.iconsourceproperty
     * @type {DependencyProperty} 
     */
    static IconSourceProperty {
        get => SettingsFlyout.get_IconSourceProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SettingsFlyout} 
     */
    static CreateInstance() {
        if (!SettingsFlyout.HasProp("__ISettingsFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SettingsFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutFactory.IID)
            SettingsFlyout.__ISettingsFlyoutFactory := ISettingsFlyoutFactory(factoryPtr)
        }

        return SettingsFlyout.__ISettingsFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!SettingsFlyout.HasProp("__ISettingsFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SettingsFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutStatics.IID)
            SettingsFlyout.__ISettingsFlyoutStatics := ISettingsFlyoutStatics(factoryPtr)
        }

        return SettingsFlyout.__ISettingsFlyoutStatics.get_TitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderBackgroundProperty() {
        if (!SettingsFlyout.HasProp("__ISettingsFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SettingsFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutStatics.IID)
            SettingsFlyout.__ISettingsFlyoutStatics := ISettingsFlyoutStatics(factoryPtr)
        }

        return SettingsFlyout.__ISettingsFlyoutStatics.get_HeaderBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderForegroundProperty() {
        if (!SettingsFlyout.HasProp("__ISettingsFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SettingsFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutStatics.IID)
            SettingsFlyout.__ISettingsFlyoutStatics := ISettingsFlyoutStatics(factoryPtr)
        }

        return SettingsFlyout.__ISettingsFlyoutStatics.get_HeaderForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconSourceProperty() {
        if (!SettingsFlyout.HasProp("__ISettingsFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SettingsFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsFlyoutStatics.IID)
            SettingsFlyout.__ISettingsFlyoutStatics := ISettingsFlyoutStatics(factoryPtr)
        }

        return SettingsFlyout.__ISettingsFlyoutStatics.get_IconSourceProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the title of the [SettingsFlyout](settingsflyout.md) control when displayed.
     * @remarks
     * > [!NOTE]
     * > Even though the default property value is an empty string, the Microsoft Visual Studio Settings Flyout item template sets the Title to the name of your settings flyout class (for example, `Title="AccountSettingsFlyout"`).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that fills the background of the [SettingsFlyout](settingsflyout.md) header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.headerbackground
     * @type {Brush} 
     */
    HeaderBackground {
        get => this.get_HeaderBackground()
        set => this.put_HeaderBackground(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that fills the foreground of the [SettingsFlyout](settingsflyout.md) header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.headerforeground
     * @type {Brush} 
     */
    HeaderForeground {
        get => this.get_HeaderForeground()
        set => this.put_HeaderForeground(value)
    }

    /**
     * Gets or sets the icon image displayed in the [SettingsFlyout](settingsflyout.md) header.
     * @remarks
     * > [!NOTE]
     * > Even though the default property value is **null**, the Microsoft Visual Studio Settings Flyout item template sets the IconSource to your app’s small logo (`IconSource="Assets/SmallLogo.png"`).
     * 
     * The IconSource property is typically set in XAML to take advantage of the built-in conversion from string.
     * 
     * If you do set the IconSource property in code, you can use a [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) object, constructed with the Uniform Resource Identifier (URI) that describes the path to a valid image source file. You can also initialize a [BitmapSource](../windows.ui.xaml.media.imaging/bitmapsource.md) with a stream, perhaps a stream from a storage file, but that's not typical for a [SettingsFlyout](settingsflyout.md) UI scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.iconsource
     * @type {ImageSource} 
     */
    IconSource {
        get => this.get_IconSource()
        set => this.put_IconSource(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [SettingsFlyout](settingsflyout.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.templatesettings
     * @type {SettingsFlyoutTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Occurs when the user clicks the back button on a [SettingsFlyout](settingsflyout.md) control.
     * @remarks
     * By default, clicking the back button on a [SettingsFlyout](settingsflyout.md) control hides the control. Handle the BackClick event and set [BackClickEventArgs.Handled](backclickeventargs_handled.md) to **true** to override this behavior and introduce your own logic.
     * 
     * This is useful when you have a [SettingsFlyout](settingsflyout.md) that opens a second [SettingsFlyout](settingsflyout.md). By default, when the user taps the Back button on the second flyout, it will reopen the [SettingsPane](../windows.ui.applicationsettings/settingspane.md). You should handle the BackClick event and reopen the first flyout instead.
     * @type {BackClickEventHandler}
    */
    OnBackClick {
        get {
            if(!this.HasProp("__OnBackClick")){
                this.__OnBackClick := WinRTEventHandler(
                    BackClickEventHandler,
                    BackClickEventHandler.IID,
                    IInspectable,
                    BackClickEventArgs
                )
                this.__OnBackClickToken := this.add_BackClick(this.__OnBackClick.iface)
            }
            return this.__OnBackClick
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBackClickToken")) {
            this.remove_BackClick(this.__OnBackClickToken)
            this.__OnBackClick.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.put_Title(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderBackground() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.get_HeaderBackground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_HeaderBackground(value) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.put_HeaderBackground(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_HeaderForeground() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.get_HeaderForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_HeaderForeground(value) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.put_HeaderForeground(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_IconSource() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.get_IconSource()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_IconSource(value) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.put_IconSource(value)
    }

    /**
     * 
     * @returns {SettingsFlyoutTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.get_TemplateSettings()
    }

    /**
     * 
     * @param {BackClickEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackClick(handler) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.add_BackClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackClick(token) {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.remove_BackClick(token)
    }

    /**
     * Opens the Settings flyout, and returns the user to the Settings pane after the flyout is dismissed.
     * @remarks
     * If a [SettingsFlyout](settingsflyout.md) is shown by calling the Show method, then clicking the Back button reopens the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) after the [SettingsFlyout](settingsflyout.md) dismisses. If a [SettingsFlyout](settingsflyout.md) is shown by calling [ShowIndependent](settingsflyout_showindependent_61271159.md), then clicking the Back button dismisses the [SettingsFlyout](settingsflyout.md) and returns the user to the app; the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) is not reopened.
     * 
     * Call the Show method in your [CommandsRequested](../windows.ui.applicationsettings/settingspane_commandsrequested.md) event handler. This code is invoked when the user opens the [SettingsFlyout](settingsflyout.md) from the [SettingsPane](../windows.ui.applicationsettings/settingspane.md), so you should return the user to the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) when they click the Back button.
     * 
     * Only one [SettingsFlyout](settingsflyout.md) is shown at a time. Calling Show on a [SettingsFlyout](settingsflyout.md) closes any other [SettingsFlyout](settingsflyout.md) currently shown. The [SettingsFlyout](settingsflyout.md) being closed completes its close animation before the new [SettingsFlyout](settingsflyout.md) begins its show animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.show
     */
    Show() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.Show()
    }

    /**
     * Opens the Settings flyout, and returns the user to the app after the flyout is dismissed.
     * @remarks
     * If a [SettingsFlyout](settingsflyout.md) is shown by calling the [Show](settingsflyout_show_392493604.md) method, then clicking the Back button reopens the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) after the [SettingsFlyout](settingsflyout.md) dismisses. If a [SettingsFlyout](settingsflyout.md) is shown by calling ShowIndependent, then clicking the Back button dismisses the [SettingsFlyout](settingsflyout.md) and returns the user to the app; the [SettingsPane](../windows.ui.applicationsettings/settingspane.md) is not reopened.
     * 
     * Call the ShowIndependent method to open the [SettingsFlyout](settingsflyout.md) from a button in your app. In this case, because the user did not open the [SettingsFlyout](settingsflyout.md) from the [SettingsPane](../windows.ui.applicationsettings/settingspane.md), they should return to your app when they click the Back button.
     * 
     * Only one [SettingsFlyout](settingsflyout.md) is shown at a time. Calling ShowIndependent on a [SettingsFlyout](settingsflyout.md) closes any other [SettingsFlyout](settingsflyout.md) currently shown. The [SettingsFlyout](settingsflyout.md) being closed completes its close animation before the new [SettingsFlyout](settingsflyout.md) begins its show animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.showindependent
     */
    ShowIndependent() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.ShowIndependent()
    }

    /**
     * Closes the Settings flyout.
     * @remarks
     * By default, the settings flyout is dismissed when the user presses the back button, and is always light-dismissed when the user taps outside of it. In most cases, you will not need to call the Hide method to dismiss the settings flyout.
     * 
     * Calling the Hide method has the same behavior as light dismiss. It always returns the user to your app and closes the settings pane, regardless of whether the settings flyout was opened by calling [Show](settingsflyout_show_392493604.md) or [ShowIndependent](settingsflyout_showindependent_61271159.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.settingsflyout.hide
     */
    Hide() {
        if (!this.HasProp("__ISettingsFlyout")) {
            if ((queryResult := this.QueryInterface(ISettingsFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsFlyout := ISettingsFlyout(outPtr)
        }

        return this.__ISettingsFlyout.Hide()
    }

;@endregion Instance Methods
}
