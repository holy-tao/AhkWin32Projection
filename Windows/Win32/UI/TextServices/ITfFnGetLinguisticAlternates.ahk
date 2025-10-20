#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnGetLinguisticAlternates interface is implemented by a text service and/or by the TSF manager to provide linguistic alternates for the text within a given range passed as a parameter.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffngetlinguisticalternates
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnGetLinguisticAlternates extends ITfFunction{
    /**
     * The interface identifier for ITfFnGetLinguisticAlternates
     * @type {Guid}
     */
    static IID => Guid("{ea163ce2-7a65-4506-82a3-c528215da64e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Pointer<ITfCandidateList>} ppCandidateList 
     * @returns {HRESULT} 
     */
    GetAlternates(pRange, ppCandidateList) {
        result := ComCall(4, this, "ptr", pRange, "ptr", ppCandidateList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
