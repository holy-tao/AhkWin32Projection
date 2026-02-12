#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessMemoryUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to data about the memory usage of a process.
 * @remarks
 * Use [MemoryUsage](processdiagnosticinfo_memoryusage.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusage
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessMemoryUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessMemoryUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessMemoryUsage.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [ProcessMemoryUsageReport](processmemoryusagereport.md) for the process.
     * @returns {ProcessMemoryUsageReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processmemoryusage.getreport
     */
    GetReport() {
        if (!this.HasProp("__IProcessMemoryUsage")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryUsage := IProcessMemoryUsage(outPtr)
        }

        return this.__IProcessMemoryUsage.GetReport()
    }

;@endregion Instance Methods
}
