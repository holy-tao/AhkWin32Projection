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
 * The ITfThreadMgr defines the primary object implemented by the TSF manager. ITfThreadMgr is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @remarks
 * 
 * An application obtains a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with CLSID_TF_ThreadMgr as demonstrated below.
 * 
 * A text service receives a pointer to this interface in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfThreadMgr
     * @type {Guid}
     */
    static IID => Guid("{aa80e801-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CreateDocumentMgr", "EnumDocumentMgrs", "GetFocus", "SetFocus", "AssociateFocus", "IsThreadFocus", "GetFunctionProvider", "EnumFunctionProviders", "GetGlobalCompartment"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-activate
     */
    Activate() {
        result := ComCall(3, this, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITfDocumentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-createdocumentmgr
     */
    CreateDocumentMgr() {
        result := ComCall(5, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * 
     * @returns {IEnumTfDocumentMgrs} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-enumdocumentmgrs
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
     * @param {HWND} hwnd 
     * @param {ITfDocumentMgr} pdimNew 
     * @returns {ITfDocumentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-associatefocus
     */
    AssociateFocus(hwnd, pdimNew) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "ptr", pdimNew, "ptr*", &ppdimPrev := 0, "HRESULT")
        return ITfDocumentMgr(ppdimPrev)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-isthreadfocus
     */
    IsThreadFocus() {
        result := ComCall(10, this, "int*", &pfThreadFocus := 0, "HRESULT")
        return pfThreadFocus
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {ITfFunctionProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-getfunctionprovider
     */
    GetFunctionProvider(clsid) {
        result := ComCall(11, this, "ptr", clsid, "ptr*", &ppFuncProv := 0, "HRESULT")
        return ITfFunctionProvider(ppFuncProv)
    }

    /**
     * 
     * @returns {IEnumTfFunctionProviders} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-enumfunctionproviders
     */
    EnumFunctionProviders() {
        result := ComCall(12, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfFunctionProviders(ppEnum)
    }

    /**
     * 
     * @returns {ITfCompartmentMgr} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-getglobalcompartment
     */
    GetGlobalCompartment() {
        result := ComCall(13, this, "ptr*", &ppCompMgr := 0, "HRESULT")
        return ITfCompartmentMgr(ppCompMgr)
    }
}
