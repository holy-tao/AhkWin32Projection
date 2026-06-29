#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SELECTION_TYPE.ahk" { SELECTION_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISelectionServicesListener extends IUnknown {
    /**
     * The interface identifier for ISelectionServicesListener
     * @type {Guid}
     */
    static IID := Guid("{3050f699-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectionServicesListener interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginSelectionUndo    : IntPtr
        EndSelectionUndo      : IntPtr
        OnSelectedElementExit : IntPtr
        OnChangeType          : IntPtr
        GetTypeDetail         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectionServicesListener.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginSelectionUndo() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndSelectionUndo() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIElementStart 
     * @param {IMarkupPointer} pIElementEnd 
     * @param {IMarkupPointer} pIElementContentStart 
     * @param {IMarkupPointer} pIElementContentEnd 
     * @returns {HRESULT} 
     */
    OnSelectedElementExit(pIElementStart, pIElementEnd, pIElementContentStart, pIElementContentEnd) {
        result := ComCall(5, this, "ptr", pIElementStart, "ptr", pIElementEnd, "ptr", pIElementContentStart, "ptr", pIElementContentEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SELECTION_TYPE} eType 
     * @param {ISelectionServicesListener} pIListener 
     * @returns {HRESULT} 
     */
    OnChangeType(eType, pIListener) {
        result := ComCall(6, this, SELECTION_TYPE, eType, "ptr", pIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetTypeDetail() {
        pTypeDetail := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pTypeDetail, "HRESULT")
        return pTypeDetail
    }

    Query(iid) {
        if (ISelectionServicesListener.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginSelectionUndo := CallbackCreate(GetMethod(implObj, "BeginSelectionUndo"), flags, 1)
        this.vtbl.EndSelectionUndo := CallbackCreate(GetMethod(implObj, "EndSelectionUndo"), flags, 1)
        this.vtbl.OnSelectedElementExit := CallbackCreate(GetMethod(implObj, "OnSelectedElementExit"), flags, 5)
        this.vtbl.OnChangeType := CallbackCreate(GetMethod(implObj, "OnChangeType"), flags, 3)
        this.vtbl.GetTypeDetail := CallbackCreate(GetMethod(implObj, "GetTypeDetail"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginSelectionUndo)
        CallbackFree(this.vtbl.EndSelectionUndo)
        CallbackFree(this.vtbl.OnSelectedElementExit)
        CallbackFree(this.vtbl.OnChangeType)
        CallbackFree(this.vtbl.GetTypeDetail)
    }
}
