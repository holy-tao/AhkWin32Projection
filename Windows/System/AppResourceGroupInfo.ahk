#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupInfo.ahk
#Include .\IAppResourceGroupInfo2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides diagnostic information such as memory usage and energy use.
 * @remarks
 * Resource groups allow you to group components for the purposes of resource management. If you don't define a group, you will get at least one by default, and possibly more, depending on whether the app has background tasks.
 * 
 * Resource groups are specified in the manifest with the **ResourceGroup** tag.
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the instance identifier.
     * @remarks
     * This is a system-generated value that is unique per session; it is not guaranteed to be unique across device reboots.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.instanceid
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * Indicates whether the group is part of a shared resource group. Being part of a shared resource group indicates that there are multiple apps in the package and that they share a common component.
     * @remarks
     * When a resource group is shared, it will show up in the resource group collections reported by multiple apps if those apps that share this resource group are currently running.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.isshared
     * @type {Boolean} 
     */
    IsShared {
        get => this.get_IsShared()
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
    get_InstanceId() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.get_InstanceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShared() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.get_IsShared()
    }

    /**
     * Provides information about background tasks such as their entry points, names, task ids, and trigger names.
     * @returns {IVector<AppResourceGroupBackgroundTaskReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.getbackgroundtaskreports
     */
    GetBackgroundTaskReports() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.GetBackgroundTaskReports()
    }

    /**
     * Provides information about memory usage such as the commit limit, commit usage, and so on.
     * @returns {AppResourceGroupMemoryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.getmemoryreport
     */
    GetMemoryReport() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.GetMemoryReport()
    }

    /**
     * Gets process diagnostic information for the group such as used CPU time, disk I/O usage, and so on.
     * @returns {IVector<ProcessDiagnosticInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.getprocessdiagnosticinfos
     */
    GetProcessDiagnosticInfos() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.GetProcessDiagnosticInfos()
    }

    /**
     * Gets the state report information such as execution state, energy quota state, and so on.
     * @returns {AppResourceGroupStateReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.getstatereport
     */
    GetStateReport() {
        if (!this.HasProp("__IAppResourceGroupInfo")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo := IAppResourceGroupInfo(outPtr)
        }

        return this.__IAppResourceGroupInfo.GetStateReport()
    }

    /**
     * Initiate moving the associated app to the suspended state.
     * @remarks
     * Calling this method on an app that is already suspended will return success.
     * 
     * This method initiates the standard workflow to move the app to the Suspended state. For example, on desktop this workflow includes minimizing the app. This will also include calling the app’s [OnSuspending](/uwp/api/windows.ui.xaml.application.Suspending) callback in the normal way, including honoring deferrals during suspension. This method will return as soon as it has initiated the suspension workflow, and not wait for the app to transition state or for it to run its **OnSuspending** method. Note that the app may take a long time to suspend, depending on deferrals.
     * 
     * You can call this method from any **AppResourceGroupInfo**, but only the one for the foreground app has a high probability of succeeding. Suspending the foreground app may result in suspending other resource groups for that app.
     * 
     * This method won’t work on [ResourceGroups](/windows/uwp/launch-resume/declare-background-tasks-in-the-application-manifest) that relate to background tasks because they don’t have the concept of suspend/resume.
     * 
     * This method won’t work on [Desktop Bridge](/windows/uwp/porting/desktop-to-uwp-root) apps because they don’t have the concept of suspend/resume.
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.startsuspendasync
     */
    StartSuspendAsync() {
        if (!this.HasProp("__IAppResourceGroupInfo2")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo2 := IAppResourceGroupInfo2(outPtr)
        }

        return this.__IAppResourceGroupInfo2.StartSuspendAsync()
    }

    /**
     * Initiate moving the associated app to the active state.
     * @remarks
     * Call this method to initiate the standard workflow to bring an app that is in the suspended state back to the active state. This workflow includes calling the app’s [Resuming](/uwp/api/windows.ui.xaml.application.Resuming) callback.
     * 
     * This method will return as soon as it has initiated the workflow, before the app’s Resuming callback, and before any state changes.
     * 
     * Calling this method on an app that is not suspended will result in a failure.
     * 
     * This method won’t work on [ResourceGroups](/windows/uwp/launch-resume/declare-background-tasks-in-the-application-manifest) that relate to background tasks because they don’t have the concept of suspend/resume.
     * 
     * This method won’t work on [Desktop Bridge](/windows/uwp/porting/desktop-to-uwp-root) apps because they don’t have the concept of suspend/resume.
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.startresumeasync
     */
    StartResumeAsync() {
        if (!this.HasProp("__IAppResourceGroupInfo2")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo2 := IAppResourceGroupInfo2(outPtr)
        }

        return this.__IAppResourceGroupInfo2.StartResumeAsync()
    }

    /**
     * Initiate moving the associated app to the terminated state.
     * @remarks
     * The app to terminate must be running, which includes being in the active, suspending, or suspended states. This will terminate the app the same way as if the user terminated the app by tapping the close button. This will call the app's [OnSuspending](/uwp/api/windows.ui.xaml.application.Suspending) callback, as the system moves the app through the app-lifecycle states, starting with Active, moving to Suspending, then Suspended, and finally Terminated. This method will return as soon as it has initiated the workflow, before any state changes, and before the app’s **OnSuspending** callback.
     * @returns {IAsyncOperation<AppExecutionStateChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfo.startterminateasync
     */
    StartTerminateAsync() {
        if (!this.HasProp("__IAppResourceGroupInfo2")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfo2 := IAppResourceGroupInfo2(outPtr)
        }

        return this.__IAppResourceGroupInfo2.StartTerminateAsync()
    }

;@endregion Instance Methods
}
