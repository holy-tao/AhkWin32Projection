#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\TextEditChangeType.ahk" { TextEditChangeType }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\AutomationIdentifierType.ahk" { AutomationIdentifierType }
#Import ".\SupportedTextSelection.ahk" { SupportedTextSelection }
#Import ".\NormalizeState.ahk" { NormalizeState }
#Import ".\UiaChangeInfo.ahk" { UiaChangeInfo }
#Import ".\TextPatternRangeEndpoint.ahk" { TextPatternRangeEndpoint }
#Import ".\TextUnit.ahk" { TextUnit }
#Import ".\IAccessible.ahk" { IAccessible }
#Import ".\HUIANODE.ahk" { HUIANODE }
#Import "..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import ".\ACC_UTILITY_STATE_FLAGS.ahk" { ACC_UTILITY_STATE_FLAGS }
#Import ".\DockPosition.ahk" { DockPosition }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITextRangeProvider.ahk" { ITextRangeProvider }
#Import ".\NavigateDirection.ahk" { NavigateDirection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AsyncContentLoadedState.ahk" { AsyncContentLoadedState }
#Import ".\UiaCacheRequest.ahk" { UiaCacheRequest }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HWINEVENTHOOK.ahk" { HWINEVENTHOOK }
#Import ".\UiaFindParams.ahk" { UiaFindParams }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import ".\WindowVisualState.ahk" { WindowVisualState }
#Import ".\UiaPoint.ahk" { UiaPoint }
#Import ".\NotificationProcessing.ahk" { NotificationProcessing }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HUIAPATTERNOBJECT.ahk" { HUIAPATTERNOBJECT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\NotificationKind.ahk" { NotificationKind }
#Import ".\HUIAEVENT.ahk" { HUIAEVENT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\StructureChangeType.ahk" { StructureChangeType }
#Import ".\ScrollAmount.ahk" { ScrollAmount }
#Import ".\SynchronizedInputType.ahk" { SynchronizedInputType }
#Import ".\UiaCondition.ahk" { UiaCondition }
#Import ".\HUIATEXTRANGE.ahk" { HUIATEXTRANGE }
#Import ".\TreeScope.ahk" { TreeScope }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */

;@region Functions
/**
 * Returns a reference, similar to a handle, to the specified object. Servers return this reference when handling WM_GETOBJECT.
 * @remarks
 * Servers call this function only when handling the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message. For an overview of how <b>LresultFromObject</b> is related to <b>WM_GETOBJECT</b>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-wm-getobject-works">How WM_GETOBJECT Works</a>.
 * 
 * <b>LresultFromObject</b> increments the object's reference count. If you are not storing the interface pointer passed to the function (that is, you create a new interface pointer for the object each time [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) is received), call the object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method to decrement the reference count back to one. Then the client calls <b>Release</b> and the object is destroyed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-to-handle-wm-getobject">How to Handle WM_GETOBJECT</a>.
 * 
 * Each time a server processes [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) for a specific object, it calls <b>LresultFromObject</b> to obtain a new reference to the object. Servers do not save the reference returned from <b>LresultFromObject</b> from one instance of processing <b>WM_GETOBJECT</b> to use as the message's return value when processing subsequent <b>WM_GETOBJECT</b> messages for the same object. This causes the client to receive an error.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference identifier of the interface provided to the client. This parameter is IID_IAccessible.
 * @param {WPARAM} _wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
 * 
 * Value sent by the associated [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message in its <i>wParam</i> parameter.
 * @param {IUnknown} punk Type: <b>LPUNKNOWN</b>
 * 
 * Address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface to the object that corresponds to the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
 * @returns {LRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
 * 
 * If successful, returns a positive value that is a reference to the object.
 * 
 * If not successful, returns one of the values in the table that follows, or another standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
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
 * The object specified in the <i>pAcc</i> parameter does not support the interface specified in the <i>riid</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory to store the object reference.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_UNEXPECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unexpected error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-lresultfromobject
 * @since windows5.0
 */
export LresultFromObject(riid, _wParam, punk) {
    result := DllCall("OLEACC.dll\LresultFromObject", Guid.Ptr, riid, WPARAM, _wParam, "ptr", punk, LRESULT)
    return result
}

/**
 * Retrieves a requested interface pointer for an accessible object based on a previously generated object reference.
 * @param {LRESULT} _lResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
 * 
 * A 32-bit value returned by a previous successful call to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-lresultfromobject">LresultFromObject</a> function.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference identifier of the interface to be retrieved. This is IID_IAccessible.
 * @param {WPARAM} _wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
 * 
 * Value sent by the associated [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message in its <i>wParam</i> parameter.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * Receives the address of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface on the object that corresponds to the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-objectfromlresult
 * @since windows5.1.2600
 */
