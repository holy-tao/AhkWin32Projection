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
     * 
     * @param {Integer} tid 
     * @param {Pointer<ITfEditSession>} pes 
     * @param {Integer} dwFlags 
     * @param {Pointer<HRESULT>} phrSession 
     * @returns {HRESULT} 
     */
    RequestEditSession(tid, pes, dwFlags, phrSession) {
        result := ComCall(3, this, "uint", tid, "ptr", pes, "uint", dwFlags, "ptr", phrSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<BOOL>} pfWriteSession 
     * @returns {HRESULT} 
     */
    InWriteSession(tid, pfWriteSession) {
        result := ComCall(4, this, "uint", tid, "ptr", pfWriteSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} ulIndex 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_SELECTION>} pSelection 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    GetSelection(ec, ulIndex, ulCount, pSelection, pcFetched) {
        result := ComCall(5, this, "uint", ec, "uint", ulIndex, "uint", ulCount, "ptr", pSelection, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_SELECTION>} pSelection 
     * @returns {HRESULT} 
     */
    SetSelection(ec, ulCount, pSelection) {
        result := ComCall(6, this, "uint", ec, "uint", ulCount, "ptr", pSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} ppStart 
     * @returns {HRESULT} 
     */
    GetStart(ec, ppStart) {
        result := ComCall(7, this, "uint", ec, "ptr", ppStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} ppEnd 
     * @returns {HRESULT} 
     */
    GetEnd(ec, ppEnd) {
        result := ComCall(8, this, "uint", ec, "ptr", ppEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContextView>} ppView 
     * @returns {HRESULT} 
     */
    GetActiveView(ppView) {
        result := ComCall(9, this, "ptr", ppView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfContextViews>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumViews(ppEnum) {
        result := ComCall(10, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     */
    GetStatus(pdcs) {
        result := ComCall(11, this, "ptr", pdcs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfProperty>} ppProp 
     * @returns {HRESULT} 
     */
    GetProperty(guidProp, ppProp) {
        result := ComCall(12, this, "ptr", guidProp, "ptr", ppProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfReadOnlyProperty>} ppProp 
     * @returns {HRESULT} 
     */
    GetAppProperty(guidProp, ppProp) {
        result := ComCall(13, this, "ptr", guidProp, "ptr", ppProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} prgProp 
     * @param {Integer} cProp 
     * @param {Pointer<Guid>} prgAppProp 
     * @param {Integer} cAppProp 
     * @param {Pointer<ITfReadOnlyProperty>} ppProperty 
     * @returns {HRESULT} 
     */
    TrackProperties(prgProp, cProp, prgAppProp, cAppProp, ppProperty) {
        result := ComCall(14, this, "ptr", prgProp, "uint", cProp, "ptr", prgAppProp, "uint", cAppProp, "ptr", ppProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfProperties>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumProperties(ppEnum) {
        result := ComCall(15, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppDm 
     * @returns {HRESULT} 
     */
    GetDocumentMgr(ppDm) {
        result := ComCall(16, this, "ptr", ppDm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Pointer<ITfRangeBackup>} ppBackup 
     * @returns {HRESULT} 
     */
    CreateRangeBackup(ec, pRange, ppBackup) {
        result := ComCall(17, this, "uint", ec, "ptr", pRange, "ptr", ppBackup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
