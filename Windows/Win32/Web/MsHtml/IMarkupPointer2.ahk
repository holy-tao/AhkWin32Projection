#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MOVEUNIT_ACTION.ahk" { MOVEUNIT_ACTION }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupPointer2 extends IMarkupPointer {
    /**
     * The interface identifier for IMarkupPointer2
     * @type {Guid}
     */
    static IID := Guid("{3050f675-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupPointer2 interfaces
    */
    struct Vtbl extends IMarkupPointer.Vtbl {
        IsAtWordBreak        : IntPtr
        GetMarkupPosition    : IntPtr
        MoveToMarkupPosition : IntPtr
        MoveUnitBounded      : IntPtr
        IsInsideURL          : IntPtr
        MoveToContent        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupPointer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAtWordBreak() {
        result := ComCall(24, this, BOOL.Ptr, &pfAtBreak := 0, "HRESULT")
        return pfAtBreak
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMarkupPosition() {
        result := ComCall(25, this, "int*", &plMP := 0, "HRESULT")
        return plMP
    }

    /**
     * 
     * @param {IMarkupContainer} pContainer 
     * @param {Integer} lMP 
     * @returns {HRESULT} 
     */
    MoveToMarkupPosition(pContainer, lMP) {
        result := ComCall(26, this, "ptr", pContainer, "int", lMP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {MOVEUNIT_ACTION} muAction 
     * @param {IMarkupPointer} pIBoundary 
     * @returns {HRESULT} 
     */
    MoveUnitBounded(muAction, pIBoundary) {
        result := ComCall(27, this, MOVEUNIT_ACTION, muAction, "ptr", pIBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pRight 
     * @returns {BOOL} 
     */
    IsInsideURL(pRight) {
        result := ComCall(28, this, "ptr", pRight, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContent(pIElement, fAtStart) {
        result := ComCall(29, this, "ptr", pIElement, BOOL, fAtStart, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMarkupPointer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsAtWordBreak := CallbackCreate(GetMethod(implObj, "IsAtWordBreak"), flags, 2)
        this.vtbl.GetMarkupPosition := CallbackCreate(GetMethod(implObj, "GetMarkupPosition"), flags, 2)
        this.vtbl.MoveToMarkupPosition := CallbackCreate(GetMethod(implObj, "MoveToMarkupPosition"), flags, 3)
        this.vtbl.MoveUnitBounded := CallbackCreate(GetMethod(implObj, "MoveUnitBounded"), flags, 3)
        this.vtbl.IsInsideURL := CallbackCreate(GetMethod(implObj, "IsInsideURL"), flags, 3)
        this.vtbl.MoveToContent := CallbackCreate(GetMethod(implObj, "MoveToContent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsAtWordBreak)
        CallbackFree(this.vtbl.GetMarkupPosition)
        CallbackFree(this.vtbl.MoveToMarkupPosition)
        CallbackFree(this.vtbl.MoveUnitBounded)
        CallbackFree(this.vtbl.IsInsideURL)
        CallbackFree(this.vtbl.MoveToContent)
    }
}
