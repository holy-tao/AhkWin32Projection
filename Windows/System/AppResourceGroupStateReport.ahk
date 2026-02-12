#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupStateReport.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information, such as the execution state and energy quota usage, for a resource group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupstatereport
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupStateReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupStateReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupStateReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the execution state of the resource group, such as whether it is suspended, running, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupstatereport.executionstate
     * @type {Integer} 
     */
    ExecutionState {
        get => this.get_ExecutionState()
    }

    /**
     * Gets the energy quota state of the resource group, such as whether it is under quota or over quota.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupstatereport.energyquotastate
     * @type {Integer} 
     */
    EnergyQuotaState {
        get => this.get_EnergyQuotaState()
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
    get_ExecutionState() {
        if (!this.HasProp("__IAppResourceGroupStateReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupStateReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupStateReport := IAppResourceGroupStateReport(outPtr)
        }

        return this.__IAppResourceGroupStateReport.get_ExecutionState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnergyQuotaState() {
        if (!this.HasProp("__IAppResourceGroupStateReport")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupStateReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupStateReport := IAppResourceGroupStateReport(outPtr)
        }

        return this.__IAppResourceGroupStateReport.get_EnergyQuotaState()
    }

;@endregion Instance Methods
}
