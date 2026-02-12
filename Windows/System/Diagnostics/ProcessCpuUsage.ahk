#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessCpuUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to data about the CPU usage of a process.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processcpuusage
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessCpuUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessCpuUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessCpuUsage.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [ProcessCpuUsageReport](processcpuusagereport.md) for the process.
     * @returns {ProcessCpuUsageReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processcpuusage.getreport
     */
    GetReport() {
        if (!this.HasProp("__IProcessCpuUsage")) {
            if ((queryResult := this.QueryInterface(IProcessCpuUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessCpuUsage := IProcessCpuUsage(outPtr)
        }

        return this.__IProcessCpuUsage.GetReport()
    }

;@endregion Instance Methods
}
