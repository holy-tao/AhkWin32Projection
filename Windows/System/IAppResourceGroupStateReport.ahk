#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppResourceGroupStateReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppResourceGroupStateReport
     * @type {Guid}
     */
    static IID => Guid("{52849f18-2f70-4236-ab40-d04db0c7b931}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExecutionState", "get_EnergyQuotaState"]

    /**
     * @type {Integer} 
     */
    ExecutionState {
        get => this.get_ExecutionState()
    }

    /**
     * @type {Integer} 
     */
    EnergyQuotaState {
        get => this.get_EnergyQuotaState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExecutionState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnergyQuotaState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
