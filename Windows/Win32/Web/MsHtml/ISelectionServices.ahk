#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import ".\IElementSegment.ahk" { IElementSegment }
#Import ".\ISelectionServicesListener.ahk" { ISelectionServicesListener }
#Import ".\ISegment.ahk" { ISegment }
#Import ".\SELECTION_TYPE.ahk" { SELECTION_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISelectionServices extends IUnknown {
    /**
     * The interface identifier for ISelectionServices
     * @type {Guid}
     */
    static IID := Guid("{3050f684-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectionServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSelectionType             : IntPtr
        GetMarkupContainer           : IntPtr
        AddSegment                   : IntPtr
        AddElementSegment            : IntPtr
        RemoveSegment                : IntPtr
        GetSelectionServicesListener : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectionServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {SELECTION_TYPE} eType 
     * @param {ISelectionServicesListener} pIListener 
     * @returns {HRESULT} 
     */
    SetSelectionType(eType, pIListener) {
        result := ComCall(3, this, SELECTION_TYPE, eType, "ptr", pIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    GetMarkupContainer() {
        result := ComCall(4, this, "ptr*", &ppIContainer := 0, "HRESULT")
        return IMarkupContainer(ppIContainer)
    }

    /**
     * 
     * @param {IMarkupPointer} pIStart 
     * @param {IMarkupPointer} pIEnd 
     * @returns {ISegment} 
     */
    AddSegment(pIStart, pIEnd) {
        result := ComCall(5, this, "ptr", pIStart, "ptr", pIEnd, "ptr*", &ppISegmentAdded := 0, "HRESULT")
        return ISegment(ppISegmentAdded)
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @returns {IElementSegment} 
     */
    AddElementSegment(pIElement) {
        result := ComCall(6, this, "ptr", pIElement, "ptr*", &ppISegmentAdded := 0, "HRESULT")
        return IElementSegment(ppISegmentAdded)
    }

    /**
     * 
     * @param {ISegment} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(7, this, "ptr", pISegment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISelectionServicesListener} 
     */
    GetSelectionServicesListener() {
        result := ComCall(8, this, "ptr*", &ppISelectionServicesListener := 0, "HRESULT")
        return ISelectionServicesListener(ppISelectionServicesListener)
    }

    Query(iid) {
        if (ISelectionServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSelectionType := CallbackCreate(GetMethod(implObj, "SetSelectionType"), flags, 3)
        this.vtbl.GetMarkupContainer := CallbackCreate(GetMethod(implObj, "GetMarkupContainer"), flags, 2)
        this.vtbl.AddSegment := CallbackCreate(GetMethod(implObj, "AddSegment"), flags, 4)
        this.vtbl.AddElementSegment := CallbackCreate(GetMethod(implObj, "AddElementSegment"), flags, 3)
        this.vtbl.RemoveSegment := CallbackCreate(GetMethod(implObj, "RemoveSegment"), flags, 2)
        this.vtbl.GetSelectionServicesListener := CallbackCreate(GetMethod(implObj, "GetSelectionServicesListener"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSelectionType)
        CallbackFree(this.vtbl.GetMarkupContainer)
        CallbackFree(this.vtbl.AddSegment)
        CallbackFree(this.vtbl.AddElementSegment)
        CallbackFree(this.vtbl.RemoveSegment)
        CallbackFree(this.vtbl.GetSelectionServicesListener)
    }
}
