#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTaskRegistration.ahk
#Include .\IBackgroundTaskRegistration2.ahk
#Include .\IBackgroundTaskRegistration3.ahk
#Include .\IBackgroundTaskRegistration4.ahk
#Include .\IBackgroundTaskRegistrationStatics2.ahk
#Include .\IBackgroundTaskRegistrationStatics.ahk
#Include .\BackgroundTaskProgressEventHandler.ahk
#Include .\BackgroundTaskRegistration.ahk
#Include .\BackgroundTaskProgressEventArgs.ahk
#Include .\BackgroundTaskCompletedEventHandler.ahk
#Include .\BackgroundTaskCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a background task that has been registered with the system.
 * @remarks
 * The system returns an instance of this class when the application calls the [BackgroundTaskBuilder.Register](backgroundtaskbuilder_register_292201929.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTaskRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTaskRegistration.IID

    /**
     * Gets the background task groups.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.alltaskgroups
     * @type {IMapView<HSTRING, BackgroundTaskRegistrationGroup>} 
     */
    static AllTaskGroups {
        get => BackgroundTaskRegistration.get_AllTaskGroups()
    }

    /**
     * Enumerates an application's registered background tasks, except for the background tasks registered in a group with [Windows.ApplicationModel.Background.BackgroundTaskBuilder.TaskGroup](backgroundtaskbuilder_taskgroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.alltasks
     * @type {IMapView<Guid, IBackgroundTaskRegistration>} 
     */
    static AllTasks {
        get => BackgroundTaskRegistration.get_AllTasks()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IMapView<HSTRING, BackgroundTaskRegistrationGroup>} 
     */
    static get_AllTaskGroups() {
        if (!BackgroundTaskRegistration.HasProp("__IBackgroundTaskRegistrationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskRegistrationStatics2.IID)
            BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics2 := IBackgroundTaskRegistrationStatics2(factoryPtr)
        }

        return BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics2.get_AllTaskGroups()
    }

    /**
     * Gets the task group object that is associated with the group identifier.
     * @remarks
     * If no group with the specified ID is found, `null` is returned.   
     * To get all of the tasks associated with the group, call [BackgroundTaskRegistrationGroup.AllTasks()](backgroundtaskregistrationgroup_alltasks.md)
     * @param {HSTRING} groupId The group identifier.
     * @returns {BackgroundTaskRegistrationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.gettaskgroup
     */
    static GetTaskGroup(groupId) {
        if (!BackgroundTaskRegistration.HasProp("__IBackgroundTaskRegistrationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskRegistrationStatics2.IID)
            BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics2 := IBackgroundTaskRegistrationStatics2(factoryPtr)
        }

        return BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics2.GetTaskGroup(groupId)
    }

    /**
     * 
     * @returns {IMapView<Guid, IBackgroundTaskRegistration>} 
     */
    static get_AllTasks() {
        if (!BackgroundTaskRegistration.HasProp("__IBackgroundTaskRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundTaskRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundTaskRegistrationStatics.IID)
            BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics := IBackgroundTaskRegistrationStatics(factoryPtr)
        }

        return BackgroundTaskRegistration.__IBackgroundTaskRegistrationStatics.get_AllTasks()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier of a registered background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.taskid
     * @type {Guid} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * Gets the name of a registered background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * This is not intended for use in your code. For all unsupported trigger types, the value returned by this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.trigger
     * @type {IBackgroundTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * Gets the **BackgroundTaskRegistrationGroup** that this **BackgroundTaskRegistration** is a part of.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.taskgroup
     * @type {BackgroundTaskRegistrationGroup} 
     */
    TaskGroup {
        get => this.get_TaskGroup()
    }

    /**
     * Gets the last time the background task was throttled in standby mode.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.tasklastthrottledinstandbytimestamp
     * @type {DateTime} 
     */
    TaskLastThrottledInStandbyTimestamp {
        get => this.get_TaskLastThrottledInStandbyTimestamp()
    }

    /**
     * Gets the predicted energy consumption of the background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.appenergyusepredictioncontribution
     * @type {Float} 
     */
    AppEnergyUsePredictionContribution {
        get => this.get_AppEnergyUsePredictionContribution()
    }

    /**
     * Attaches a progress event handler to the registered background task.
     * @type {BackgroundTaskProgressEventHandler}
    */
    OnProgress {
        get {
            if(!this.HasProp("__OnProgress")){
                this.__OnProgress := WinRTEventHandler(
                    BackgroundTaskProgressEventHandler,
                    BackgroundTaskProgressEventHandler.IID,
                    BackgroundTaskRegistration,
                    BackgroundTaskProgressEventArgs
                )
                this.__OnProgressToken := this.add_Progress(this.__OnProgress.iface)
            }
            return this.__OnProgress
        }
    }

    /**
     * Attaches a completed event handler to the registered background task.
     * @type {BackgroundTaskCompletedEventHandler}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    BackgroundTaskCompletedEventHandler,
                    BackgroundTaskCompletedEventHandler.IID,
                    BackgroundTaskRegistration,
                    BackgroundTaskCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnProgressToken")) {
            this.remove_Progress(this.__OnProgressToken)
            this.__OnProgress.iface.Dispose()
        }

        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TaskId() {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.get_TaskId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.get_Name()
    }

    /**
     * 
     * @param {BackgroundTaskProgressEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Progress(handler) {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.add_Progress(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Progress(cookie) {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.remove_Progress(cookie)
    }

    /**
     * 
     * @param {BackgroundTaskCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Completed(cookie) {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.remove_Completed(cookie)
    }

    /**
     * Cancels the registration of a registered background task.
     * @param {Boolean} cancelTask True if currently running instances of this background task should be canceled. If this parameter is false, currently running instances are allowed to finish. Canceled instances receive a Canceled event with a cancellation reason of **Abort**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskregistration.unregister
     */
    Unregister(cancelTask) {
        if (!this.HasProp("__IBackgroundTaskRegistration")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration := IBackgroundTaskRegistration(outPtr)
        }

        return this.__IBackgroundTaskRegistration.Unregister(cancelTask)
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_Trigger() {
        if (!this.HasProp("__IBackgroundTaskRegistration2")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration2 := IBackgroundTaskRegistration2(outPtr)
        }

        return this.__IBackgroundTaskRegistration2.get_Trigger()
    }

    /**
     * 
     * @returns {BackgroundTaskRegistrationGroup} 
     */
    get_TaskGroup() {
        if (!this.HasProp("__IBackgroundTaskRegistration3")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration3 := IBackgroundTaskRegistration3(outPtr)
        }

        return this.__IBackgroundTaskRegistration3.get_TaskGroup()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_TaskLastThrottledInStandbyTimestamp() {
        if (!this.HasProp("__IBackgroundTaskRegistration4")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration4 := IBackgroundTaskRegistration4(outPtr)
        }

        return this.__IBackgroundTaskRegistration4.get_TaskLastThrottledInStandbyTimestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AppEnergyUsePredictionContribution() {
        if (!this.HasProp("__IBackgroundTaskRegistration4")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskRegistration4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskRegistration4 := IBackgroundTaskRegistration4(outPtr)
        }

        return this.__IBackgroundTaskRegistration4.get_AppEnergyUsePredictionContribution()
    }

;@endregion Instance Methods
}
