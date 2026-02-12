#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUIBackgroundTaskInstance.ahk
#Include ..\..\ApplicationModel\Background\IBackgroundTaskInstance.ahk
#Include ..\..\ApplicationModel\Background\BackgroundTaskCanceledEventHandler.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to an instance of a background task.
  * 
  * > [!NOTE]
  * > A background task must explicitly call the Web Workers [close](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) method to terminate itself after the task has completed.
 * @remarks
 * To retrieve this object, use the [WebUIBackgroundTaskInstance.current](webuibackgroundtaskinstance_current.md) property.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIBackgroundTaskInstanceRuntimeClass extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebUIBackgroundTaskInstance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebUIBackgroundTaskInstance.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the success value for the background task. The success value is what is returned to the foreground instance of your app in the [completed](../windows.applicationmodel.background/backgroundtaskregistration_completed.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
        set => this.put_Succeeded(value)
    }

    /**
     * Gets the instance ID of the background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.instanceid
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * Gets access to the registered background task for this background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.task
     * @type {BackgroundTaskRegistration} 
     */
    Task {
        get => this.get_Task()
    }

    /**
     * Gets or sets progress status for a background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.progress
     * @type {Integer} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * Gets additional information associated with a background task instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.triggerdetails
     * @type {IInspectable} 
     */
    TriggerDetails {
        get => this.get_TriggerDetails()
    }

    /**
     * Gets the number of times resource management policy caused the background task to be suspended.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.suspendedcount
     * @type {Integer} 
     */
    SuspendedCount {
        get => this.get_SuspendedCount()
    }

    /**
     * Attaches a cancellation event handler to the background task instance.
     * @remarks
     * In most cases, JavaScript background tasks continue to run until the Web Workers [close](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) method is called. The system shuts down a background task only when all apps are being closed, for example user log off or system shut down. In that case, Windows fires the canceled event, enabling the background task to complete any final activity before it is closed.
     * @type {BackgroundTaskCanceledEventHandler}
    */
    OnCanceled {
        get {
            if(!this.HasProp("__OnCanceled")){
                this.__OnCanceled := WinRTEventHandler(
                    BackgroundTaskCanceledEventHandler,
                    BackgroundTaskCanceledEventHandler.IID,
                    IBackgroundTaskInstance,
                    (ptr) => IPropertyValue(ptr).GetInt32()
                )
                this.__OnCanceledToken := this.add_Canceled(this.__OnCanceled.iface)
            }
            return this.__OnCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCanceledToken")) {
            this.remove_Canceled(this.__OnCanceledToken)
            this.__OnCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWebUIBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IWebUIBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIBackgroundTaskInstance := IWebUIBackgroundTaskInstance(outPtr)
        }

        return this.__IWebUIBackgroundTaskInstance.get_Succeeded()
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @returns {HRESULT} 
     */
    put_Succeeded(succeeded) {
        if (!this.HasProp("__IWebUIBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IWebUIBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUIBackgroundTaskInstance := IWebUIBackgroundTaskInstance(outPtr)
        }

        return this.__IWebUIBackgroundTaskInstance.put_Succeeded(succeeded)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceId() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.get_InstanceId()
    }

    /**
     * 
     * @returns {BackgroundTaskRegistration} 
     */
    get_Task() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.get_Task()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Progress() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.get_Progress()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Progress(value) {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.put_Progress(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TriggerDetails() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.get_TriggerDetails()
    }

    /**
     * 
     * @param {BackgroundTaskCanceledEventHandler} cancelHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Canceled(cancelHandler) {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.add_Canceled(cancelHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Canceled(cookie) {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.remove_Canceled(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuspendedCount() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.get_SuspendedCount()
    }

    /**
     * Informs the system that the background task might continue to perform work after the [IBackgroundTask.Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method returns. This method is not applicable to JavaScript background tasks.
     * @remarks
     * This method is not applicable for background tasks written in JavaScript. JavaScript background tasks use the Web Workers [close](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) method to finish the task after all asynchronous operations have completed.
     * @returns {BackgroundTaskDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuibackgroundtaskinstanceruntimeclass.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBackgroundTaskInstance")) {
            if ((queryResult := this.QueryInterface(IBackgroundTaskInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTaskInstance := IBackgroundTaskInstance(outPtr)
        }

        return this.__IBackgroundTaskInstance.GetDeferral()
    }

;@endregion Instance Methods
}
