#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBCOST.ahk" { DBCOST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandCost extends IUnknown {
    /**
     * The interface identifier for ICommandCost
     * @type {Guid}
     */
    static IID := Guid("{0c733a4e-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandCost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAccumulatedCost : IntPtr
        GetCostEstimate    : IntPtr
        GetCostGoals       : IntPtr
        GetCostLimits      : IntPtr
        SetCostGoals       : IntPtr
        SetCostLimits      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandCost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszRowsetName 
     * @param {Pointer<Integer>} pcCostLimits 
     * @returns {Pointer<DBCOST>} 
     */
    GetAccumulatedCost(pwszRowsetName, pcCostLimits) {
        pwszRowsetName := pwszRowsetName is String ? StrPtr(pwszRowsetName) : pwszRowsetName

        pcCostLimitsMarshal := pcCostLimits is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwszRowsetName, pcCostLimitsMarshal, pcCostLimits, "ptr*", &prgCostLimits := 0, "HRESULT")
        return prgCostLimits
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

        result := ComCall(4, this, "ptr", pwszRowsetName, pcCostEstimatesMarshal, pcCostEstimates, DBCOST.Ptr, prgCostEstimates, "HRESULT")
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

        result := ComCall(5, this, "ptr", pwszRowsetName, pcCostGoalsMarshal, pcCostGoals, DBCOST.Ptr, prgCostGoals, "HRESULT")
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

        result := ComCall(6, this, "ptr", pwszRowsetName, pcCostLimitsMarshal, pcCostLimits, DBCOST.Ptr, prgCostLimits, "HRESULT")
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

        result := ComCall(7, this, "ptr", pwszRowsetName, "uint", cCostGoals, DBCOST.Ptr, rgCostGoals, "HRESULT")
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

        result := ComCall(8, this, "ptr", pwszRowsetName, "uint", cCostLimits, DBCOST.Ptr, prgCostLimits, "uint", dwExecutionFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandCost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAccumulatedCost := CallbackCreate(GetMethod(implObj, "GetAccumulatedCost"), flags, 4)
        this.vtbl.GetCostEstimate := CallbackCreate(GetMethod(implObj, "GetCostEstimate"), flags, 4)
        this.vtbl.GetCostGoals := CallbackCreate(GetMethod(implObj, "GetCostGoals"), flags, 4)
        this.vtbl.GetCostLimits := CallbackCreate(GetMethod(implObj, "GetCostLimits"), flags, 4)
        this.vtbl.SetCostGoals := CallbackCreate(GetMethod(implObj, "SetCostGoals"), flags, 4)
        this.vtbl.SetCostLimits := CallbackCreate(GetMethod(implObj, "SetCostLimits"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAccumulatedCost)
        CallbackFree(this.vtbl.GetCostEstimate)
        CallbackFree(this.vtbl.GetCostGoals)
        CallbackFree(this.vtbl.GetCostLimits)
        CallbackFree(this.vtbl.SetCostGoals)
        CallbackFree(this.vtbl.SetCostLimits)
    }
}
