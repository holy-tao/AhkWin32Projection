#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessDiagnosticInfo.ahk
#Include .\IProcessDiagnosticInfo2.ahk
#Include .\IProcessDiagnosticInfoStatics2.ahk
#Include .\IProcessDiagnosticInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides diagnostic information about a process, such as CPU usage, disk usage, memory usage and so on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessDiagnosticInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessDiagnosticInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessDiagnosticInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [ProcessDiagnosticInfo](processdiagnosticinfo.md) object for the specified process.
     * @remarks
     * If you call this method for the current app process ID, there is no capability check. Calling the method for any other process requires user consent, which defaults to denied. Users can provide consent in Windows Settings. An app can request consent programmatically by calling [AppDiagnosticInfo.RequestAccessAsync](../windows.system/appdiagnosticinfo_requestaccessasync_380675631.md).
     * @param {Integer} processId The identifier of the process for which to retrieve a [ProcessDiagnosticInfo](processdiagnosticinfo.md) object.
     * @returns {ProcessDiagnosticInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.trygetforprocessid
     */
    static TryGetForProcessId(processId) {
        if (!ProcessDiagnosticInfo.HasProp("__IProcessDiagnosticInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.ProcessDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProcessDiagnosticInfoStatics2.IID)
            ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics2 := IProcessDiagnosticInfoStatics2(factoryPtr)
        }

        return ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics2.TryGetForProcessId(processId)
    }

    /**
     * Gets a list of [ProcessDiagnosticInfo](processdiagnosticinfo.md) objects for all running processes that are accessible to the caller.
     * @remarks
     * For UWP apps, processes must be in the same **AppContainer**.
     * 
     * To correlate `ProcessDiagnosticInfo` to `AppDiagnosticInfo` and retrieve the package name for a process, you can use the `AppDiagnosticInfo` class. The `AppDiagnosticInfo` class provides diagnostic information about an app, including its package details.
     * 
     * Here’s how you can retrieve the package name for a process:
     * 
     * 1. Use the `ProcessDiagnosticInfo.GetForProcesses()` method to get a list of `ProcessDiagnosticInfo` objects.
     * 1. For each `ProcessDiagnosticInfo` object, call the `AppDiagnosticInfo.TryGetForProcess()` method to retrieve the associated `AppDiagnosticInfo`.
     * 1. Access the `AppInfo` property of the `AppDiagnosticInfo` object to get the `AppInfo` instance, which contains the package name.
     * 
     * The following example demonstrates how to achieve this:
     * 
     * ```csharp
     * using System;
     * using System.Collections.Generic;
     * using Windows.System.Diagnostics;
     * using Windows.System;
     * 
     * class Program
     * {
     *     static void Main(string[] args)
     *     {
     *         IReadOnlyList<ProcessDiagnosticInfo> processes = ProcessDiagnosticInfo.GetForProcesses();
     * 
     *         foreach (var process in processes)
     *         {
     *             if (process.IsPackaged)
     *             {
     *                 var appDiagnosticInfos = AppDiagnosticInfo.TryGetForProcess(process);
     * 
     *                 if (appDiagnosticInfos != null)
     *                 {
     *                     foreach (var appDiagnosticInfo in appDiagnosticInfos)
     *                     {
     *                     var appInfo = appDiagnosticInfo.AppInfo;
     *                     if (appInfo != null)
     *                     {
     *                         Console.WriteLine($"Process ID: {process.ProcessId}, Package Name: {appInfo.PackageFamilyName}");
     *                     }
     *                     else
     *                     {
     *                         Console.WriteLine($"Process ID: {process.ProcessId} has no associated AppInfo.");
     *                     }}");
     *                     }
     *                 }
     *             }
     *             else
     *             {
     *                 Console.WriteLine($"Process ID: {process.ProcessId} is not associated with an app package.");
     *             }
     *         }
     *     }
     * }
     * ```
     * 
     * Some things to note:
     * 
     * - The `IsPackaged` property indicates whether the process is part of a packaged app. If `IsPackaged` is `false`, the process is not associated with an app package, and `AppDiagnosticInfo.TryGetForProcess()` will return `null`.
     * - Ensure your app has the necessary capabilities declared in the app manifest to access process and app diagnostic information.
     * @returns {IVectorView<ProcessDiagnosticInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.getforprocesses
     */
    static GetForProcesses() {
        if (!ProcessDiagnosticInfo.HasProp("__IProcessDiagnosticInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.ProcessDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProcessDiagnosticInfoStatics.IID)
            ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics := IProcessDiagnosticInfoStatics(factoryPtr)
        }

        return ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics.GetForProcesses()
    }

    /**
     * Gets the [ProcessDiagnosticInfo](processdiagnosticinfo.md) for the currently running process.
     * @returns {ProcessDiagnosticInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.getforcurrentprocess
     */
    static GetForCurrentProcess() {
        if (!ProcessDiagnosticInfo.HasProp("__IProcessDiagnosticInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.ProcessDiagnosticInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProcessDiagnosticInfoStatics.IID)
            ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics := IProcessDiagnosticInfoStatics(factoryPtr)
        }

        return ProcessDiagnosticInfo.__IProcessDiagnosticInfoStatics.GetForCurrentProcess()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique process ID.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.processid
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * Gets the name of the executable file for the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.executablefilename
     * @type {HSTRING} 
     */
    ExecutableFileName {
        get => this.get_ExecutableFileName()
    }

    /**
     * Gets the [ProcessDiagnosticInfo](processdiagnosticinfo.md) for the parent process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.parent
     * @type {ProcessDiagnosticInfo} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * Gets the time the process was started.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.processstarttime
     * @type {DateTime} 
     */
    ProcessStartTime {
        get => this.get_ProcessStartTime()
    }

    /**
     * Gets the disk I/O usage of the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.diskusage
     * @type {ProcessDiskUsage} 
     */
    DiskUsage {
        get => this.get_DiskUsage()
    }

    /**
     * Gets memory usage data for the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.memoryusage
     * @type {ProcessMemoryUsage} 
     */
    MemoryUsage {
        get => this.get_MemoryUsage()
    }

    /**
     * Gets the CPU time used by the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.cpuusage
     * @type {ProcessCpuUsage} 
     */
    CpuUsage {
        get => this.get_CpuUsage()
    }

    /**
     * Gets a Boolean value indicating whether or not this [ProcessDiagnosticInfo](processdiagnosticinfo.md) instance has any related [UWP](/windows/uwp/get-started/universal-application-platform-guide) information.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.ispackaged
     * @type {Boolean} 
     */
    IsPackaged {
        get => this.get_IsPackaged()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_ProcessId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExecutableFileName() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_ExecutableFileName()
    }

    /**
     * 
     * @returns {ProcessDiagnosticInfo} 
     */
    get_Parent() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_Parent()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ProcessStartTime() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_ProcessStartTime()
    }

    /**
     * 
     * @returns {ProcessDiskUsage} 
     */
    get_DiskUsage() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_DiskUsage()
    }

    /**
     * 
     * @returns {ProcessMemoryUsage} 
     */
    get_MemoryUsage() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_MemoryUsage()
    }

    /**
     * 
     * @returns {ProcessCpuUsage} 
     */
    get_CpuUsage() {
        if (!this.HasProp("__IProcessDiagnosticInfo")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo := IProcessDiagnosticInfo(outPtr)
        }

        return this.__IProcessDiagnosticInfo.get_CpuUsage()
    }

    /**
     * Gets one or more [AppDiagnosticInfo](/uwp/api/windows.system.appdiagnosticinfo) objects if the [IsPackaged](processdiagnosticinfo_ispackaged.md) property is **true**.
     * @remarks
     * Use of this method may require user consent, which defaults to denied. If you do not have consent, the method will return information for only the current app. Users can provide consent in Windows Settings. An app can request consent programmatically by calling [AppDiagnosticInfo.RequestAccessAsync](../windows.system/appdiagnosticinfo_requestaccessasync_380675631.md).
     * @returns {IVector<AppDiagnosticInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiagnosticinfo.getappdiagnosticinfos
     */
    GetAppDiagnosticInfos() {
        if (!this.HasProp("__IProcessDiagnosticInfo2")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo2 := IProcessDiagnosticInfo2(outPtr)
        }

        return this.__IProcessDiagnosticInfo2.GetAppDiagnosticInfos()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPackaged() {
        if (!this.HasProp("__IProcessDiagnosticInfo2")) {
            if ((queryResult := this.QueryInterface(IProcessDiagnosticInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiagnosticInfo2 := IProcessDiagnosticInfo2(outPtr)
        }

        return this.__IProcessDiagnosticInfo2.get_IsPackaged()
    }

;@endregion Instance Methods
}
