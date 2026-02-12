#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupMemoryReport.ahk
#Include ..\..\Guid.ahk

/**
 * Provides memory information for a resource group, such as commit usage.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupmemoryreport
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupMemoryReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupMemoryReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupMemoryReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the limit of the amount of memory that can be committed (allocated) by this resource group.
     * @remarks
     * The commit limit is roughly the current pagefile size + the amount of RAM - the amount of RAM allocated to non-pageable memory.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupmemoryreport.commitusagelimit
     * @type {Integer} 
     */
    CommitUsageLimit {
        get => this.get_CommitUsageLimit()
    }

    /**
     * Returns the commit usage level for the resource group.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupmemoryreport.commitusagelevel
     * @type {Integer} 
     */
    CommitUsageLevel {
        get => this.get_CommitUsageLevel()
    }

    /**
     * Gets the amount of private memory (memory that can't be shared between processes) committed by this resource group.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupmemoryreport.privatecommitusage
     * @type {Integer} 
     */
    PrivateCommitUsage {
        get => this.get_PrivateCommitUsage()
    }

    /**
     * Gets the total amount of memory committed by this resource group.
     * @remarks
     * The total amount of committed memory is the sum of the private commit + the shared commit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupmemoryreport.totalcommitusage
     * @type {Integer} 
     */
    TotalCommitUsage {
        get => this.get_TotalCommitUsage()
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
    get_CommitUsageLimit() {
        if (!this.HasProp("__IAppResourceGroupMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupMemoryReport := IAppResourceGroupMemoryReport(outPtr)
        }

        return this.__IAppResourceGroupMemoryReport.get_CommitUsageLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CommitUsageLevel() {
        if (!this.HasProp("__IAppResourceGroupMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupMemoryReport := IAppResourceGroupMemoryReport(outPtr)
        }

        return this.__IAppResourceGroupMemoryReport.get_CommitUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrivateCommitUsage() {
        if (!this.HasProp("__IAppResourceGroupMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupMemoryReport := IAppResourceGroupMemoryReport(outPtr)
        }

        return this.__IAppResourceGroupMemoryReport.get_PrivateCommitUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCommitUsage() {
        if (!this.HasProp("__IAppResourceGroupMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupMemoryReport := IAppResourceGroupMemoryReport(outPtr)
        }

        return this.__IAppResourceGroupMemoryReport.get_TotalCommitUsage()
    }

;@endregion Instance Methods
}
