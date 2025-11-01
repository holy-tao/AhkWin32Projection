#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<HRESULT>} phrSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-requesteditsession
     */
    RequestEditSession(tid, pes, dwFlags, phrSession) {
        result := ComCall(3, this, "uint", tid, "ptr", pes, "uint", dwFlags, "ptr", phrSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<BOOL>} pfWriteSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-inwritesession
     */
    InWriteSession(tid, pfWriteSession) {
        result := ComCall(4, this, "uint", tid, "ptr", pfWriteSession, "HRESULT")
        return result
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
        result := ComCall(5, this, "uint", ec, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, "uint*", pcFetched, "HRESULT")
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
     * @param {Pointer<ITfRange>} ppStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstart
     */
    GetStart(ec, ppStart) {
        result := ComCall(7, this, "uint", ec, "ptr*", ppStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} ppEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getend
     */
    GetEnd(ec, ppEnd) {
        result := ComCall(8, this, "uint", ec, "ptr*", ppEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfContextView>} ppView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getactiveview
     */
    GetActiveView(ppView) {
        result := ComCall(9, this, "ptr*", ppView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfContextViews>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumViews(ppEnum) {
        result := ComCall(10, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getstatus
     */
    GetStatus(pdcs) {
        result := ComCall(11, this, "ptr", pdcs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfProperty>} ppProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getproperty
     */
    GetProperty(guidProp, ppProp) {
        result := ComCall(12, this, "ptr", guidProp, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfReadOnlyProperty>} ppProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getappproperty
     */
    GetAppProperty(guidProp, ppProp) {
        result := ComCall(13, this, "ptr", guidProp, "ptr*", ppProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} prgProp 
     * @param {Integer} cProp 
     * @param {Pointer<Pointer<Guid>>} prgAppProp 
     * @param {Integer} cAppProp 
     * @param {Pointer<ITfReadOnlyProperty>} ppProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-trackproperties
     */
    TrackProperties(prgProp, cProp, prgAppProp, cAppProp, ppProperty) {
        result := ComCall(14, this, "ptr*", prgProp, "uint", cProp, "ptr*", prgAppProp, "uint", cAppProp, "ptr*", ppProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfProperties>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-enumproperties
     */
    EnumProperties(ppEnum) {
        result := ComCall(15, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppDm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-getdocumentmgr
     */
    GetDocumentMgr(ppDm) {
        result := ComCall(16, this, "ptr*", ppDm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Pointer<ITfRangeBackup>} ppBackup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontext-createrangebackup
     */
    CreateRangeBackup(ec, pRange, ppBackup) {
        result := ComCall(17, this, "uint", ec, "ptr", pRange, "ptr*", ppBackup, "HRESULT")
        return result
    }
}
