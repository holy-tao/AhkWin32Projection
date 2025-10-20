#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iresourcemanager
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IResourceManager extends IUnknown{
    /**
     * The interface identifier for IResourceManager
     * @type {Guid}
     */
    static IID => Guid("{56a868ac-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} cResource 
     * @param {Pointer<Int32>} plToken 
     * @returns {HRESULT} 
     */
    Register(pName, cResource, plToken) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(3, this, "ptr", pName, "int", cResource, "int*", plToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {Integer} cResource 
     * @param {Pointer<Int32>} palTokens 
     * @param {Pointer<Int32>} plToken 
     * @returns {HRESULT} 
     */
    RegisterGroup(pName, cResource, palTokens, plToken) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(4, this, "ptr", pName, "int", cResource, "int*", palTokens, "int*", plToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idResource 
     * @param {Pointer<IUnknown>} pFocusObject 
     * @param {Pointer<IResourceConsumer>} pConsumer 
     * @returns {HRESULT} 
     */
    RequestResource(idResource, pFocusObject, pConsumer) {
        result := ComCall(5, this, "int", idResource, "ptr", pFocusObject, "ptr", pConsumer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idResource 
     * @param {Pointer<IResourceConsumer>} pConsumer 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    NotifyAcquire(idResource, pConsumer, hr) {
        result := ComCall(6, this, "int", idResource, "ptr", pConsumer, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idResource 
     * @param {Pointer<IResourceConsumer>} pConsumer 
     * @param {BOOL} bStillWant 
     * @returns {HRESULT} 
     */
    NotifyRelease(idResource, pConsumer, bStillWant) {
        result := ComCall(7, this, "int", idResource, "ptr", pConsumer, "int", bStillWant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idResource 
     * @param {Pointer<IResourceConsumer>} pConsumer 
     * @returns {HRESULT} 
     */
    CancelRequest(idResource, pConsumer) {
        result := ComCall(8, this, "int", idResource, "ptr", pConsumer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @param {Pointer<IUnknown>} pFocusObject 
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus(pFocusObject) {
        result := ComCall(9, this, "ptr", pFocusObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pFocusObject 
     * @returns {HRESULT} 
     */
    ReleaseFocus(pFocusObject) {
        result := ComCall(10, this, "ptr", pFocusObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
