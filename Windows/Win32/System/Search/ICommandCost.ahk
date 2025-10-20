#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandCost extends IUnknown{
    /**
     * The interface identifier for ICommandCost
     * @type {Guid}
     */
    static IID => Guid("{0c733a4e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<UInt32>} pcCostLimits 
     * @param {Pointer<DBCOST>} prgCostLimits 
     * @returns {HRESULT} 
     */
    GetAccumulatedCost(pwszRowsetName, pcCostLimits, prgCostLimits) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(3, this, "ptr", pwszRowsetName, "uint*", pcCostLimits, "ptr", prgCostLimits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<UInt32>} pcCostEstimates 
     * @param {Pointer<DBCOST>} prgCostEstimates 
     * @returns {HRESULT} 
     */
    GetCostEstimate(pwszRowsetName, pcCostEstimates, prgCostEstimates) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(4, this, "ptr", pwszRowsetName, "uint*", pcCostEstimates, "ptr", prgCostEstimates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<UInt32>} pcCostGoals 
     * @param {Pointer<DBCOST>} prgCostGoals 
     * @returns {HRESULT} 
     */
    GetCostGoals(pwszRowsetName, pcCostGoals, prgCostGoals) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(5, this, "ptr", pwszRowsetName, "uint*", pcCostGoals, "ptr", prgCostGoals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<UInt32>} pcCostLimits 
     * @param {Pointer<DBCOST>} prgCostLimits 
     * @returns {HRESULT} 
     */
    GetCostLimits(pwszRowsetName, pcCostLimits, prgCostLimits) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(6, this, "ptr", pwszRowsetName, "uint*", pcCostLimits, "ptr", prgCostLimits, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Integer} cCostGoals 
     * @param {Pointer<DBCOST>} rgCostGoals 
     * @returns {HRESULT} 
     */
    SetCostGoals(pwszRowsetName, cCostGoals, rgCostGoals) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(7, this, "ptr", pwszRowsetName, "uint", cCostGoals, "ptr", rgCostGoals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Integer} cCostLimits 
     * @param {Pointer<DBCOST>} prgCostLimits 
     * @param {Integer} dwExecutionFlags 
     * @returns {HRESULT} 
     */
    SetCostLimits(pwszRowsetName, cCostLimits, prgCostLimits, dwExecutionFlags) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        result := ComCall(8, this, "ptr", pwszRowsetName, "uint", cCostLimits, "ptr", prgCostLimits, "uint", dwExecutionFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
