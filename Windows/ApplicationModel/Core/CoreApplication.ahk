#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreApplicationExit.ahk
#Include .\ICoreImmersiveApplication3.ahk
#Include .\ICoreApplicationUseCount.ahk
#Include .\ICoreImmersiveApplication.ahk
#Include .\ICoreImmersiveApplication2.ahk
#Include .\ICoreApplication3.ahk
#Include .\ICoreApplicationUnhandledError.ahk
#Include .\ICoreApplication2.ahk
#Include .\ICoreApplication.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables apps to handle state changes, manage windows, and integrate with a variety of UI frameworks.
 * @remarks
 * The system creates this object as a singleton when it runs the app. It is run as an Application Single-Threaded Apartment (ASTA). Threads created from the app singleton, such as the view provider (seen in the sample below), should be attributed as Multi-Threaded Apartment (MTAThread). 
 * 
 * This API is supported in Universal Windows Platform apps only, except for the [Properties](coreapplication_properties.md) property, which is always available.
 * 
 * ```cppwinrt
 * struct App : implements<App, IFrameworkViewSource, IFrameworkView>
 * {
 * public:
 *     IFrameworkView CreateView()
 *     {
 *         return *this;
 *     }
 * };
 * 
 * ...
 * 
 * int __stdcall wWinMain(HINSTANCE, HINSTANCE, PWSTR, int)
 * {
 *     Windows::ApplicationModel::Core::CoreApplication::Run(App());
 * }
 * ```
 * 
 * ```cppcx
 * ref class MyFrameworkViewSource : IFrameworkViewSource
 * {
 * public:
 *     virtual IFrameworkView^ CreateView()
 *     {
 *         return ref new MyFrameworkView();
 *     }
 * };
 * 
 * // ...
 * 
 * [Platform::MTAThread]
 * int main(Platform::Array<Platform::String^>^)
 * {
 *     auto frameworkViewSource = ref new MyFrameworkViewSource();
 *     Windows::ApplicationModel::Core::CoreApplication::Run(frameworkViewSource);
 *     return 0;
 * }
 * ```
 * 
 * ```csharp
 * internal class ApplicationSource : IFrameworkViewSource
 * {
 * 	public virtual IFrameworkView CreateView()
 * 	{
 * 		return new CoreApp();
 * 	}
 * }
 * 
 * ...
 * 
 * [MTAThread]
 * public static int Main()
 * {
 * 	var appSource = new ApplicationSource();
 * 	CoreApplication.Run(appSource);
 * 	return 0;
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class CoreApplication extends IInspectable {
;@region Static Properties
    /**
     * Gets all views for the app.
     * @remarks
     * A view is an app window and its thread.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.views
     * @type {IVectorView<CoreApplicationView>} 
     */
    static Views {
        get => CoreApplication.get_Views()
    }

    /**
     * Gets the main [CoreApplicationView](coreapplicationview.md) instance for all running apps that use this [CoreApplication](coreapplication.md) instance.
     * @remarks
     * A [CoreApplicationView](coreapplicationview.md) is the app window and its thread.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.mainview
     * @type {CoreApplicationView} 
     */
    static MainView {
        get => CoreApplication.get_MainView()
    }

    /**
     * Gets the package-relative app identifier for the process.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.id
     * @type {HSTRING} 
     */
    static Id {
        get => CoreApplication.get_Id()
    }

    /**
     * Gets a property set that the app and UI frameworks can use to store info while the process is running.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.properties
     * @type {IPropertySet} 
     */
    static Properties {
        get => CoreApplication.get_Properties()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Shuts down the app.
     * @remarks
     * Starting with Windows 10, calling this method is no longer is treated as an app crash.
     * 
     * Don't call this method from within an activation event handler.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.exit
     */
    static Exit() {
        if (!CoreApplication.HasProp("__ICoreApplicationExit")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationExit.IID)
            CoreApplication.__ICoreApplicationExit := ICoreApplicationExit(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationExit.Exit()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Exiting(handler) {
        if (!CoreApplication.HasProp("__ICoreApplicationExit")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationExit.IID)
            CoreApplication.__ICoreApplicationExit := ICoreApplicationExit(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationExit.add_Exiting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Exiting(token) {
        if (!CoreApplication.HasProp("__ICoreApplicationExit")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationExit.IID)
            CoreApplication.__ICoreApplicationExit := ICoreApplicationExit(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationExit.remove_Exiting(token)
    }

    /**
     * Creates a new view for the app.
     * @remarks
     * You cannot create a new view while the app is suspending or resuming.
     * @param {IFrameworkViewSource} viewSource 
     * @returns {CoreApplicationView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.createnewview
     */
    static CreateNewViewWithViewSource(viewSource) {
        if (!CoreApplication.HasProp("__ICoreImmersiveApplication3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreImmersiveApplication3.IID)
            CoreApplication.__ICoreImmersiveApplication3 := ICoreImmersiveApplication3(factoryPtr)
        }

        return CoreApplication.__ICoreImmersiveApplication3.CreateNewViewWithViewSource(viewSource)
    }

    /**
     * Increments the total count of running app instances that use this [CoreApplication](coreapplication.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.incrementapplicationusecount
     */
    static IncrementApplicationUseCount() {
        if (!CoreApplication.HasProp("__ICoreApplicationUseCount")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationUseCount.IID)
            CoreApplication.__ICoreApplicationUseCount := ICoreApplicationUseCount(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationUseCount.IncrementApplicationUseCount()
    }

    /**
     * Decrements the total count of running app instances that use this [CoreApplication](coreapplication.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.decrementapplicationusecount
     */
    static DecrementApplicationUseCount() {
        if (!CoreApplication.HasProp("__ICoreApplicationUseCount")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationUseCount.IID)
            CoreApplication.__ICoreApplicationUseCount := ICoreApplicationUseCount(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationUseCount.DecrementApplicationUseCount()
    }

    /**
     * 
     * @returns {IVectorView<CoreApplicationView>} 
     */
    static get_Views() {
        if (!CoreApplication.HasProp("__ICoreImmersiveApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreImmersiveApplication.IID)
            CoreApplication.__ICoreImmersiveApplication := ICoreImmersiveApplication(factoryPtr)
        }

        return CoreApplication.__ICoreImmersiveApplication.get_Views()
    }

    /**
     * Creates a new view for the app.
     * @remarks
     * You cannot create a new view while the app is suspending or resuming.
     * @param {HSTRING} runtimeType 
     * @param {HSTRING} entryPoint 
     * @returns {CoreApplicationView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.createnewview
     */
    static CreateNewView(runtimeType, entryPoint) {
        if (!CoreApplication.HasProp("__ICoreImmersiveApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreImmersiveApplication.IID)
            CoreApplication.__ICoreImmersiveApplication := ICoreImmersiveApplication(factoryPtr)
        }

        return CoreApplication.__ICoreImmersiveApplication.CreateNewView(runtimeType, entryPoint)
    }

    /**
     * 
     * @returns {CoreApplicationView} 
     */
    static get_MainView() {
        if (!CoreApplication.HasProp("__ICoreImmersiveApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreImmersiveApplication.IID)
            CoreApplication.__ICoreImmersiveApplication := ICoreImmersiveApplication(factoryPtr)
        }

        return CoreApplication.__ICoreImmersiveApplication.get_MainView()
    }

    /**
     * Creates a new view for the app.
     * @remarks
     * You cannot create a new view while the app is suspending or resuming.
     * @returns {CoreApplicationView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.createnewview
     */
    static CreateNewViewFromMainView() {
        if (!CoreApplication.HasProp("__ICoreImmersiveApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreImmersiveApplication2.IID)
            CoreApplication.__ICoreImmersiveApplication2 := ICoreImmersiveApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreImmersiveApplication2.CreateNewViewFromMainView()
    }

    /**
     * Restart the app.
     * @remarks
     * * The app must be visible and foreground when it calls this API.
     * * If the restart fails, but the user subsequently launches the app manually, the app will launch normally and no restart arguments will be passed.
     * * If the app wasn't launched in the normal way, but was launched by a share contract, file picker, app-service, and so on, the app should not call this API because the user will not expect the resulting behavior.
     * * The app should not request an Extended Execution session after it has called this API because that will result in a poor user experience.
     * * If the app has any in-process background tasks running when it calls this API, those tasks will be cancelled in the normal way. Out-of-process background tasks will not be affected.
     * * When the app is restarted, [LaunchActivatedEventArgs.PreviousExecutionState](/uwp/api/Windows.ApplicationModel.Activation.LaunchActivatedEventArgs) will have the value **Terminated** so that the app can distinguish between a resume and a restart.
     * @param {HSTRING} launchArguments The arguments to pass to the restarted instance.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.requestrestartasync
     */
    static RequestRestartAsync(launchArguments) {
        if (!CoreApplication.HasProp("__ICoreApplication3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication3.IID)
            CoreApplication.__ICoreApplication3 := ICoreApplication3(factoryPtr)
        }

        return CoreApplication.__ICoreApplication3.RequestRestartAsync(launchArguments)
    }

    /**
     * Restart the app in the context of a different user.
     * @remarks
     * * The app must be visible and foreground when it calls this API.
     * * If the restart fails, but the user subsequently launches the app manually, the app will launch normally and no restart arguments will be passed.
     * * If the app wasn't launched in the normal way, but was launched by a share contract, file picker, app-service, and so on, the app should not call this API because the user will not expect the resulting behavior.
     * * The app is responsible for ensuring the validity of the **User** object. The activation will fail if there is policy in place which prevents that user from executing the app.
     * * The app should not request an Extended Execution session after it has called this API because that will result in a poor user experience.
     * * If the app has any in-process background tasks running when it calls this API, those tasks will be cancelled in the normal way. Out-of-process background tasks will not be affected.
     * * When the app is restarted, [LaunchActivatedEventArgs.PreviousExecutionState](/uwp/api/Windows.ApplicationModel.Activation.LaunchActivatedEventArgs) will have the value **Terminated** so that the app can distinguish between a resume and a restart.
     * @param {User} user_ The user to restart the app as.
     * @param {HSTRING} launchArguments The arguments to pass to the restarted instance.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.requestrestartforuserasync
     */
    static RequestRestartForUserAsync(user_, launchArguments) {
        if (!CoreApplication.HasProp("__ICoreApplication3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication3.IID)
            CoreApplication.__ICoreApplication3 := ICoreApplication3(factoryPtr)
        }

        return CoreApplication.__ICoreApplication3.RequestRestartForUserAsync(user_, launchArguments)
    }

    /**
     * 
     * @param {EventHandler<UnhandledErrorDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_UnhandledErrorDetected(handler) {
        if (!CoreApplication.HasProp("__ICoreApplicationUnhandledError")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationUnhandledError.IID)
            CoreApplication.__ICoreApplicationUnhandledError := ICoreApplicationUnhandledError(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationUnhandledError.add_UnhandledErrorDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_UnhandledErrorDetected(token) {
        if (!CoreApplication.HasProp("__ICoreApplicationUnhandledError")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplicationUnhandledError.IID)
            CoreApplication.__ICoreApplicationUnhandledError := ICoreApplicationUnhandledError(factoryPtr)
        }

        return CoreApplication.__ICoreApplicationUnhandledError.remove_UnhandledErrorDetected(token)
    }

    /**
     * 
     * @param {EventHandler<BackgroundActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_BackgroundActivated(handler) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.add_BackgroundActivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_BackgroundActivated(token) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.remove_BackgroundActivated(token)
    }

    /**
     * 
     * @param {EventHandler<LeavingBackgroundEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_LeavingBackground(handler) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.add_LeavingBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_LeavingBackground(token) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.remove_LeavingBackground(token)
    }

    /**
     * 
     * @param {EventHandler<EnteredBackgroundEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_EnteredBackground(handler) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.add_EnteredBackground(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_EnteredBackground(token) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.remove_EnteredBackground(token)
    }

    /**
     * Enable or disable the operating system's ability to prelaunch your app.
     * @remarks
     * When available system resources allow, the startup performance of UWP apps is improved by proactively launching the user’s most frequently used UWP apps in the background. A prelaunched app is put into the suspended state shortly after it is launched. When the user invokes the app, the app is resumed by bringing it from the suspended state to the running state--which is faster than launching the app cold.
     * 
     * Windows 10 automatically prelaunched UWP apps. In Windows 10, version 1607, UWP apps must opt-in to be prelaunched. You will typically make this call during the first run of your app although you may call the function multiple times and with different values without harm.
     * @param {Boolean} value **True** to enable prelaunch for your app; **false**, otherwise.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.enableprelaunch
     */
    static EnablePrelaunch(value) {
        if (!CoreApplication.HasProp("__ICoreApplication2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication2.IID)
            CoreApplication.__ICoreApplication2 := ICoreApplication2(factoryPtr)
        }

        return CoreApplication.__ICoreApplication2.EnablePrelaunch(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Id() {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.get_Id()
    }

    /**
     * 
     * @param {EventHandler<SuspendingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Suspending(handler) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.add_Suspending(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Suspending(token) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.remove_Suspending(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Resuming(handler) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.add_Resuming(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Resuming(token) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.remove_Resuming(token)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    static get_Properties() {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.get_Properties()
    }

    /**
     * Gets the view corresponding to the current thread.
     * @remarks
     * A [CoreApplicationView](coreapplicationview.md) is an app window and its thread.
     * @returns {CoreApplicationView} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.getcurrentview
     */
    static GetCurrentView() {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.GetCurrentView()
    }

    /**
     * Runs an external view provider factory to obtain a view provider.
     * @param {IFrameworkViewSource} viewSource An implementation of a view provider factory.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.run
     */
    static Run(viewSource) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.Run(viewSource)
    }

    /**
     * Runs an activatable type factory to obtain an external activatable type.
     * @param {IGetActivationFactory} activationFactoryCallback An implementation of an activatable type factory.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication.runwithactivationfactories
     */
    static RunWithActivationFactories(activationFactoryCallback) {
        if (!CoreApplication.HasProp("__ICoreApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Core.CoreApplication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreApplication.IID)
            CoreApplication.__ICoreApplication := ICoreApplication(factoryPtr)
        }

        return CoreApplication.__ICoreApplication.RunWithActivationFactories(activationFactoryCallback)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
