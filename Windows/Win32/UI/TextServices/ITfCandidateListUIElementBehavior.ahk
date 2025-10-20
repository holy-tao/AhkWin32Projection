#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfCandidateListUIElement.ahk

/**
 * This interface is implemented by a text service that has a candidate list UI and its UI can be controlled by the application. The application QI this interface from ITfUIElement and controls the candidate list behavior.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcandidatelistuielementbehavior
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateListUIElementBehavior extends ITfCandidateListUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCandidateListUIElementBehavior
     * @type {Guid}
     */
    static IID => Guid("{85fad185-58ce-497a-9460-355366b64b9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSelection", "Finalize", "Abort"]

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-setselection
     */
    SetSelection(nIndex) {
        result := ComCall(15, this, "uint", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-finalize
     */
    Finalize() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcandidatelistuielementbehavior-abort
     */
    Abort() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
