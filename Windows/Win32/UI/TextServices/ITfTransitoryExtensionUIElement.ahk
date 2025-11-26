#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfDocumentMgr.ahk
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
     * The ITfTransitoryExtensionUIElement::GetDocumentMgr method returns the pointer of the transitory document manager.
     * @returns {ITfDocumentMgr} [out] A pointer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer. This document manager object contains a context object that has the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface and contains the text of the transitory extension.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itftransitoryextensionuielement-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(7, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }
}
