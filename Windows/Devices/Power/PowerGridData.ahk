#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerGridData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the signals that can be used to determine what times are best to time-shift work to.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergriddata
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class PowerGridData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerGridData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerGridData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether a time is considered anywhere from "good" to "bad". You should optimize to run workloads at the lowest severity, but you might have other factors that you need to consider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergriddata.severity
     * @type {Float} 
     */
    Severity {
        get => this.get_Severity()
    }

    /**
     * Gets a value indicating whether Windows predicts that the user will be away from their device, or not doing resource-intensive work. When making a decision about what time to time-shift a workload to, you can use this value to determine when you'll have the least impact on user experience.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergriddata.islowuserexperienceimpact
     * @type {Boolean} 
     */
    IsLowUserExperienceImpact {
        get => this.get_IsLowUserExperienceImpact()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Severity() {
        if (!this.HasProp("__IPowerGridData")) {
            if ((queryResult := this.QueryInterface(IPowerGridData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerGridData := IPowerGridData(outPtr)
        }

        return this.__IPowerGridData.get_Severity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowUserExperienceImpact() {
        if (!this.HasProp("__IPowerGridData")) {
            if ((queryResult := this.QueryInterface(IPowerGridData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerGridData := IPowerGridData(outPtr)
        }

        return this.__IPowerGridData.get_IsLowUserExperienceImpact()
    }

;@endregion Instance Methods
}
