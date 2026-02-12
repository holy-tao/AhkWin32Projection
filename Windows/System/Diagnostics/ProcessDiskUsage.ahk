#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessDiskUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to data about the disk usage of a process.
 * @remarks
 * Use [DiskUsage](processdiagnosticinfo_diskusage.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusage
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessDiskUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessDiskUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessDiskUsage.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [ProcessDiskUsageReport](processdiskusagereport.md) for the process.
     * @returns {ProcessDiskUsageReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusage.getreport
     */
    GetReport() {
        if (!this.HasProp("__IProcessDiskUsage")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsage := IProcessDiskUsage(outPtr)
        }

        return this.__IProcessDiskUsage.GetReport()
    }

;@endregion Instance Methods
}
