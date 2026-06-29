#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHighlightSegment.ahk" { IHighlightSegment }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDisplayPointer.ahk" { IDisplayPointer }
#Import ".\IHTMLRenderStyle.ahk" { IHTMLRenderStyle }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHighlightRenderingServices extends IUnknown {
    /**
     * The interface identifier for IHighlightRenderingServices
     * @type {Guid}
     */
    static IID := Guid("{3050f606-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHighlightRenderingServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddSegment            : IntPtr
        MoveSegmentToPointers : IntPtr
        RemoveSegment         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHighlightRenderingServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointerStart 
     * @param {IDisplayPointer} pDispPointerEnd 
     * @param {IHTMLRenderStyle} pIRenderStyle 
     * @returns {IHighlightSegment} 
     */
    AddSegment(pDispPointerStart, pDispPointerEnd, pIRenderStyle) {
        result := ComCall(3, this, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "ptr", pIRenderStyle, "ptr*", &ppISegment := 0, "HRESULT")
        return IHighlightSegment(ppISegment)
    }

    /**
     * 
     * @param {IHighlightSegment} pISegment 
     * @param {IDisplayPointer} pDispPointerStart 
     * @param {IDisplayPointer} pDispPointerEnd 
     * @returns {HRESULT} 
     */
    MoveSegmentToPointers(pISegment, pDispPointerStart, pDispPointerEnd) {
        result := ComCall(4, this, "ptr", pISegment, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHighlightSegment} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(5, this, "ptr", pISegment, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHighlightRenderingServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSegment := CallbackCreate(GetMethod(implObj, "AddSegment"), flags, 5)
        this.vtbl.MoveSegmentToPointers := CallbackCreate(GetMethod(implObj, "MoveSegmentToPointers"), flags, 4)
        this.vtbl.RemoveSegment := CallbackCreate(GetMethod(implObj, "RemoveSegment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSegment)
        CallbackFree(this.vtbl.MoveSegmentToPointers)
        CallbackFree(this.vtbl.RemoveSegment)
    }
}
