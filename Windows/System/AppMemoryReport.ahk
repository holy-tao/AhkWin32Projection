#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppMemoryReport.ahk
#Include .\IAppMemoryReport2.ahk
#Include ..\..\Guid.ahk

/**
 * Represents app memory usage at a single point in time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppMemoryReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppMemoryReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppMemoryReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app's usage of private commit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport.privatecommitusage
     * @type {Integer} 
     */
    PrivateCommitUsage {
        get => this.get_PrivateCommitUsage()
    }

    /**
     * Gets the app's peak usage of private commit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport.peakprivatecommitusage
     * @type {Integer} 
     */
    PeakPrivateCommitUsage {
        get => this.get_PeakPrivateCommitUsage()
    }

    /**
     * Gets the app's total usage of private plus shared commit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport.totalcommitusage
     * @type {Integer} 
     */
    TotalCommitUsage {
        get => this.get_TotalCommitUsage()
    }

    /**
     * Gets the app's total cap for private plus shared commit.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport.totalcommitlimit
     * @type {Integer} 
     */
    TotalCommitLimit {
        get => this.get_TotalCommitLimit()
    }

    /**
     * Gets the expected commit limit for the current app.
     * @remarks
     * When an app launches on Xbox, it is initially given a small commit limit (the sum of the app’s available usage of private plus shared commit memory) which may grow as the system frees memory. This property returns the expected upper limit.
     * 
     * When an app launches on a non-Xbox system, the commit limit the app gets at launch remains the same and this property will return the same value as [Windows.System.AppMemoryReport.TotalCommitLimit](appmemoryreport_totalcommitlimit.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.appmemoryreport.expectedtotalcommitlimit
     * @type {Integer} 
     */
    ExpectedTotalCommitLimit {
        get => this.get_ExpectedTotalCommitLimit()
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
    get_PrivateCommitUsage() {
        if (!this.HasProp("__IAppMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryReport := IAppMemoryReport(outPtr)
        }

        return this.__IAppMemoryReport.get_PrivateCommitUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PeakPrivateCommitUsage() {
        if (!this.HasProp("__IAppMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryReport := IAppMemoryReport(outPtr)
        }

        return this.__IAppMemoryReport.get_PeakPrivateCommitUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCommitUsage() {
        if (!this.HasProp("__IAppMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryReport := IAppMemoryReport(outPtr)
        }

        return this.__IAppMemoryReport.get_TotalCommitUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalCommitLimit() {
        if (!this.HasProp("__IAppMemoryReport")) {
            if ((queryResult := this.QueryInterface(IAppMemoryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryReport := IAppMemoryReport(outPtr)
        }

        return this.__IAppMemoryReport.get_TotalCommitLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpectedTotalCommitLimit() {
        if (!this.HasProp("__IAppMemoryReport2")) {
            if ((queryResult := this.QueryInterface(IAppMemoryReport2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppMemoryReport2 := IAppMemoryReport2(outPtr)
        }

        return this.__IAppMemoryReport2.get_ExpectedTotalCommitLimit()
    }

;@endregion Instance Methods
}
