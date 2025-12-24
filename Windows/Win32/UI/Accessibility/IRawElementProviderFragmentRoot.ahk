#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderFragment.ahk
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
     * Retrieves the provider of the element that is at the specified point in this fragment.
     * @param {Float} x Type: <b>double</b>
     * 
     * The horizontal screen coordinate.
     * @param {Float} y Type: <b>double</b>
     * 
     * The vertical screen coordinate.
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives a pointer to the provider of the element at (x, y),	or <b>NULL</b> if none exists. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementproviderfragmentroot-elementproviderfrompoint
     */
    ElementProviderFromPoint(x, y) {
        result := ComCall(3, this, "double", x, "double", y, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragment(pRetVal)
    }

    /**
     * Retrieves the element in this fragment that has the input focus.
     * @returns {IRawElementProviderFragment} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a> 
     *                 interface of the
     * 				element in this fragment that has the input focus, if any; otherwise <b>NULL</b>. 
     * 				This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-irawelementproviderfragmentroot-getfocus
     */
    GetFocus() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderFragment(pRetVal)
    }
}
