#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import ".\MOVEUNIT_ACTION.ahk" { MOVEUNIT_ACTION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MARKUP_CONTEXT_TYPE.ahk" { MARKUP_CONTEXT_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\POINTER_GRAVITY.ahk" { POINTER_GRAVITY }
#Import ".\ELEMENT_ADJACENCY.ahk" { ELEMENT_ADJACENCY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IMarkupContainer.ahk" { IMarkupContainer }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupPointer extends IUnknown {
    /**
     * The interface identifier for IMarkupPointer
     * @type {Guid}
     */
    static IID := Guid("{3050f49f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupPointer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OwningDoc             : IntPtr
        Gravity               : IntPtr
        SetGravity            : IntPtr
        Cling                 : IntPtr
        SetCling              : IntPtr
        Unposition            : IntPtr
        IsPositioned          : IntPtr
        GetContainer          : IntPtr
        MoveAdjacentToElement : IntPtr
        MoveToPointer         : IntPtr
        MoveToContainer       : IntPtr
        Left                  : IntPtr
        Right                 : IntPtr
        CurrentScope          : IntPtr
        IsLeftOf              : IntPtr
        IsLeftOfOrEqualTo     : IntPtr
        IsRightOf             : IntPtr
        IsRightOfOrEqualTo    : IntPtr
        IsEqualTo             : IntPtr
        MoveUnit              : IntPtr
        FindText              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupPointer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLDocument2} 
     */
    OwningDoc() {
        result := ComCall(3, this, "ptr*", &ppDoc := 0, "HRESULT")
        return IHTMLDocument2(ppDoc)
    }

    /**
     * 
     * @returns {POINTER_GRAVITY} 
     */
    Gravity() {
        result := ComCall(4, this, "int*", &pGravity := 0, "HRESULT")
        return pGravity
    }

    /**
     * 
     * @param {POINTER_GRAVITY} Gravity 
     * @returns {HRESULT} 
     */
    SetGravity(Gravity) {
        result := ComCall(5, this, POINTER_GRAVITY, Gravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    Cling() {
        result := ComCall(6, this, BOOL.Ptr, &pfCling := 0, "HRESULT")
        return pfCling
    }

    /**
     * 
     * @param {BOOL} fCLing 
     * @returns {HRESULT} 
     */
    SetCling(fCLing) {
        result := ComCall(7, this, BOOL, fCLing, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unposition() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPositioned() {
        result := ComCall(9, this, BOOL.Ptr, &pfPositioned := 0, "HRESULT")
        return pfPositioned
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    GetContainer() {
        result := ComCall(10, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IMarkupContainer(ppContainer)
    }

    /**
     * 
     * @param {IHTMLElement} pElement 
     * @param {ELEMENT_ADJACENCY} eAdj 
     * @returns {HRESULT} 
     */
    MoveAdjacentToElement(pElement, eAdj) {
        result := ComCall(11, this, "ptr", pElement, ELEMENT_ADJACENCY, eAdj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointer 
     * @returns {HRESULT} 
     */
    MoveToPointer(pPointer) {
        result := ComCall(12, this, "ptr", pPointer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupContainer} pContainer 
     * @param {BOOL} fAtStart 
     * @returns {HRESULT} 
     */
    MoveToContainer(pContainer, fAtStart) {
        result := ComCall(13, this, "ptr", pContainer, BOOL, fAtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<MARKUP_CONTEXT_TYPE>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Left(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, BOOL, fMove, pContextMarshal, pContext, IHTMLElement.Ptr, ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<MARKUP_CONTEXT_TYPE>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Right(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, BOOL, fMove, pContextMarshal, pContext, IHTMLElement.Ptr, ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    CurrentScope() {
        result := ComCall(16, this, "ptr*", &ppElemCurrent := 0, "HRESULT")
        return IHTMLElement(ppElemCurrent)
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsLeftOf(pPointerThat) {
        result := ComCall(17, this, "ptr", pPointerThat, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsLeftOfOrEqualTo(pPointerThat) {
        result := ComCall(18, this, "ptr", pPointerThat, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsRightOf(pPointerThat) {
        result := ComCall(19, this, "ptr", pPointerThat, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsRightOfOrEqualTo(pPointerThat) {
        result := ComCall(20, this, "ptr", pPointerThat, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsEqualTo(pPointerThat) {
        result := ComCall(21, this, "ptr", pPointerThat, BOOL.Ptr, &pfAreEqual := 0, "HRESULT")
        return pfAreEqual
    }

    /**
     * 
     * @param {MOVEUNIT_ACTION} muAction 
     * @returns {HRESULT} 
     */
    MoveUnit(muAction) {
        result := ComCall(22, this, MOVEUNIT_ACTION, muAction, "HRESULT")
        return result
    }

    /**
     * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document. (ANSI)
     * @remarks
     * The <b>FindText</b> function does not perform a search operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
     * 
     * Before calling <b>FindText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b> button, or when the dialog box is closing. The  <i>lParam</i> parameter of the <b>FINDMSGSTRING</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
     * 
     * If you create a <b>Find</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. <b>IsDialogMessage</b> returns a value that indicates whether the <b>Find</b> dialog box processed the message.
     * 
     * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Find</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
     * @param {PWSTR} pchFindText 
     * @param {Integer} dwFlags 
     * @param {IMarkupPointer} pIEndMatch 
     * @param {IMarkupPointer} pIEndSearch 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
     * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-findtexta
     */
    FindText(pchFindText, dwFlags, pIEndMatch, pIEndSearch) {
        pchFindText := pchFindText is String ? StrPtr(pchFindText) : pchFindText

        result := ComCall(23, this, "ptr", pchFindText, "uint", dwFlags, "ptr", pIEndMatch, "ptr", pIEndSearch, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMarkupPointer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OwningDoc := CallbackCreate(GetMethod(implObj, "OwningDoc"), flags, 2)
        this.vtbl.Gravity := CallbackCreate(GetMethod(implObj, "Gravity"), flags, 2)
        this.vtbl.SetGravity := CallbackCreate(GetMethod(implObj, "SetGravity"), flags, 2)
        this.vtbl.Cling := CallbackCreate(GetMethod(implObj, "Cling"), flags, 2)
        this.vtbl.SetCling := CallbackCreate(GetMethod(implObj, "SetCling"), flags, 2)
        this.vtbl.Unposition := CallbackCreate(GetMethod(implObj, "Unposition"), flags, 1)
        this.vtbl.IsPositioned := CallbackCreate(GetMethod(implObj, "IsPositioned"), flags, 2)
        this.vtbl.GetContainer := CallbackCreate(GetMethod(implObj, "GetContainer"), flags, 2)
        this.vtbl.MoveAdjacentToElement := CallbackCreate(GetMethod(implObj, "MoveAdjacentToElement"), flags, 3)
        this.vtbl.MoveToPointer := CallbackCreate(GetMethod(implObj, "MoveToPointer"), flags, 2)
        this.vtbl.MoveToContainer := CallbackCreate(GetMethod(implObj, "MoveToContainer"), flags, 3)
        this.vtbl.Left := CallbackCreate(GetMethod(implObj, "Left"), flags, 6)
        this.vtbl.Right := CallbackCreate(GetMethod(implObj, "Right"), flags, 6)
        this.vtbl.CurrentScope := CallbackCreate(GetMethod(implObj, "CurrentScope"), flags, 2)
        this.vtbl.IsLeftOf := CallbackCreate(GetMethod(implObj, "IsLeftOf"), flags, 3)
        this.vtbl.IsLeftOfOrEqualTo := CallbackCreate(GetMethod(implObj, "IsLeftOfOrEqualTo"), flags, 3)
        this.vtbl.IsRightOf := CallbackCreate(GetMethod(implObj, "IsRightOf"), flags, 3)
        this.vtbl.IsRightOfOrEqualTo := CallbackCreate(GetMethod(implObj, "IsRightOfOrEqualTo"), flags, 3)
        this.vtbl.IsEqualTo := CallbackCreate(GetMethod(implObj, "IsEqualTo"), flags, 3)
        this.vtbl.MoveUnit := CallbackCreate(GetMethod(implObj, "MoveUnit"), flags, 2)
        this.vtbl.FindText := CallbackCreate(GetMethod(implObj, "FindText"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OwningDoc)
        CallbackFree(this.vtbl.Gravity)
        CallbackFree(this.vtbl.SetGravity)
        CallbackFree(this.vtbl.Cling)
        CallbackFree(this.vtbl.SetCling)
        CallbackFree(this.vtbl.Unposition)
        CallbackFree(this.vtbl.IsPositioned)
        CallbackFree(this.vtbl.GetContainer)
        CallbackFree(this.vtbl.MoveAdjacentToElement)
        CallbackFree(this.vtbl.MoveToPointer)
        CallbackFree(this.vtbl.MoveToContainer)
        CallbackFree(this.vtbl.Left)
        CallbackFree(this.vtbl.Right)
        CallbackFree(this.vtbl.CurrentScope)
        CallbackFree(this.vtbl.IsLeftOf)
        CallbackFree(this.vtbl.IsLeftOfOrEqualTo)
        CallbackFree(this.vtbl.IsRightOf)
        CallbackFree(this.vtbl.IsRightOfOrEqualTo)
        CallbackFree(this.vtbl.IsEqualTo)
        CallbackFree(this.vtbl.MoveUnit)
        CallbackFree(this.vtbl.FindText)
    }
}
