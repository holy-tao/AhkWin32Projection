#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfCandidateList.ahk
#Include .\ITfFunction.ahk

/**
 * Enables an integrated search experience in an Input Method Editor (IME).
 * @remarks
 * 
  * Implement the <b>ITfFnSearchCandidateProvider</b> interface in your Input Method Editor (IME) to enable an integrated search experience. Implementing this interface enables searches with meaningful results to begin before IME input has been completed, by providing a set of possible IME conversion candidates for a given input string.  Apps can use this interface to obtain IME conversions for a string, so the <b>ITfFnSearchCandidateProvider</b> interface, along with <a href="https://docs.microsoft.com/windows/desktop/api/ctffunc/nn-ctffunc-itffngetlinguisticalternates">ITfFnGetLinguisticAlternates</a>, provides a TSF-based replacement for the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetconversionlista">ImmGetConversionList</a> function.  Typically IMEs implement either <b>ITfFnGetLinguisticAlternates</b> or <b>ITfFnSearchCandidateProvider</b> (or neither).
  * 
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-getfunctionprovider">GetFunctionProvider</a> with the CLSID of a text service to get an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itffunctionprovider">ITfFunctionProvider</a> instance.  Use the following call to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itffunctionprovider-getfunction">ITfFunctionProvider::GetFunction</a> method to get the <b>ITfFnSearchCandidateProvider</b> interface pointer.
  * 
  * <c>ITfFunctionProvider::GetFunction(GUID_NULL, IID_ITfFnSearchCandidateProvider, &amp;pSearchCandidate)</c>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnsearchcandidateprovider
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnSearchCandidateProvider extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnSearchCandidateProvider
     * @type {Guid}
     */
    static IID => Guid("{87a2ad8f-f27b-4920-8501-67602280175d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSearchCandidates", "SetResult"]

    /**
     * 
     * @param {BSTR} bstrQuery 
     * @param {BSTR} bstrApplicationId 
     * @returns {ITfCandidateList} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-getsearchcandidates
     */
    GetSearchCandidates(bstrQuery, bstrApplicationId) {
        bstrQuery := bstrQuery is String ? BSTR.Alloc(bstrQuery).Value : bstrQuery
        bstrApplicationId := bstrApplicationId is String ? BSTR.Alloc(bstrApplicationId).Value : bstrApplicationId

        result := ComCall(4, this, "ptr", bstrQuery, "ptr", bstrApplicationId, "ptr*", &pplist := 0, "HRESULT")
        return ITfCandidateList(pplist)
    }

    /**
     * 
     * @param {BSTR} bstrQuery 
     * @param {BSTR} bstrApplicationID 
     * @param {BSTR} bstrResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnsearchcandidateprovider-setresult
     */
    SetResult(bstrQuery, bstrApplicationID, bstrResult) {
        bstrQuery := bstrQuery is String ? BSTR.Alloc(bstrQuery).Value : bstrQuery
        bstrApplicationID := bstrApplicationID is String ? BSTR.Alloc(bstrApplicationID).Value : bstrApplicationID
        bstrResult := bstrResult is String ? BSTR.Alloc(bstrResult).Value : bstrResult

        result := ComCall(5, this, "ptr", bstrQuery, "ptr", bstrApplicationID, "ptr", bstrResult, "HRESULT")
        return result
    }
}
