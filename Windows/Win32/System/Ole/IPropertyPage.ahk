#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PROPPAGEINFO.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the main features of a property page object that manages a particular page within a property sheet.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipropertypage
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPropertyPage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyPage
     * @type {Guid}
     */
    static IID => Guid("{b196b28d-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPageSite", "Activate", "Deactivate", "GetPageInfo", "SetObjects", "Show", "Move", "IsPageDirty", "Apply", "Help", "TranslateAccelerator"]

    /**
     * Initializes a property page and provides the page with a pointer to the IPropertyPageSite interface through which the property page communicates with the property frame.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the <i>pPageSite</i> parameter is <b>NULL</b>, this method must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on any <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypagesite">IPropertyPageSite</a> pointer passed during a previous call to this method. If non-<b>NULL</b>, this method must save the <b>IPropertyPageSite</b> pointer value and call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>. Two consecutive calls to this method with a non-<b>NULL</b> site pointer are not allowed and should cause the property page to return E_UNEXPECTED.
     * 
     * E_NOTIMPL is not a valid return value. All property pages must implement this method.
     * @param {IPropertyPageSite} pPageSite A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypagesite">IPropertyPageSite</a> interface of the page site that manages and provides services to this property page within the entire property sheet.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-setpagesite
     */
    SetPageSite(pPageSite) {
        result := ComCall(3, this, "ptr", pPageSite, "HRESULT")
        return result
    }

    /**
     * Creates the dialog box window for the property page.
     * @remarks
     * The property page maintains the window handle created in this process, which it uses to destroy the dialog box within <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-deactivate">IPropertyPage::Deactivate</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not a valid return value.
     * @param {HWND} hWndParent The window handle of the parent of the dialog box that is being created.
     * @param {Pointer<RECT>} pRect A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the positioning information for the dialog box. This method must create its dialog box with the placement and dimensions described by this structure.
     * @param {BOOL} bModal Indicates whether the dialog box frame is modal (<b>TRUE</b>) or modeless (<b>FALSE</b>).
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>prc</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-activate
     */
    Activate(hWndParent, pRect, bModal) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(4, this, "ptr", hWndParent, "ptr", pRect, "int", bModal, "HRESULT")
        return result
    }

    /**
     * Destroys the window created in IPropertyPage::Activate.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * It is important that property pages not keep the dialog box around as an optimization. In a property sheet with many property pages, memory consumption would become excessive if all property pages kept their dialog boxes created at all times. Destroying the dialog box prevents excessive memory consumption due to a very large number of created controls in the dialog boxes. If the frame wishes to keep pages alive while they are not visible, it can use <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-show">IPropertyPage::Show</a> for that purpose. The decision is ultimately left to the frame.
     * 
     * E_NOTIMPL is not a valid return value.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-deactivate
     */
    Deactivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the property page.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not a valid return value.
     * @returns {PROPPAGEINFO} A pointer to the caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-proppageinfo">PROPPAGEINFO</a> structure in which the property page stores its page information. All allocations stored in this structure become the responsibility of the caller.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-getpageinfo
     */
    GetPageInfo() {
        pPageInfo := PROPPAGEINFO()
        result := ComCall(6, this, "ptr", pPageInfo, "HRESULT")
        return pPageInfo
    }

    /**
     * Provides the property page with an array of pointers to objects associated with this property page.
     * @remarks
     * The property page is required to keep the pointers returned by this method or others queried through them. If these specific <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers are held, the property page must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> through each when caching them, until the time when <b>SetObjects</b> is called with <i>cObjects</i> equal to 0. At that time, the property page must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through each pointer, releasing any objects that it held.
     * 
     * 
     * 
     * The caller must provide the property page with these objects before calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a>, and should call <b>SetObjects</b> with zero as the parameter when deactivating the page or when releasing the object entirely. Each call to <b>SetObjects</b> with a non-<b>NULL</b><i>ppUnk</i> parameter must be matched with a later call to <b>SetObjects</b> with 0 in the <i>cObjects</i> parameter.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not a valid return value.
     * @param {Integer} cObjects The number of pointers in the array pointed to by <i>ppUnk</i>. If this parameter is 0, the property page must release any pointers previously passed to this method.
     * @param {Pointer<IUnknown>} ppUnk A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointers where each pointer identifies a unique object affected by the property sheet in which this (and possibly other) property pages are displayed. The property page must cache these pointers calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> for each pointer at that time. This array of pointers is the same one that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframe">OleCreatePropertyFrame</a> or <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-olecreatepropertyframeindirect">OleCreatePropertyFrameIndirect</a> to invoke the property sheet.
     * @returns {HRESULT} This method can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property page successfully saved the pointers it needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the objects in <i>ppUnk</i> did not support the interface expected by this property page, and so this property page cannot communicate with it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>ppUnk</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-setobjects
     */
    SetObjects(cObjects, ppUnk) {
        result := ComCall(7, this, "uint", cObjects, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * Makes the property page dialog box visible or invisible. If the page is made visible, the page should set the focus to itself, specifically to the first property on the page.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calls to this method must occur after a call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a> and before a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-deactivate">IPropertyPage::Deactivate</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not a valid return value. E_OUTOFMEMORY is not a valid return value, since no memory should be used in implementing this method.
     * @param {Integer} nCmdShow A command describing whether to become visible (SW_SHOW or SW_SHOWNORMAL) or hidden (SW_HIDE). No other values are valid for this parameter.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-show
     */
    Show(nCmdShow) {
        result := ComCall(8, this, "uint", nCmdShow, "HRESULT")
        return result
    }

    /**
     * Positions and resizes the property page dialog box within the frame.
     * @remarks
     * The rectangle specified by <i>prc</i> is treated identically to that passed to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calls to this method must occur after a call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a> and before a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-deactivate">IPropertyPage::Deactivate</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The page must create its dialog box with the placement and dimensions described by this structure.
     * @param {Pointer<RECT>} pRect A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the positioning information for the property page dialog box.
     * @returns {HRESULT} This method can return the standard return value E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>prc</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-move
     */
    Move(pRect) {
        result := ComCall(9, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * Indicates whether the property page has changed since it was activated or since the most recent call to Apply.
     * @remarks
     * The property sheet uses this information to enable or disable the <b>Apply</b> button in the dialog box. There is no need to apply the values on a property page if those values are already current with the underlying objects.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method has no reason to return an error code, since the inability to determine if the page is dirty should return S_OK as a default. In this way, the user has a chance to update the values. The page should not return an error code, since an error code is not the same as S_OK and would indicate that the page is not dirty. Then, the property frame could potentially disable the <b>Apply</b> button, not allowing the user to make sure that the property values are current.
     * @returns {HRESULT} This method returns S_OK to indicate that the property page has changed. Otherwise, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-ispagedirty
     */
    IsPageDirty() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Applies the current values to the underlying objects associated with the property page as previously passed to IPropertyPage::SetObjects.
     * @remarks
     * The objects to be changed are provided through a previous call to 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-setobjects">IPropertyPage::SetObjects</a>. By calling 
     *      <b>IPropertyPage::SetObjects</b> prior to calling this 
     *      method, the caller ensures that all underlying objects have the correct interfaces through which to communicate 
     *      changes. Therefore, this method should not fail because of non-existent interfaces.
     * 
     * After applying its values, the property page should determine if its state is now current with the objects in 
     *      order to properly implement 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-ispagedirty">IPropertyPage::IsPageDirty</a> and to provide both 
     *      <b>S_OK</b> and <b>S_FALSE</b> return values.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not a valid return value.
     * @returns {HRESULT} This method can return the standard return values <b>E_OUTOFMEMORY</b> and 
     *       <b>E_UNEXPECTED</b>, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Changes were successfully applied and the property page is current with the underlying objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Changes were applied, but the property page cannot determine if its state is current with the 
     *         objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-apply
     */
    Apply() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Invokes the property page help in response to an end-user request.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calls to this method must occur between calls to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-deactivate">IPropertyPage::Deactivate</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the page fails this method (such as E_NOTIMPL), then the frame will attempt to use the <b>pszHelpFile</b> and <b>dwHelpContext</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-proppageinfo">PROPPAGEINFO</a> structure obtained through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-getpageinfo">IPropertyPage::GetPageInfo</a>. Therefore, the page should either implement <b>IPropertyPage::Help</b> or return help information through <b>IPropertyPage::GetPageInfo</b>.
     * @param {PWSTR} pszHelpDir A pointer to the string under the <b>HelpDir</b> key in the property page's CLSID information in the registry. If <b>HelpDir</b> does not exist, this will be the path found in the <b><a href="https://docs.microsoft.com/windows/desktop/com/inprocserver32">InprocServer32</a></b> entry minus the server file name. (Note that <b><a href="https://docs.microsoft.com/windows/desktop/com/localserver32">LocalServer32</a></b> is not checked, because local property pages are not supported).
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The page displayed its own help.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Help is either not provided or is provided only through the information is <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-proppageinfo">PROPPAGEINFO</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-help
     */
    Help(pszHelpDir) {
        pszHelpDir := pszHelpDir is String ? StrPtr(pszHelpDir) : pszHelpDir

        result := ComCall(12, this, "ptr", pszHelpDir, "HRESULT")
        return result
    }

    /**
     * Passes a keystroke to the property page for processing.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Calls to this method must occur after a call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a> and before the corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-deactivate">IPropertyPage::Deactivate</a>.
     * @param {Pointer<MSG>} pMsg A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure describing the keystroke to be processed.
     * @returns {HRESULT} This method can return the standard return value E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property page handles the accelerator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property page handles accelerators, but this one was not useful to it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property page does not handle accelerators.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address in <i>pMsg</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-translateaccelerator
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(13, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
