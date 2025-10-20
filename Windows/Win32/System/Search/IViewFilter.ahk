#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IViewFilter extends IUnknown{
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
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<UIntPtr>} pcRows 
     * @param {Pointer<UInt32>} pCompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    GetFilter(hAccessor, pcRows, pCompareOps, pCriteriaData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hAccessor, "ptr*", pcRows, "uint*", pCompareOps, "ptr", pCriteriaData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} pcBindings 
     * @param {Pointer<DBBINDING>} prgBindings 
     * @returns {HRESULT} 
     */
    GetFilterBindings(pcBindings, prgBindings) {
        result := ComCall(4, this, "ptr*", pcBindings, "ptr", prgBindings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer} cRows 
     * @param {Pointer<UInt32>} CompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    SetFilter(hAccessor, cRows, CompareOps, pCriteriaData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(5, this, "ptr", hAccessor, "ptr", cRows, "uint*", CompareOps, "ptr", pCriteriaData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
