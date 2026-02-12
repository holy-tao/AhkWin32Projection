#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemCpuUsageReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the CPU usage of the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusagereport
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class SystemCpuUsageReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemCpuUsageReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemCpuUsageReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the amount of CPU kernel time consumed by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusagereport.kerneltime
     * @type {TimeSpan} 
     */
    KernelTime {
        get => this.get_KernelTime()
    }

    /**
     * Gets the amount of CPU user time consumed by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusagereport.usertime
     * @type {TimeSpan} 
     */
    UserTime {
        get => this.get_UserTime()
    }

    /**
     * Gets the amount of time the CPU was idle.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemcpuusagereport.idletime
     * @type {TimeSpan} 
     */
    IdleTime {
        get => this.get_IdleTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_KernelTime() {
        if (!this.HasProp("__ISystemCpuUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemCpuUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemCpuUsageReport := ISystemCpuUsageReport(outPtr)
        }

        return this.__ISystemCpuUsageReport.get_KernelTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UserTime() {
        if (!this.HasProp("__ISystemCpuUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemCpuUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemCpuUsageReport := ISystemCpuUsageReport(outPtr)
        }

        return this.__ISystemCpuUsageReport.get_UserTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_IdleTime() {
        if (!this.HasProp("__ISystemCpuUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemCpuUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemCpuUsageReport := ISystemCpuUsageReport(outPtr)
        }

        return this.__ISystemCpuUsageReport.get_IdleTime()
    }

;@endregion Instance Methods
}
