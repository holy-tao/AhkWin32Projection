#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccStore
     * @type {Guid}
     */
    static IID => Guid("{e2cd4a63-2b72-4d48-b739-95e4765195ba}")

    /**
     * The class identifier for AccStore
     * @type {Guid}
     */
    static CLSID => Guid("{5440837f-4bff-4ae5-a1b1-7722ecc6332a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister", "GetDocuments", "LookupByHWND", "LookupByPoint", "OnDocumentFocus", "GetFocused"]

    /**
     * The expert must implement the Register expert function. Network Monitor calls the Register expert function to obtain information about the expert.
     * @remarks
     * The **Version** member of the [**EXPERTENUMINFO**](expertenuminfo.md) structure must be zero.
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} If the function is successful, the return value is **TRUE**, and the function returns the requested information.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/register-expert
     */
    Register(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @remarks
     * You do not need to call this function before exiting. You need to remove the registration only if you choose to not recover data.
     * @param {IUnknown} punk 
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-unregisterapplicationrecoverycallback
     */
    Unregister(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    GetDocuments() {
        result := ComCall(5, this, "ptr*", &enumUnknown := 0, "HRESULT")
        return IEnumUnknown(enumUnknown)
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    LookupByHWND(_hWnd, riid) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(6, this, "ptr", _hWnd, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    LookupByPoint(pt, riid) {
        result := ComCall(7, this, "ptr", pt, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnDocumentFocus(punk) {
        result := ComCall(8, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetFocused(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
