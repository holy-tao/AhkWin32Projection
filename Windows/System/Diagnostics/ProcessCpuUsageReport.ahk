#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessCpuUsageReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the CPU usage of the process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processcpuusagereport
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessCpuUsageReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessCpuUsageReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessCpuUsageReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the amount of CPU kernel time consumed by the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processcpuusagereport.kerneltime
     * @type {TimeSpan} 
     */
    KernelTime {
        get => this.get_KernelTime()
    }

    /**
     * Gets the amount of CPU user time consumed by the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processcpuusagereport.usertime
     * @type {TimeSpan} 
     */
    UserTime {
        get => this.get_UserTime()
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
        if (!this.HasProp("__IProcessCpuUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessCpuUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessCpuUsageReport := IProcessCpuUsageReport(outPtr)
        }

        return this.__IProcessCpuUsageReport.get_KernelTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UserTime() {
        if (!this.HasProp("__IProcessCpuUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessCpuUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessCpuUsageReport := IProcessCpuUsageReport(outPtr)
        }

        return this.__IProcessCpuUsageReport.get_UserTime()
    }

;@endregion Instance Methods
}
