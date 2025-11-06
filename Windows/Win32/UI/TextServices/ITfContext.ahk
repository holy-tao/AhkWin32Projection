#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfRange.ahk
#Include .\ITfContextView.ahk
#Include .\IEnumTfContextViews.ahk
#Include .\TS_STATUS.ahk
#Include .\ITfProperty.ahk
#Include .\ITfReadOnlyProperty.ahk
#Include .\IEnumTfProperties.ahk
#Include .\ITfDocumentMgr.ahk
#Include .\ITfRangeBackup.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContext interface is implemented by the TSF manager and used by applications and text services to access an edit context.
 * @remarks
 * 
  * An edit context object is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfdocumentmgr-createcontext">ITfDocumentMgr::CreateContext</a>. Often, a text service uses the currently active edit context. The currently active edit context is the edit context at the top of the stack of the active document manager.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontext
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContext
     * @type {Guid}
     */
    static IID => Guid("{aa80e7fd-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestEditSession", "InWriteSession", "GetSelection", "SetSelection", "GetStart", "GetEnd", "GetActiveView", "EnumViews", "GetStatus", "GetProperty", "GetAppProperty", "TrackProperties", "EnumProperties", "GetDocumentMgr", "CreateRangeBackup"]

    /**
     * 
     * @param {Integer} tid 
     * @param {ITfEditSession} pes 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-requesteditsession
     */
    RequestEditSession(tid, pes, dwFlags) {
        result := ComCall(3, this, "uint", tid, "ptr", pes, "uint", dwFlags, "int*", &phrSession := 0, "HRESULT")
        return phrSession
    }

    /**
     * 
     * @param {Integer} tid 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-inwritesession
     */
    InWriteSession(tid) {
        result := ComCall(4, this, "uint", tid, "int*", &pfWriteSession := 0, "HRESULT")
        return pfWriteSession
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_SELECTION>} pSelection 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getselection
     */
    GetSelection(ec, ulIndex, ulCount, pSelection, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ec, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_SELECTION>} pSelection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-setselection
     */
    SetSelection(ec, ulCount, pSelection) {
        result := ComCall(6, this, "uint", ec, "uint", ulCount, "ptr", pSelection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstart
     */
    GetStart(ec) {
        result := ComCall(7, this, "uint", ec, "ptr*", &ppStart := 0, "HRESULT")
        return ITfRange(ppStart)
    }

    /**
     * 
     * @param {Integer} ec 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getend
     */
    GetEnd(ec) {
        result := ComCall(8, this, "uint", ec, "ptr*", &ppEnd := 0, "HRESULT")
        return ITfRange(ppEnd)
    }

    /**
     * 
     * @returns {ITfContextView} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getactiveview
     */
    GetActiveView() {
        result := ComCall(9, this, "ptr*", &ppView := 0, "HRESULT")
        return ITfContextView(ppView)
    }

    /**
     * 
     * @returns {IEnumTfContextViews} 
     */
    EnumViews() {
        result := ComCall(10, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfContextViews(ppEnum)
    }

    /**
     * 
     * @returns {TS_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstatus
     */
    GetStatus() {
        pdcs := TS_STATUS()
        result := ComCall(11, this, "ptr", pdcs, "HRESULT")
        return pdcs
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @returns {ITfProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getproperty
     */
    GetProperty(guidProp) {
        result := ComCall(12, this, "ptr", guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfProperty(ppProp)
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @returns {ITfReadOnlyProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getappproperty
     */
    GetAppProperty(guidProp) {
        result := ComCall(13, this, "ptr", guidProp, "ptr*", &ppProp := 0, "HRESULT")
        return ITfReadOnlyProperty(ppProp)
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} prgProp 
     * @param {Integer} cProp 
     * @param {Pointer<Pointer<Guid>>} prgAppProp 
     * @param {Integer} cAppProp 
     * @returns {ITfReadOnlyProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-trackproperties
     */
    TrackProperties(prgProp, cProp, prgAppProp, cAppProp) {
        prgPropMarshal := prgProp is VarRef ? "ptr*" : "ptr"
        prgAppPropMarshal := prgAppProp is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, prgPropMarshal, prgProp, "uint", cProp, prgAppPropMarshal, prgAppProp, "uint", cAppProp, "ptr*", &ppProperty := 0, "HRESULT")
        return ITfReadOnlyProperty(ppProperty)
    }

    /**
     * 
     * @returns {IEnumTfProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-enumproperties
     */
    EnumProperties() {
        result := ComCall(15, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfProperties(ppEnum)
    }

    /**
     * 
     * @returns {ITfDocumentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getdocumentmgr
     */
    GetDocumentMgr() {
        result := ComCall(16, this, "ptr*", &ppDm := 0, "HRESULT")
        return ITfDocumentMgr(ppDm)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @returns {ITfRangeBackup} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-createrangebackup
     */
    CreateRangeBackup(ec, pRange) {
        result := ComCall(17, this, "uint", ec, "ptr", pRange, "ptr*", &ppBackup := 0, "HRESULT")
        return ITfRangeBackup(ppBackup)
    }
}
