#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISegmentList.ahk" { ISegmentList }
#Import ".\IMarkupServices.ahk" { IMarkupServices }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\HGLOBAL.ahk" { HGLOBAL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupServices2 extends IMarkupServices {
    /**
     * The interface identifier for IMarkupServices2
     * @type {Guid}
     */
    static IID := Guid("{3050f682-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupServices2 interfaces
    */
    struct Vtbl extends IMarkupServices.Vtbl {
        ParseGlobalEx           : IntPtr
        ValidateElements        : IntPtr
        SaveSegmentsToClipboard : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupServices2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupContainer} pContext 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {IMarkupContainer} 
     */
    ParseGlobalEx(hglobalHTML, dwFlags, pContext, pPointerStart, pPointerFinish) {
        result := ComCall(23, this, HGLOBAL, hglobalHTML, "uint", dwFlags, "ptr", pContext, "ptr*", &ppContainerResult := 0, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return IMarkupContainer(ppContainerResult)
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @param {IMarkupPointer} pPointerStatus 
     * @param {Pointer<IHTMLElement>} ppElemFailBottom 
     * @param {Pointer<IHTMLElement>} ppElemFailTop 
     * @returns {HRESULT} 
     */
    ValidateElements(pPointerStart, pPointerFinish, pPointerTarget, pPointerStatus, ppElemFailBottom, ppElemFailTop) {
        result := ComCall(24, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pPointerTarget, "ptr", pPointerStatus, IHTMLElement.Ptr, ppElemFailBottom, IHTMLElement.Ptr, ppElemFailTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISegmentList} pSegmentList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveSegmentsToClipboard(pSegmentList, dwFlags) {
        result := ComCall(25, this, "ptr", pSegmentList, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMarkupServices2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ParseGlobalEx := CallbackCreate(GetMethod(implObj, "ParseGlobalEx"), flags, 7)
        this.vtbl.ValidateElements := CallbackCreate(GetMethod(implObj, "ValidateElements"), flags, 7)
        this.vtbl.SaveSegmentsToClipboard := CallbackCreate(GetMethod(implObj, "SaveSegmentsToClipboard"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ParseGlobalEx)
        CallbackFree(this.vtbl.ValidateElements)
        CallbackFree(this.vtbl.SaveSegmentsToClipboard)
    }
}
