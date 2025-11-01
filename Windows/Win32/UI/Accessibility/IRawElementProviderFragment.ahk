#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods and properties on UI elements that are part of a structure more than one level deep, such as a list box or list item. Implemented by Microsoft UI Automation provider.
 * @remarks
 * 
  * The root node of the fragment must also support the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot">IRawElementProviderFragmentRoot</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementproviderfragment
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderFragment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderFragment
     * @type {Guid}
     */
    static IID => Guid("{f7063da8-8359-439c-9297-bbc5299a7d87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Navigate", "GetRuntimeId", "get_BoundingRectangle", "GetEmbeddedFragmentRoots", "SetFocus", "get_FragmentRoot"]

    /**
     * 
     * @param {Integer} direction 
     * @param {Pointer<IRawElementProviderFragment>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-navigate
     */
    Navigate(direction, pRetVal) {
        result := ComCall(3, this, "int", direction, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getruntimeid
     */
    GetRuntimeId(pRetVal) {
        result := ComCall(4, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<UiaRect>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-get_boundingrectangle
     */
    get_BoundingRectangle(pRetVal) {
        result := ComCall(5, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-getembeddedfragmentroots
     */
    GetEmbeddedFragmentRoots(pRetVal) {
        result := ComCall(6, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

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
     * @param {Pointer<IRawElementProviderFragmentRoot>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragment-get_fragmentroot
     */
    get_FragmentRoot(pRetVal) {
        result := ComCall(8, this, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
