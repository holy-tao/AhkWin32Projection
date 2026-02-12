#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessDiskUsageReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the disk usage of the process.
 * @remarks
 * Call the [GetReport](processdiskusage_getreport_610268658.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ProcessDiskUsageReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProcessDiskUsageReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProcessDiskUsageReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of disk read operations performed by the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.readoperationcount
     * @type {Integer} 
     */
    ReadOperationCount {
        get => this.get_ReadOperationCount()
    }

    /**
     * Gets the number of disk write operations performed by the process.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.writeoperationcount
     * @type {Integer} 
     */
    WriteOperationCount {
        get => this.get_WriteOperationCount()
    }

    /**
     * Gets the number of disk operations performed by the process that were not read or write operations.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.otheroperationcount
     * @type {Integer} 
     */
    OtherOperationCount {
        get => this.get_OtherOperationCount()
    }

    /**
     * Gets the number of bytes the process has read from disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.bytesreadcount
     * @type {Integer} 
     */
    BytesReadCount {
        get => this.get_BytesReadCount()
    }

    /**
     * Gets the number of bytes the process has written to disk.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.byteswrittencount
     * @type {Integer} 
     */
    BytesWrittenCount {
        get => this.get_BytesWrittenCount()
    }

    /**
     * Gets the number of bytes used by the process in disk operations that were not read or write operations.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.processdiskusagereport.otherbytescount
     * @type {Integer} 
     */
    OtherBytesCount {
        get => this.get_OtherBytesCount()
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
    get_ReadOperationCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_ReadOperationCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteOperationCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_WriteOperationCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherOperationCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_OtherOperationCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReadCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_BytesReadCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesWrittenCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_BytesWrittenCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherBytesCount() {
        if (!this.HasProp("__IProcessDiskUsageReport")) {
            if ((queryResult := this.QueryInterface(IProcessDiskUsageReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProcessDiskUsageReport := IProcessDiskUsageReport(outPtr)
        }

        return this.__IProcessDiskUsageReport.get_OtherBytesCount()
    }

;@endregion Instance Methods
}
