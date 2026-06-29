#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLEditDesigner.ahk" { IHTMLEditDesigner }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import ".\SELECTION_TYPE.ahk" { SELECTION_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISelectionServices.ahk" { ISelectionServices }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLEditServices extends IUnknown {
    /**
     * The interface identifier for IHTMLEditServices
     * @type {Guid}
     */
    static IID := Guid("{3050f663-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEditServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddDesigner           : IntPtr
        RemoveDesigner        : IntPtr
        GetSelectionServices  : IntPtr
        MoveToSelectionAnchor : IntPtr
        MoveToSelectionEnd    : IntPtr
        SelectRange           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEditServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHTMLEditDesigner} pIDesigner 
     * @returns {HRESULT} 
     */
    AddDesigner(pIDesigner) {
        result := ComCall(3, this, "ptr", pIDesigner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLEditDesigner} pIDesigner 
     * @returns {HRESULT} 
     */
    RemoveDesigner(pIDesigner) {
        result := ComCall(4, this, "ptr", pIDesigner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupContainer} pIContainer 
     * @returns {ISelectionServices} 
     */
    GetSelectionServices(pIContainer) {
        result := ComCall(5, this, "ptr", pIContainer, "ptr*", &ppSelSvc := 0, "HRESULT")
        return ISelectionServices(ppSelSvc)
    }

    /**
     * 
     * @param {IMarkupPointer} pIStartAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionAnchor(pIStartAnchor) {
        result := ComCall(6, this, "ptr", pIStartAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pIEndAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionEnd(pIEndAnchor) {
        result := ComCall(7, this, "ptr", pIEndAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pStart 
     * @param {IMarkupPointer} pEnd 
     * @param {SELECTION_TYPE} eType 
     * @returns {HRESULT} 
     */
    SelectRange(pStart, pEnd, eType) {
        result := ComCall(8, this, "ptr", pStart, "ptr", pEnd, SELECTION_TYPE, eType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLEditServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddDesigner := CallbackCreate(GetMethod(implObj, "AddDesigner"), flags, 2)
        this.vtbl.RemoveDesigner := CallbackCreate(GetMethod(implObj, "RemoveDesigner"), flags, 2)
        this.vtbl.GetSelectionServices := CallbackCreate(GetMethod(implObj, "GetSelectionServices"), flags, 3)
        this.vtbl.MoveToSelectionAnchor := CallbackCreate(GetMethod(implObj, "MoveToSelectionAnchor"), flags, 2)
        this.vtbl.MoveToSelectionEnd := CallbackCreate(GetMethod(implObj, "MoveToSelectionEnd"), flags, 2)
        this.vtbl.SelectRange := CallbackCreate(GetMethod(implObj, "SelectRange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddDesigner)
        CallbackFree(this.vtbl.RemoveDesigner)
        CallbackFree(this.vtbl.GetSelectionServices)
        CallbackFree(this.vtbl.MoveToSelectionAnchor)
        CallbackFree(this.vtbl.MoveToSelectionEnd)
        CallbackFree(this.vtbl.SelectRange)
    }
}
