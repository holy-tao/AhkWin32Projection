#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Power.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IForegroundEnergyDiagnosticsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IForegroundEnergyDiagnosticsStatics
     * @type {Guid}
     */
    static IID => Guid("{23ca0917-cd07-4609-be15-8fe894c5e41e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceSpecificConversionFactor", "ComputeTotalEnergyUsage", "ResetTotalEnergyUsage"]

    /**
     * @type {Float} 
     */
    DeviceSpecificConversionFactor {
        get => this.get_DeviceSpecificConversionFactor()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeviceSpecificConversionFactor() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    ComputeTotalEnergyUsage() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetTotalEnergyUsage() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
