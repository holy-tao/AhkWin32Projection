#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods and properties on the root element in a fragment.
 * @remarks
 * 
  * This interface is implemented by a root element within a framework; for example, a list box within a window. 
  * 			Other elements in the same fragment, such as list items, implement the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementproviderfragmentroot
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderFragmentRoot extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderFragmentRoot
     * @type {Guid}
     */
    static IID => Guid("{620ce2a5-ab8f-40a9-86cb-de3c75599b58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ElementProviderFromPoint", "GetFocus"]

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<IRawElementProviderFragment>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderfragmentroot-elementproviderfrompoint
     */
    ElementProviderFromPoint(x, y, pRetVal) {
        result := ComCall(3, this, "double", x, "double", y, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @param {Pointer<IRawElementProviderFragment>} pRetVal 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     */
    GetFocus(pRetVal) {
        result := ComCall(4, this, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
