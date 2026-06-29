#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDOMNodeIterator.ahk" { IDOMNodeIterator }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IDOMTreeWalker.ahk" { IDOMTreeWalker }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocumentTraversal extends IDispatch {
    /**
     * The interface identifier for IDocumentTraversal
     * @type {Guid}
     */
    static IID := Guid("{30510744-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocumentTraversal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createNodeIterator : IntPtr
        createTreeWalker   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocumentTraversal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDispatch} pRootNode 
     * @param {Integer} ulWhatToShow 
     * @param {Pointer<VARIANT>} pFilter 
     * @param {VARIANT_BOOL} fEntityReferenceExpansion 
     * @returns {IDOMNodeIterator} 
     */
    createNodeIterator(pRootNode, ulWhatToShow, pFilter, fEntityReferenceExpansion) {
        result := ComCall(7, this, "ptr", pRootNode, "int", ulWhatToShow, VARIANT.Ptr, pFilter, VARIANT_BOOL, fEntityReferenceExpansion, "ptr*", &ppNodeIterator := 0, "HRESULT")
        return IDOMNodeIterator(ppNodeIterator)
    }

    /**
     * 
     * @param {IDispatch} pRootNode 
     * @param {Integer} ulWhatToShow 
     * @param {Pointer<VARIANT>} pFilter 
     * @param {VARIANT_BOOL} fEntityReferenceExpansion 
     * @returns {IDOMTreeWalker} 
     */
    createTreeWalker(pRootNode, ulWhatToShow, pFilter, fEntityReferenceExpansion) {
        result := ComCall(8, this, "ptr", pRootNode, "int", ulWhatToShow, VARIANT.Ptr, pFilter, VARIANT_BOOL, fEntityReferenceExpansion, "ptr*", &ppTreeWalker := 0, "HRESULT")
        return IDOMTreeWalker(ppTreeWalker)
    }

    Query(iid) {
        if (IDocumentTraversal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createNodeIterator := CallbackCreate(GetMethod(implObj, "createNodeIterator"), flags, 6)
        this.vtbl.createTreeWalker := CallbackCreate(GetMethod(implObj, "createTreeWalker"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createNodeIterator)
        CallbackFree(this.vtbl.createTreeWalker)
    }
}
