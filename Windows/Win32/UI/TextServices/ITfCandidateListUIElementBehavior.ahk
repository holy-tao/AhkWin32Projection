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
     * 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    SetSelection(nIndex) {
        result := ComCall(15, this, "uint", nIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finalize() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
