#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewFilter
     * @type {Guid}
     */
    static IID => Guid("{0c733a9b-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilter", "GetFilterBindings", "SetFilter"]

    /**
     * 
     * @param {HACCESSOR} hAccessor_ 
     * @param {Pointer<Pointer>} pcRows 
     * @param {Pointer<Pointer<Integer>>} pCompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    GetFilter(hAccessor_, pcRows, pCompareOps, pCriteriaData) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"
        pCompareOpsMarshal := pCompareOps is VarRef ? "ptr*" : "ptr"
        pCriteriaDataMarshal := pCriteriaData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hAccessor_, pcRowsMarshal, pcRows, pCompareOpsMarshal, pCompareOps, pCriteriaDataMarshal, pCriteriaData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcBindings 
     * @param {Pointer<Pointer<DBBINDING>>} prgBindings 
     * @returns {HRESULT} 
     */
    GetFilterBindings(pcBindings, prgBindings) {
        pcBindingsMarshal := pcBindings is VarRef ? "ptr*" : "ptr"
        prgBindingsMarshal := prgBindings is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcBindingsMarshal, pcBindings, prgBindingsMarshal, prgBindings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor_ 
     * @param {Pointer} cRows 
     * @param {Pointer<Integer>} CompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    SetFilter(hAccessor_, cRows, CompareOps, pCriteriaData) {
        hAccessor_ := hAccessor_ is Win32Handle ? NumGet(hAccessor_, "ptr") : hAccessor_

        CompareOpsMarshal := CompareOps is VarRef ? "uint*" : "ptr"
        pCriteriaDataMarshal := pCriteriaData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", hAccessor_, "ptr", cRows, CompareOpsMarshal, CompareOps, pCriteriaDataMarshal, pCriteriaData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
