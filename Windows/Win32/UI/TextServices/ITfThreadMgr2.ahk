#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfDocumentMgr.ahk
#Include .\IEnumTfDocumentMgrs.ahk
#Include .\ITfFunctionProvider.ahk
#Include .\IEnumTfFunctionProviders.ahk
#Include .\ITfCompartmentMgr.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadMgr2 defines the primary object implemented by the TSF manager. ITfThreadMgr2 is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgr2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgr2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CreateDocumentMgr", "EnumDocumentMgrs", "GetFocus", "SetFocus", "IsThreadFocus", "GetFunctionProvider", "EnumFunctionProviders", "GetGlobalCompartment", "ActivateEx", "GetActiveFlags", "SuspendKeystrokeHandling", "ResumeKeystrokeHandling"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-activate
     */
    Activate() {
        result := ComCall(3, this, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITfDocumentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-createdocumentmgr
     */
    CreateDocumentMgr() {
        result := ComCall(5, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * 
     * @returns {IEnumTfDocumentMgrs} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-enumdocumentmgrs
     */
    EnumDocumentMgrs() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDocumentMgrs(ppEnum)
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @returns {ITfDocumentMgr} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     */
    GetFocus() {
        result := ComCall(7, this, "ptr*", &ppdimFocus := 0, "HRESULT")
        return ITfDocumentMgr(ppdimFocus)
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @param {ITfDocumentMgr} pdimFocus 
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus(pdimFocus) {
        result := ComCall(8, this, "ptr", pdimFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-isthreadfocus
     */
    IsThreadFocus() {
        result := ComCall(9, this, "int*", &pfThreadFocus := 0, "HRESULT")
        return pfThreadFocus
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {ITfFunctionProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getfunctionprovider
     */
    GetFunctionProvider(clsid) {
        result := ComCall(10, this, "ptr", clsid, "ptr*", &ppFuncProv := 0, "HRESULT")
        return ITfFunctionProvider(ppFuncProv)
    }

    /**
     * 
     * @returns {IEnumTfFunctionProviders} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-enumfunctionproviders
     */
    EnumFunctionProviders() {
        result := ComCall(11, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfFunctionProviders(ppEnum)
    }

    /**
     * 
     * @returns {ITfCompartmentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getglobalcompartment
     */
    GetGlobalCompartment() {
        result := ComCall(12, this, "ptr*", &ppCompMgr := 0, "HRESULT")
        return ITfCompartmentMgr(ppCompMgr)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-activateex
     */
    ActivateEx(dwFlags) {
        result := ComCall(13, this, "uint*", &ptid := 0, "uint", dwFlags, "HRESULT")
        return ptid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getactiveflags
     */
    GetActiveFlags() {
        result := ComCall(14, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-suspendkeystrokehandling
     */
    SuspendKeystrokeHandling() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-resumekeystrokehandling
     */
    ResumeKeystrokeHandling() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
