#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessMemoryReport.ahk
#Include ..\..\Guid.ahk

/**
 * Represents process memory usage at a single point in time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.processmemoryreport
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProcessMemoryReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessMemoryReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessMemoryReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the process' private working set usage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processmemoryreport.privateworkingsetusage
     * @type {Integer} 
     */
    PrivateWorkingSetUsage {
        get => this.get_PrivateWorkingSetUsage()
    }

    /**
     * Gets the process' total working set usage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.processmemoryreport.totalworkingsetusage
     * @type {Integer} 
     */
    TotalWorkingSetUsage {
        get => this.get_TotalWorkingSetUsage()
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
    get_PrivateWorkingSetUsage() {
        if (!this.HasProp("__IProcessMemoryReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryReport := IProcessMemoryReport(outPtr)
        }

        return this.__IProcessMemoryReport.get_PrivateWorkingSetUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalWorkingSetUsage() {
        if (!this.HasProp("__IProcessMemoryReport")) {
            if ((queryResult := this.QueryInterface(IProcessMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessMemoryReport := IProcessMemoryReport(outPtr)
        }

        return this.__IProcessMemoryReport.get_TotalWorkingSetUsage()
    }

;@endregion Instance Methods
}
