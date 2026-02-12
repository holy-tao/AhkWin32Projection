#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupBackgroundTaskReport.ahk
#Include ..\..\Guid.ahk

/**
 * Provides snapshot information about a background task such as its name, trigger name, entry point name, and task identifier.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupbackgroundtaskreport
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupBackgroundTaskReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupBackgroundTaskReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupBackgroundTaskReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the background task's identifier.
     * @remarks
     * The identifier is an internally generated session-unique identifier. You can use it to disambiguate multiple background task instances.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupbackgroundtaskreport.taskid
     * @type {Guid} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * Gets the name of the background task.
     * @remarks
     * This is the name supplied by the app when it registered the task with [BackgroundTaskBuilder](/uwp/api/Windows.ApplicationModel.Background.BackgroundTaskBuilder)
     * 
     * Some background tasks do not have names and will return an empty string because they are not explicitly registered. For example, background audio playback tasks and app-service tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupbackgroundtaskreport.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the name of the trigger that activated this task.
     * @remarks
     * If the task is activated by a trigger, then this will be the trigger type name; otherwise it will be an internally-generated string that identifies the activation behavior. For example, the trigger string would be `"Windows.ApplicationModel.Background.ActivitySensorTrigger"` if an app set a background task trigger in code like this:
     * 
     * ```csharp
     * var builder = new Windows.ApplicationModel.Background.BackgroundTaskBuilder;
     * builder.SetTrigger(new Windows.ApplicationModel.Background.ActivitySensorTrigger(50));
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupbackgroundtaskreport.trigger
     * @type {HSTRING} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * Gets the name of the background task entry point.
     * @remarks
     * The entry point string is taken from the definition in the manifest. For example, the EntryPoint string will be `"Tasks.BackgroundTaskClass"` for a manifest that contains the following declaration:
     * ```xml
     * <Extension Category="windows.backgroundTasks" EntryPoint="Tasks.BackgroundTaskClass">
     *     <BackgroundTasks>
     *         <Task Type="systemEvent" />
     *         <Task Type="pushNotification" />
     *     </BackgroundTasks>
     * </Extension>
     * ```
     * 
     * For JavaScript tasks, the entry point string is taken from the value of the **StartPage** attribute in the background task registration. For example, the entry point string will be `"js\completionGroupBackgroundTask.js"` for a manifest that contains the following declaration:
     * 
     * ```xml
     * <Extension Category="windows.backgroundTasks" StartPage="js\completionGroupBackgroundTask.js">
     *   <BackgroundTasks>
     *     <Task Type="general" />
     *   </BackgroundTasks>
     * </Extension>
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupbackgroundtaskreport.entrypoint
     * @type {HSTRING} 
     */
    EntryPoint {
        get => this.get_EntryPoint()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TaskId() {
        if (!this.HasProp("__IAppResourceGroupBackgroundTaskReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupBackgroundTaskReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupBackgroundTaskReport := IAppResourceGroupBackgroundTaskReport(outPtr)
        }

        return this.__IAppResourceGroupBackgroundTaskReport.get_TaskId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IAppResourceGroupBackgroundTaskReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupBackgroundTaskReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupBackgroundTaskReport := IAppResourceGroupBackgroundTaskReport(outPtr)
        }

        return this.__IAppResourceGroupBackgroundTaskReport.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Trigger() {
        if (!this.HasProp("__IAppResourceGroupBackgroundTaskReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupBackgroundTaskReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupBackgroundTaskReport := IAppResourceGroupBackgroundTaskReport(outPtr)
        }

        return this.__IAppResourceGroupBackgroundTaskReport.get_Trigger()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EntryPoint() {
        if (!this.HasProp("__IAppResourceGroupBackgroundTaskReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupBackgroundTaskReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupBackgroundTaskReport := IAppResourceGroupBackgroundTaskReport(outPtr)
        }

        return this.__IAppResourceGroupBackgroundTaskReport.get_EntryPoint()
    }

;@endregion Instance Methods
}
