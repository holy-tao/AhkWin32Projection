#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSearchBand extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSearchBand
     * @type {Guid}
     */
    static IID => Guid("{2d91eea1-9932-11d2-be86-00a0c9a83da1}")

    /**
     * The class identifier for FileSearchBand
     * @type {Guid}
     */
    static CLSID => Guid("{c4ee31f3-4768-11d2-be5c-00a0c9a83da1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFocus", "SetSearchParameters", "get_SearchID", "get_Scope", "get_QueryFile"]

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchID 
     * @param {VARIANT_BOOL} bNavToResults 
     * @param {Pointer<VARIANT>} pvarScope 
     * @param {Pointer<VARIANT>} pvarQueryFile 
     * @returns {HRESULT} 
     */
    SetSearchParameters(pbstrSearchID, bNavToResults, pvarScope, pvarQueryFile) {
        result := ComCall(8, this, "ptr", pbstrSearchID, "short", bNavToResults, "ptr", pvarScope, "ptr", pvarQueryFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSearchID 
     * @returns {HRESULT} 
     */
    get_SearchID(pbstrSearchID) {
        result := ComCall(9, this, "ptr", pbstrSearchID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarScope 
     * @returns {HRESULT} 
     */
    get_Scope(pvarScope) {
        result := ComCall(10, this, "ptr", pvarScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarFile 
     * @returns {HRESULT} 
     */
    get_QueryFile(pvarFile) {
        result := ComCall(11, this, "ptr", pvarFile, "HRESULT")
        return result
    }
}
