#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLDocument2.ahk
#Include .\IMarkupContainer.ahk
#Include .\IHTMLElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupPointer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupPointer
     * @type {Guid}
     */
    static IID => Guid("{3050f49f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OwningDoc", "Gravity", "SetGravity", "Cling", "SetCling", "Unposition", "IsPositioned", "GetContainer", "MoveAdjacentToElement", "MoveToPointer", "MoveToContainer", "Left", "Right", "CurrentScope", "IsLeftOf", "IsLeftOfOrEqualTo", "IsRightOf", "IsRightOfOrEqualTo", "IsEqualTo", "MoveUnit", "FindText"]

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
     * @returns {Integer} 
     */
    Gravity() {
        result := ComCall(4, this, "int*", &pGravity := 0, "HRESULT")
        return pGravity
    }

    /**
     * 
     * @param {Integer} Gravity 
     * @returns {HRESULT} 
     */
    SetGravity(Gravity) {
        result := ComCall(5, this, "int", Gravity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    Cling() {
        result := ComCall(6, this, "int*", &pfCling := 0, "HRESULT")
        return pfCling
    }

    /**
     * 
     * @param {BOOL} fCLing 
     * @returns {HRESULT} 
     */
    SetCling(fCLing) {
        result := ComCall(7, this, "int", fCLing, "HRESULT")
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
        result := ComCall(9, this, "int*", &pfPositioned := 0, "HRESULT")
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
     * @param {Integer} eAdj 
     * @returns {HRESULT} 
     */
    MoveAdjacentToElement(pElement, eAdj) {
        result := ComCall(11, this, "ptr", pElement, "int", eAdj, "HRESULT")
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
        result := ComCall(13, this, "ptr", pContainer, "int", fAtStart, "HRESULT")
        return result
    }

    /**
     * If the LeftUnit property is set, the unit is placed to the left of the number instead of the typical right side.
     * @param {BOOL} fMove 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Msi/leftunit
     */
    Left(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, "int", fMove, pContextMarshal, pContext, "ptr*", ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMove 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IHTMLElement>} ppElement 
     * @param {Pointer<Integer>} pcch 
     * @param {PWSTR} pchText 
     * @returns {HRESULT} 
     */
    Right(fMove, pContext, ppElement, pcch, pchText) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, "int", fMove, pContextMarshal, pContext, "ptr*", ppElement, pcchMarshal, pcch, "ptr", pchText, "HRESULT")
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
        result := ComCall(17, this, "ptr", pPointerThat, "int*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsLeftOfOrEqualTo(pPointerThat) {
        result := ComCall(18, this, "ptr", pPointerThat, "int*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsRightOf(pPointerThat) {
        result := ComCall(19, this, "ptr", pPointerThat, "int*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsRightOfOrEqualTo(pPointerThat) {
        result := ComCall(20, this, "ptr", pPointerThat, "int*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerThat 
     * @returns {BOOL} 
     */
    IsEqualTo(pPointerThat) {
        result := ComCall(21, this, "ptr", pPointerThat, "int*", &pfAreEqual := 0, "HRESULT")
        return pfAreEqual
    }

    /**
     * 
     * @param {Integer} muAction 
     * @returns {HRESULT} 
     */
    MoveUnit(muAction) {
        result := ComCall(22, this, "int", muAction, "HRESULT")
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
}
