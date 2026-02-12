#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMemoryUsageReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the memory usage of the system.
 * @remarks
 * Call [SystemMemoryUsage.GetReport](systemmemoryusage_getreport_610268658.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusagereport
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class SystemMemoryUsageReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMemoryUsageReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMemoryUsageReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the total amount of physical memory for the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusagereport.totalphysicalsizeinbytes
     * @type {Integer} 
     */
    TotalPhysicalSizeInBytes {
        get => this.get_TotalPhysicalSizeInBytes()
    }

    /**
     * Gets the amount of system memory available in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusagereport.availablesizeinbytes
     * @type {Integer} 
     */
    AvailableSizeInBytes {
        get => this.get_AvailableSizeInBytes()
    }

    /**
     * Gets the amount of committed memory for the system.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.systemmemoryusagereport.committedsizeinbytes
     * @type {Integer} 
     */
    CommittedSizeInBytes {
        get => this.get_CommittedSizeInBytes()
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
    get_TotalPhysicalSizeInBytes() {
        if (!this.HasProp("__ISystemMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMemoryUsageReport := ISystemMemoryUsageReport(outPtr)
        }

        return this.__ISystemMemoryUsageReport.get_TotalPhysicalSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvailableSizeInBytes() {
        if (!this.HasProp("__ISystemMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMemoryUsageReport := ISystemMemoryUsageReport(outPtr)
        }

        return this.__ISystemMemoryUsageReport.get_AvailableSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CommittedSizeInBytes() {
        if (!this.HasProp("__ISystemMemoryUsageReport")) {
            if ((queryResult := this.QueryInterface(ISystemMemoryUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMemoryUsageReport := ISystemMemoryUsageReport(outPtr)
        }

        return this.__ISystemMemoryUsageReport.get_CommittedSizeInBytes()
    }

;@endregion Instance Methods
}
