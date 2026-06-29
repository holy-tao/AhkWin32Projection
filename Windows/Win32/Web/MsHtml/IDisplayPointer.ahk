#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\POINTER_GRAVITY.ahk" { POINTER_GRAVITY }
#Import ".\ILineInfo.ahk" { ILineInfo }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\COORD_SYSTEM.ahk" { COORD_SYSTEM }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import ".\DISPLAY_MOVEUNIT.ahk" { DISPLAY_MOVEUNIT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DISPLAY_GRAVITY.ahk" { DISPLAY_GRAVITY }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDisplayPointer extends IUnknown {
    /**
     * The interface identifier for IDisplayPointer
     * @type {Guid}
     */
    static IID := Guid("{3050f69e-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDisplayPointer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveToPoint           : IntPtr
        MoveUnit              : IntPtr
        PositionMarkupPointer : IntPtr
        MoveToPointer         : IntPtr
        SetPointerGravity     : IntPtr
        GetPointerGravity     : IntPtr
        SetDisplayGravity     : IntPtr
        GetDisplayGravity     : IntPtr
        IsPositioned          : IntPtr
        Unposition            : IntPtr
        IsEqualTo             : IntPtr
        IsLeftOf              : IntPtr
        IsRightOf             : IntPtr
        IsAtBOL               : IntPtr
        MoveToMarkupPointer   : IntPtr
        ScrollIntoView        : IntPtr
        GetLineInfo           : IntPtr
        GetFlowElement        : IntPtr
        QueryBreaks           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDisplayPointer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {POINT} ptPoint 
     * @param {COORD_SYSTEM} eCoordSystem 
     * @param {IHTMLElement} pElementContext 
     * @param {Integer} dwHitTestOptions 
     * @returns {Integer} 
     */
    MoveToPoint(ptPoint, eCoordSystem, pElementContext, dwHitTestOptions) {
        result := ComCall(3, this, POINT, ptPoint, COORD_SYSTEM, eCoordSystem, "ptr", pElementContext, "uint", dwHitTestOptions, "uint*", &pdwHitTestResults := 0, "HRESULT")
        return pdwHitTestResults
    }

    /**
     * 
     * @param {DISPLAY_MOVEUNIT} eMoveUnit 
     * @param {Integer} lXPos 
     * @returns {HRESULT} 
     */
    MoveUnit(eMoveUnit, lXPos) {
        result := ComCall(4, this, DISPLAY_MOVEUNIT, eMoveUnit, "int", lXPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pMarkupPointer 
     * @returns {HRESULT} 
     */
    PositionMarkupPointer(pMarkupPointer) {
        result := ComCall(5, this, "ptr", pMarkupPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pDispPointer) {
        result := ComCall(6, this, "ptr", pDispPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINTER_GRAVITY} eGravity 
     * @returns {HRESULT} 
     */
    SetPointerGravity(eGravity) {
        result := ComCall(7, this, POINTER_GRAVITY, eGravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {POINTER_GRAVITY} 
     */
    GetPointerGravity() {
        result := ComCall(8, this, "int*", &peGravity := 0, "HRESULT")
        return peGravity
    }

    /**
     * 
     * @param {DISPLAY_GRAVITY} eGravity 
     * @returns {HRESULT} 
     */
    SetDisplayGravity(eGravity) {
        result := ComCall(9, this, DISPLAY_GRAVITY, eGravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DISPLAY_GRAVITY} 
     */
    GetDisplayGravity() {
        result := ComCall(10, this, "int*", &peGravity := 0, "HRESULT")
        return peGravity
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPositioned() {
        result := ComCall(11, this, BOOL.Ptr, &pfPositioned := 0, "HRESULT")
        return pfPositioned
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsEqualTo(pDispPointer) {
        result := ComCall(13, this, "ptr", pDispPointer, BOOL.Ptr, &pfIsEqual := 0, "HRESULT")
        return pfIsEqual
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsLeftOf(pDispPointer) {
        result := ComCall(14, this, "ptr", pDispPointer, BOOL.Ptr, &pfIsLeftOf := 0, "HRESULT")
        return pfIsLeftOf
    }

    /**
     * 
     * @param {IDisplayPointer} pDispPointer 
     * @returns {BOOL} 
     */
    IsRightOf(pDispPointer) {
        result := ComCall(15, this, "ptr", pDispPointer, BOOL.Ptr, &pfIsRightOf := 0, "HRESULT")
        return pfIsRightOf
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAtBOL() {
        result := ComCall(16, this, BOOL.Ptr, &pfBOL := 0, "HRESULT")
        return pfBOL
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @param {IDisplayPointer} pDispLineContext 
     * @returns {HRESULT} 
     */
    MoveToMarkupPointer(pPointer, pDispLineContext) {
        result := ComCall(17, this, "ptr", pPointer, "ptr", pDispLineContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ScrollIntoView() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ILineInfo} 
     */
    GetLineInfo() {
        result := ComCall(19, this, "ptr*", &ppLineInfo := 0, "HRESULT")
        return ILineInfo(ppLineInfo)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetFlowElement() {
        result := ComCall(20, this, "ptr*", &ppLayoutElement := 0, "HRESULT")
        return IHTMLElement(ppLayoutElement)
    }

    /**
     * 
     * @returns {Integer} 
     */
    QueryBreaks() {
        result := ComCall(21, this, "uint*", &pdwBreaks := 0, "HRESULT")
        return pdwBreaks
    }

    Query(iid) {
        if (IDisplayPointer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveToPoint := CallbackCreate(GetMethod(implObj, "MoveToPoint"), flags, 6)
        this.vtbl.MoveUnit := CallbackCreate(GetMethod(implObj, "MoveUnit"), flags, 3)
        this.vtbl.PositionMarkupPointer := CallbackCreate(GetMethod(implObj, "PositionMarkupPointer"), flags, 2)
        this.vtbl.MoveToPointer := CallbackCreate(GetMethod(implObj, "MoveToPointer"), flags, 2)
        this.vtbl.SetPointerGravity := CallbackCreate(GetMethod(implObj, "SetPointerGravity"), flags, 2)
        this.vtbl.GetPointerGravity := CallbackCreate(GetMethod(implObj, "GetPointerGravity"), flags, 2)
        this.vtbl.SetDisplayGravity := CallbackCreate(GetMethod(implObj, "SetDisplayGravity"), flags, 2)
        this.vtbl.GetDisplayGravity := CallbackCreate(GetMethod(implObj, "GetDisplayGravity"), flags, 2)
        this.vtbl.IsPositioned := CallbackCreate(GetMethod(implObj, "IsPositioned"), flags, 2)
        this.vtbl.Unposition := CallbackCreate(GetMethod(implObj, "Unposition"), flags, 1)
        this.vtbl.IsEqualTo := CallbackCreate(GetMethod(implObj, "IsEqualTo"), flags, 3)
        this.vtbl.IsLeftOf := CallbackCreate(GetMethod(implObj, "IsLeftOf"), flags, 3)
        this.vtbl.IsRightOf := CallbackCreate(GetMethod(implObj, "IsRightOf"), flags, 3)
        this.vtbl.IsAtBOL := CallbackCreate(GetMethod(implObj, "IsAtBOL"), flags, 2)
        this.vtbl.MoveToMarkupPointer := CallbackCreate(GetMethod(implObj, "MoveToMarkupPointer"), flags, 3)
        this.vtbl.ScrollIntoView := CallbackCreate(GetMethod(implObj, "ScrollIntoView"), flags, 1)
        this.vtbl.GetLineInfo := CallbackCreate(GetMethod(implObj, "GetLineInfo"), flags, 2)
        this.vtbl.GetFlowElement := CallbackCreate(GetMethod(implObj, "GetFlowElement"), flags, 2)
        this.vtbl.QueryBreaks := CallbackCreate(GetMethod(implObj, "QueryBreaks"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveToPoint)
        CallbackFree(this.vtbl.MoveUnit)
        CallbackFree(this.vtbl.PositionMarkupPointer)
        CallbackFree(this.vtbl.MoveToPointer)
        CallbackFree(this.vtbl.SetPointerGravity)
        CallbackFree(this.vtbl.GetPointerGravity)
        CallbackFree(this.vtbl.SetDisplayGravity)
        CallbackFree(this.vtbl.GetDisplayGravity)
        CallbackFree(this.vtbl.IsPositioned)
        CallbackFree(this.vtbl.Unposition)
        CallbackFree(this.vtbl.IsEqualTo)
        CallbackFree(this.vtbl.IsLeftOf)
        CallbackFree(this.vtbl.IsRightOf)
        CallbackFree(this.vtbl.IsAtBOL)
        CallbackFree(this.vtbl.MoveToMarkupPointer)
        CallbackFree(this.vtbl.ScrollIntoView)
        CallbackFree(this.vtbl.GetLineInfo)
        CallbackFree(this.vtbl.GetFlowElement)
        CallbackFree(this.vtbl.QueryBreaks)
    }
}
