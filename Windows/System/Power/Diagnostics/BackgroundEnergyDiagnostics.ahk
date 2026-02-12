#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundEnergyDiagnosticsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides debugging APIs for calculating your app's background energy usage in real time. We recommend using these APIs only for debugging.
  * 
  * > [!IMPORTANT]
  * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
 * @remarks
 * > [!IMPORTANT]
 * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.backgroundenergydiagnostics
 * @namespace Windows.System.Power.Diagnostics
 * @version WindowsRuntime 1.4
 */
class BackgroundEnergyDiagnostics extends IInspectable {
;@region Static Properties
    /**
     * Gets the device-specific conversion factor used to convert energy usage (mW) to a normalized percentage.
     * 
     * > [!IMPORTANT]
     * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
     * @remarks
     * To determine the estimated energy usage for the device in units of milliwatts (mW), divide the computed total energy usage by the DeviceSpecificConversionFactor.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.backgroundenergydiagnostics.devicespecificconversionfactor
     * @type {Float} 
     */
    static DeviceSpecificConversionFactor {
        get => BackgroundEnergyDiagnostics.get_DeviceSpecificConversionFactor()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Float} 
     */
    static get_DeviceSpecificConversionFactor() {
        if (!BackgroundEnergyDiagnostics.HasProp("__IBackgroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyDiagnosticsStatics.IID)
            BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics := IBackgroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics.get_DeviceSpecificConversionFactor()
    }

    /**
     * Computes the total cumulative energy usage of the background task since the last reset, expressed as a percentage of normal.
     * 
     * > [!IMPORTANT]
     * > This method consumes significant CPU resources. We recommend using this method only for debugging purposes.
     * @remarks
     * Reset the energy usage total by calling [ResetTotalEnergyUsage](backgroundenergydiagnostics_resettotalenergyusage_1916149566.md).
     * 
     * The energy usage of a background task is classified into one of these predefined levels, from lowest to highest energy consumption: [LowUsageLevel](../windows.system.power/backgroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](../windows.system.power/backgroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](../windows.system.power/backgroundenergymanager_maxacceptableusagelevel.md), [ExcessiveUsageLevel](../windows.system.power/backgroundenergymanager_excessiveusagelevel.md), [NearTerminationUsageLevel](../windows.system.power/backgroundenergymanager_nearterminationusagelevel.md), or [TerminationUsageLevel](../windows.system.power/backgroundenergymanager_terminationusagelevel.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.backgroundenergydiagnostics.computetotalenergyusage
     */
    static ComputeTotalEnergyUsage() {
        if (!BackgroundEnergyDiagnostics.HasProp("__IBackgroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyDiagnosticsStatics.IID)
            BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics := IBackgroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics.ComputeTotalEnergyUsage()
    }

    /**
     * Clears the value that represents the total cumulative energy usage of the background task since the last reset.
     * 
     * > [!IMPORTANT]
     * > These APIs consume significant CPU resources. We recommend using these APIs only for debugging purposes.
     * @remarks
     * This method doesn't reduce energy consumption, it simply resets the counter used to track total energy usage.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.diagnostics.backgroundenergydiagnostics.resettotalenergyusage
     */
    static ResetTotalEnergyUsage() {
        if (!BackgroundEnergyDiagnostics.HasProp("__IBackgroundEnergyDiagnosticsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyDiagnosticsStatics.IID)
            BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics := IBackgroundEnergyDiagnosticsStatics(factoryPtr)
        }

        return BackgroundEnergyDiagnostics.__IBackgroundEnergyDiagnosticsStatics.ResetTotalEnergyUsage()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
