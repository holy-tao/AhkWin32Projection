#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCandidateList.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnGetLinguisticAlternates interface is implemented by a text service and/or by the TSF manager to provide linguistic alternates for the text within a given range passed as a parameter.
 * @see https://learn.microsoft.com/windows/win32/api//content/ctffunc/nn-ctffunc-itffngetlinguisticalternates
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnGetLinguisticAlternates extends ITfFunction{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlternates"]

    /**
     * Returns a list of alternate strings for a given text range.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that covers the text to return alternates for.
     * @returns {Pointer<ITfCandidateList>} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itfcandidatelist">ITfCandidateList</a> pointer that receives the list object containing alternate strings.
     * @see https://learn.microsoft.com/windows/win32/api//content/ctffunc/nf-ctffunc-itffngetlinguisticalternates-getalternates
     */
    GetAlternates(pRange) {
        result := ComCall(4, this, "ptr", pRange, "ptr*", &ppCandidateList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppCandidateList
    }
}
