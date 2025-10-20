#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadMgr2 defines the primary object implemented by the TSF manager. ITfThreadMgr2 is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgr2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgr2 extends IUnknown{
    /**
     * The interface identifier for ITfThreadMgr2
     * @type {Guid}
     */
    static IID => Guid("{0ab198ef-6477-4ee8-8812-6780edb82d5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} ptid 
     * @returns {HRESULT} 
     */
    Activate(ptid) {
        result := ComCall(3, this, "uint*", ptid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deactivate() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfDocumentMgr>} ppdim 
     * @returns {HRESULT} 
     */
    CreateDocumentMgr(ppdim) {
        result := ComCall(5, this, "ptr", ppdim, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfDocumentMgrs>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumDocumentMgrs(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @param {Pointer<ITfDocumentMgr>} ppdimFocus 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     */
    GetFocus(ppdimFocus) {
        result := ComCall(7, this, "ptr", ppdimFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @param {Pointer<ITfDocumentMgr>} pdimFocus 
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus(pdimFocus) {
        result := ComCall(8, this, "ptr", pdimFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfThreadFocus 
     * @returns {HRESULT} 
     */
    IsThreadFocus(pfThreadFocus) {
        result := ComCall(9, this, "ptr", pfThreadFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<ITfFunctionProvider>} ppFuncProv 
     * @returns {HRESULT} 
     */
    GetFunctionProvider(clsid, ppFuncProv) {
        result := ComCall(10, this, "ptr", clsid, "ptr", ppFuncProv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfFunctionProviders>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumFunctionProviders(ppEnum) {
        result := ComCall(11, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfCompartmentMgr>} ppCompMgr 
     * @returns {HRESULT} 
     */
    GetGlobalCompartment(ppCompMgr) {
        result := ComCall(12, this, "ptr", ppCompMgr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ptid 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    ActivateEx(ptid, dwFlags) {
        result := ComCall(13, this, "uint*", ptid, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwFlags 
     * @returns {HRESULT} 
     */
    GetActiveFlags(lpdwFlags) {
        result := ComCall(14, this, "uint*", lpdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendKeystrokeHandling() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeKeystrokeHandling() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
