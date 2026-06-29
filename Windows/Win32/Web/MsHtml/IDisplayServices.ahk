#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLCaret.ahk" { IHTMLCaret }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COORD_SYSTEM.ahk" { COORD_SYSTEM }
#Import ".\IHTMLComputedStyle.ahk" { IHTMLComputedStyle }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDisplayPointer.ahk" { IDisplayPointer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDisplayServices extends IUnknown {
    /**
     * The interface identifier for IDisplayServices
     * @type {Guid}
     */
    static IID := Guid("{3050f69d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDisplayServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDisplayPointer : IntPtr
        TransformRect        : IntPtr
        TransformPoint       : IntPtr
        GetCaret             : IntPtr
        GetComputedStyle     : IntPtr
        ScrollRectIntoView   : IntPtr
        HasFlowLayout        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDisplayServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDisplayPointer} 
     */
    CreateDisplayPointer() {
        result := ComCall(3, this, "ptr*", &ppDispPointer := 0, "HRESULT")
        return IDisplayPointer(ppDispPointer)
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @param {COORD_SYSTEM} eSource 
     * @param {COORD_SYSTEM} eDestination 
     * @param {IHTMLElement} pIElement 
     * @returns {HRESULT} 
     */
    TransformRect(pRect, eSource, eDestination, pIElement) {
        result := ComCall(4, this, RECT.Ptr, pRect, COORD_SYSTEM, eSource, COORD_SYSTEM, eDestination, "ptr", pIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} pPoint 
     * @param {COORD_SYSTEM} eSource 
     * @param {COORD_SYSTEM} eDestination 
     * @param {IHTMLElement} pIElement 
     * @returns {HRESULT} 
     */
    TransformPoint(pPoint, eSource, eDestination, pIElement) {
        result := ComCall(5, this, POINT.Ptr, pPoint, COORD_SYSTEM, eSource, COORD_SYSTEM, eDestination, "ptr", pIElement, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLCaret} 
     */
    GetCaret() {
        result := ComCall(6, this, "ptr*", &ppCaret := 0, "HRESULT")
        return IHTMLCaret(ppCaret)
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @returns {IHTMLComputedStyle} 
     */
    GetComputedStyle(pPointer) {
        result := ComCall(7, this, "ptr", pPointer, "ptr*", &ppComputedStyle := 0, "HRESULT")
        return IHTMLComputedStyle(ppComputedStyle)
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {RECT} _rect 
     * @returns {HRESULT} 
     */
    ScrollRectIntoView(pIElement, _rect) {
        result := ComCall(8, this, "ptr", pIElement, RECT, _rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @returns {BOOL} 
     */
    HasFlowLayout(pIElement) {
        result := ComCall(9, this, "ptr", pIElement, BOOL.Ptr, &pfHasFlowLayout := 0, "HRESULT")
        return pfHasFlowLayout
    }

    Query(iid) {
        if (IDisplayServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDisplayPointer := CallbackCreate(GetMethod(implObj, "CreateDisplayPointer"), flags, 2)
        this.vtbl.TransformRect := CallbackCreate(GetMethod(implObj, "TransformRect"), flags, 5)
        this.vtbl.TransformPoint := CallbackCreate(GetMethod(implObj, "TransformPoint"), flags, 5)
        this.vtbl.GetCaret := CallbackCreate(GetMethod(implObj, "GetCaret"), flags, 2)
        this.vtbl.GetComputedStyle := CallbackCreate(GetMethod(implObj, "GetComputedStyle"), flags, 3)
        this.vtbl.ScrollRectIntoView := CallbackCreate(GetMethod(implObj, "ScrollRectIntoView"), flags, 3)
        this.vtbl.HasFlowLayout := CallbackCreate(GetMethod(implObj, "HasFlowLayout"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDisplayPointer)
        CallbackFree(this.vtbl.TransformRect)
        CallbackFree(this.vtbl.TransformPoint)
        CallbackFree(this.vtbl.GetCaret)
        CallbackFree(this.vtbl.GetComputedStyle)
        CallbackFree(this.vtbl.ScrollRectIntoView)
        CallbackFree(this.vtbl.HasFlowLayout)
    }
}
