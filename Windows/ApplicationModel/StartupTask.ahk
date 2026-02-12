#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStartupTask.ahk
#Include .\IStartupTaskStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a UWP app or a desktop application background task that runs at system startup or when the user logs in to their device.
 * @remarks
 * This functionality is supported on desktop versions of Windows in both UWP apps and desktop applications in a Windows app package. For more information on packaged desktop applications (also known as Desktop Bridge Apps), see [Package desktop applications](/windows/uwp/porting/desktop-to-uwp-root). Support for packaged desktop applications was introduced in the Windows 10 Anniversary Update (version 1607), and for UWP apps in the Windows 10 Fall Creators Update (version 1709).
 * 
 * An app must add the `windows.startup` extension category to its app package manifest in order to be activated at startup or when the user logs in. Adding this extension will not, by itself, automatically cause the app start.
 * 
 * UWP apps must call [RequestEnableAsync](/uwp/api/Windows.ApplicationModel.StartupTask.RequestEnableAsync) from a UI thread to trigger a user-consent dialog. If the user consents, the UWP app will then start on startup or user log in. Note that UWP startup apps will start minimized.
 * 
 * If **RequestEnableAsync** is called from a packaged desktop app, no user-consent dialog is shown. Desktop apps can set their startup tasks to **Enabled** in the manifest, in which case they do not need to call [RequestEnableAsync](/uwp/api/Windows.ApplicationModel.StartupTask.RequestEnableAsync).
 * 
 * In both cases, to enable startup functionality, the user must either launch the app at least once, or they must enable startup functionality for the app on the **Startup** page in **Settings**. Once enabled, the user is in control and can change the enabled state of your app at any time via the **Startup** page in **Settings** or the **Startup** tab in Task Manager.
 * 
 * The following extension declaration goes in the app package manifest. The declaration that you use depends on whether your startup task will be a UWP app or desktop app background task.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class StartupTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStartupTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStartupTask.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all startup tasks for the current app package.
     * @returns {IAsyncOperation<IVectorView<StartupTask>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.getforcurrentpackageasync
     */
    static GetForCurrentPackageAsync() {
        if (!StartupTask.HasProp("__IStartupTaskStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.StartupTask")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStartupTaskStatics.IID)
            StartupTask.__IStartupTaskStatics := IStartupTaskStatics(factoryPtr)
        }

        return StartupTask.__IStartupTaskStatics.GetForCurrentPackageAsync()
    }

    /**
     * Gets a startup task by Id.
     * @param {HSTRING} taskId The Id of the startup task to get.
     * @returns {IAsyncOperation<StartupTask>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.getasync
     */
    static GetAsync(taskId) {
        if (!StartupTask.HasProp("__IStartupTaskStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.StartupTask")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStartupTaskStatics.IID)
            StartupTask.__IStartupTaskStatics := IStartupTaskStatics(factoryPtr)
        }

        return StartupTask.__IStartupTaskStatics.GetAsync(taskId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state (enabled, disabled, or disabled by user) of the startup task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the Id of the startup task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.taskid
     * @type {HSTRING} 
     */
    TaskId {
        get => this.get_TaskId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests that the startup task be enabled. If the task was disabled by the user using Task Manager, this method will not override their choice and the user must re-enable the task manually.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.requestenableasync
     */
    RequestEnableAsync() {
        if (!this.HasProp("__IStartupTask")) {
            if ((queryResult := this.QueryInterface(IStartupTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartupTask := IStartupTask(outPtr)
        }

        return this.__IStartupTask.RequestEnableAsync()
    }

    /**
     * Disables the startup task.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.startuptask.disable
     */
    Disable() {
        if (!this.HasProp("__IStartupTask")) {
            if ((queryResult := this.QueryInterface(IStartupTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartupTask := IStartupTask(outPtr)
        }

        return this.__IStartupTask.Disable()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IStartupTask")) {
            if ((queryResult := this.QueryInterface(IStartupTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartupTask := IStartupTask(outPtr)
        }

        return this.__IStartupTask.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        if (!this.HasProp("__IStartupTask")) {
            if ((queryResult := this.QueryInterface(IStartupTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStartupTask := IStartupTask(outPtr)
        }

        return this.__IStartupTask.get_TaskId()
    }

;@endregion Instance Methods
}
