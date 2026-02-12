#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForegroundEnergyDiagnosticsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides debugging APIs for calculating your app's foreground energy usage in real time. We recommend using these APIs only for debugging.
  * 
  * > [!IMPORTANT]
  * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
 * @remarks
 * > [!IMPORTANT]
 * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.foregroundenergydiagnostics
 * @namespace Windows.System.Power.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ForegroundEnergyDiagnostics extends IInspectable {
;@region Static Properties
    /**
     * Gets the device-specific conversion factor used to convert energy usage (mW) to a normalized percentage.
     * 
     * > [!IMPORTANT]
     * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
     * @remarks
     * To determine the estimated energy usage for the device in units of milliwatts (mW), divide the computed total energy usage by the DeviceSpecificConversionFactor.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.foregroundenergydiagnostics.devicespecificconversionfactor
     * @type {Float} 
     */
    static DeviceSpecificConversionFactor {
        get => ForegroundEnergyDiagnostics.get_DeviceSpecificConversionFactor()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Float} 
     */
    static get_DeviceSpecificConversionFactor() {
        if (!ForegroundEnergyDiagnostics.HasProp("__IForegroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyDiagnosticsStatics.IID)
            ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics := IForegroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics.get_DeviceSpecificConversionFactor()
    }

    /**
     * Computes the total cumulative energy usage of the foreground app since the last reset, expressed as a percentage of normal.
     * 
     * > [!IMPORTANT]
     * > This method consumes significant CPU resources. We recommend using this method only for debugging purposes.
     * @remarks
     * > [!IMPORTANT]
     * > This method consumes significant CPU resources. We recommend using this method only for debugging purposes.
     * 
     * Reset the energy usage total by calling [ResetTotalEnergyUsage](foregroundenergydiagnostics_resettotalenergyusage_1916149566.md).
     * 
     * The energy usage of a foreground app is classified into one these predefined levels, from lowest to highest energy consumption: [LowUsageLevel](../windows.system.power/foregroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](../windows.system.power/foregroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](../windows.system.power/foregroundenergymanager_maxacceptableusagelevel.md), or [ExcessiveUsageLevel](../windows.system.power/foregroundenergymanager_excessiveusagelevel.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.foregroundenergydiagnostics.computetotalenergyusage
     */
    static ComputeTotalEnergyUsage() {
        if (!ForegroundEnergyDiagnostics.HasProp("__IForegroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyDiagnosticsStatics.IID)
            ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics := IForegroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics.ComputeTotalEnergyUsage()
    }

    /**
     * Clears the value that represents the total cumulative energy usage of the foreground app since the last reset.
     * 
     * > [!IMPORTANT]
     * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
     * @remarks
     * This method doesn't reduce energy consumption, it simply resets the counter used to track total energy usage.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.foregroundenergydiagnostics.resettotalenergyusage
     */
    static ResetTotalEnergyUsage() {
        if (!ForegroundEnergyDiagnostics.HasProp("__IForegroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyDiagnosticsStatics.IID)
            ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics := IForegroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return ForegroundEnergyDiagnostics.__IForegroundEnergyDiagnosticsStatics.ResetTotalEnergyUsage()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
