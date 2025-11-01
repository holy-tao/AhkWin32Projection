#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfUIElement.ahk

/**
 * The ITfTransitoryExtensionUIElement interface is implemented by TSF manager which provides the UI of transitory extension.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftransitoryextensionuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTransitoryExtensionUIElement extends ITfUIElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfTransitoryExtensionUIElement
     * @type {Guid}
     */
    static IID => Guid("{858f956a-972f-42a2-a2f2-0321e1abe209}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentMgr"]

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppdim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftransitoryextensionuielement-getdocumentmgr
     */
    GetDocumentMgr(ppdim) {
        result := ComCall(7, this, "ptr*", ppdim, "HRESULT")
        return result
    }
}
