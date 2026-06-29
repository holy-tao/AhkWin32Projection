#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugDocument.ahk" { IDebugDocument }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugDocumentInfo.ahk" { IDebugDocumentInfo }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentProvider extends IDebugDocumentInfo {
    /**
     * The interface identifier for IDebugDocumentProvider
     * @type {Guid}
     */
    static IID := Guid("{51973c20-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentProvider interfaces
    */
    struct Vtbl extends IDebugDocumentInfo.Vtbl {
        GetDocument : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugDocument} 
     */
    GetDocument() {
        result := ComCall(5, this, "ptr*", &ppssd := 0, "HRESULT")
        return IDebugDocument(ppssd)
    }

    Query(iid) {
        if (IDebugDocumentProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocument := CallbackCreate(GetMethod(implObj, "GetDocument"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocument)
    }
}
