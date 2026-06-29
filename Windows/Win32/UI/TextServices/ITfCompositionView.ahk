#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCompositionView interface is implemented by the TSF manager and used by an application to obtain data about a composition view. An instance of this interface is provided by one of the ITfContextOwnerCompositionSink methods.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcompositionview
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCompositionView extends IUnknown {
    /**
     * The interface identifier for ITfCompositionView
     * @type {Guid}
     */
    static IID := Guid("{d7540241-f9a1-4364-befc-dbcd2c4395b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCompositionView interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOwnerClsid : IntPtr
        GetRange      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCompositionView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCompositionView::GetOwnerClsid method
     * @remarks
     * This method can be used to enable a text service to filter compositions that it does not own.
     * @returns {Guid} Pointer to a CLSID that receives the class identifier of the text service that owns the composition.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionview-getownerclsid
     */
    GetOwnerClsid() {
        pclsid := Guid()
        result := ComCall(3, this, Guid.Ptr, pclsid, "HRESULT")
        return pclsid
    }

    /**
     * ITfCompositionView::GetRange method
     * @returns {ITfRange} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfRange</a> interface pointer that receives the range object. It is possible that the range will have zero length.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionview-getrange
     */
    GetRange() {
        result := ComCall(4, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITfRange(ppRange)
    }

    Query(iid) {
        if (ITfCompositionView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOwnerClsid := CallbackCreate(GetMethod(implObj, "GetOwnerClsid"), flags, 2)
        this.vtbl.GetRange := CallbackCreate(GetMethod(implObj, "GetRange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOwnerClsid)
        CallbackFree(this.vtbl.GetRange)
    }
}