export ObjectFromLresult(_lResult, riid, _wParam) {
    result := DllCall("OLEACC.dll\ObjectFromLresult", LRESULT, _lResult, Guid.Ptr, riid, WPARAM, _wParam, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Retrieves the window handle that corresponds to a particular instance of an IAccessible interface.
 * @param {IAccessible} param0 
 * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
 * 
 * Address of a variable that receives a handle to the window containing the object specified in <i>pacc</i>. If this value is <b>NULL</b> after the call, the object is not contained within a window; for example, the mouse pointer is not contained within a window.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-windowfromaccessibleobject
 * @since windows5.0
 */
export WindowFromAccessibleObject(param0) {
    phwnd := HWND()
    result := DllCall("OLEACC.dll\WindowFromAccessibleObject", "ptr", param0, HWND.Ptr, phwnd, "HRESULT")
    return phwnd
}

/**
 * Retrieves the address of the specified interface for the object associated with the specified window.
 * @remarks
 * Clients call this function to retrieve the address of an object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a>, <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or other supported interface pointer.
 * 
 * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
 * 
 * Clients use this function to obtain access to the Microsoft Office 2000 native object model. The native object model provides clients with accessibility information about an Office application's document or client area that is not exposed by Microsoft Active Accessibility.
 * 
 * To obtain an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface pointer to a class supported by the native object model, specify <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_NATIVEOM</a> in <i>dwObjectID</i>. When using this object identifier, the <i>hwnd</i> parameter must match the following window class types.
 * 
 * <table>
 * <tr>
 * <th>Office application</th>
 * <th>Window class</th>
 * <th>IDispatch pointer to</th>
 * </tr>
 * <tr>
 * <td>Word</td>
 * <td>_WwG</td>
 * <td>Window</td>
 * </tr>
 * <tr>
 * <td>Excel</td>
 * <td>EXCEL7</td>
 * <td>Window</td>
 * </tr>
 * <tr>
 * <td>PowerPoint</td>
 * <td>paneClassDC</td>
 * <td>DocumentWindow</td>
 * </tr>
 * <tr>
 * <td>Command Bars</td>
 * <td>MsoCommandBar</td>
 * <td>CommandBar</td>
 * </tr>
 * </table>
 *  
 * 
 * Note that the above window classes correspond to the innermost document window or pane window. For more information about the Office object model, see the <a href="https://docs.microsoft.com/previous-versions/office/developer/office2000/aa141393(v=office.10)">Microsoft Office 2000/Visual Basic Programmer's Guide</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Specifies the handle of a window for which an object is to be retrieved. To retrieve an interface pointer to the cursor or caret object, specify <b>NULL</b> and use the appropriate object ID in <i>dwObjectID</i>.
 * @param {Integer} dwId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the object ID. This value is one of the standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifier</a> constants or a custom object ID such as <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_NATIVEOM</a>, which is the object ID for the Office native object model. For more information about <b>OBJID_NATIVEOM</b>, see the Remarks section in this topic.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Specifies the reference identifier of the requested interface. This value is either IID_IAccessible or IID_IDispatch, but it can also be IID_IUnknown, or the IID of any interface that the object is expected to support.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * Address of a pointer variable that receives the address of the specified interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfromwindow
 * @since windows5.0
 */
export AccessibleObjectFromWindow(_hwnd, dwId, riid) {
    result := DllCall("OLEACC.dll\AccessibleObjectFromWindow", HWND, _hwnd, "uint", dwId, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Retrieves the address of the IAccessible interface for the object that generated the event that is currently being processed by the client's event hook function.
 * @remarks
 * Clients call this function within an event hook function to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer to either the object that generated the event or to the parent of the element that generated the event. The parameters sent to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-wineventproc">WinEventProc</a> callback function must be used for this function's <i>hwnd</i>, <i>dwObjectID</i>, and <i>dwChildID</i> parameters.
 * 
 * This function retrieves the lowest-level accessible object in the object hierarchy that is associated with an event. If the element that generated the event is not an accessible object (that is, does not support <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>), then the function retrieves the <b>IAccessible</b> interface of the parent object. The parent object must provide information about the child element through the <b>IAccessible</b> interface.
 * 
 * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
 * 
 * This function fails if called in response to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_CREATE</a> because the object is not fully initialized. Similarly, clients should not call this in response to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_DESTROY</a> because the object is no longer available and cannot respond. Clients watch for <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_SHOW</a> and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_OBJECT_HIDE</a> events rather than for <b>EVENT_OBJECT_CREATE</b> and <b>EVENT_OBJECT_DESTROY</b>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Specifies the window handle of the window that generated the event. This value must be the window handle that is sent to the event hook function.
 * @param {Integer} dwId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the object ID of the object that generated the event. This value must be the object ID that is sent to the event hook function.
 * @param {Integer} dwChildId Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies whether the event was triggered by an object or one of its child elements. If the object triggered the event, <i>dwChildID</i> is CHILDID_SELF. If a child element triggered the event, <i>dwChildID</i> is the element's child ID. This value must be the child ID that is sent to the event hook function.
 * @param {Pointer<VARIANT>} pvarChild Type: <b>VARIANT*</b>
 * 
 * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a> that specifies the child ID that can be used to access information about the UI element.
 * @returns {IAccessible} Type: <b>IAccessible**</b>
 * 
 * Address of a pointer variable that receives the address of an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface. The interface is either for the object that generated the event, or for the parent of the element that generated the event.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfromevent
 * @since windows5.0
 */
export AccessibleObjectFromEvent(_hwnd, dwId, dwChildId, pvarChild) {
    result := DllCall("OLEACC.dll\AccessibleObjectFromEvent", HWND, _hwnd, "uint", dwId, "uint", dwChildId, "ptr*", &ppacc := 0, VARIANT.Ptr, pvarChild, "HRESULT")
    return IAccessible(ppacc)
}

/**
 * Retrieves the address of the IAccessible interface pointer for the object displayed at a specified point on the screen.
 * @remarks
 * This function retrieves the lowest-level accessible object in the object hierarchy at a given point. If the element at the point is not an accessible object (that is, does not support <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>), then the function retrieves the <b>IAccessible</b> interface of the parent object. The parent object must provide information about the child element through the <b>IAccessible</b> interface. Call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-acchittest">IAccessible::accHitTest</a> to identify the child element at the specified screen coordinates.
 * 
 * As with other <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and functions, clients might receive errors for <b>IAccessible</b> interface pointers because of a user action. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/receiving-errors-for-iaccessible-interface-pointers">Receiving Errors for IAccessible Interface Pointers</a>.
 * 
 * <h3><a id="Client_Example"></a><a id="client_example"></a><a id="CLIENT_EXAMPLE"></a>Client Example</h3>
 * The following example function selects the item at a specified point on the screen. It is assumed that a single selection is wanted.
 * 
 * 
 * ```cpp
 * 
 * HRESULT SelectItemAtPoint(POINT point)
 * {
 *     VARIANT varItem;
 *     IAccessible* pAcc;
 *     HRESULT hr = AccessibleObjectFromPoint(point, &pAcc, &varItem);
 *     if ((hr == S_OK))
 *     {
 *         hr = pAcc->accSelect((SELFLAG_TAKEFOCUS | SELFLAG_TAKESELECTION), varItem);
 *         VariantClear(&varItem);
 *         pAcc->Release();
 *     }
 *     return hr;
 * }
 * 
 * ```
 * @param {POINT} ptScreen Specifies, in physical screen coordinates, the point that is examined.
 * @param {Pointer<VARIANT>} pvarChild Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> structure that specifies whether the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer that is returned in <i>ppacc</i> belongs to the object displayed at the specified point, or to the parent of the element at the specified point. The <b>vt</b> member of the <b>VARIANT</b> is always VT_I4. If the <b>lVal</b> member is CHILDID_SELF, then the <b>IAccessible</b> interface pointer at <i>ppacc</i> belongs to the object at the point. If the <b>lVal</b> member is not CHILDID_SELF, <i>ppacc</i> is the address of the <b>IAccessible</b> interface of the child element's parent object. Clients must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> on the retrieved <b>VARIANT</b> parameter when finished using it.
 * @returns {IAccessible} Address of a pointer variable that receives the address of the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessibleobjectfrompoint
 * @since windows5.0
 */
export AccessibleObjectFromPoint(ptScreen, pvarChild) {
    result := DllCall("OLEACC.dll\AccessibleObjectFromPoint", POINT, ptScreen, "ptr*", &ppacc := 0, VARIANT.Ptr, pvarChild, "HRESULT")
    return IAccessible(ppacc)
}

/**
 * Retrieves the child ID or IDispatch of each child within an accessible container object.
 * @remarks
 * To retrieve information about all of the children in a container, the <i>iChildStart</i> parameter  must be zero (0), and <i>cChildren</i> must be the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
 * 
 * When calling this function to obtain information about the children of a user interface element, it is recommended that clients obtain information about all of the children. For example, <i>iChildStart</i> must be zero (0), and <i>cChildren</i> must be the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
 * 
 * If a child ID is returned for an element, then the container must provide information about the child element. To obtain information about the element, clients use the container's  <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer and specify the obtained child ID in calls to the <b>IAccessible</b> properties.
 * 
 * Clients must call the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method for any <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interfaces retrieved by this function, and free the array when it is no longer required.
 * @param {IAccessible} paccContainer Type: <b>IAccessible*</b>
 * 
 * Pointer to the container object's <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
 * @param {Integer} iChildStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Specifies the zero-based index of the first child that is retrieved. This parameter is an index, not a child ID, and it is usually is set to zero (0).
 * @param {Integer} cChildren Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Specifies the number of children to retrieve. To retrieve the current number of children, an application calls <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccessible-get_accchildcount">IAccessible::get_accChildCount</a>.
 * @param {Pointer<VARIANT>} rgvarChildren Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> structures that receives information about the container's children. If the <b>vt</b> member of an array element is VT_I4, then the <b>lVal</b> member for that element is the child ID. If the <b>vt</b> member of an array element is VT_DISPATCH, then the <b>pdispVal</b> member for that element is the address of the child object's <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
 * 
 * Address of a variable that receives the number of elements in the <i>rgvarChildren</i> array that is populated by the <b>AccessibleChildren</b> function. This value is the same as that of the <i>cChildren</i> parameter; however, if you request more children than exist, this value will be less than that of <i>cChildren</i>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accessiblechildren
 * @since windows5.0
 */
export AccessibleChildren(paccContainer, iChildStart, cChildren, rgvarChildren) {
    result := DllCall("OLEACC.dll\AccessibleChildren", "ptr", paccContainer, "int", iChildStart, "int", cChildren, VARIANT.Ptr, rgvarChildren, "int*", &pcObtained := 0, "HRESULT")
    return pcObtained
}

/**
 * Retrieves the localized string that describes the object's role for the specified role value. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oleacc.h header defines GetRoleText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} lRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-roles">object role</a> constants.
 * @param {PSTR} lpszRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * Address of a buffer that receives the role text string. If this parameter is <b>NULL</b>, the function returns the role string's length, not including the null character.
 * @param {Integer} cchRoleMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The size of the buffer that is pointed to by the <i>lpszRole</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * If successful, and if <i>lpszRole</i> is non-<b>NULL</b>, the return value is the number of bytes (ANSI strings) or characters (Unicode strings) copied into the buffer, not including the terminating null character. If <i>lpszRole</i> is <b>NULL</b>, the return value represents the string's length, not including the null character.
 * 
 * If the string resource does not exist, or if the <i>lpszRole</i> parameter is not a valid pointer, the return value is zero (0). To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getroletexta
 * @since windows5.0
 */
export GetRoleTextA(lRole, lpszRole, cchRoleMax) {
    lpszRole := lpszRole is String ? StrPtr(lpszRole) : lpszRole

    A_LastError := 0

    result := DllCall("OLEACC.dll\GetRoleTextA", "uint", lRole, "ptr", lpszRole, "uint", cchRoleMax, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the localized string that describes the object's role for the specified role value. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oleacc.h header defines GetRoleText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} lRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-roles">object role</a> constants.
 * @param {PWSTR} lpszRole Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * Address of a buffer that receives the role text string. If this parameter is <b>NULL</b>, the function returns the role string's length, not including the null character.
 * @param {Integer} cchRoleMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The size of the buffer that is pointed to by the <i>lpszRole</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * If successful, and if <i>lpszRole</i> is non-<b>NULL</b>, the return value is the number of bytes (ANSI strings) or characters (Unicode strings) copied into the buffer, not including the terminating null character. If <i>lpszRole</i> is <b>NULL</b>, the return value represents the string's length, not including the null character.
 * 
 * If the string resource does not exist, or if the <i>lpszRole</i> parameter is not a valid pointer, the return value is zero (0). To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getroletextw
 * @since windows5.0
 */
export GetRoleTextW(lRole, lpszRole, cchRoleMax) {
    lpszRole := lpszRole is String ? StrPtr(lpszRole) : lpszRole

    A_LastError := 0

    result := DllCall("OLEACC.dll\GetRoleTextW", "uint", lRole, "ptr", lpszRole, "uint", cchRoleMax, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a localized string that describes an object's state for a single predefined state bit flag. Because state values are a combination of one or more bit flags, clients call this function more than once to retrieve all state strings. (ANSI)
 * @remarks
 * This function accepts only one state bit at a time, not a bitmask.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The oleacc.h header defines GetStateText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} lStateBit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">object state constants</a>.
 * @param {PSTR} lpszState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * Address of a buffer that receives the state text string. If this parameter is <b>NULL</b>, the function returns the state string's length, not including the null character.
 * @param {Integer} cchState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The size of the buffer that is pointed to by the <i>lpszStateBit</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * If successful, and if <i>lpszStateBit</i> is non-<b>NULL</b>, the return value is the number of bytes (ANSI strings) or characters (Unicode strings) that are copied into the buffer, not including the null-terminated character. If <i>lpszStateBit</i> is <b>NULL</b>, the return value represents the string's length, not including the null character.
 * 
 * If the string resource does not exist, or if the <i>lpszStateBit</i> parameter is not a valid pointer, the return value is zero (0). To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getstatetexta
 * @since windows5.0
 */
export GetStateTextA(lStateBit, lpszState, cchState) {
    lpszState := lpszState is String ? StrPtr(lpszState) : lpszState

    A_LastError := 0

    result := DllCall("OLEACC.dll\GetStateTextA", "uint", lStateBit, "ptr", lpszState, "uint", cchState, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a localized string that describes an object's state for a single predefined state bit flag. Because state values are a combination of one or more bit flags, clients call this function more than once to retrieve all state strings. (Unicode)
 * @remarks
 * This function accepts only one state bit at a time, not a bitmask.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The oleacc.h header defines GetStateText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} lStateBit Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * One of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">object state constants</a>.
 * @param {PWSTR} lpszState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * Address of a buffer that receives the state text string. If this parameter is <b>NULL</b>, the function returns the state string's length, not including the null character.
 * @param {Integer} cchState Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The size of the buffer that is pointed to by the <i>lpszStateBit</i> parameter. For ANSI strings, this value is measured in bytes; for Unicode strings, it is measured in characters.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * If successful, and if <i>lpszStateBit</i> is non-<b>NULL</b>, the return value is the number of bytes (ANSI strings) or characters (Unicode strings) that are copied into the buffer, not including the null-terminated character. If <i>lpszStateBit</i> is <b>NULL</b>, the return value represents the string's length, not including the null character.
 * 
 * If the string resource does not exist, or if the <i>lpszStateBit</i> parameter is not a valid pointer, the return value is zero (0). To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getstatetextw
 * @since windows5.0
 */
export GetStateTextW(lStateBit, lpszState, cchState) {
    lpszState := lpszState is String ? StrPtr(lpszState) : lpszState

    A_LastError := 0

    result := DllCall("OLEACC.dll\GetStateTextW", "uint", lStateBit, "ptr", lpszState, "uint", cchState, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the version number and build number of the Microsoft Active Accessibility file Oleacc.dll.
 * @remarks
 * This function provides an easy way to get the version and build numbers for Oleacc.dll. The <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizea">GetFileVersionInfoSize</a>, <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfoa">GetFileVersionInfo</a>, and <a href="https://docs.microsoft.com/windows/win32/api/winver/nf-winver-verqueryvaluea">VerQueryValue</a> functions can be used to retrieve the same information.
 * @param {Pointer<Integer>} pVer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
 * 
 * Address of a <b>DWORD</b> that receives the version number. The major version number is placed in the high word, and the minor version number is placed in the low word.
 * @param {Pointer<Integer>} pBuild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
 * 
 * Address of a <b>DWORD</b> that receives the build number. The major build number is placed in the high word, and the minor build number is placed in the low word.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-getoleaccversioninfo
 * @since windows5.0
 */
export GetOleaccVersionInfo(pVer, pBuild) {
    pVerMarshal := pVer is VarRef ? "uint*" : "ptr"
    pBuildMarshal := pBuild is VarRef ? "uint*" : "ptr"

    DllCall("OLEACC.dll\GetOleaccVersionInfo", pVerMarshal, pVer, pBuildMarshal, pBuild)
}

/**
 * Creates an accessible object with the methods and properties of the specified type of system-provided user interface element.
 * @remarks
 * Server applications call this function when they contain a custom UI object that is similar to a system-provided object. Server developers can call <b>CreateStdAccessibleObject</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom objects. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that <b>CreateStdAccessibleObject</b> requires. Server developers should still use <b>CreateStdAccessibleObject</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
 * 
 * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleproxya">CreateStdAccessibleProxy</a>, except that <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter whereas <b>CreateStdAccessibleObject</b> uses the class name associated with the <i>hwnd</i> parameter.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
 * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, but it may be another object identifier.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference identifier of the requested interface. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * Address of a pointer variable that receives the address of the specified interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleobject
 * @since windows5.0
 */
export CreateStdAccessibleObject(_hwnd, idObject, riid) {
    result := DllCall("OLEACC.dll\CreateStdAccessibleObject", HWND, _hwnd, "int", idObject, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Creates an accessible object that has the properties and methods of the specified class of system-provided user interface element. (ANSI)
 * @remarks
 * Server applications call this function when they contain a custom control that is similar to a system-provided control. Server applications can call <b>CreateStdAccessibleProxy</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom controls. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that were required with <b>CreateStdAccessibleProxy</b>. Server developers should still use <b>CreateStdAccessibleProxy</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
 * 
 * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleobject">CreateStdAccessibleObject</a>, except that <b>CreateStdAccessibleObject</b> always uses the class name associated with the <i>hwnd</i> whereas <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter.
 * 
 * Use <b>CreateStdAccessibleProxy</b> to create an accessible object for a user interface element that is superclassed. When a user interface element is superclassed, an application creates a custom control with a window class name different from the predefined control on which it is based. Because the class name associated with the <i>hwnd</i> parameter is the superclass window class name, specify the base class name (the system class name on which the superclassed control is based) in <i>pszClassName</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The oleacc.h header defines CreateStdAccessibleProxy as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
 * @param {PSTR} pClassName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string of the class name of a system-provided user interface element for which an accessible object is created. The window class name is one of the common controls (defined in Comctl32.dll), predefined controls (defined in User32.dll), or window elements.
 * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, which is one of the object identifier constants, but it may be another object identifier.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference identifier of the interface requested. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * Address of a pointer variable that receives the address of the specified interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleproxya
 * @since windows5.0
 */
export CreateStdAccessibleProxyA(_hwnd, pClassName, idObject, riid) {
    pClassName := pClassName is String ? StrPtr(pClassName) : pClassName

    result := DllCall("OLEACC.dll\CreateStdAccessibleProxyA", HWND, _hwnd, "ptr", pClassName, "int", idObject, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Creates an accessible object that has the properties and methods of the specified class of system-provided user interface element. (Unicode)
 * @remarks
 * Server applications call this function when they contain a custom control that is similar to a system-provided control. Server applications can call <b>CreateStdAccessibleProxy</b> to override the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods and properties as required to match their custom controls. Alternatively, server developers can use Dynamic Annotation to override specific properties without having to use difficult subclassing techniques that were required with <b>CreateStdAccessibleProxy</b>. Server developers should still use <b>CreateStdAccessibleProxy</b> for structural changes, such as hiding a child element or creating a placeholder child element. This approach saves server developers the work of fully implementing all of the <b>IAccessible</b> properties and methods.
 * 
 * This function is similar to <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-createstdaccessibleobject">CreateStdAccessibleObject</a>, except that <b>CreateStdAccessibleObject</b> always uses the class name associated with the <i>hwnd</i> whereas <b>CreateStdAccessibleProxy</b> allows you to specify the class name as a parameter.
 * 
 * Use <b>CreateStdAccessibleProxy</b> to create an accessible object for a user interface element that is superclassed. When a user interface element is superclassed, an application creates a custom control with a window class name different from the predefined control on which it is based. Because the class name associated with the <i>hwnd</i> parameter is the superclass window class name, specify the base class name (the system class name on which the superclassed control is based) in <i>pszClassName</i>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The oleacc.h header defines CreateStdAccessibleProxy as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Window handle of the system-provided user interface element (a control) for which an accessible object is created.
 * @param {PWSTR} pClassName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string of the class name of a system-provided user interface element for which an accessible object is created. The window class name is one of the common controls (defined in Comctl32.dll), predefined controls (defined in User32.dll), or window elements.
 * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Object ID. This value is usually <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, which is one of the object identifier constants, but it may be another object identifier.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference identifier of the interface requested. This value is one of the following: IID_IAccessible, IID_IDispatch, IID_IEnumVARIANT, or IID_IUnknown.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * Address of a pointer variable that receives the address of the specified interface.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-createstdaccessibleproxyw
 * @since windows5.0
 */
export CreateStdAccessibleProxyW(_hwnd, pClassName, idObject, riid) {
    pClassName := pClassName is String ? StrPtr(pClassName) : pClassName

    result := DllCall("OLEACC.dll\CreateStdAccessibleProxyW", HWND, _hwnd, "ptr", pClassName, "int", idObject, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
    return ppvObject
}

/**
 * Sets system values that indicate whether an assistive technology (AT) application's current state affects functionality that is typically provided by the system.
 * @remarks
 * Before it exits, an AT application should reset any system values that it previously set. 
 * 
 * This function requires the calling process to have UIAccess or higher privileges.  If the caller does not have the required privileges, the call to <b>AccSetRunningUtilityState</b> fails and returns <b>E_ACCESSDENIED</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-securityoverview">Security Considerations for Assistive Technologies</a> and <a href="https://docs.microsoft.com/cpp/build/reference/manifestuac-embeds-uac-information-in-manifest">/MANIFESTUAC (Embeds UAC information in manifest)</a>.
 * @param {HWND} hwndApp Type: <b>HWND</b>
 * 
 * The handle of the AT application window. This parameter must not be <b>NULL</b>.
 * @param {Integer} dwUtilityStateMask Type: <b>DWORD</b>
 * 
 * 
 * A
 * @param {ACC_UTILITY_STATE_FLAGS} dwUtilityState Type: <b>DWORD</b>
 * @returns {HRESULT} Type: <b>STDAPI</b>
 * 
 * If successful, returns S_OK.
 * 
 * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accsetrunningutilitystate
 * @since windows8.0
 */
export AccSetRunningUtilityState(hwndApp, dwUtilityStateMask, dwUtilityState) {
    result := DllCall("OLEACC.dll\AccSetRunningUtilityState", HWND, hwndApp, "uint", dwUtilityStateMask, ACC_UTILITY_STATE_FLAGS, dwUtilityState, "HRESULT")
    return result
}

/**
 * Allows an assistive technology (AT) application to notify the system that it is interacting with UI through a Windows Automation API (such as Microsoft UI Automation) as a result of a touch gesture from the user.
 * @remarks
 * This function requires the calling process to have UIAccess or higher privileges.  If the caller does not have the required privileges, the call to <b>AccNotifyTouchInteraction</b> fails and returns <b>E_ACCESSDENIED</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-securityoverview">Security Considerations for Assistive Technologies</a> and <a href="https://docs.microsoft.com/cpp/build/reference/manifestuac-embeds-uac-information-in-manifest">/MANIFESTUAC (Embeds UAC information in manifest)</a>.
 * 
 * When an AT is consuming touch data (such as when using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpointerinputtarget">RegisterPointerInputTarget</a> function), the shell and applications that the AT interacts with through the Windows Automation API are not aware that the user is interacting through touch. For the system to expose touch-related functionality to the user, the AT must use <b>AccNotifyTouchInteraction</b> to notify the system that it is performing the interaction in response to user touch input.
 * @param {HWND} hwndApp A window that belongs to the AT process that is calling <b>AccNotifyTouchInteraction</b>.
 * @param {HWND} hwndTarget The nearest window of the automation element that the AT is targeting.
 * @param {POINT} ptTarget The center point of the automation element (or a point in the bounding rectangle of the element).
 * @returns {HRESULT} If successful, returns S_OK.
 * 
 * If not successful, returns a standard <a href="https://docs.microsoft.com/windows/desktop/WinAuto/return-values">COM error code</a>.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-accnotifytouchinteraction
 * @since windows8.0
 */
export AccNotifyTouchInteraction(hwndApp, hwndTarget, ptTarget) {
    result := DllCall("OLEACC.dll\AccNotifyTouchInteraction", HWND, hwndApp, HWND, hwndTarget, POINT, ptTarget, "HRESULT")
    return result
}

/**
 * Gets an error string so that it can be passed to the client. This method is not used directly by clients.
 * @param {Pointer<BSTR>} pDescription Type: <b>BSTR*</b>
 * 
 * The address of a variable that receives the description of the error. This parameter is passed uninitialized.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if an error description can be reported; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiageterrordescription
 * @since windows5.1.2600
 */
export UiaGetErrorDescription(pDescription) {
    result := DllCall("UIAutomationCore.dll\UiaGetErrorDescription", BSTR.Ptr, pDescription, BOOL)
    return result
}

/**
 * Gets an HUIANODE from a VARIANT type.
 * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * The node.
 * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
 * 
 * The address of a variable that receives the HUIANODE.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahuianodefromvariant
 * @since windows5.1.2600
 */
export UiaHUiaNodeFromVariant(pvar, phnode) {
    result := DllCall("UIAutomationCore.dll\UiaHUiaNodeFromVariant", VARIANT.Ptr, pvar, HUIANODE.Ptr, phnode, "HRESULT")
    return result
}

/**
 * Gets a control pattern object from a VARIANT type.
 * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * The pattern.
 * @param {Pointer<HUIAPATTERNOBJECT>} phobj Type: <b>HUIAPATTERNOBJECT *</b>
 * 
 * The address of a variable that receives the control pattern object.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahpatternobjectfromvariant
 * @since windows5.1.2600
 */
export UiaHPatternObjectFromVariant(pvar, phobj) {
    result := DllCall("UIAutomationCore.dll\UiaHPatternObjectFromVariant", VARIANT.Ptr, pvar, HUIAPATTERNOBJECT.Ptr, phobj, "HRESULT")
    return result
}

/**
 * Gets a text range from a VARIANT type.
 * @param {Pointer<VARIANT>} pvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * The text range.
 * @param {Pointer<HUIATEXTRANGE>} phtextrange Type: <b>HUIATEXTRANGE*</b>
 * 
 * The address of a variable that receives the text range.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahtextrangefromvariant
 * @since windows5.1.2600
 */
export UiaHTextRangeFromVariant(pvar, phtextrange) {
    result := DllCall("UIAutomationCore.dll\UiaHTextRangeFromVariant", VARIANT.Ptr, pvar, HUIATEXTRANGE.Ptr, phtextrange, "HRESULT")
    return result
}

/**
 * Deletes a node from memory.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The node to be deleted.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if the node was successfully deleted; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianoderelease
 * @since windows5.1.2600
 */
export UiaNodeRelease(_hnode) {
    result := DllCall("UIAutomationCore.dll\UiaNodeRelease", HUIANODE, _hnode, BOOL)
    return result
}

/**
 * Retrieves the value of a UI Automation property.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The element that the property is being requested from.
 * @param {Integer} propertyId Type: <b>PROPERTYID</b>
 * 
 * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
 * @param {Pointer<VARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * Receives the value of the specified property, or the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservednotsupportedvalue">UiaGetReservedNotSupportedValue</a> if the property is not supported.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetpropertyvalue
 * @since windows5.1.2600
 */
export UiaGetPropertyValue(_hnode, propertyId, pValue) {
    result := DllCall("UIAutomationCore.dll\UiaGetPropertyValue", HUIANODE, _hnode, "int", propertyId, VARIANT.Ptr, pValue, "HRESULT")
    return result
}

/**
 * Retrieves a control pattern.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The element that implements the pattern.
 * @param {Integer} patternId Type: <b>PATTERNID</b>
 * 
 * The identifier of the control pattern being requested. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
 * @param {Pointer<HUIAPATTERNOBJECT>} phobj Type: <b>HPATTERNOBJECT*</b>
 * 
 * The address of a variable that receives a handle to the control pattern.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetpatternprovider
 * @since windows5.1.2600
 */
export UiaGetPatternProvider(_hnode, patternId, phobj) {
    result := DllCall("UIAutomationCore.dll\UiaGetPatternProvider", HUIANODE, _hnode, "int", patternId, HUIAPATTERNOBJECT.Ptr, phobj, "HRESULT")
    return result
}

/**
 * Retrieves the runtime identifier of a UI Automation node.
 * @remarks
 * The runtime identifier should be treated as an opaque value and used only for comparison.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The node for which the identifier is being requested.
 * @param {Pointer<Pointer<SAFEARRAY>>} pruntimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the runtime identifier of the type VT_I4. This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetruntimeid
 * @since windows5.1.2600
 */
export UiaGetRuntimeId(_hnode, pruntimeId) {
    pruntimeIdMarshal := pruntimeId is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaGetRuntimeId", HUIANODE, _hnode, pruntimeIdMarshal, pruntimeId, "HRESULT")
    return result
}

/**
 * Sets the input focus to the specified element in the UI.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The element that receives focus.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiasetfocus
 * @since windows5.1.2600
 */
export UiaSetFocus(_hnode) {
    result := DllCall("UIAutomationCore.dll\UiaSetFocus", HUIANODE, _hnode, "HRESULT")
    return result
}

/**
 * Navigates in the UI Automation tree, optionally retrieving cached information.
 * @remarks
 * The tree structure is described by a string where every character is either "p" or ")". 
 * 			The first character in the string always represents the root node. 
 * The string is <b>NULL</b> if no elements are returned by the function.
 * 			
 * 
 * A "p" represents a node 
 * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
 * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
 * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The element on which the navigation begins.
 * @param {NavigateDirection} _direction Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-navigatedirection">NavigateDirection</a></b>
 * 
 * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-navigatedirection">NavigateDirection</a> enumerated type indicating the direction to navigate from <i>hnode</i>.
 * @param {Pointer<UiaCondition>} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies the condition that the element being navigated to must match. Use this parameter to skip elements that are not of interest.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains a description of the information to be cached.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized. See Remarks.
 * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
 * 
 * The address of a variable that receives the description of the tree structure. 
 * 				This parameter is passed uninitialized. See Remarks.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianavigate
 * @since windows5.1.2600
 */
export UiaNavigate(_hnode, _direction, pCondition, pRequest, ppRequestedData, ppTreeStructure) {
    ppRequestedDataMarshal := ppRequestedData is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaNavigate", HUIANODE, _hnode, NavigateDirection, _direction, UiaCondition.Ptr, pCondition, UiaCacheRequest.Ptr, pRequest, ppRequestedDataMarshal, ppRequestedData, BSTR.Ptr, ppTreeStructure, "HRESULT")
    return result
}

/**
 * Updates the cache of property values and control patterns.
 * @remarks
 * The tree structure is described by a string where every character is either "p" or ")". 
 * 			The first character in the string always represents the root node. 
 * The string is <b>NULL</b> if no elements are returned by the function.
 * 			
 * 
 * A "p" represents a node 
 * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
 * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
 * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The element that updated information is being requested for.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that specifies the cached information to update.
 * @param {NormalizeState} _normalizeState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState</a></b>
 * 
 * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState</a> enumerated type specifying the type of normalization.
 * @param {Pointer<UiaCondition>} pNormalizeCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that specifies a condition against which the information can be normalized, if <i>normalizeState</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate">NormalizeState_Custom</a>.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized. See Remarks.
 * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
 * 
 * A pointer to the description of the tree structure.
 * 				This parameter is passed uninitialized. See Remarks.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetupdatedcache
 * @since windows5.1.2600
 */
export UiaGetUpdatedCache(_hnode, pRequest, _normalizeState, pNormalizeCondition, ppRequestedData, ppTreeStructure) {
    ppRequestedDataMarshal := ppRequestedData is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaGetUpdatedCache", HUIANODE, _hnode, UiaCacheRequest.Ptr, pRequest, NormalizeState, _normalizeState, UiaCondition.Ptr, pNormalizeCondition, ppRequestedDataMarshal, ppRequestedData, BSTR.Ptr, ppTreeStructure, "HRESULT")
    return result
}

/**
 * Retrieves one or more UI Automation nodes that match the search criteria.
 * @remarks
 * The tree structure is described by a string where every character is either "p" or ")". 
 * 			The first character in the string always represents the root node. 
 * The string is <b>NULL</b> if no elements are returned by the function.
 * 			
 * 
 * A "p" represents a node 
 * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
 * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
 * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The node to use as starting-point of the search.
 * @param {Pointer<UiaFindParams>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams">UiaFindParams</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams">UiaFindParams</a> structure that contains the search parameters.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that specifies what information is to be cached.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> containing the requested data. This parameter is passed uninitialized. See Remarks.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppOffsets Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a SAFEARRAY containing the indexes to the requested data array for where the element subtree starts. This parameter is passed uninitialized.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppTreeStructures Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a SAFEARRAY containing the description of the tree structure. This parameter is passed uninitialized. See Remarks.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiafind
 * @since windows5.1.2600
 */
export UiaFind(_hnode, pParams, pRequest, ppRequestedData, ppOffsets, ppTreeStructures) {
    ppRequestedDataMarshal := ppRequestedData is VarRef ? "ptr*" : "ptr"
    ppOffsetsMarshal := ppOffsets is VarRef ? "ptr*" : "ptr"
    ppTreeStructuresMarshal := ppTreeStructures is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaFind", HUIANODE, _hnode, UiaFindParams.Ptr, pParams, UiaCacheRequest.Ptr, pRequest, ppRequestedDataMarshal, ppRequestedData, ppOffsetsMarshal, ppOffsets, ppTreeStructuresMarshal, ppTreeStructures, "HRESULT")
    return result
}

/**
 * Retrieves the UI Automation node for the element at the specified point.
 * @remarks
 * The element returned will be the closest element in the UI Automation tree structure that matches the specified criteria.
 * 
 * The tree structure is described by a string where every character is either "p" or ")". 
 * 			The first character in the string always represents the root node. 
 * The string is <b>NULL</b> if no elements are returned by the function.
 * 			
 * 
 * A "p" represents a node 
 * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
 * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
 * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @param {Float} x Type: <b>double</b>
 * 
 * The horizontal coordinate of the point.
 * @param {Float} y Type: <b>double</b>
 * 
 * The vertical coordinate of the point.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains the cache request for information from the client.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the requested data. This parameter is passed uninitialized.
 * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
 * 
 * The address of a variable that receives the description of the tree structure.
 * 				This parameter is passed uninitialized. See Remarks.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefrompoint
 * @since windows5.1.2600
 */
export UiaNodeFromPoint(x, y, pRequest, ppRequestedData, ppTreeStructure) {
    ppRequestedDataMarshal := ppRequestedData is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaNodeFromPoint", "double", x, "double", y, UiaCacheRequest.Ptr, pRequest, ppRequestedDataMarshal, ppRequestedData, BSTR.Ptr, ppTreeStructure, "HRESULT")
    return result
}

/**
 * Retrieves the UI Automation node for the UI element that currently has input focus.
 * @remarks
 * The tree structure is described by a string where every character is either "p" or ")". 
 * 			The first character in the string always represents the root node. 
 * The string is <b>NULL</b> if no elements are returned by the function.
 * 			
 * 
 * A "p" represents a node 
 * 			(UI Automation element). When one "p" directly follows another, the second node is a child of the first.
 * 			A ")" represents a step back up the tree. For example, "pp)p" represents a node followed
 * 			by two child nodes that are siblings of one another. In "pp))p", the last node is a sibling of the first one.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that contains information about data to be cached.
 * @param {Pointer<Pointer<SAFEARRAY>>} ppRequestedData Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * The address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains 				the requested information.
 * 				This parameter is passed uninitialized.
 * @param {Pointer<BSTR>} ppTreeStructure Type: <b>BSTR*</b>
 * 
 * The address of a variable that receives the description of the tree structure. 
 * 				This parameter is passed uninitialized. See Remarks.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromfocus
 * @since windows5.1.2600
 */
export UiaNodeFromFocus(pRequest, ppRequestedData, ppTreeStructure) {
    ppRequestedDataMarshal := ppRequestedData is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaNodeFromFocus", UiaCacheRequest.Ptr, pRequest, ppRequestedDataMarshal, ppRequestedData, BSTR.Ptr, ppTreeStructure, "HRESULT")
    return result
}

/**
 * Retrieves the UI Automation node associated with a window.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle of the window.
 * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
 * 
 * The address of a variable that receives the handle of the node.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromhandle
 * @since windows5.1.2600
 */
export UiaNodeFromHandle(_hwnd, phnode) {
    result := DllCall("UIAutomationCore.dll\UiaNodeFromHandle", HWND, _hwnd, HUIANODE.Ptr, phnode, "HRESULT")
    return result
}

/**
 * Retrieves the UI Automation node for a raw element provider.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface of the provider.
 * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
 * 
 * The address of a variable that receives the UI Automation node for the raw element provider.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uianodefromprovider
 * @since windows5.1.2600
 */
export UiaNodeFromProvider(pProvider, phnode) {
    result := DllCall("UIAutomationCore.dll\UiaNodeFromProvider", "ptr", pProvider, HUIANODE.Ptr, phnode, "HRESULT")
    return result
}

/**
 * Retrieves the root UI Automation node.
 * @param {Pointer<HUIANODE>} phnode Type: <b>HUIANODE*</b>
 * 
 * The address of a variable that receives a handle to the root node.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetrootnode
 * @since windows5.1.2600
 */
export UiaGetRootNode(phnode) {
    result := DllCall("UIAutomationCore.dll\UiaGetRootNode", HUIANODE.Ptr, phnode, "HRESULT")
    return result
}

/**
 * Registers the application-defined method that is called by UI Automation to obtain a provider for an element.
 * @param {Pointer<Pointer<UiaProviderCallback>>} pCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaprovidercallback">UiaProviderCallback</a>*</b>
 * 
 * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaprovidercallback">UiaProviderCallback</a> callback function that returns the provider.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaregisterprovidercallback
 * @since windows5.1.2600
 */
export UiaRegisterProviderCallback(pCallback) {
    pCallbackMarshal := pCallback is VarRef ? "ptr*" : "ptr"

    DllCall("UIAutomationCore.dll\UiaRegisterProviderCallback", pCallbackMarshal, pCallback)
}

/**
 * Gets the integer identifier that can be used in methods that require a PROPERTYID, PATTERNID, CONTROLTYPEID, TEXTATTRIBUTEID, or EVENTID.
 * @param {AutomationIdentifierType} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype">AutomationIdentifierType</a></b>
 * 
 * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-automationidentifiertype">AutomationIdentifierType</a> enumerated type that specifies the type of identifier to look up.
 * @param {Pointer<Guid>} pGuid Type: <b>GUID*</b>
 * 
 * The address of the unique identifier of the property, pattern, control type, text attribute, or event.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns an integer identifier.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uialookupid
 * @since windows5.1.2600
 */
export UiaLookupId(type, pGuid) {
    result := DllCall("UIAutomationCore.dll\UiaLookupId", AutomationIdentifierType, type, Guid.Ptr, pGuid, Int32)
    return result
}

/**
 * Retrieves a reserved value indicating that a Microsoft UI Automation property or a text attribute is not supported.
 * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
 * 
 * Receives the object representing the value.
 *     This parameter is passed uninitialized.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservednotsupportedvalue
 * @since windows5.1.2600
 */
export UiaGetReservedNotSupportedValue() {
    result := DllCall("UIAutomationCore.dll\UiaGetReservedNotSupportedValue", "ptr*", &punkNotSupportedValue := 0, "HRESULT")
    return IUnknown(punkNotSupportedValue)
}

/**
 * Retrieves a reserved value indicating that the value of a Microsoft UI Automation text attribute varies within a text range.
 * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
 * 
 * Receives 
 *     a reserved value specifying that 
 *     an attribute varies over a text range.
 *     This parameter is passed uninitialized.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiagetreservedmixedattributevalue
 * @since windows5.1.2600
 */
export UiaGetReservedMixedAttributeValue() {
    result := DllCall("UIAutomationCore.dll\UiaGetReservedMixedAttributeValue", "ptr*", &punkMixedAttributeValue := 0, "HRESULT")
    return IUnknown(punkMixedAttributeValue)
}

/**
 * Gets a value that indicates whether any client application is subscribed to Microsoft UI Automation events.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if a client has subscribed to events; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening
 * @since windows5.1.2600
 */
export UiaClientsAreListening() {
    result := DllCall("UIAutomationCore.dll\UiaClientsAreListening", BOOL)
    return result
}

/**
 * Called by providers to notify the Microsoft UI Automation core that an element property has changed.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the property change event occurred.
 * @param {UIA_PROPERTY_ID} id Type: <b>PROPERTYID</b>
 * 
 * The identifier for the property that changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
 * @param {VARIANT} oldValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
 * 
 * The old value of the property.
 * @param {VARIANT} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
 * 
 * The new value of the property.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent
 * @since windows5.1.2600
 */
export UiaRaiseAutomationPropertyChangedEvent(pProvider, id, oldValue, newValue) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseAutomationPropertyChangedEvent", "ptr", pProvider, UIA_PROPERTY_ID, id, VARIANT, oldValue, VARIANT, newValue, "HRESULT")
    return result
}

/**
 * Notifies listeners of an event.
 * @remarks
 * This function increments the reference counter of the <i>pProvider</i> interface, and UI Automation decrements the reference counter when the event handers finish processing the event.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider element where the event occurred.
 * @param {UIA_EVENT_ID} id Type: <b>EVENTID</b>
 * 
 * The identifier of the event to be raised. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationevent
 * @since windows5.1.2600
 */
export UiaRaiseAutomationEvent(pProvider, id) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseAutomationEvent", "ptr", pProvider, UIA_EVENT_ID, id, "HRESULT")
    return result
}

/**
 * Called by a provider to notify the Microsoft UI Automation core that the tree structure has changed.
 * @remarks
 * An example of a change in the tree structure is child elements being added to or removed from a list box, or being expanded or collapsed in a tree view.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the tree change occurred.
 * @param {StructureChangeType} _structureChangeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType</a></b>
 * 
 * The type of change that occurred in the tree.
 * @param {Pointer<Integer>} pRuntimeId Type: <b>int*</b>
 * 
 * The runtime IDs for the child elements of the provider node where the tree change occurred. This parameter is used only when <i>structureChangeType</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType_ChildRemoved</a>; it is <b>NULL</b> for all other structure-change events.
 * 
 * <div class="alert"><b>Note</b>  For Windows 7, the array of integers pointed to by <i>pRuntimeId</i> can contain a partial set of IDs that identify only those elements affected by the structure change.</div>
 * @param {Integer} cRuntimeIdLen Type: <b>int</b>
 * 
 * Length of the array of integers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisestructurechangedevent
 * @since windows5.1.2600
 */
export UiaRaiseStructureChangedEvent(pProvider, _structureChangeType, pRuntimeId, cRuntimeIdLen) {
    pRuntimeIdMarshal := pRuntimeId is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaRaiseStructureChangedEvent", "ptr", pProvider, StructureChangeType, _structureChangeType, pRuntimeIdMarshal, pRuntimeId, "int", cRuntimeIdLen, "HRESULT")
    return result
}

/**
 * Called by a provider to notify the Microsoft UI Automation core that content is being loaded asynchronously.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the content is being loaded.
 * @param {AsyncContentLoadedState} _asyncContentLoadedState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a></b>
 * 
 * The current state of loading.
 * @param {Float} percentComplete Type: <b>double</b>
 * 
 * The percentage of content that has been loaded.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseasynccontentloadedevent
 * @since windows5.1.2600
 */
export UiaRaiseAsyncContentLoadedEvent(pProvider, _asyncContentLoadedState, percentComplete) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseAsyncContentLoadedEvent", "ptr", pProvider, AsyncContentLoadedState, _asyncContentLoadedState, "double", percentComplete, "HRESULT")
    return result
}

/**
 * Called by a provider to notify the Microsoft UI Automation core that a text control has programmatically changed text. (UiaRaiseTextEditTextChangedEvent)
 * @remarks
 * This is a helper function for providers that implement <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itexteditprovider">ITextEditProvider</a> and are raising the pattern's required events. Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes when to raise the events and what payload the events should pass to UI Automation.
 * 
 * If there are no clients listening for a particular change type, no event is raised.
 * 
 * The event data should contain different payloads for each change type (per <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a>):
 * 
 * <ul>
 * <li><b>TextEditChangeType_AutoCorrect</b>: <i>pChangedData</i> should be the new corrected string .</li>
 * <li><b>TextEditChangeType_Composition</b>: <i>pChangedData</i> should be the updated string in the composition (only the part that changed).</li>
 * <li><b>TextEditChangeType_CompositionFinalized</b>: <i>pChangedData</i> should be the finalized string of the completed composition (this may be empty if composition was canceled or deleted).</li>
 * </ul>
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the text change occurred.
 * @param {TextEditChangeType} _textEditChangeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a></b>
 * 
 * The type of text-edit change that occurred.
 * @param {Pointer<SAFEARRAY>} pChangedData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithsafearrays">SAFEARRAY</a>*</b>
 * 
 * The event data. Should be assignable as a <b>VAR</b> of type <b>VT_BSTR</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisetextedittextchangedevent
 * @since windows8.1
 */
export UiaRaiseTextEditTextChangedEvent(pProvider, _textEditChangeType, pChangedData) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseTextEditTextChangedEvent", "ptr", pProvider, TextEditChangeType, _textEditChangeType, SAFEARRAY.Ptr, pChangedData, "HRESULT")
    return result
}

/**
 * Called by providers to notify the Microsoft UI Automation core that a change has occurred.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the change event occurred.
 * @param {Integer} eventIdCount The number of changes that occurred. This is the number of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures pointed to by the <i>pUiaChanges</i> parameter.
 * @param {Pointer<UiaChangeInfo>} pUiaChanges A collection of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> value indicating success or failure.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisechangesevent
 * @since windows10.0.10240
 */
export UiaRaiseChangesEvent(pProvider, eventIdCount, pUiaChanges) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseChangesEvent", "ptr", pProvider, "int", eventIdCount, UiaChangeInfo.Ptr, pUiaChanges, "HRESULT")
    return result
}

/**
 * Called by providers to initiate a notification event.
 * @remarks
 * If your window uses the [`WS_POPUP`](/windows/win32/winmsg/window-styles) style, it must also implement the [Window Control Pattern](/windows/win32/winauto/uiauto-implementingwindow) and handle the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message (see [How to Expose a Server-Side UI Automation Provider](/windows/win32/winauto/uiauto-howto-expose-serverside-uiautomation-provider) for more details).
 * @param {IRawElementProviderSimple} provider The provider node where the notification event occurred.
 * @param {NotificationKind} _notificationKind The type of notification, as a [NotificationKind enumeration](../uiautomationcore/ne-uiautomationcore-notificationkind.md) value.
 * @param {NotificationProcessing} _notificationProcessing The preferred way to process a notification, as a [NotificationProcessing enumeration](../uiautomationcore/ne-uiautomationcore-notificationprocessing.md) value.
 * @param {BSTR} displayString A string to display in the notification message.
 * @param {BSTR} activityId A unique non-localized string to identify an action or group of actions. Use this to pass additional information to the event handler.
 * @returns {HRESULT} If this function succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisenotificationevent
 * @since windows10.0.16299
 */
export UiaRaiseNotificationEvent(provider, _notificationKind, _notificationProcessing, displayString, activityId) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseNotificationEvent", "ptr", provider, NotificationKind, _notificationKind, NotificationProcessing, _notificationProcessing, BSTR, displayString, BSTR, activityId, "HRESULT")
    return result
}

/**
 * Called by a provider to notify the Microsoft UI Automation core that a text control has programmatically changed text. (UiaRaiseActiveTextPositionChangedEvent)
 * @param {IRawElementProviderSimple} provider Type: <b><a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider node where the position change within the text occurred.
 * @param {ITextRangeProvider} textRange Type: <b><a href="https://docs.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>*</b>
 * 
 * The text range change that occurred, if applicable.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseactivetextpositionchangedevent
 * @since windows8.1
 */
export UiaRaiseActiveTextPositionChangedEvent(provider, textRange) {
    result := DllCall("UIAutomationCore.dll\UiaRaiseActiveTextPositionChangedEvent", "ptr", provider, "ptr", textRange, "HRESULT")
    return result
}

/**
 * Adds a listener for events on a node in the UI Automation tree.
 * @param {HUIANODE} _hnode Type: <b>HUIANODE</b>
 * 
 * The node to add an event listener to.
 * @param {Integer} eventId Type: <b>EVENTID</b>
 * 
 * The identifier of the event to listen for. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
 * @param {Pointer<Pointer<UiaEventCallback>>} pCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback">UiaEventCallback</a>*</b>
 * 
 * The address of the application-defined <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaeventcallback">UiaEventCallback</a> callback function that is called when the event is raised.
 * @param {TreeScope} scope Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a>*</b>
 * 
 * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> enumerated type indicating the scope of events to be handled; that is, whether they are on the element itself, 
 * 				or on its ancestors and children.
 * @param {Pointer<Integer>} pProperties Type: <b>PROPERTYID*</b>
 * 
 * The address of an array that contains the identifiers of the properties to monitor for change events, when <i>eventId</i> is the EVENTID derived from AutomationPropertyChanged_Event_GUID; otherwise this parameter is <b>NULL</b>. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
 * @param {Integer} cProperties Type: <b>int</b>
 * 
 * The count of elements in the <i>pProperties</i> array.
 * @param {Pointer<UiaCacheRequest>} pRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a>*</b>
 * 
 * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacacherequest">UiaCacheRequest</a> structure that defines the cache request in effect for nodes that are returned with events.
 * @param {Pointer<HUIAEVENT>} phEvent Type: <b>HUIEVENT*</b>
 * 
 * When this function returns, contains 
 * 				a pointer to the event that is added. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent
 * @since windows5.1.2600
 */
export UiaAddEvent(_hnode, eventId, pCallback, scope, pProperties, cProperties, pRequest, phEvent) {
    pCallbackMarshal := pCallback is VarRef ? "ptr*" : "ptr"
    pPropertiesMarshal := pProperties is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\UiaAddEvent", HUIANODE, _hnode, "int", eventId, pCallbackMarshal, pCallback, TreeScope, scope, pPropertiesMarshal, pProperties, "int", cProperties, UiaCacheRequest.Ptr, pRequest, HUIAEVENT.Ptr, phEvent, "HRESULT")
    return result
}

/**
 * Removes a listener for events on a node in the UI Automation tree.
 * @remarks
 * The callback pointer, the scope, the node, and the list of properties must match exactly the parameters that were sent to the 
 * corresponding <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
 * @param {HUIAEVENT} hEvent Type: <b>HUIAEVENT</b>
 * 
 * The event to remove. This value was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaremoveevent
 * @since windows5.1.2600
 */
export UiaRemoveEvent(hEvent) {
    result := DllCall("UIAutomationCore.dll\UiaRemoveEvent", HUIAEVENT, hEvent, "HRESULT")
    return result
}

/**
 * Adds a window to the event listener.
 * @param {HUIAEVENT} hEvent Type: <b>HUIAEVENT</b>
 * 
 * The event being listened for. This event was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle of the window to add.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaeventaddwindow
 * @since windows5.1.2600
 */
export UiaEventAddWindow(hEvent, _hwnd) {
    result := DllCall("UIAutomationCore.dll\UiaEventAddWindow", HUIAEVENT, hEvent, HWND, _hwnd, "HRESULT")
    return result
}

/**
 * Removes a window from the event listener.
 * @param {HUIAEVENT} hEvent Type: <b>HUIAEVENT</b>
 * 
 * The event being listened for. This event was retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaaddevent">UiaAddEvent</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle of the window to remove.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaeventremovewindow
 * @since windows5.1.2600
 */
export UiaEventRemoveWindow(hEvent, _hwnd) {
    result := DllCall("UIAutomationCore.dll\UiaEventRemoveWindow", HUIAEVENT, hEvent, HWND, _hwnd, "HRESULT")
    return result
}

/**
 * Docks the UI Automation element at the requested dockPosition within a docking container.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {DockPosition} _dockPosition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-dockposition">DockPosition</a></b>
 * 
 * The location to dock the control to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-dockpattern_setdockposition
 * @since windows5.1.2600
 */
export DockPattern_SetDockPosition(hobj, _dockPosition) {
    result := DllCall("UIAutomationCore.dll\DockPattern_SetDockPosition", HUIAPATTERNOBJECT, hobj, DockPosition, _dockPosition, "HRESULT")
    return result
}

/**
 * Hides all descendant nodes, controls, or content of the UI Automation element.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_collapse
 * @since windows5.1.2600
 */
export ExpandCollapsePattern_Collapse(hobj) {
    result := DllCall("UIAutomationCore.dll\ExpandCollapsePattern_Collapse", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Expands a control on the screen so that it shows more information.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-expandcollapsepattern_expand
 * @since windows5.1.2600
 */
export ExpandCollapsePattern_Expand(hobj) {
    result := DllCall("UIAutomationCore.dll\ExpandCollapsePattern_Expand", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Gets the node for an item in a grid.
 * @remarks
 * Row 0, column 0 is the first item in a grid.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {Integer} row Type: <b>int</b>
 * 
 * The row of the node being requested.
 * @param {Integer} _column Type: <b>int</b>
 * 
 * The column of the node being requested.
 * @param {Pointer<HUIANODE>} pResult Type: <b>HUIANODE*</b>
 * 
 * When this function returns, contains a pointer to the node for the cell 
 * 				at the specified location. This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-gridpattern_getitem
 * @since windows5.1.2600
 */
export GridPattern_GetItem(hobj, row, _column, pResult) {
    result := DllCall("UIAutomationCore.dll\GridPattern_GetItem", HUIAPATTERNOBJECT, hobj, "int", row, "int", _column, HUIANODE.Ptr, pResult, "HRESULT")
    return result
}

/**
 * Sends a request to activate a control and initiate its single, unambiguous action. (InvokePattern_Invoke)
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-invokepattern_invoke
 * @since windows5.1.2600
 */
export InvokePattern_Invoke(hobj) {
    result := DllCall("UIAutomationCore.dll\InvokePattern_Invoke", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Retrieves the name of a control-specific view. (MultipleViewPattern_GetViewName)
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {Integer} viewId Type: <b>int</b>
 * 
 * The integer identifier for the view.
 * @param {Pointer<BSTR>} ppStr Type: <b>BSTR*</b>
 * 
 * When this function returns, contains a pointer to the string containing the name of the view. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-multipleviewpattern_getviewname
 * @since windows5.1.2600
 */
export MultipleViewPattern_GetViewName(hobj, viewId, ppStr) {
    result := DllCall("UIAutomationCore.dll\MultipleViewPattern_GetViewName", HUIAPATTERNOBJECT, hobj, "int", viewId, BSTR.Ptr, ppStr, "HRESULT")
    return result
}

/**
 * Sets a control to a different layout.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Integer} viewId Type: <b>int</b>
 * 
 * The control-specific identifier for the view.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-multipleviewpattern_setcurrentview
 * @since windows5.1.2600
 */
export MultipleViewPattern_SetCurrentView(hobj, viewId) {
    result := DllCall("UIAutomationCore.dll\MultipleViewPattern_SetCurrentView", HUIAPATTERNOBJECT, hobj, "int", viewId, "HRESULT")
    return result
}

/**
 * Sets the value of a control that has a numerical range.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Float} _val Type: <b>double</b>
 * 
 * The value to set.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-rangevaluepattern_setvalue
 * @since windows5.1.2600
 */
export RangeValuePattern_SetValue(hobj, _val) {
    result := DllCall("UIAutomationCore.dll\RangeValuePattern_SetValue", HUIAPATTERNOBJECT, hobj, "double", _val, "HRESULT")
    return result
}

/**
 * Scrolls the content area of a container object in order to display the UI Automation element within the visible region (viewport) of the container.
 * @remarks
 * This method does not guarantee the position of the UI Automation element 
 *             within the visible region (viewport) of the container.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollitempattern_scrollintoview
 * @since windows5.1.2600
 */
export ScrollItemPattern_ScrollIntoView(hobj) {
    result := DllCall("UIAutomationCore.dll\ScrollItemPattern_ScrollIntoView", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Scrolls the currently visible region of the content area the specified ScrollAmount, horizontally, vertically, or both.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {ScrollAmount} horizontalAmount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-scrollamount">ScrollAmount</a></b>
 * 
 * The amount to scroll the container on the horizontal axis, as a percentage.
 * @param {ScrollAmount} verticalAmount Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-scrollamount">ScrollAmount</a></b>
 * 
 * The amount to scroll the container on the vertical axis, as a percentage.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollpattern_scroll
 * @since windows5.1.2600
 */
export ScrollPattern_Scroll(hobj, horizontalAmount, verticalAmount) {
    result := DllCall("UIAutomationCore.dll\ScrollPattern_Scroll", HUIAPATTERNOBJECT, hobj, ScrollAmount, horizontalAmount, ScrollAmount, verticalAmount, "HRESULT")
    return result
}

/**
 * Scrolls a container to a specific position horizontally, vertically, or both.
 * @remarks
 * The scroll area is normalized to range from 0.0 to 100.0. If the position is set to 0.0, the control 
 * scrolls to the beginning of the 
 * visible region, and if the position is set to 100.0, it  scrolls to the end of the visible region. 
 * Pass -1.0 for the percent parameters if no scrolling occurs on that axis.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Float} horizontalPercent Type: <b>double</b>
 * 
 * The horizontal position to scroll to.
 * @param {Float} verticalPercent Type: <b>double</b>
 * 
 * The vertical position to scroll to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-scrollpattern_setscrollpercent
 * @since windows5.1.2600
 */
export ScrollPattern_SetScrollPercent(hobj, horizontalPercent, verticalPercent) {
    result := DllCall("UIAutomationCore.dll\ScrollPattern_SetScrollPercent", HUIAPATTERNOBJECT, hobj, "double", horizontalPercent, "double", verticalPercent, "HRESULT")
    return result
}

/**
 * Adds an unselected element to a selection in a control.
 * @remarks
 * In a control that supports multiple selection, this function adds an item to the selection. In a single-selection control,
 * it deselects the currently selected item and selects the specified item.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_addtoselection
 * @since windows5.1.2600
 */
export SelectionItemPattern_AddToSelection(hobj) {
    result := DllCall("UIAutomationCore.dll\SelectionItemPattern_AddToSelection", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Removes an element from the selection in a selection container.
 * @remarks
 * The function has no effect if an attempt is made to remove the last selected element in a control that requires at
 * least one element to be selected.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_removefromselection
 * @since windows5.1.2600
 */
export SelectionItemPattern_RemoveFromSelection(hobj) {
    result := DllCall("UIAutomationCore.dll\SelectionItemPattern_RemoveFromSelection", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Selects an element in a selection container.
 * @remarks
 * All other elements are deselected. 
 * To select an element without deselecting others, use <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_addtoselection">SelectionItemPattern_AddToSelection</a>.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-selectionitempattern_select
 * @since windows5.1.2600
 */
export SelectionItemPattern_Select(hobj) {
    result := DllCall("UIAutomationCore.dll\SelectionItemPattern_Select", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Toggles a control to its next supported state.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-togglepattern_toggle
 * @since windows5.1.2600
 */
export TogglePattern_Toggle(hobj) {
    result := DllCall("UIAutomationCore.dll\TogglePattern_Toggle", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Moves an element to a specified location on the screen.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Float} x Type: <b>double</b>
 * 
 * The horizontal screen coordinate to move the element to.
 * @param {Float} y Type: <b>double</b>
 * 
 * The vertical screen coordinate to move the element to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_move
 * @since windows5.1.2600
 */
export TransformPattern_Move(hobj, x, y) {
    result := DllCall("UIAutomationCore.dll\TransformPattern_Move", HUIAPATTERNOBJECT, hobj, "double", x, "double", y, "HRESULT")
    return result
}

/**
 * Resizes an element on the screen.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Float} width Type: <b>double</b>
 * 
 * The width, in pixels, to resize the element to.
 * @param {Float} height Type: <b>double</b>
 * 
 * The height, in pixels, to resize the element to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_resize
 * @since windows5.1.2600
 */
export TransformPattern_Resize(hobj, width, height) {
    result := DllCall("UIAutomationCore.dll\TransformPattern_Resize", HUIAPATTERNOBJECT, hobj, "double", width, "double", height, "HRESULT")
    return result
}

/**
 * Rotates an element on the screen.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Float} degrees Type: <b>double</b>
 * 
 * The number of degrees to rotate the control. 
 * 				Positive values are clockwise; negative values are counterclockwise.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-transformpattern_rotate
 * @since windows5.1.2600
 */
export TransformPattern_Rotate(hobj, degrees) {
    result := DllCall("UIAutomationCore.dll\TransformPattern_Rotate", HUIAPATTERNOBJECT, hobj, "double", degrees, "HRESULT")
    return result
}

/**
 * Sets the text value of an element.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {PWSTR} pVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * The string to set the element's content to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-valuepattern_setvalue
 * @since windows5.1.2600
 */
export ValuePattern_SetValue(hobj, pVal) {
    pVal := pVal is String ? StrPtr(pVal) : pVal

    result := DllCall("UIAutomationCore.dll\ValuePattern_SetValue", HUIAPATTERNOBJECT, hobj, "ptr", pVal, "HRESULT")
    return result
}

/**
 * Closes an open window.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_close
 * @since windows5.1.2600
 */
export WindowPattern_Close(hobj) {
    result := DllCall("UIAutomationCore.dll\WindowPattern_Close", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Sets the visual state of a window; for example, to maximize a window.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {WindowVisualState} state Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-windowvisualstate">WindowVisualState</a></b>
 * 
 * The visual state to set the window to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_setwindowvisualstate
 * @since windows5.1.2600
 */
export WindowPattern_SetWindowVisualState(hobj, state) {
    result := DllCall("UIAutomationCore.dll\WindowPattern_SetWindowVisualState", HUIAPATTERNOBJECT, hobj, WindowVisualState, state, "HRESULT")
    return result
}

/**
 * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first. (WindowPattern_WaitForInputIdle)
 * @remarks
 * This method is typically used in conjunction with the handling of a WindowOpenedEvent 
 *         (<i>Window_WindowOpened_Event_GUID</i>).
 *         The implementation is dependent on the underlying application framework; 
 *         therefore this method may return some time after the window is ready for user input. 
 *         The calling code should not rely on this method to ascertain exactly when the window has become idle. 
 *         Use the value of <i>pResult</i> to determine if the window is ready for input or if the method timed out.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The control pattern object.
 * @param {Integer} milliseconds Type: <b>int</b>
 * 
 * The number of milliseconds to wait before retrieving <i>pResult</i>.
 * @param {Pointer<BOOL>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
 * 
 * <b>TRUE</b> if the window is ready to accept user input; otherwise <b>FALSE</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-windowpattern_waitforinputidle
 * @since windows5.1.2600
 */
export WindowPattern_WaitForInputIdle(hobj, milliseconds, pResult) {
    pResultMarshal := pResult is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\WindowPattern_WaitForInputIdle", HUIAPATTERNOBJECT, hobj, "int", milliseconds, pResultMarshal, pResult, "HRESULT")
    return result
}

/**
 * Gets the current range of selected text from a text container supporting the text pattern.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains 
 * 				the text range spanning the currently selected text in the container. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_getselection
 * @since windows5.1.2600
 */
export TextPattern_GetSelection(hobj, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextPattern_GetSelection", HUIAPATTERNOBJECT, hobj, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Retrieves an array of disjoint text ranges from a text container where each text range begins with the first partially visible line through to the end of the last partially visible line.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains
 * 				an array of text ranges spanning the visible text within the text container. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_getvisibleranges
 * @since windows5.1.2600
 */
export TextPattern_GetVisibleRanges(hobj, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextPattern_GetVisibleRanges", HUIAPATTERNOBJECT, hobj, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Gets the text range that a given node spans.
 * @remarks
 * As an example of how this function might be used, 
 * a client can pass in an embedded hyperlink control and receive the range of text that it spans.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {HUIANODE} hnodeChild Type: <b>HUIANODE</b>
 * 
 * Reference to a node that the client wants the text range for.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains the text range that the node spans. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_rangefromchild
 * @since windows5.1.2600
 */
export TextPattern_RangeFromChild(hobj, hnodeChild, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextPattern_RangeFromChild", HUIAPATTERNOBJECT, hobj, HUIANODE, hnodeChild, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Retrieves the degenerate (empty) text range nearest to the specified screen coordinates. (TextPattern_RangeFromPoint)
 * @remarks
 * A text range that wraps a child object is returned if the screen coordinates are within the coordinates of an image, hyperlink, Microsoft Excel spreadsheet, or other embedded object.
 * 
 * Because hidden text is not ignored, this method retrieves a degenerate range from the visible text closest to the specified coordinates.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {UiaPoint} _point Type: <b>HiaPoint</b>
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiapoint">UiaPoint</a> structure that contains the location in screen coordinates.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains the text range that the node spans. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_rangefrompoint
 * @since windows5.1.2600
 */
export TextPattern_RangeFromPoint(hobj, _point, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextPattern_RangeFromPoint", HUIAPATTERNOBJECT, hobj, UiaPoint, _point, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Gets the text range for the entire document.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains 
 * 				the text range spanning the entire document contents of the text container. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_get_documentrange
 * @since windows5.1.2600
 */
export TextPattern_get_DocumentRange(hobj, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextPattern_get_DocumentRange", HUIAPATTERNOBJECT, hobj, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Ascertains whether the text container's contents can be selected and deselected.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @param {Pointer<SupportedTextSelection>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
 * 
 * When this function returns, contains a value indicating whether the text container can have its contents selected and deselected.
 * 
 * This parameter is passed uninitialized.
 * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/WinProg/windows-data-types)**
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textpattern_get_supportedtextselection
 * @since windows5.1.2600
 */
export TextPattern_get_SupportedTextSelection(hobj, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextPattern_get_SupportedTextSelection", HUIAPATTERNOBJECT, hobj, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Copies a text range.
 * @remarks
 * The method never returns <b>NULL</b> (Nothing in Microsoft Visual Basic .NET).
 * 
 * The new range can be manipulated independently from the original.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUIATEXTRANGE*</b>
 * 
 * When this function returns, contains the copy. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_clone
 * @since windows5.1.2600
 */
export TextRange_Clone(hobj, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_Clone", HUIATEXTRANGE, hobj, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Compares two text ranges.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The first text range to compare.
 * @param {HUIATEXTRANGE} range Type: <b>HUIATEXTRANGE</b>
 * 
 * The second text range to compare.
 * @param {Pointer<BOOL>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
 * 
 * When this function returns, contains <b>TRUE</b> if the two objects span the same text; otherwise <b>FALSE</b>. 
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_compare
 * @since windows5.1.2600
 */
export TextRange_Compare(hobj, range, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_Compare", HUIATEXTRANGE, hobj, HUIATEXTRANGE, range, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Returns a value indicating whether two text ranges have identical endpoints.
 * @remarks
 * The returned value is &lt;0 if the caller's endpoint occurs earlier in the text than the target endpoint; 
 * 			0 if the caller's endpoint is at the same location as the target endpoint; and 
 * 			&gt;0 if the caller's endpoint occurs later in the text than the target endpoint.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {TextPatternRangeEndpoint} endpoint Type: <b>TextPatternRangeEndpoint</b>
 * 
 * The starting or ending endpoint of <i>hobj</i>.
 * @param {HUIATEXTRANGE} targetRange Type: <b>ITextRangeInteropProvider*</b>
 * 
 * The text range that is being compared against.
 * @param {TextPatternRangeEndpoint} targetEndpoint Type: <b>TextPatternRangeEndpoint</b>
 * 
 * The starting or ending endpoint of <i>targetRange</i>.
 * @param {Pointer<Integer>} pRetVal Type: <b>int*</b>
 * 
 * The address of a variable that receives a pointer to a value that indicates whether two text ranges have identical endpoints.
 * 				 This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_compareendpoints
 * @since windows5.1.2600
 */
export TextRange_CompareEndpoints(hobj, endpoint, targetRange, targetEndpoint, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_CompareEndpoints", HUIATEXTRANGE, hobj, TextPatternRangeEndpoint, endpoint, HUIATEXTRANGE, targetRange, TextPatternRangeEndpoint, targetEndpoint, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Expands the text range to a larger or smaller unit such as Character, Word, Line, or Page.
 * @remarks
 * If the range is already an integral number of the specified units, it remains unchanged.
 * 
 * If the starting endpoint is not at a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a> boundary, it is moved backward until it is at a boundary. 
 * 			Subsequently, if the ending endpoint is not at a boundary, or if it is at the same boundary as the starting endpoint, 
 * 			the ending endpoint is moved forward until it is at a boundary.
 * 
 * <div class="alert"><b>Note</b>  It is common for a screen reader to read out a full word, entire paragraph, and so on, 
 * 			at the insertion point or any virtual cursor position.
 * </div>
 * <div> </div>
 * <b>TextRange_ExpandToEnclosingUnit</b> respects both hidden and visible text. The UI Automationclient can check the is-hidden attribute (Text_IsHidden_Attribute_GUID) for text visibility.
 * 
 * <b>TextRange_ExpandToEnclosingUnit</b> defaults up to the next supported <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a> if the given <b>TextUnit</b> is not supported by the control.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {TextUnit} _unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
 * 
 * The unit that the provider must expand the text range to.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_expandtoenclosingunit
 * @since windows5.1.2600
 */
export TextRange_ExpandToEnclosingUnit(hobj, _unit) {
    result := DllCall("UIAutomationCore.dll\TextRange_ExpandToEnclosingUnit", HUIATEXTRANGE, hobj, TextUnit, _unit, "HRESULT")
    return result
}

/**
 * Gets the value of a text attribute for a text range.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Integer} _attributeId Type: <b>TEXTATTRIBUTEID</b>
 * 
 * The text attribute whose value is wanted. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
 * @param {Pointer<VARIANT>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * When this function returns, contains 
 * 				the value of the attribute for the text range.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getattributevalue
 * @since windows5.1.2600
 */
export TextRange_GetAttributeValue(hobj, _attributeId, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_GetAttributeValue", HUIATEXTRANGE, hobj, "int", _attributeId, VARIANT.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Searches in a specified direction for the first piece of text supporting a specified text attribute.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range to search.
 * @param {Integer} _attributeId Type: <b>TEXTATTRIBUTEID</b>
 * 
 * The text attribute to search for. For a list of text attribute IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>.
 * @param {VARIANT} _val Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
 * 
 * The value of the attribute that the client wants to find.
 * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> to search backward, otherwise <b>FALSE</b>.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUITEXTRANGE*</b>
 * 
 * When this function returns, contains 
 * 				the first matching text range.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_findattribute
 * @since windows5.1.2600
 */
export TextRange_FindAttribute(hobj, _attributeId, _val, backward, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_FindAttribute", HUIATEXTRANGE, hobj, "int", _attributeId, VARIANT, _val, BOOL, backward, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Returns the first text range in the specified direction that contains the text the client is searching for.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range to search.
 * @param {BSTR} text Type: <b>BSTR</b>
 * 
 * The string to search for.
 * @param {BOOL} backward Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> to search backward; otherwise <b>FALSE</b>.
 * @param {BOOL} ignoreCase Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> to specify a case-insensitive search; otherwise <b>FALSE</b>.
 * @param {Pointer<HUIATEXTRANGE>} pRetVal Type: <b>HUITEXTRANGE*</b>
 * 
 * When this function returns, contains 
 * 				the text range for the first span of text that matches the string 
 * 				the client is searching for.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_findtext
 * @since windows5.1.2600
 */
export TextRange_FindText(hobj, text, backward, ignoreCase, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_FindText", HUIATEXTRANGE, hobj, BSTR, text, BOOL, backward, BOOL, ignoreCase, HUIATEXTRANGE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Retrieves the minimum number of bounding rectangles that can enclose the range, one rectangle per line.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * When this function returns, contains 
 * 				an array of rectangle coordinates for the lines of text that the range spans. 
 * 				This parameter is passed uninitialized.
 * 				The SAFEARRAY contains VARIANTs of type VT_I4.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getboundingrectangles
 * @since windows5.1.2600
 */
export TextRange_GetBoundingRectangles(hobj, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_GetBoundingRectangles", HUIATEXTRANGE, hobj, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Returns the node for the next smallest provider that covers the range.
 * @remarks
 * The enclosing element is typically the text provider that supplies the text range. However,
 * 		if the text provider supports child elements such as tables or hyperlinks, 
 * 		the enclosing element could be a descendant of the text provider.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Pointer<HUIANODE>} pRetVal Type: <b>HUIANODE*</b>
 * 
 * When this function returns, contains 
 * 				the node for the next smallest element that encloses the range.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getenclosingelement
 * @since windows5.1.2600
 */
export TextRange_GetEnclosingElement(hobj, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_GetEnclosingElement", HUIATEXTRANGE, hobj, HUIANODE.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Returns the text in a text range, up to a specified number of characters.
 * @remarks
 * If <i>maxLength</i> is -1, all of the text within the text range is returned. 
 * If <i>maxLength</i> is larger than the length of the text range, the returned string contains all of the text in the text range.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Integer} maxLength Type: <b>int</b>
 * 
 * The number of characters to return, beginning with the character at the starting endpoint of the text range.
 * @param {Pointer<BSTR>} pRetVal Type: <b>BSTR*</b>
 * 
 * When this function returns, this parameter contains 
 * 				a pointer to the returned text.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_gettext
 * @since windows5.1.2600
 */
export TextRange_GetText(hobj, maxLength, pRetVal) {
    result := DllCall("UIAutomationCore.dll\TextRange_GetText", HUIATEXTRANGE, hobj, "int", maxLength, BSTR.Ptr, pRetVal, "HRESULT")
    return result
}

/**
 * Moves the text range the specified number of units requested by the client.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {TextUnit} _unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
 * 
 * The unit, such as Page, Line, or Word.
 * @param {Integer} count Type: <b>int</b>
 * 
 * The number of units to move. Positive numbers move the range forward, 
 * 				and negative numbers move the range backward.
 * @param {Pointer<Integer>} pRetVal Type: <b>int*</b>
 * 
 * When this function returns, contains 
 * 				the number of units actually moved.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_move
 * @since windows5.1.2600
 */
export TextRange_Move(hobj, _unit, count, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_Move", HUIATEXTRANGE, hobj, TextUnit, _unit, "int", count, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Moves an endpoint of the range the specified number of units.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {TextPatternRangeEndpoint} endpoint Type: <b>TextPatternRangeEndpoint</b>
 * 
 * The endpoint to move (either the start or the end).
 * @param {TextUnit} _unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-textunit">TextUnit</a></b>
 * 
 * The unit, such as Page, Line, or Word.
 * @param {Integer} count Type: <b>int</b>
 * 
 * The number of units to move. A positive value moves the range forward; a negative value
 * 				moves it backward.
 * @param {Pointer<Integer>} pRetVal Type: <b>int*</b>
 * 
 * When this function returns, contains 
 * 				the number of units the endpoint actually moved.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_moveendpointbyunit
 * @since windows5.1.2600
 */
export TextRange_MoveEndpointByUnit(hobj, endpoint, _unit, count, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_MoveEndpointByUnit", HUIATEXTRANGE, hobj, TextPatternRangeEndpoint, endpoint, TextUnit, _unit, "int", count, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Moves an endpoint of one range to the endpoint of another range.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range object whose endpoint is to move.
 * @param {TextPatternRangeEndpoint} endpoint Type: <b>TextPatternRangeEndpoint</b>
 * 
 * The endpoint to move (either the start or the end).
 * @param {HUIATEXTRANGE} targetRange Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range that contains the target endpoint.
 * @param {TextPatternRangeEndpoint} targetEndpoint Type: <b>TextPatternRangeEndpoint</b>
 * 
 * The target endpoint to move to (either the start or the end).
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_moveendpointbyrange
 * @since windows5.1.2600
 */
export TextRange_MoveEndpointByRange(hobj, endpoint, targetRange, targetEndpoint) {
    result := DllCall("UIAutomationCore.dll\TextRange_MoveEndpointByRange", HUIATEXTRANGE, hobj, TextPatternRangeEndpoint, endpoint, HUIATEXTRANGE, targetRange, TextPatternRangeEndpoint, targetEndpoint, "HRESULT")
    return result
}

/**
 * Selects a text range.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_select
 * @since windows5.1.2600
 */
export TextRange_Select(hobj) {
    result := DllCall("UIAutomationCore.dll\TextRange_Select", HUIATEXTRANGE, hobj, "HRESULT")
    return result
}

/**
 * Adds to the existing collection of highlighted text in a text container that supports multiple, disjoint selections by highlighting supplementary text corresponding to the calling text range Start and End endpoints.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_addtoselection
 * @since windows5.1.2600
 */
export TextRange_AddToSelection(hobj) {
    result := DllCall("UIAutomationCore.dll\TextRange_AddToSelection", HUIATEXTRANGE, hobj, "HRESULT")
    return result
}

/**
 * Removes the selected text, corresponding to the calling text range TextPatternRangeEndpoint_Start and TextPatternRangeEndpoint_End endpoints, from an existing collection of selected text in a text container that supports multiple, disjoint selections.
 * @remarks
 * The text insertion point will move to the area of the new selection.
 *             
 * 
 * Providing a degenerate text range will move the text insertion point.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_removefromselection
 * @since windows5.1.2600
 */
export TextRange_RemoveFromSelection(hobj) {
    result := DllCall("UIAutomationCore.dll\TextRange_RemoveFromSelection", HUIATEXTRANGE, hobj, "HRESULT")
    return result
}

/**
 * Scrolls the text so the specified range is visible in the viewport.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range to scroll.
 * @param {BOOL} alignToTop Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * TRUE to align the top of the text range with the top of the viewport; 
 * 				FALSE to align the bottom of the text range with the bottom of the viewport.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_scrollintoview
 * @since windows5.1.2600
 */
export TextRange_ScrollIntoView(hobj, alignToTop) {
    result := DllCall("UIAutomationCore.dll\TextRange_ScrollIntoView", HUIATEXTRANGE, hobj, BOOL, alignToTop, "HRESULT")
    return result
}

/**
 * Returns all UI Automation elements contained within the specified text range.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * A text range object.
 * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
 * 
 * When this function returns, contains 
 * 				an array of nodes that are children of the text range in the UI Automation tree.
 * 				This parameter is passed uninitialized.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-textrange_getchildren
 * @since windows5.1.2600
 */
export TextRange_GetChildren(hobj, pRetVal) {
    pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

    result := DllCall("UIAutomationCore.dll\TextRange_GetChildren", HUIATEXTRANGE, hobj, pRetValMarshal, pRetVal, "HRESULT")
    return result
}

/**
 * Retrieves a node within a containing node, based on a specified property value.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {HUIANODE} hnodeStartAfter Type: <b>HUIANODE</b>
 * 
 * The node after which to start the search.
 * @param {Integer} propertyId Type: <b>PROPERTYID</b>
 * 
 * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
 * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
 * 
 * The value of the <i>propertyId</i> property.
 * @param {Pointer<HUIANODE>} pFound Type: <b>HUIANODE*</b>
 * 
 * The node of the matching element.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-itemcontainerpattern_finditembyproperty
 * @since windows6.1
 */
export ItemContainerPattern_FindItemByProperty(hobj, hnodeStartAfter, propertyId, value, pFound) {
    result := DllCall("UIAutomationCore.dll\ItemContainerPattern_FindItemByProperty", HUIAPATTERNOBJECT, hobj, HUIANODE, hnodeStartAfter, "int", propertyId, VARIANT, value, HUIANODE.Ptr, pFound, "HRESULT")
    return result
}

/**
 * Performs a Microsoft Active Accessibility selection. (LegacyIAccessiblePattern_Select)
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {Integer} flagsSelect Type: <b>long</b>
 * 
 * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the values described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_select
 * @since windows6.1
 */
export LegacyIAccessiblePattern_Select(hobj, flagsSelect) {
    result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_Select", HUIAPATTERNOBJECT, hobj, "int", flagsSelect, "HRESULT")
    return result
}

/**
 * Performs the Microsoft Active Accessibility default action for the element. (LegacyIAccessiblePattern_DoDefaultAction)
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_dodefaultaction
 * @since windows6.1
 */
export LegacyIAccessiblePattern_DoDefaultAction(hobj) {
    result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_DoDefaultAction", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Sets the Microsoft Active Accessibility value property for the node.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {PWSTR} szValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * A localized string that contains the value.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_setvalue
 * @since windows6.1
 */
export LegacyIAccessiblePattern_SetValue(hobj, szValue) {
    szValue := szValue is String ? StrPtr(szValue) : szValue

    result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_SetValue", HUIAPATTERNOBJECT, hobj, "ptr", szValue, "HRESULT")
    return result
}

/**
 * Retrieves an IAccessible object that corresponds to the UI Automation element.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * A control pattern object.
 * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
 * 
 * The address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for the accessible object.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-legacyiaccessiblepattern_getiaccessible
 * @since windows6.1
 */
export LegacyIAccessiblePattern_GetIAccessible(hobj) {
    result := DllCall("UIAutomationCore.dll\LegacyIAccessiblePattern_GetIAccessible", HUIAPATTERNOBJECT, hobj, "ptr*", &pAccessible := 0, "HRESULT")
    return IAccessible(pAccessible)
}

/**
 * Causes the UI Automation provider to start listening for mouse or keyboard input.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @param {SynchronizedInputType} inputType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a></b>
 * 
 * A combination of values from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype">SynchronizedInputType</a> enumerated type specifying the type of input for which to listen.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-synchronizedinputpattern_startlistening
 * @since windows6.1
 */
export SynchronizedInputPattern_StartListening(hobj, inputType) {
    result := DllCall("UIAutomationCore.dll\SynchronizedInputPattern_StartListening", HUIAPATTERNOBJECT, hobj, SynchronizedInputType, inputType, "HRESULT")
    return result
}

/**
 * Causes the UI Automation provider to stop listening for mouse or keyboard input.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-synchronizedinputpattern_cancel
 * @since windows6.1
 */
export SynchronizedInputPattern_Cancel(hobj) {
    result := DllCall("UIAutomationCore.dll\SynchronizedInputPattern_Cancel", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Makes the virtual item fully accessible as a UI Automation element. (VirtualizedItemPattern_Realize)
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The <i>control pattern</i> object.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful or an error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-virtualizeditempattern_realize
 * @since windows6.1
 */
export VirtualizedItemPattern_Realize(hobj) {
    result := DllCall("UIAutomationCore.dll\VirtualizedItemPattern_Realize", HUIAPATTERNOBJECT, hobj, "HRESULT")
    return result
}

/**
 * Deletes an allocated pattern object from memory.
 * @param {HUIAPATTERNOBJECT} hobj Type: <b>HUIAPATTERNOBJECT</b>
 * 
 * The pattern object to be deleted.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if the pattern was successfully deleted; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiapatternrelease
 * @since windows5.1.2600
 */
export UiaPatternRelease(hobj) {
    result := DllCall("UIAutomationCore.dll\UiaPatternRelease", HUIAPATTERNOBJECT, hobj, BOOL)
    return result
}

/**
 * Deletes an allocated text range object from memory.
 * @param {HUIATEXTRANGE} hobj Type: <b>HUIATEXTRANGE</b>
 * 
 * The text range object to be deleted.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if object was deleted; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiatextrangerelease
 * @since windows5.1.2600
 */
export UiaTextRangeRelease(hobj) {
    result := DllCall("UIAutomationCore.dll\UiaTextRangeRelease", HUIATEXTRANGE, hobj, BOOL)
    return result
}

/**
 * Gets an interface to the UI Automation provider for a window.
 * @remarks
 * This function is called by a control when it receives the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message, to provide UI Automation with the UI Automation provider for the control. The control should pass the <i>wParam</i> and <i>lParam</i> parameters to the <b>UiaReturnRawElementProvider</b> function without filtering them first, because filtering can cause problems with Microsoft Active Accessibility clients. The control's window procedure should return the result of calling <b>UiaReturnRawElementProvider</b>.
 * 
 * When Microsoft Active Accessibility clients are listening to events raised by a UI Automation provider, UI Automation maintains a map of the providers that have raised events. When the Microsoft Active Accessibility clients request further information, UI Automation uses the map to route the requests to the appropriate providers. When a window that previously returned providers has been destroyed, you should notify UI Automation by calling the <b>UiaReturnRawElementProvider</b> function as follows: <c>UiaReturnRawElementProvider(hwnd, 0, 0, NULL)</c>. This call tells UI Automation that it can safely remove all map entries that refer to the specified window. This call can save memory because it releases references to the providers being held by the raised-event map. The function returns zero when called with these special parameters. Microsoft recommends making this call from the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-destroy">WM_DESTROY</a> message handler of the window that returns the UI Automation providers.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle of the window containing the element served by the provider.
 * @param {WPARAM} _wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
 * 
 * The <i>wParam</i> argument of the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * The <i>lParam</i> argument of the [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message.
 * @param {IRawElementProviderSimple} el Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The UI Automation provider.
 * @returns {LRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LRESULT</a></b>
 * 
 * The key for the client process to connect to the server process through UI Automation.
 * 
 * This function returns zero when it is used to notify UI Automation that it is safe to remove the provider raised-event map. For more information, see Remarks.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider
 * @since windows5.1.2600
 */
export UiaReturnRawElementProvider(_hwnd, _wParam, _lParam, el) {
    result := DllCall("UIAutomationCore.dll\UiaReturnRawElementProvider", HWND, _hwnd, WPARAM, _wParam, LPARAM, _lParam, "ptr", el, LRESULT)
    return result
}

/**
 * Gets the host provider for a window.
 * @remarks
 * The object retrieved by this function is useful only for responding to calls to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple-get_hostrawelementprovider">IRawElementProviderSimple::get_HostRawElementProvider</a> method. You cannot use the object to raise events, provide properties, and so on.  If you need to raise events or provide properties, you must create a provider object that fully implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The window containing the element served by the provider.
 * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
 * 
 * The host provider for the window.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahostproviderfromhwnd
 * @since windows5.1.2600
 */
export UiaHostProviderFromHwnd(_hwnd) {
    result := DllCall("UIAutomationCore.dll\UiaHostProviderFromHwnd", HWND, _hwnd, "ptr*", &ppProvider := 0, "HRESULT")
    return IRawElementProviderSimple(ppProvider)
}

/**
 * Gets the provider for the entire non-client area of a window, or for a control in the non-client area of a window.
 * @remarks
 * This function returns the default Microsoft UI Automation provider for the non-client area of a window.  UI Automation supports the non-client area without any explicit help from the window. You can override and customize the support by using the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface that is retrieved by this function.  
 * 
 * This function is particularly useful when you use it with the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-provideroptions">ProviderOptions_RefuseNonClientSupport</a> flag, which disables the UI Automation default provider for the non-client area so that the window can supply  its own provider.
 * 
 * 
 * 
 * The supported object IDs for controls in the non-client area include <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_WINDOW</a><a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">, OBJID_VSCROLL</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_HSCROLL</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_TITLEBAR</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_MENU</a>, and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_SIZEGRIP</a>.  For <b>OBJID_TITLEBAR</b>, use the child ID to distinguish between the entire title bar and the buttons that it contains.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The window that owns the non-client area or non-client control.
 * @param {Integer} idObject Type: <b>long</b>
 * 
 * The object identifier of the non-client control, or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_WINDOW</a> for the entire non-client area. For a list of possible values, see <b>Object Identifiers</b>.
 * @param {Integer} idChild Type: <b>long</b>
 * 
 * The child identifier of the non-client control.
 * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
 * 
 * Receives the provider for the non-client area or non-client control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaproviderfornonclient
 * @since windows8.0
 */
export UiaProviderForNonClient(_hwnd, idObject, idChild) {
    result := DllCall("UIAutomationCore.dll\UiaProviderForNonClient", HWND, _hwnd, "int", idObject, "int", idChild, "ptr*", &ppProvider := 0, "HRESULT")
    return IRawElementProviderSimple(ppProvider)
}

/**
 * Retrieves an IAccessible implementation that provides Microsoft Active Accessibility data on behalf of a Microsoft UI Automation provider.
 * @remarks
 * In most cases, this function retrieves a wrapper object, provided by Windows, that implements <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> on behalf of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> object.  If the provided <b>IRawElementProviderSimple</b> pointer is itself a wrapper object, this function retrieves the wrapped <b>IAccessible</b> pointer and returns that instead, to prevent the creation of multiple layers of wrappers.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * A pointer to the UI Automation object.
 * @param {Integer} dwFlags Type: <b>DWORD</b>
 * @param {Pointer<VARIANT>} pvarChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>*</b>
 * 
 * Receives the child identifier of the accessible element in the <b>lVal</b> member.
 * @returns {IAccessible} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
 * 
 * Receives the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> implementation for the provider.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaiaccessiblefromprovider
 * @since windows8.0
 */
export UiaIAccessibleFromProvider(pProvider, dwFlags, pvarChild) {
    result := DllCall("UIAutomationCore.dll\UiaIAccessibleFromProvider", "ptr", pProvider, "uint", dwFlags, "ptr*", &ppAccessible := 0, VARIANT.Ptr, pvarChild, "HRESULT")
    return IAccessible(ppAccessible)
}

/**
 * Creates a Microsoft UI Automation provider based on the specified Microsoft Active Accessibility object.
 * @remarks
 * UI Automation provides backward compatibility for Microsoft Active Accessibility providers by supplying a proxy for them, called the Microsoft Active Accessibility to UI Automation proxy.  This proxy is created automatically when a window responds to a [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a Microsoft Active Accessibility provider.  Use <b>UiaProviderFromIAccessible</b> when you need to create a Microsoft Active Accessibility to UI Automation proxy manually; for example, when implementing the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> interface.  
 * 
 * Some properties, such as LabeledBy, must be expressed as a UI Automation provider.  An <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> provider can use <b>UiaProviderFromIAccessible</b> to wrap an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> object to return it as the value of the LabeledBy property.
 * @param {IAccessible} pAccessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>*</b>
 * 
 * A pointer to the Microsoft Active Accessibility object.
 * @param {Integer} idChild Type: <b>long</b>
 * 
 * The child ID of the Microsoft Active Accessibility object.
 * @param {Integer} dwFlags Type: <b>DWORD</b>
 * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
 * 
 * The new UI Automation provider.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaproviderfromiaccessible
 * @since windows8.0
 */
export UiaProviderFromIAccessible(pAccessible, idChild, dwFlags) {
    result := DllCall("UIAutomationCore.dll\UiaProviderFromIAccessible", "ptr", pAccessible, "int", idChild, "uint", dwFlags, "ptr*", &ppProvider := 0, "HRESULT")
    return IRawElementProviderSimple(ppProvider)
}

/**
 * Releases all Microsoft UI Automation resources that are held by all providers associated with the calling process.
 * @remarks
 * A provider application should use this function to release UI Automation resources before shutting down.
 * 
 * This function cannot be called in response to a call to the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-sendmessage">SendMessage</a> function. An application cannot make outbound Component Object Model (COM) calls in response to a call to <b>SendMessage</b>, and releasing a provider is typically an outbound COM call.  The <b>UiaDisconnectAllProviders</b> function returns RPC_E_CANTCALLOUT_ININPUTSYNCCALL if the function is called in response to a <b>SendMessage</b> call.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insendmessageex">InSendMessageEx</a> function to determine whether a particular message is being handled in response to a <b>SendMessage</b> call.
 * 
 * 
 * An application that calls <b>UiaDisconnectAllProviders</b> should not respond to a re-entrant [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a pointer to the provider that it is trying to disconnect.  If the application tries to disconnect a provider, but then calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider">UiaReturnRawElementProvider</a> function with that same provider during the disconnect attempt, the provider might not be fully disconnected.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiadisconnectallproviders
 * @since windows8.0
 */
export UiaDisconnectAllProviders() {
    result := DllCall("UIAutomationCore.dll\UiaDisconnectAllProviders", "HRESULT")
    return result
}

/**
 * Releases all references that a particular provider holds to Microsoft UI Automation objects.
 * @remarks
 * A provider should call this function to clean up UI Automation resources that are associated with a UI element that was destroyed.  The DLL  associated with the UI element can be safely unloaded after the function returns.
 * 
 * After this function returns, all client requests that are associated with the disconnected provider receive the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-error-codes">UIA_E_ELEMENTNOTAVAILABLE</a> 
 * error code.
 * 
 * This function cannot be called in response to a call to the <a href="https://docs.microsoft.com/windows/desktop/DevNotes/-sendmessage">SendMessage</a> function. An application cannot make outbound Component Object Model (COM) calls in response to a call to <b>SendMessage</b>, and releasing a provider is typically an outbound COM call.  The <b>UiaDisconnectProvider</b> function returns RPC_E_CANTCALLOUT_ININPUTSYNCCALL if the function is called in response to a <b>SendMessage</b> call.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insendmessageex">InSendMessageEx</a> function to determine whether a particular message is being handled in response to a <b>SendMessage</b> call.
 * 
 * 
 * An application that calls <b>UiaDisconnectProvider</b> should not respond to a re-entrant [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message by returning a pointer to the provider that it is trying to disconnect.  If the application tries to disconnect a provider, but then calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiareturnrawelementprovider">UiaReturnRawElementProvider</a> function with that same provider during the disconnect attempt, the provider might not be fully disconnected.
 * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
 * 
 * The provider to be disconnected.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiadisconnectprovider
 * @since windows8.0
 */
export UiaDisconnectProvider(pProvider) {
    result := DllCall("UIAutomationCore.dll\UiaDisconnectProvider", "ptr", pProvider, "HRESULT")
    return result
}

/**
 * Ascertains whether a window has a Microsoft UI Automation provider implementation.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle of the window.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if the window has a UI Automation provider implementation; otherwise <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiahasserversideprovider
 * @since windows5.1.2600
 */
export UiaHasServerSideProvider(_hwnd) {
    result := DllCall("UIAutomationCore.dll\UiaHasServerSideProvider", HWND, _hwnd, BOOL)
    return result
}

/**
 * Allows the caller to register a target window to which all pointer input of the specified type is redirected.
 * @remarks
 * An application with the UI Access privilege can use this function to register its own window to receive all input of the specified pointer input type. Each desktop allows only one such global redirection target window for each pointer input type at any given time. The first window to successfully register remains in effect until the window is unregistered or destroyed, at which point the role is available to the next qualified caller.
 * 
 * While the registration is in effect, all input of the specified pointer type, whether from an input device or injected by an application, is redirected to the registered window. However, when the process that owns the registered window injects input of the specified pointer type, such injected is not redirected but is instead processed normally.
 * 
 * An application that wishes to register the same window as a global redirection target for multiple pointer input types must call the <b>RegisterPointerInputTarget</b> function multiple times, once for each pointer input type of interest.
 * 
 * If the calling thread does not have the UI Access privilege, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
 * 
 * If the specified pointer input type is not valid, this function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * If the calling thread does not own the specified window, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
 * 
 * If the specified window’s desktop already has a registered global redirection target for the specified pointer input type, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
 * @param {HWND} _hwnd The window to register as a global redirection target.
 * 
 * Redirection can cause the foreground window to lose activation (focus). To avoid this, ensure the window is a message-only window or has the <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">WS_EX_NOACTIVATE</a> style set.
 * @param {POINTER_INPUT_TYPE} pointerType Type of pointer input to be redirected to the specified  window. This is any valid and supported value from the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a> enumeration. Note that the generic <b>PT_POINTER</b> type and the <b>PT_MOUSE</b> type are not valid in this parameter.
 * @returns {BOOL} If the function succeeds, the return value is non-zero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerpointerinputtarget
 * @since windows8.0
 */
export RegisterPointerInputTarget(_hwnd, pointerType) {
    A_LastError := 0

    result := DllCall("USER32.dll\RegisterPointerInputTarget", HWND, _hwnd, POINTER_INPUT_TYPE, pointerType, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Allows the caller to unregister a target window to which all pointer input of the specified type is redirected.
 * @remarks
 * An application that has successfully called the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerpointerinputtarget">RegisterPointerInputTarget</a> function can call this function to un-register the window from the role of global redirected target for the specified pointer type.
 * 
 * An application that has registered the same window as a global redirection target for multiple pointer input types can call the <b>UnregisterPointerInputTarget</b> to un-register the window for one of those types while leaving the window registered for the remaining types.
 * 
 * If the calling thread does not have the UI Access privilege, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
 * 
 * If the specified pointer input type is not valid, this function fails with the last error set to <b>ERROR_INVALID_PARAMETER</b>.
 * 
 * If the calling thread does not own the specified window, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
 * 
 * If the specified window is not the registered global redirection target for the specified pointer input type on its desktop, this function takes no action and returns success.
 * @param {HWND} _hwnd Window to be un-registered as a global redirection target on its desktop.
 * @param {POINTER_INPUT_TYPE} pointerType Type of pointer input to no longer be redirected to the specified window. This is any valid and supported value from the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE </a> enumeration. Note that the generic <b>PT_POINTER</b> type and the<b> PT_MOUSE</b> type are not valid in this parameter.
 * @returns {BOOL} If the function succeeds, the return value is non-zero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unregisterpointerinputtarget
 * @since windows8.0
 */
export UnregisterPointerInputTarget(_hwnd, pointerType) {
    A_LastError := 0

    result := DllCall("USER32.dll\UnregisterPointerInputTarget", HWND, _hwnd, POINTER_INPUT_TYPE, pointerType, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * RegisterPointerInputTargetEx may be altered or unavailable. Instead, use RegisterPointerInputTarget.
 * @param {HWND} _hwnd Not supported.
 * @param {POINTER_INPUT_TYPE} pointerType Not supported.
 * @param {BOOL} fObserve Not supported.
 * @returns {BOOL} Not supported.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerpointerinputtargetex
 * @since windows10.0.10240
 */
export RegisterPointerInputTargetEx(_hwnd, pointerType, fObserve) {
    result := DllCall("USER32.dll\RegisterPointerInputTargetEx", HWND, _hwnd, POINTER_INPUT_TYPE, pointerType, BOOL, fObserve, BOOL)
    return result
}

/**
 * UnregisterPointerInputTargetEx may be altered or unavailable. Instead, use UnregisterPointerInputTarget.
 * @param {HWND} _hwnd Not supported.
 * @param {POINTER_INPUT_TYPE} pointerType Not supported.
 * @returns {BOOL} Not supported.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unregisterpointerinputtargetex
 * @since windows10.0.10240
 */
export UnregisterPointerInputTargetEx(_hwnd, pointerType) {
    result := DllCall("USER32.dll\UnregisterPointerInputTargetEx", HWND, _hwnd, POINTER_INPUT_TYPE, pointerType, BOOL)
    return result
}

/**
 * Signals the system that a predefined event occurred. If any client applications have registered a hook function for the event, the system calls the client's hook function.
 * @remarks
 * Servers call this function to notify the system that an event has occurred. Microsoft Active Accessibility checks to see if any client applications have set hook procedures for the event and, if so, calls the appropriate hook procedures.
 * 
 * If no hook procedures are registered for the event, the performance penalty for calling this function is minor.
 * 
 * Servers call <b>NotifyWinEvent</b> to announce the event to the system after the event has occurred; they must never notify the system of an event before the event has occurred.
 * 
 * When the client's hook procedure is called, it receives a number of parameters that describe the event and the object that generated the event. The hook procedure uses the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-accessibleobjectfromevent">AccessibleObjectFromEvent</a> function to retrieve a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface of the object that generated the event.
 * 
 * Servers may receive a [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) message immediately after calling this function. This can happen if there are any in-context clients that call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-accessibleobjectfromevent">AccessibleObjectFromEvent</a> in the event callback.
 * 
 * When servers call this function, they must be ready to handle [WM_GETOBJECT](/windows/win32/winauto/wm-getobject), return an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface pointer, and handle any of the <b>IAccessible</b> methods.
 * 
 * <b>Note to Server Developers:  </b>When you call <b>NotifyWinEvent</b>, if any clients are listening for that event in-context, their event handlers, which typically send [WM_GETOBJECT](/windows/win32/winauto/wm-getobject) and call <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> methods, will execute before <b>NotifyWinEvent</b> returns. When you call <b>NotifyWinEvent</b>, you should be prepared to handle these calls, if they occur. If you need to do extra setup to allow for this, you should do so before you call <b>NotifyWinEvent</b>, not after.
 * @param {Integer} event Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the event that occurred. This value must be one of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">event constants</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the window that contains the object that generated the event.
 * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Identifies the object that generated the event. This value is either one of the predefined <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">object identifiers</a> or a custom object ID value.
 * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Identifies whether the event was generated by an object or by a child element of the object. If this value is CHILDID_SELF, the event was generated by the object itself. If not CHILDID_SELF, this value is the child ID of the element that generated the event.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-notifywinevent
 * @since windows5.0
 */
export NotifyWinEvent(event, _hwnd, idObject, idChild) {
    DllCall("USER32.dll\NotifyWinEvent", "uint", event, HWND, _hwnd, "int", idObject, "int", idChild)
}

/**
 * Sets an event hook function for a range of events.
 * @remarks
 * This function allows clients to specify which processes and threads they are interested in.
 * 
 * If the <i>idProcess</i> parameter is nonzero and <i>idThread</i> is zero, the hook function receives the specified events from all threads in that process. If the <i>idProcess</i> parameter is zero and <i>idThread</i> is nonzero, the hook function receives the specified events only from the thread specified by <i>idThread</i>. If both are zero, the hook function receives the specified events from all threads and processes.
 * 
 * Clients can call <b>SetWinEventHook</b> multiple times if they want to register additional hook functions or listen for additional events.
 * 
 * The client thread that calls <b>SetWinEventHook</b> must have a message loop in order to receive events.
 * 
 * When you use <b>SetWinEventHook</b> to set a callback in managed code, you should use the <a href="https://docs.microsoft.com/dotnet/api/system.runtime.interopservices.gchandle">GCHandle</a> structure to avoid exceptions. This tells the garbage collector not to move the callback.
 * 
 * For out-of-context events, the event is delivered on the same thread that called <b>SetWinEventHook</b>. In some situations, even if you request WINEVENT_INCONTEXT events, the events will still be delivered out-of-context. These scenarios include events from console windows and events from processes that have a different bit-depth (64 bit versus 32 bits) than the caller. 
 * 
 * 
 * 
 * While a hook function processes an event, additional events may be triggered, which may cause the hook function to reenter before the processing for the original event is finished. The problem with reentrancy in hook functions is that events are completed out of sequence unless the hook function handles this situation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/guarding-against-reentrancy-in-hook-functions">Guarding Against Reentrancy</a>.
 * 
 * <b>Windows Store app development</b> If dwFlags is WINEVENT_INCONTEXT AND (idProcess = 0 | idThread = 0), then window hook DLLs are not loaded in-process for the Windows Store app processes and the Windows Runtime broker process unless they are installed by UIAccess processes (accessibility tools). The notification is delivered on the installer's thread.
 * 
 * This behavior is similar to what happens when there is an architecture mismatch between the hook DLL and the target application process, for example, when the hook DLL is 32-bit and the application process 64-bit.
 * @param {Integer} eventMin Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Specifies the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">event constant</a> for the lowest event value in the range of events that are handled by the hook function. This parameter can be set to <b>EVENT_MIN</b> to indicate the lowest possible event value.
 * @param {Integer} eventMax Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Specifies the event constant for the highest event value in the range of events that are handled by the hook function. This parameter can be  set to <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">EVENT_MAX</a> to indicate the highest possible event value.
 * @param {HMODULE} hmodWinEventProc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
 * 
 * Handle to the DLL that contains the hook function at <i>lpfnWinEventProc</i>, if the WINEVENT_INCONTEXT flag is specified in the <i>dwFlags</i> parameter. If the hook function is not located in a DLL, or if the WINEVENT_OUTOFCONTEXT flag is specified, this parameter is <b>NULL</b>.
 * @param {Pointer<WINEVENTPROC>} pfnWinEventProc Type: <b>WINEVENTPROC</b>
 * 
 * Pointer to the event hook function. For more information about this function, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-wineventproc">WinEventProc</a>.
 * @param {Integer} idProcess Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the ID of the process from which the hook function receives events. Specify zero (0) to receive events from all processes on the current desktop.
 * @param {Integer} idThread Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the ID of the thread from which the hook function receives events. If this parameter is zero, the hook function is associated with all existing threads on the current desktop.
 * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * 
 * Flag values that specify the location of the hook function and of the events to be skipped. The following flags are valid:
 * 			 
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINEVENT_INCONTEXT"></a><a id="winevent_incontext"></a><dl>
 * <dt><b>WINEVENT_INCONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The DLL that contains the callback function is mapped into the address space of the process that generates the event. With this flag, the system sends event notifications to the callback function as they occur. The hook function must be in a DLL when this flag is specified. This flag has no effect when both the calling process and the generating process are not 32-bit or 64-bit processes, or when the generating process is a console application. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/in-context-hook-functions">In-Context Hook Functions</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINEVENT_OUTOFCONTEXT"></a><a id="winevent_outofcontext"></a><dl>
 * <dt><b>WINEVENT_OUTOFCONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callback function is not mapped into the address space of the process that generates the event. Because the hook function is called across process boundaries, the system must queue events. Although this method is asynchronous, events are guaranteed to be in sequential order. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/out-of-context-hook-functions">Out-of-Context Hook Functions</a>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINEVENT_SKIPOWNPROCESS"></a><a id="winevent_skipownprocess"></a><dl>
 * <dt><b>WINEVENT_SKIPOWNPROCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Prevents this instance of the hook from receiving the events that are generated by threads in this process. This flag does not prevent threads from generating events.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="WINEVENT_SKIPOWNTHREAD"></a><a id="winevent_skipownthread"></a><dl>
 * <dt><b>WINEVENT_SKIPOWNTHREAD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Prevents this instance of the hook from receiving the events that are generated by the thread that is registering this hook.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following flag combinations are valid:
 * 
 * <ul>
 * <li>WINEVENT_INCONTEXT | WINEVENT_SKIPOWNPROCESS</li>
 * <li>WINEVENT_INCONTEXT | WINEVENT_SKIPOWNTHREAD</li>
 * <li>WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNPROCESS</li>
 * <li>WINEVENT_OUTOFCONTEXT | WINEVENT_SKIPOWNTHREAD</li>
 * </ul>
 * Additionally, client applications can specify WINEVENT_INCONTEXT, or WINEVENT_OUTOFCONTEXT alone.
 * 
 * See Remarks section for information on Windows Store app development.
 * @returns {HWINEVENTHOOK} Type: <b>HWINEVENTHOOK</b>
 * 
 * If successful, returns an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/hwineventhook">HWINEVENTHOOK</a> value that identifies this event hook instance. Applications save this return value to use it with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-unhookwinevent">UnhookWinEvent</a> function.
 * 
 * If unsuccessful, returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setwineventhook
 * @since windows5.0
 */
export SetWinEventHook(eventMin, eventMax, hmodWinEventProc, pfnWinEventProc, idProcess, idThread, dwFlags) {
    result := DllCall("USER32.dll\SetWinEventHook", "uint", eventMin, "uint", eventMax, HMODULE, hmodWinEventProc, "ptr", pfnWinEventProc, "uint", idProcess, "uint", idThread, "uint", dwFlags, HWINEVENTHOOK.Owned)
    return result
}

/**
 * Determines whether there is an installed WinEvent hook that might be notified of a specified event.
 * @remarks
 * This method is guaranteed to never return a false negative. If this method returns <b>FALSE</b>, it means that no hooks in the system would be notified of the event. However, this method may return a false positive. In other words, it may return <b>TRUE</b> even though there are no hooks that would be notified. Thus, it is safe for components to circumvent some work if this method returns <b>FALSE</b>. 
 * 
 * Event hooks can be installed at any time, so server developers should not cache the return value for long periods of time.
 * @param {Integer} event Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * The event constant that hooks might be notified of. The function checks whether there is an installed hook for this event constant.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If there is a hook to be notified of the specified event, the return value is <b>TRUE</b>.
 * 
 * If there are no hooks to be notified of the specified event, the return value is <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-iswineventhookinstalled
 * @since windows5.1.2600
 */
export IsWinEventHookInstalled(event) {
    result := DllCall("USER32.dll\IsWinEventHookInstalled", "uint", event, BOOL)
    return result
}

/**
 * Removes an event hook function created by a previous call to SetWinEventHook.
 * @remarks
 * This function removes the event hook specified by <i>hWinEventHook</i> that prevents the corresponding callback function from receiving further event notifications. If the client's thread ends, the system automatically calls this function.
 * 
 * Call this function from the same thread that installed the event hook. <b>UnhookWinEvent</b> fails if called from a thread different from the call that corresponds to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.
 * 
 * If WINEVENT_INCONTEXT was specified when this event hook was installed, the system attempts to unload the corresponding DLL from all processes that loaded it. Although unloading does not occur immediately, the hook function is not called after <b>UnhookWinEvent</b> returns. For more information on WINEVENT_INCONTEXT, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/in-context-hook-functions">In-Context Hook Functions</a>.
 * @param {HWINEVENTHOOK} _hWinEventHook Type: <b>HWINEVENTHOOK</b>
 * 
 * Handle to the event hook returned in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If successful, returns <b>TRUE</b>; otherwise, returns <b>FALSE</b>.
 * 
 * Three common errors cause this function to fail:
 * 
 * <ul>
 * <li>The <i>hWinEventHook</i> parameter is <b>NULL</b> or not valid.</li>
 * <li>The event hook specified by <i>hWinEventHook</i> was already removed.</li>
 * <li><b>UnhookWinEvent</b> is called from a thread that is different from the original call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setwineventhook">SetWinEventHook</a>.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-unhookwinevent
 * @since windows5.0
 */
export UnhookWinEvent(_hWinEventHook) {
    result := DllCall("USER32.dll\UnhookWinEvent", HWINEVENTHOOK, _hWinEventHook, BOOL)
    return result
}

;@endregion Functions
