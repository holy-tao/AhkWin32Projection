#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTaskRegistration.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\BackgroundTaskDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to a background task instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskInstance extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskInstance
     * @type {Guid}
     */
    static IID => Guid("{865bda7a-21d8-4573-8f32-928a1b0641f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstanceId", "get_Task", "get_Progress", "put_Progress", "get_TriggerDetails", "add_Canceled", "remove_Canceled", "get_SuspendedCount", "GetDeferral"]

    /**
     * Gets the instance ID of the background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.instanceid
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * Gets access to the registered background task for this background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.task
     * @type {BackgroundTaskRegistration} 
     */
    Task {
        get => this.get_Task()
    }

    /**
     * Gets or sets progress status for a background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.progress
     * @type {Integer} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * Gets additional information associated with a background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.triggerdetails
     * @type {IInspectable} 
     */
    TriggerDetails {
        get => this.get_TriggerDetails()
    }

    /**
     * Gets the number of times resource management policy caused the background task to be suspended.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.suspendedcount
     * @type {Integer} 
     */
    SuspendedCount {
        get => this.get_SuspendedCount()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BackgroundTaskRegistration} 
     */
    get_Task() {
        result := ComCall(7, this, "ptr*", &task := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTaskRegistration(task)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Progress() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Progress(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TriggerDetails() {
        result := ComCall(10, this, "ptr*", &triggerDetails := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(triggerDetails)
    }

    /**
     * 
     * @param {BackgroundTaskCanceledEventHandler} cancelHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Canceled(cancelHandler) {
        cookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", cancelHandler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Canceled(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(12, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuspendedCount() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Informs the system that the background task might continue to perform work after the [IBackgroundTask.Run](ibackgroundtask_run_2017283929.md) method returns.
     * @remarks
     * If a background task uses an asynchronous operation, it is possible for the [Run](ibackgroundtask_run_2017283929.md) method to return before the background task has completed its work. As soon as the [Run](ibackgroundtask_run_2017283929.md) method returns, the system might suspend or terminate the background task host process, which could prevent completion of asynchronous operations started by the background task.
     * 
     * To keep the host process from being suspended or terminated while the background task is running, use the GetDeferral method to get a background task deferral for each asynchronous operation initiated. Then, when the asynchronous operation is finished, call the [BackgroundTaskDeferral.Complete](backgroundtaskdeferral_complete_1807836922.md) method.
     * 
     * Ensure that you complete all background task deferrals. Most background tasks have a timeout after which the app will be suspended or terminated regardless of whether there are any pending deferrals. However, leaving outstanding background task deferrals interferes with the system's ability to manage process lifetimes in a timely way.
     * @returns {BackgroundTaskDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.getdeferral
     */
    GetDeferral() {
        result := ComCall(14, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTaskDeferral(deferral_)
    }
}
