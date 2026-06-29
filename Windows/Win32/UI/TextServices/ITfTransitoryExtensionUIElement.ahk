#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfUIElement.ahk" { ITfUIElement }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }

/**
 * The ITfTransitoryExtensionUIElement interface is implemented by TSF manager which provides the UI of transitory extension.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftransitoryextensionuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTransitoryExtensionUIElement extends ITfUIElement {
    /**
     * The interface identifier for ITfTransitoryExtensionUIElement
     * @type {Guid}
     */
    static IID := Guid("{858f956a-972f-42a2-a2f2-0321e1abe209}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTransitoryExtensionUIElement interfaces
    */
    struct Vtbl extends ITfUIElement.Vtbl {
        GetDocumentMgr : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTransitoryExtensionUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfTransitoryExtensionUIElement::GetDocumentMgr method returns the pointer of the transitory document manager.
     * @returns {ITfDocumentMgr} [out] A pointer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface pointer. This document manager object contains a context object that has the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface and contains the text of the transitory extension.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftransitoryextensionuielement-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(7, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    Query(iid) {
        if (ITfTransitoryExtensionUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentMgr := CallbackCreate(GetMethod(implObj, "GetDocumentMgr"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentMgr)
    }
}
