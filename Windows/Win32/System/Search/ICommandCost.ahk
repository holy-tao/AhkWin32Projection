#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandCost extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAccumulatedCost", "GetCostEstimate", "GetCostGoals", "GetCostLimits", "SetCostGoals", "SetCostLimits"]

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<Integer>} pcCostLimits 
     * @param {Pointer<Pointer<DBCOST>>} prgCostLimits 
     * @returns {HRESULT} 
     */
    GetAccumulatedCost(pwszRowsetName, pcCostLimits, prgCostLimits) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        pcCostLimitsMarshal := pcCostLimits is VarRef ? "uint*" : "ptr"
        prgCostLimitsMarshal := prgCostLimits is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pwszRowsetName, pcCostLimitsMarshal, pcCostLimits, prgCostLimitsMarshal, prgCostLimits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<Integer>} pcCostEstimates 
     * @param {Pointer<DBCOST>} prgCostEstimates 
     * @returns {HRESULT} 
     */
    GetCostEstimate(pwszRowsetName, pcCostEstimates, prgCostEstimates) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        pcCostEstimatesMarshal := pcCostEstimates is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszRowsetName, pcCostEstimatesMarshal, pcCostEstimates, "ptr", prgCostEstimates, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<Integer>} pcCostGoals 
     * @param {Pointer<DBCOST>} prgCostGoals 
     * @returns {HRESULT} 
     */
    GetCostGoals(pwszRowsetName, pcCostGoals, prgCostGoals) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        pcCostGoalsMarshal := pcCostGoals is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwszRowsetName, pcCostGoalsMarshal, pcCostGoals, "ptr", prgCostGoals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<Integer>} pcCostLimits 
     * @param {Pointer<DBCOST>} prgCostLimits 
     * @returns {HRESULT} 
     */
    GetCostLimits(pwszRowsetName, pcCostLimits, prgCostLimits) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        pcCostLimitsMarshal := pcCostLimits is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszRowsetName, pcCostLimitsMarshal, pcCostLimits, "ptr", prgCostLimits, "HRESULT")
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

        result := ComCall(7, this, "ptr", pwszRowsetName, "uint", cCostGoals, "ptr", rgCostGoals, "HRESULT")
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

        result := ComCall(8, this, "ptr", pwszRowsetName, "uint", cCostLimits, "ptr", prgCostLimits, "uint", dwExecutionFlags, "HRESULT")
        return result
    }
}
