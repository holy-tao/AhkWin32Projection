#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplication.ahk
#Include .\IApplication2.ahk
#Include .\IApplication3.ahk
#Include .\IApplicationOverrides.ahk
#Include .\IApplicationOverrides2.ahk
#Include .\IApplicationStatics.ahk
#Include .\IApplicationFactory.ahk
#Include .\UnhandledExceptionEventHandler.ahk
#Include .\UnhandledExceptionEventArgs.ahk
#Include .\SuspendingEventHandler.ahk
#Include ..\..\ApplicationModel\SuspendingEventArgs.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include .\LeavingBackgroundEventHandler.ahk
#Include ..\..\ApplicationModel\LeavingBackgroundEventArgs.ahk
#Include .\EnteredBackgroundEventHandler.ahk
#Include ..\..\ApplicationModel\EnteredBackgroundEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Encapsulates the app and its available services.
 * @remarks
 * The Application class encapsulates an app and provides the following services: 
 * + app entry point, particularly for various activation contracts
 * + app lifetime management
 * + app-scoped resources
 * + unhandled exception detection
 * 
 * The Application object is typically provided in the initial XAML for App.xaml. The default project templates in Visual Studio generate an `App` class that derives from Application and provides an entry point where you can add initialization code.
 * 
 * The `App` class associates itself with the corresponding XAML by calling the generated `InitializeComponent` method in its constructor. You can add additional initialization code to the `App` constructor, but you will typically only add code to associate handlers to Application events. For other initialization code, you should override one or more initialization methods such as [OnLaunched](application_onlaunched_859642554.md).
 * 
 * The system handles app lifetime by suspending your app whenever the user switches to another app or to the desktop, and resuming your app whenever the user switches back to it. However, the system can also terminate your app while it is suspended in order to free up resources. You should handle the [Suspending](application_suspending.md) event to save your app state in case of termination, and override the [OnLaunched](application_onlaunched_859642554.md) method to restore your app state. You should handle the [Resuming](application_resuming.md) event only if you need to refresh any displayed content that might have changed while the app is suspended. You do not need to restore other app state when the app resumes.
 * 
 * Because of its position in the application model, codegen, and activation sequence, Application has some restrictions on its XAML usage:
 * 
 * + Other than the xmlns declarations and **x:Class**, no other attribute can appear on the `Application` root tag.
 * + Don't attempt to change **x:Class** values that come from the project template App.xaml pages, there are additional dependencies on using that naming scheme that exist in the build actions.
 * + Don't wire the Application event handlers in XAML. All event wiring should be done in code (usually in the constructor). Also, you generally use method overrides rather than event syntax for an event (for example, you override [OnActivated](application_onactivated_603737819.md) to respond to that phase of the application life cycle.)
 * + The only expected properties on an Application instance in XAML is the set of elements to populate the [Application.Resources](application_resources.md) property, using a XAML property element usage. For more info, see [Resources](application_resources.md).
 * To provide general error handling for any exceptions that your app code doesn't catch, handle the [UnhandledException](application_unhandledexception.md) event.
 * 
 * > [!NOTE]
 * > The Application main file must be named `App.xaml`.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Application extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplication

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplication.IID

    /**
     * Gets the [Application](application.md) object for the current application.
     * @remarks
     * [Application](application.md) is a singleton that implements the static Current property to provide shared access to the [Application](application.md) instance for the current application. The singleton pattern ensures that state managed by [Application](application.md), including shared resources and properties, is available from a single, shared location.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.current
     * @type {Application} 
     */
    static Current {
        get => Application.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Application} 
     */
    static get_Current() {
        if (!Application.HasProp("__IApplicationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Application")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationStatics.IID)
            Application.__IApplicationStatics := IApplicationStatics(factoryPtr)
        }

        return Application.__IApplicationStatics.get_Current()
    }

    /**
     * Provides the entry point and requests initialization of the application. Use the callback to instantiate the [Application](application.md) class.
     * @remarks
     * Typically, you will not need to call this method directly. If you use Visual Studio to develop your apps, the build system will generate code that includes the necessary call for you.
     * 
     * The callback runs in the same thread as the main view.
     * @param {ApplicationInitializationCallback} callback The callback that should be invoked during the initialization sequence.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.start
     */
    static Start(callback) {
        if (!Application.HasProp("__IApplicationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Application")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationStatics.IID)
            Application.__IApplicationStatics := IApplicationStatics(factoryPtr)
        }

        return Application.__IApplicationStatics.Start(callback)
    }

    /**
     * Loads a XAML file that is located at the specified relative location, and converts it to an instance of the object that is specified by the root element of the XAML file.
     * @remarks
     * LoadComponent exists mainly for infrastructure. You can see LoadComponent as part of the generated **InitializeComponent** logic that integrates the partial classes of a XAML page and its code-behind.
     * 
     * LoadComponent sometimes is cited in a call stack for an exception that is ultimately because your app is trying to parse bad XAML. In this case there's nothing that app code can do to change how [LoadComponent](application_loadcomponent_91636756.md) is used, and the way to fix the problem is to check your XAML source in an XML editor and fix it. What might be helpful from the stack trace message is confirming which XAML file is not loading. In scenarios where you have merged resources or other multiple XAML sources being combined, it's not always the obvious page-level XAML that is failing to parse.
     * 
     * Most app scenarios that involve loading XAML content and producing an object tree should use [XamlReader.Load](../windows.ui.xaml.markup/xamlreader_load_1077941801.md) instead.
     * @param {IInspectable} component_ An object of the same type as the root element of the XAML content to be loaded.
     * @param {Uri} resourceLocator An object describing the Uniform Resource Identifier (URI) path to the resource to load.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.loadcomponent
     */
    static LoadComponent(component_, resourceLocator) {
        if (!Application.HasProp("__IApplicationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Application")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationStatics.IID)
            Application.__IApplicationStatics := IApplicationStatics(factoryPtr)
        }

        return Application.__IApplicationStatics.LoadComponent(component_, resourceLocator)
    }

    /**
     * Loads a XAML file that is located at the specified relative location, and converts it to an instance of the object that is specified by the root element of the XAML file.
     * @param {IInspectable} component_ An object of the same type as the root element of the XAML content to be loaded.
     * @param {Uri} resourceLocator An object describing the Uniform Resource Identifier (URI) path to the resource to load.
     * @param {Integer} componentResourceLocation_ A value of the enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.loadcomponent
     */
    static LoadComponentWithResourceLocation(component_, resourceLocator, componentResourceLocation_) {
        if (!Application.HasProp("__IApplicationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Application")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationStatics.IID)
            Application.__IApplicationStatics := IApplicationStatics(factoryPtr)
        }

        return Application.__IApplicationStatics.LoadComponentWithResourceLocation(component_, resourceLocator, componentResourceLocation_)
    }

    /**
     * 
     * @returns {Application} 
     */
    static CreateInstance() {
        if (!Application.HasProp("__IApplicationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Application")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationFactory.IID)
            Application.__IApplicationFactory := IApplicationFactory(factoryPtr)
        }

        return Application.__IApplicationFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a collection of application-scoped resources, such as styles, templates, and brushes.
     * @remarks
     * The resource dictionary model in the Windows Runtime supports many of the XAML resource concepts you may be familiar with if you have created applications using Windows Presentation Foundation (WPF) or Microsoft Silverlight. For more info, see [ResourceDictionary and XAML resource references](/windows/apps/design/style/xaml-resource-dictionary).
     * 
     * The resources you define in the [ResourceDictionary](resourcedictionary.md) that fills the `Application.Resources` property element are available for retrieval from any page of your app. This is advantageous if many of your app's pages are all using the same resource. For example, if you have a [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) resource that you're using for color schemes in your app's UI, and that color is used on most of your pages, it makes sense to declare that [SolidColorBrush](../windows.ui.xaml.media/solidcolorbrush.md) in the `Application.Resources` used for `Application.Resources`.
     * 
     * When you add resources to `Application.Resources`, add them either before or after any existing `ResourceDictionary.MergedResources`. The rules of XAML don't allow you to put content on both sides of a property element tag. For more info, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.resources
     * @type {ResourceDictionary} 
     */
    Resources {
        get => this.get_Resources()
        set => this.put_Resources(value)
    }

    /**
     * Gets an object that declares how the app behaves when run in a debug environment.
     * @remarks
     * To modify the app debug settings, get the [DebugSettings](debugsettings.md) object from this property and then change its properties as necessary.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.debugsettings
     * @type {DebugSettings} 
     */
    DebugSettings {
        get => this.get_DebugSettings()
    }

    /**
     * Gets or sets a value that determines the light-dark preference for the overall theme of an app.
     * @remarks
     * There are two built in themes: "Light" and "Dark". By default your app runs using the theme set by the user in Windows settings (Settings > Personalization > Colors > Choose your default app mode). You can set the app's RequestedTheme property to override the user default and specify which theme is used.
     * 
     * The theme can only be set when the app is started, not while it's running. Attempting to set RequestedTheme while the app is running throws an exception (**NotSupportedException** for Microsoft .NET code). If you give the user an option to pick a theme that's part of app UI, you must save the setting in the app data and apply it when the app is restarted. (For more info about app settings, see [Store and retrieve settings and other app data](/windows/uwp/design/app-settings/store-and-retrieve-app-data)).
     * 
     * You can change specific theme values at run-time after Application.RequestedTheme is applied, if you use the [FrameworkElement.RequestedTheme](frameworkelement_requestedtheme.md) property and sets values on specific elements in the UI.
     * 
     * There is also a "HighContrast" theme that uses system values, but apps and app code use a different technique for switching the app to high contrast. The RequestedTheme property is ignored if the user is running in high contrast mode. See [High-contrast themes](/windows/uwp/accessibility/high-contrast-themes) and [XAML high contrast style sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/XAML%20high%20contrast%20style%20sample).
     * 
     * Although the app can't switch the themes at run-time, the user can (starting with Windows 8.1). For example, a user might enable a high-contrast theme while your app is running, by using the Alt+Shift+PrtScn key shortcut. If this happens, the XAML resource system will recalculate the resource values for any [{ThemeResource} markup extension](/windows/uwp/xaml-platform/themeresource-markup-extension) usage. Theme-appropriate resources such as colors and brushes then use values appropriate for the current theme, even though it wasn't the app that requested that theme originally.
     * 
     * The resources that are theme-specific are typically defined in a separate resource dictionary in XAML. This resource dictionary comes from the [ThemeDictionaries](resourcedictionary_themedictionaries.md) property of the primary [ResourceDictionary](resourcedictionary.md) that is used for control templates. The default system resource dictionary for theme-specific resources is named ThemeResources.xaml. This file is available in the \(Program Files)\Windows Kits\10\DesignTime\CommonConfiguration\Neutral\UAP\<SDK version>\Generic folder from a Windows Software Development Kit (SDK) installation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.requestedtheme
     * @type {Integer} 
     */
    RequestedTheme {
        get => this.get_RequestedTheme()
        set => this.put_RequestedTheme(value)
    }

    /**
     * Gets or sets the type of visual feedback that an app can use to indicate the UI element with focus.
     * 
     * > This property is valid only for input devices that can generate key events, such as a keyboard or game pad.
     * @remarks
     * [HighVisibility](focusvisualkind.md) focus visuals are rendered with an outer (primary) and inner (secondary) border. 
     * For more info:
     * 
     * + [FocusVisualPrimaryBrush](frameworkelement_focusvisualprimarybrush.md)
     * + [FocusVisualSecondaryBrush](frameworkelement_focusvisualsecondarybrush.md)
     * + [FocusVisualPrimaryThickness](frameworkelement_focusvisualprimarythickness.md)
     * + [FocusVisualSecondaryThickness](frameworkelement_focusvisualsecondarythickness.md)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.focusvisualkind
     * @type {Integer} 
     */
    FocusVisualKind {
        get => this.get_FocusVisualKind()
        set => this.put_FocusVisualKind(value)
    }

    /**
     * Gets or sets whether a UWP app supports mouse mode, which emulates pointer interaction experiences with non-pointer input devices such as an game pad or remote control. (All nested elements inherit this behavior.)
     * @remarks
     * For non-pointer input devices, focus is moved between controls through a variety of methods, such as the Tab and arrow keys on a keyboard, the directional pad (D-pad) on a remote, or thumb sticks on a controller. For some user experiences, such as maps and drawing surfaces, it is not possible or practical to use XY focus navigation. RequiresPointerMode enables an app to provide a more pointer-like interaction experience through a cursor that can be moved freely using the game input devices.
     * 
     * RequiresPointerMode is supported only on the Xbox device family, and only when using a game pad or remote control. The property is ignored otherwise.
     * 
     * [RequiresPointer](../windows.ui.xaml.controls/control_requirespointer.md) sets mouse mode at the UI element level.
     * 
     * For more info, see the [Mouse mode](/windows/uwp/input-and-devices/designing-for-tv) section of [Designing for Xbox and TV](/windows/uwp/input-and-devices/designing-for-tv).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.requirespointermode
     * @type {Integer} 
     */
    RequiresPointerMode {
        get => this.get_RequiresPointerMode()
        set => this.put_RequiresPointerMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the framework automatically adjusts visual properties when high contrast themes are enabled.
     * @remarks
     * The value of this property affects all [UIElement](uielement.md) instances where the UIElement's [HighContrastAdjustment](uielement_highcontrastadjustment.md) has not been explicitly set.  Setting it to **None** provides an easy way to disable the framework's automatic adjustments across all its windows and elements.
     * 
     * For more information about the behavior of this feature, see the remarks for the [UIElement.HighContrastAdjustment](uielement_highcontrastadjustment.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.highcontrastadjustment
     * @type {Integer} 
     */
    HighContrastAdjustment {
        get => this.get_HighContrastAdjustment()
        set => this.put_HighContrastAdjustment(value)
    }

    /**
     * Occurs when an exception can be handled by app code, as forwarded from a native-level Windows Runtime error. Apps can mark the occurrence as handled in event data.
     * @remarks
     * The UnhandledException event is used to notify the app about exceptions encountered by the XAML framework or by the Windows Runtime in general that have not been handled by app code.
     * 
     * For example, if the Windows Runtime invokes app code like an event handler, and the app code throws an exception and does not catch it, the exception will propagate back to the Windows Runtime. The Windows Runtime will then fire the UnhandledException event to notify the app of this exception.
     * 
     * Handling exceptions in an UnhandledException is just one of many techniques that can be used both for debugging and for run-time exception handling and possible recovery. For more info about the full set of techniques you might use for debugging and error handling, see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)).
     * 
     * Note that this event will only fire when there is no longer any possibility that app code can catch an exception. For example, imagine that an app event handler calls a Windows Runtime  API that in turn invokes a callback. If the inner app code throws an exception and does not catch it, the exception will propagate through the Windows Runtime back to the outer layer of app code, which is given a chance to catch it. The UnhandledException event is fired only when there are no more opportunities for app code to catch an exception through normal propagation.
     * 
     * It’s also possible for an exception to be thrown and never have any chance to be caught by app code. For example, if the XAML framework is performing layout and an exception is thrown, this exception won’t propagate through any app code. In this case, the UnhandledException event fires, and this will be the first time any app code is notified about the exception.
     * 
     * Normally after the UnhandledException event is fired, the Windows Runtime terminates the app because the exception was unhandled. The app code has some control over this: if the UnhandledException event handler sets the [Handled](unhandledexceptioneventargs_handled.md) property of the event arguments to **true**, then in most cases the app will not be terminated. However, doing so routinely is not recommended for several reasons: 
     * + Typically the UnhandledException event handler doesn’t have enough information to know whether continuing on after an exception is safe. Parts of the application code or the Windows Runtime may be in an inconsistent state, which could result in subsequent failures if the app continues running its code.
     * + The Windows Runtime considers exceptions encountered during certain operations as nonrecoverable, because the Windows Runtime itself will be in an inconsistent state following these exceptions. For such exceptions, even if the UnhandledException event handler sets [Handled](unhandledexceptioneventargs_handled.md) to **true**, the app will still be terminated.
     * + Errors that happen during navigation could cause a state where there's nothing loaded as content and nothing to indicate to the user that the app is still running.
     * + For more info on these points see [Exception handling for    in C# or Visual Basic](/previous-versions/windows/apps/dn532194(v=win.10)).
     * 
     * 
     * 
     * <!--THIS FIXED in 8.1 with unified exception model<p  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">It’s important to be aware of several limitations of the <xref targtype="event_winrt" rid="w_ui_xaml.application_unhandledexception">UnhandledException</xref> event. This event is only used with exceptions encountered by the XAML framework or the core <tla rid="winrt"/>. Exceptions encountered by other <tla rid="winrt"/> components or parts of the app that are not using  the XAML framework will not result in this event being raised. For example, if a different <tla rid="windows"/> component calls into app  code and an exception is thrown and not caught, the <xref targtype="event_winrt" rid="w_ui_xaml.application_unhandledexception">UnhandledException</xref> event won’t fire, and the app won't have a chance to handle that. There's also an affinity to the UI thread. If app  code creates a worker thread, and then raises an exception on the worker thread, the <xref targtype="event_winrt" rid="w_ui_xaml.application_unhandledexception">UnhandledException</xref> event doesn't fire.</p>-->
     * A notable limitation is that the UnhandledException event arguments don’t contain as much detail as the original exception as propagated from app code. Whenever possible, if the app requires specific processing of a certain exception, it’s always better to catch the exception as it propagates, because more detail will be available then. The UnhandledException event arguments expose an exception object through the [Exception](unhandledexceptioneventargs_exception.md) property. However, the type, message, and stack trace of this exception object are not guaranteed to match those of the original exception that was raised. The event arguments do expose a [Message](unhandledexceptioneventargs_message.md) property. In most cases, this will contain the message of the originally raised exception.
     * 
     * You can't wire handlers for UnhandledException in XAML (on the [Application](application.md) element in App.xaml). You must attach handlers for UnhandledException on the [Application](application.md) object in code, either in the constructor or in activation logic.
     * 
     * For Windows 8.1 apps, exceptions from async method calls can propagate as an UnhandledException event. This includes your own async method implementations (activation handlers and so on).
     * @type {UnhandledExceptionEventHandler}
    */
    OnUnhandledException {
        get {
            if(!this.HasProp("__OnUnhandledException")){
                this.__OnUnhandledException := WinRTEventHandler(
                    UnhandledExceptionEventHandler,
                    UnhandledExceptionEventHandler.IID,
                    IInspectable,
                    UnhandledExceptionEventArgs
                )
                this.__OnUnhandledExceptionToken := this.add_UnhandledException(this.__OnUnhandledException.iface)
            }
            return this.__OnUnhandledException
        }
    }

    /**
     * Occurs when the application transitions to Suspended state from some other state.
     * @remarks
     * The system suspends your app whenever the user switches to another app or to the desktop, and resumes your app whenever the user switches back to it. However, the system can also terminate your app while it is suspended in order to free up resources. Therefore, you should handle the Suspending event to perform the following operations:
     * 
     * 
     * + Preserve user session state.
     * + Release any exclusive locks on resources.
     * + Reduce memory usage if possible. For example, serialize any data that is easy to reconstruct in object form upon reactivation.
     * + Save app state.
     * The Suspending event is the only indication your app will receive prior to termination (if it happens). Because of this, you should store enough session state (such as the current article being read or the current movie playback position) to recreate the exact same experience during activation. The guidance for content creation apps is to save a user’s work early and often but also commit one final save during Suspending. Saving data prior to suspension is useful because the Suspending event handler has only 5 seconds to complete its operation.
     * 
     * If your app is terminated, you can restore the app state in an [OnLaunched](application_onlaunched_859642554.md) method override. If your app resumes before it is terminated, the system restores the app state automatically. You should handle the [Resuming](application_resuming.md) event only if you need to refresh any displayed content that might have changed while the app is suspended, such as news feeds or the user's location.
     * 
     * The Suspending event runs in the same apartment it was registered in.
     * @type {SuspendingEventHandler}
    */
    OnSuspending {
        get {
            if(!this.HasProp("__OnSuspending")){
                this.__OnSuspending := WinRTEventHandler(
                    SuspendingEventHandler,
                    SuspendingEventHandler.IID,
                    IInspectable,
                    SuspendingEventArgs
                )
                this.__OnSuspendingToken := this.add_Suspending(this.__OnSuspending.iface)
            }
            return this.__OnSuspending
        }
    }

    /**
     * Occurs when the application transitions from Suspended state to Running state.
     * @remarks
     * The system suspends your app whenever the user switches to another app or to the desktop, and resumes your app whenever the user switches back to it. However, the system can also terminate your app while it is suspended in order to free up resources. Therefore, you should handle the [Suspending](application_suspending.md) event to save your app state.
     * 
     * If your app is terminated, you can restore the app state in an [OnLaunched](application_onlaunched_859642554.md) method override. If your app resumes before it is terminated, the system restores the app state automatically. You should handle the Resuming event only if you need to refresh any displayed content that might have changed while the app is suspended, such as news feeds or the user's location.
     * 
     * Applications should avoid invoking code that puts a high load on the UI thread in response to Resuming. Doing so gives appearance to the user that the shell is being unresponsive, when in fact it is your application code that is the throttle point. Delegate operations to other threads if possible, or use a staged or virtualized approach for rebuilding views and UI whenever the application is resumed.
     * 
     * The Resuming event runs in the same apartment it was registered in.
     * @type {EventHandler<IInspectable>}
    */
    OnResuming {
        get {
            if(!this.HasProp("__OnResuming")){
                this.__OnResuming := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnResumingToken := this.add_Resuming(this.__OnResuming.iface)
            }
            return this.__OnResuming
        }
    }

    /**
     * Occurs when the app moves from the background to the foreground.
     * @remarks
     * The LeavingBackground event runs in the same apartment it was registered in.
     * @type {LeavingBackgroundEventHandler}
    */
    OnLeavingBackground {
        get {
            if(!this.HasProp("__OnLeavingBackground")){
                this.__OnLeavingBackground := WinRTEventHandler(
                    LeavingBackgroundEventHandler,
                    LeavingBackgroundEventHandler.IID,
                    IInspectable,
                    LeavingBackgroundEventArgs
                )
                this.__OnLeavingBackgroundToken := this.add_LeavingBackground(this.__OnLeavingBackground.iface)
            }
            return this.__OnLeavingBackground
        }
    }

    /**
     * Occurs when the app moves from the foreground to the background.
     * @remarks
     * This event is fired when the user navigates away from the app. There is a limited amount of time that an event handler for this event can run. 
     * 
     * When your app moves into the background, the memory constraints enforced by the system may change. Use this event to check your current memory consumption and free resources in order to stay below the limit so that your app won't be suspended and possibly terminated while it is in the background.  See [Free memory when your app moves to the background](/windows/uwp/launch-resume/reduce-memory-usage) for more details.
     * 
     * The EnteredBackground event runs in the apartment it was registered in.
     * @type {EnteredBackgroundEventHandler}
    */
    OnEnteredBackground {
        get {
            if(!this.HasProp("__OnEnteredBackground")){
                this.__OnEnteredBackground := WinRTEventHandler(
                    EnteredBackgroundEventHandler,
                    EnteredBackgroundEventHandler.IID,
                    IInspectable,
                    EnteredBackgroundEventArgs
                )
                this.__OnEnteredBackgroundToken := this.add_EnteredBackground(this.__OnEnteredBackground.iface)
            }
            return this.__OnEnteredBackground
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUnhandledExceptionToken")) {
            this.remove_UnhandledException(this.__OnUnhandledExceptionToken)
            this.__OnUnhandledException.iface.Dispose()
        }

        if(this.HasProp("__OnSuspendingToken")) {
            this.remove_Suspending(this.__OnSuspendingToken)
            this.__OnSuspending.iface.Dispose()
        }

        if(this.HasProp("__OnResumingToken")) {
            this.remove_Resuming(this.__OnResumingToken)
            this.__OnResuming.iface.Dispose()
        }

        if(this.HasProp("__OnLeavingBackgroundToken")) {
            this.remove_LeavingBackground(this.__OnLeavingBackgroundToken)
            this.__OnLeavingBackground.iface.Dispose()
        }

        if(this.HasProp("__OnEnteredBackgroundToken")) {
            this.remove_EnteredBackground(this.__OnEnteredBackgroundToken)
            this.__OnEnteredBackground.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ResourceDictionary} 
     */
    get_Resources() {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.get_Resources()
    }

    /**
     * 
     * @param {ResourceDictionary} value 
     * @returns {HRESULT} 
     */
    put_Resources(value) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.put_Resources(value)
    }

    /**
     * 
     * @returns {DebugSettings} 
     */
    get_DebugSettings() {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.get_DebugSettings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedTheme() {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.get_RequestedTheme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestedTheme(value) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.put_RequestedTheme(value)
    }

    /**
     * 
     * @param {UnhandledExceptionEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnhandledException(handler) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.add_UnhandledException(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UnhandledException(token) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.remove_UnhandledException(token)
    }

    /**
     * 
     * @param {SuspendingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Suspending(handler) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.add_Suspending(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Suspending(token) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.remove_Suspending(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Resuming(handler) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.add_Resuming(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Resuming(token) {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.remove_Resuming(token)
    }

    /**
     * Shuts down the app.
     * @remarks
     * Use this method to provide UI that enables users to exit your app. Normally, however, you should not provide this UI because the system automatically manages app lifetime and terminates suspended apps as needed to free resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.exit
     */
    Exit() {
        if (!this.HasProp("__IApplication")) {
            if ((queryResult := this.QueryInterface(IApplication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication := IApplication(outPtr)
        }

        return this.__IApplication.Exit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusVisualKind() {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.get_FocusVisualKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FocusVisualKind(value) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.put_FocusVisualKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequiresPointerMode() {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.get_RequiresPointerMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequiresPointerMode(value) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.put_RequiresPointerMode(value)
    }

    /**
     * 
     * @param {LeavingBackgroundEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LeavingBackground(handler) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.add_LeavingBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LeavingBackground(token) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.remove_LeavingBackground(token)
    }

    /**
     * 
     * @param {EnteredBackgroundEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnteredBackground(handler) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.add_EnteredBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnteredBackground(token) {
        if (!this.HasProp("__IApplication2")) {
            if ((queryResult := this.QueryInterface(IApplication2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication2 := IApplication2(outPtr)
        }

        return this.__IApplication2.remove_EnteredBackground(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighContrastAdjustment() {
        if (!this.HasProp("__IApplication3")) {
            if ((queryResult := this.QueryInterface(IApplication3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication3 := IApplication3(outPtr)
        }

        return this.__IApplication3.get_HighContrastAdjustment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighContrastAdjustment(value) {
        if (!this.HasProp("__IApplication3")) {
            if ((queryResult := this.QueryInterface(IApplication3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplication3 := IApplication3(outPtr)
        }

        return this.__IApplication3.put_HighContrastAdjustment(value)
    }

    /**
     * Invoked when the application is activated by some means other than normal launching.
     * @remarks
     * When a user launches your app normally (for example, by tapping the app tile), only the [OnLaunched](application_onlaunched_859642554.md) method is called. Override the OnActivated method to perform any general app initialization that should occur only when the app is not launched normally (for example, from another app through the Search contract). You can determine how the app was activated through the [IActivatedEventArgs.Kind](../windows.applicationmodel.activation/iactivatedeventargs_kind.md) property.
     * 
     * For most kinds of activation, you can perform initialization specific to the activation type by overriding one of the following methods instead of the OnActivated method:
     * + [OnFileActivated](application_onfileactivated_2046716329.md)
     * + [OnSearchActivated](application_onsearchactivated_1291367716.md)
     * + [OnShareTargetActivated](application_onsharetargetactivated_169511293.md)
     * + [OnFileOpenPickerActivated](application_onfileopenpickeractivated_101387531.md)
     * + [OnFileSavePickerActivated](application_onfilesavepickeractivated_425940653.md)
     * + [OnCachedFileUpdaterActivated](application_oncachedfileupdateractivated_383584449.md)
     * 
     * 
     * For more info, see [App lifecycle](/windows/uwp/launch-resume/app-lifecycle).
     * @param {IActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onactivated
     */
    OnActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnActivated(args)
    }

    /**
     * Invoked when the application is launched. Override this method to perform application initialization and to display initial content in the associated [Window](window.md).
     * @remarks
     * Override the OnLaunched method to perform any general app initialization that should occur only when the user launches your app normally (for example, by tapping the app tile). For info on other kinds of activation, see [OnActivated](application_onactivated_603737819.md). Specific activation kinds sometimes have a specific override, also a virtual method on [Application](application.md). For example, [OnFileActivated](application_onfileactivated_2046716329.md) is invoked for any core [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) event on the [Application](application.md) if the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **File**.
     * 
     * The starting project templates include a basic implementation for OnLaunched. The implementation sets the initial root visual for the application by setting `Window.Current.Content` to a new instance of the class defined by the project template's MainPage XAML/code-behind pair. All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * 
     * For example code of overrides of OnLaunched, create a new app project and examine the template-created code in the app.xaml code-behind.
     * 
     * > [!NOTE]
     * > The app.xaml code-behind from some project templates reference API in a SuspensionManager helper class. In this case, the OnLaunched override is asynchronous, because some of the SuspensionManager  API it calls is asynchronous. For more info, see [Minimize startup time](/previous-versions/windows/apps/hh994639(v=win.10)).
     * @param {LaunchActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onlaunched
     */
    OnLaunched(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnLaunched(args)
    }

    /**
     * Invoked when the application is activated through file-open.
     * @remarks
     * OnFileActivated is a pre-defined activation point handler that is invoked for a core [Activated](../windows.ui.core/corewindow_activated.md) event when the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **File**.
     * 
     * An app can register to become the default handler for a certain file type. You should only register for a file type if you expect to handle all file launches for that type of file. In addition to overriding OnFileActivated, your app must also specify an extension point in the package manifest. For more info, see [How to handle file activation](/previous-versions/windows/apps/hh779669(v=win.10)).
     * 
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * @param {FileActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onfileactivated
     */
    OnFileActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnFileActivated(args)
    }

    /**
     * Invoked when the application is activated through a search association.
     * @remarks
     * OnSearchActivated is a pre-defined activation point handler that is invoked for a core [Activated](../windows.ui.core/corewindow_activated.md) event when the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **Search**.
     * 
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * 
     * The [Search contract sample (Windows 8)](https://code.msdn.microsoft.com/windowsapps/Search-app-contract-sample-118a92f5) demonstrates how to respond to a [Search](../windows.applicationmodel.activation/activationkind.md) activated event.
     * 
     * Consider writing your OnSearchActivated handler as asynchronous. For more info, see [Minimize startup time](/previous-versions/windows/apps/hh994639(v=win.10)).
     * @param {SearchActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onsearchactivated
     */
    OnSearchActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnSearchActivated(args)
    }

    /**
     * Invoked when the application is activated through sharing association.
     * @remarks
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * 
     * For example code, see [Share target activation sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/ShareTarget).
     * @param {ShareTargetActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onsharetargetactivated
     */
    OnShareTargetActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnShareTargetActivated(args)
    }

    /**
     * Invoked when the application is activated through file-open dialog association.
     * @remarks
     * OnFileOpenPickerActivated is a pre-defined activation point handler that is invoked for a core [Activated](../windows.ui.core/corewindow_activated.md) event when the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **FileOpenPicker**.
     * 
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * @param {FileOpenPickerActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onfileopenpickeractivated
     */
    OnFileOpenPickerActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnFileOpenPickerActivated(args)
    }

    /**
     * Invoked when the application is activated through file-save dialog association.
     * @remarks
     * OnFileSavePickerActivated is a pre-defined activation point handler that is invoked for a core [Activated](../windows.ui.core/corewindow_activated.md) event when the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **FileSavePicker**. This occurs when the user saves a file through the file picker and selects the app as the location.
     * 
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * 
     * For example code that shows an OnFileSavePickerActivated override, see [File picker contracts sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/File%20picker%20contracts%20sample).
     * @param {FileSavePickerActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onfilesavepickeractivated
     */
    OnFileSavePickerActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnFileSavePickerActivated(args)
    }

    /**
     * Invoked when the application is activated due to an activation contract with [ActivationKind](../windows.applicationmodel.activation/activationkind.md) as **CachedFileUpdater**.
     * @remarks
     * [OnFileOpenPickerActivated](application_onfileopenpickeractivated_101387531.md) is a pre-defined activation point handler that is invoked for a core [Activated](../windows.ui.core/corewindow_activated.md) event when the [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **CachedFileUpdater**. The default template app.xaml code-behind files always include an override for [OnLaunched](application_onlaunched_859642554.md), but defining overrides for other activation points such as OnCachedFileUpdaterActivated is up to your app code.
     * 
     * All [Application](application.md) overrides involved in an activation scenario should call [Window.Activate](window_activate_1797342875.md) in their implementations.
     * 
     * For example code that overrides [OnFileOpenPickerActivated](application_onfileopenpickeractivated_101387531.md), see [File picker contracts sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/File%20picker%20contracts%20sample).
     * @param {CachedFileUpdaterActivatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.oncachedfileupdateractivated
     */
    OnCachedFileUpdaterActivated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnCachedFileUpdaterActivated(args)
    }

    /**
     * Invoked when the application creates a window.
     * @remarks
     * This method is called once for the creation of the main window, once for each hosted window, and once each time [CreateNewView](/uwp/api/windows.applicationmodel.core.coreapplication.createnewview) is called. You can override this method, for example, to access various panes by calling **GetForCurrentView** methods such as [SearchPane.GetForCurrentView](../windows.applicationmodel.search/searchpane_getforcurrentview_1363600702.md) and [SettingsPane.GetForCurrentView](../windows.ui.applicationsettings/settingspane_getforcurrentview_1363600702.md).
     * @param {WindowCreatedEventArgs} args Event data for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onwindowcreated
     */
    OnWindowCreated(args) {
        if (!this.HasProp("__IApplicationOverrides")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides := IApplicationOverrides(outPtr)
        }

        return this.__IApplicationOverrides.OnWindowCreated(args)
    }

    /**
     * Invoked when the application is activated in the background.
     * @param {BackgroundActivatedEventArgs} args Data about the background activation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.application.onbackgroundactivated
     */
    OnBackgroundActivated(args) {
        if (!this.HasProp("__IApplicationOverrides2")) {
            if ((queryResult := this.QueryInterface(IApplicationOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationOverrides2 := IApplicationOverrides2(outPtr)
        }

        return this.__IApplicationOverrides2.OnBackgroundActivated(args)
    }

;@endregion Instance Methods
}
