#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLEditServices.ahk" { IHTMLEditServices }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDisplayPointer.ahk" { IDisplayPointer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLEditServices2 extends IHTMLEditServices {
    /**
     * The interface identifier for IHTMLEditServices2
     * @type {Guid}
     */
    static IID := Guid("{3050f812-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEditServices2 interfaces
    */
    struct Vtbl extends IHTMLEditServices.Vtbl {
        MoveToSelectionAnchorEx : IntPtr
        MoveToSelectionEndEx    : IntPtr
        FreezeVirtualCaretPos   : IntPtr
        UnFreezeVirtualCaretPos : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEditServices2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDisplayPointer} pIStartAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionAnchorEx(pIStartAnchor) {
        result := ComCall(9, this, "ptr", pIStartAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pIEndAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionEndEx(pIEndAnchor) {
        result := ComCall(10, this, "ptr", pIEndAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fReCompute 
     * @returns {HRESULT} 
     */
    FreezeVirtualCaretPos(fReCompute) {
        result := ComCall(11, this, BOOL, fReCompute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fReset 
     * @returns {HRESULT} 
     */
    UnFreezeVirtualCaretPos(fReset) {
        result := ComCall(12, this, BOOL, fReset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLEditServices2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveToSelectionAnchorEx := CallbackCreate(GetMethod(implObj, "MoveToSelectionAnchorEx"), flags, 2)
        this.vtbl.MoveToSelectionEndEx := CallbackCreate(GetMethod(implObj, "MoveToSelectionEndEx"), flags, 2)
        this.vtbl.FreezeVirtualCaretPos := CallbackCreate(GetMethod(implObj, "FreezeVirtualCaretPos"), flags, 2)
        this.vtbl.UnFreezeVirtualCaretPos := CallbackCreate(GetMethod(implObj, "UnFreezeVirtualCaretPos"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveToSelectionAnchorEx)
        CallbackFree(this.vtbl.MoveToSelectionEndEx)
        CallbackFree(this.vtbl.FreezeVirtualCaretPos)
        CallbackFree(this.vtbl.UnFreezeVirtualCaretPos)
    }
}
