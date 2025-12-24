#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * Exposes methods and properties that make a user interface element and its children accessible to client applications.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccessible
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessible extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessible
     * @type {Guid}
     */
    static IID => Guid("{618736e0-3c3d-11cf-810c-00aa00389b71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_accParent", "get_accChildCount", "get_accChild", "get_accName", "get_accValue", "get_accDescription", "get_accRole", "get_accState", "get_accHelp", "get_accHelpTopic", "get_accKeyboardShortcut", "get_accFocus", "get_accSelection", "get_accDefaultAction", "accSelect", "accLocation", "accNavigate", "accHitTest", "accDoDefaultAction", "put_accName", "put_accValue"]

    /**
     * @type {IDispatch} 
     */
    accParent {
        get => this.get_accParent()
    }

    /**
     * @type {Integer} 
     */
    accChildCount {
        get => this.get_accChildCount()
    }

    /**
     * @type {VARIANT} 
     */
    accFocus {
        get => this.get_accFocus()
    }

    /**
     * @type {VARIANT} 
     */
    accSelection {
        get => this.get_accSelection()
    }

    /**
     * The IAccessible::get_accParent method retrieves the IDispatch of the object's parent. All objects support this property.
     * @returns {IDispatch} Type: <b>IDispatch**</b>
     * 
     *  Receives the address of the parent object's <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface. If no parent exists or if the child cannot access its parent, the variable is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accparent
     */
    get_accParent() {
        result := ComCall(7, this, "ptr*", &ppdispParent := 0, "HRESULT")
        return IDispatch(ppdispParent)
    }

    /**
     * The IAccessible::get_accChildCount method retrieves the number of children that belong to this object. All objects must support this property.
     * @returns {Integer} Type: <b>long*</b>
     * 
     *  Address of a variable that receives the number of children that belong to this object. The children are accessible objects or child elements. If the object has no children, this value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accchildcount
     */
    get_accChildCount() {
        result := ComCall(8, this, "int*", &pcountChildren := 0, "HRESULT")
        return pcountChildren
    }

    /**
     * The IAccessible::get_accChild method retrieves an IDispatch for the specified child, if one exists. All objects must support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Identifies the child whose <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface is retrieved. For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {IDispatch} Type: <b>IDispatch**</b>
     * 
     * [out, retval] Receives the address of the child object's <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accchild
     */
    get_accChild(varChild) {
        result := ComCall(9, this, "ptr", varChild, "ptr*", &ppdispChild := 0, "HRESULT")
        return IDispatch(ppdispChild)
    }

    /**
     * The IAccessible::get_accName method retrieves the name of the specified object. All objects support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved name belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Address of a <b>BSTR</b> that receives a string that contains the specified object's name.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accname
     */
    get_accName(varChild) {
        pszName := BSTR()
        result := ComCall(10, this, "ptr", varChild, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * The IAccessible::get_accValue method retrieves the value of the specified object. Not all objects have a value.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved value information belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     *  Address of the <b>BSTR</b> that receives a localized string that contains the object's current value.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accvalue
     */
    get_accValue(varChild) {
        pszValue := BSTR()
        result := ComCall(11, this, "ptr", varChild, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * The IAccessible::get_accDescription method retrieves a string that describes the visual appearance of the specified object. Not all objects have a description.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved description belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     *  Address of a <b>BSTR</b> that receives a localized string that describes the specified object, or <b>NULL</b> if this object has no description.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accdescription
     */
    get_accDescription(varChild) {
        pszDescription := BSTR()
        result := ComCall(12, this, "ptr", varChild, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * The IAccessible::get_accRole method retrieves information that describes the role of the specified object. All objects support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved role information belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> that receives an <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-roles">object role</a> constant. The <b>vt</b> member must be VT_I4. The <b>lVal</b> member receives an object role constant.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accrole
     */
    get_accRole(varChild) {
        pvarRole := VARIANT()
        result := ComCall(13, this, "ptr", varChild, "ptr", pvarRole, "HRESULT")
        return pvarRole
    }

    /**
     * The IAccessible::get_accState method retrieves the current state of the specified object. All objects support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved state information belongs to the object or of one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a> that receives information that describes the object's state. The <b>vt</b> member is VT_I4, and the <b>lVal</b> member is one or more of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">object state constants</a>.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accstate
     */
    get_accState(varChild) {
        pvarState := VARIANT()
        result := ComCall(14, this, "ptr", varChild, "ptr", pvarState, "HRESULT")
        return pvarState
    }

    /**
     * The IAccessible::get_accHelp method retrieves the Help property string of an object. Not all objects support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved help information belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about one of the object's child elements). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * [out, retval] Address of a <b>BSTR</b> that receives the localized string that contains the help information for the specified object, or <b>NULL</b> if no help information is available.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_acchelp
     */
    get_accHelp(varChild) {
        pszHelp := BSTR()
        result := ComCall(15, this, "ptr", varChild, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * The IAccessible::get_accHelpTopic method retrieves the full path of the WinHelp file that is associated with the specified object; it also retrieves the identifier of the appropriate topic within that file.
     * @param {Pointer<BSTR>} pszHelpFile Type: <b>BSTR*</b>
     * 
     * Address of a <b>BSTR</b> that receives the full path of the WinHelp file that is associated with the specified object.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved Help topic belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain a Help topic for the object) or a child ID (to obtain a Help topic for one of the object's child elements). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * [out, retval] Address of a variable that identifies the Help file topic associated with the specified object. This value is used as the context identifier of the desired topic that passes to the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-winhelpa">WinHelp</a> function. When calling <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-winhelpa">WinHelp</a> to display the topic, set the <i>uCommand</i> parameter to HELP_CONTEXT, cast the value pointed to by <i>pidTopic</i> to a <b>DWORD</b>, and pass it as the <i>dwData</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_acchelptopic
     */
    get_accHelpTopic(pszHelpFile, varChild) {
        result := ComCall(16, this, "ptr", pszHelpFile, "ptr", varChild, "int*", &pidTopic := 0, "HRESULT")
        return pidTopic
    }

    /**
     * The IAccessible::get_accKeyboardShortcut method retrieves the specified object's shortcut key or access key, also known as the mnemonic. All objects that have a shortcut key or an access key support this property.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved keyboard shortcut belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     *  Address of a <b>BSTR</b> that receives a localized string that identifies the keyboard shortcut, or <b>NULL</b> if no keyboard shortcut is associated with the specified object.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_acckeyboardshortcut
     */
    get_accKeyboardShortcut(varChild) {
        pszKeyboardShortcut := BSTR()
        result := ComCall(17, this, "ptr", varChild, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * The IAccessible::get_accFocus method retrieves the object that has the keyboard focus. All objects that may receive the keyboard focus must support this property.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a> that receives information about the object that has the focus. The following table describes the information returned in <i>pvarID</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_EMPTY"></a><a id="vt_empty"></a><dl>
     * <dt><b>VT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None. Neither this object nor any of its children has the keyboard focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_I4"></a><a id="vt_i4"></a><dl>
     * <dt><b>VT_I4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>lVal</b> is CHILDID_SELF. The object itself has the keyboard focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_I4"></a><a id="vt_i4"></a><dl>
     * <dt><b>VT_I4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>lVal</b> contains the child ID of the child element that has the keyboard focus.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_DISPATCH"></a><a id="vt_dispatch"></a><dl>
     * <dt><b>VT_DISPATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>pdispVal</b> member is the address of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch interface</a> for the child object that has the keyboard focus.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accfocus
     */
    get_accFocus() {
        pvarChild := VARIANT()
        result := ComCall(18, this, "ptr", pvarChild, "HRESULT")
        return pvarChild
    }

    /**
     * The IAccessible::get_accSelection method retrieves the selected children of this object. All objects that support selection must support this property.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a> that receives information about which children are selected. The following table describes the information returned in <i>pvarChildren</i>.
     * 
     * <table>
     * <tr>
     * <th>vt member</th>
     * <th>Value member</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_EMPTY"></a><a id="vt_empty"></a><dl>
     * <dt><b>VT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No children are selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_DISPATCH"></a><a id="vt_dispatch"></a><dl>
     * <dt><b>VT_DISPATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One child object is selected, and the address of its <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a> interface is set in the <b>pdispVal</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_I4"></a><a id="vt_i4"></a><dl>
     * <dt><b>VT_I4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>lVal</b> contains the child ID of the child element that is selected. If <b>lVal</b> is CHILDID_SELF, this means that the object itself is selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_UNKNOWN"></a><a id="vt_unknown"></a><dl>
     * <dt><b>VT_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Multiple child objects are selected, and the <b>punkVal</b> member contains the address of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. The client queries this interface for the <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface, which it uses to enumerate the selected objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accselection
     */
    get_accSelection() {
        pvarChildren := VARIANT()
        result := ComCall(19, this, "ptr", pvarChildren, "HRESULT")
        return pvarChildren
    }

    /**
     * The IAccessible::get_accDefaultAction method retrieves a string that indicates the object's default action. Not all objects have a default action.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the retrieved default action is performed by the object or of one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Address of a <b>BSTR</b> that receives a localized string that describes the default action for the specified object; if this object has no default action, the value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-get_accdefaultaction
     */
    get_accDefaultAction(varChild) {
        pszDefaultAction := BSTR()
        result := ComCall(20, this, "ptr", varChild, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * The IAccessible::accSelect method modifies the selection or moves the keyboard focus of the specified object. All objects that support selection or receive the keyboard focus must support this method.
     * @param {Integer} flagsSelect Type: <b>long</b>
     * 
     * Specifies which selection or focus operations are to be performed. This parameter must have a combination of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/selflag">SELFLAG Constants</a>.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies the selected object. If the value is CHILDID_SELF, the object itself is selected; if a child ID, one of the object's child elements is selected. For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the values in the table that follows, or another standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object is not selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid. This return value means that the specified SELFLAG combination is not valid, or that the SELFLAG value does not make sense for the specified object. For example, the following flags are not allowed on a single-selection list box: <a href="/windows/desktop/WinAuto/selflag">SELFLAG_EXTENDSELECTION</a>, <a href="/windows/desktop/WinAuto/selflag">SELFLAG_ADDSELECTION</a>, and <a href="/windows/desktop/WinAuto/selflag">SELFLAG_REMOVESELECTION</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-accselect
     */
    accSelect(flagsSelect, varChild) {
        result := ComCall(21, this, "int", flagsSelect, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * The IAccessible::accLocation method retrieves the specified object's current screen location. All visual objects must support this method. Sound objects do not support this method.
     * @param {Pointer<Integer>} pxLeft Type: <b>long*</b>
     * 
     * Address, in physical screen coordinates, of the variable that receives the x-coordinate of the upper-left boundary of the object's location.
     * @param {Pointer<Integer>} pyTop Type: <b>long*</b>
     * 
     * Address, in physical screen coordinates, of the variable that receives the y-coordinate of the upper-left boundary of the object's location.
     * @param {Pointer<Integer>} pcxWidth Type: <b>long*</b>
     * 
     * Address, in pixels, of the variable that receives the object's width.
     * @param {Pointer<Integer>} pcyHeight Type: <b>long*</b>
     * 
     * Address, in pixels, of the variable that receives the object's height.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the location that the server returns should be that of the object or that of one of the object's child elements. This parameter is either CHILDID_SELF (to obtain information about the object) or a child ID (to obtain information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK. Clients must always check that output parameters contain valid values.
     * 
     * If not successful, returns one of the values in the table that follows, or another standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>. For more information, see <a href="/windows/desktop/WinAuto/checking-iaccessible-return-values">Checking IAccessible Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-acclocation
     */
    accLocation(pxLeft, pyTop, pcxWidth, pcyHeight, varChild) {
        pxLeftMarshal := pxLeft is VarRef ? "int*" : "ptr"
        pyTopMarshal := pyTop is VarRef ? "int*" : "ptr"
        pcxWidthMarshal := pcxWidth is VarRef ? "int*" : "ptr"
        pcyHeightMarshal := pcyHeight is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pxLeftMarshal, pxLeft, pyTopMarshal, pyTop, pcxWidthMarshal, pcxWidth, pcyHeightMarshal, pcyHeight, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * The IAccessible::accNavigate method traverses to another UI element within a container and retrieves the object. This method is optional.
     * @param {Integer} navDir Type: <b>long</b>
     * 
     * Specifies the direction to navigate. This direction is in <i>spatial</i> order, such as left or right, or <i>logical</i> order, such as next or previous. This value is one of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/navigation-constants">navigation constants</a>.
     * @param {VARIANT} varStart Type: <b>VARIANT</b>
     * 
     * Specifies whether the starting object of the navigation is the object itself or one of the object's children. This parameter is either CHILDID_SELF (to start from the object) or a child ID (to start from one of the object's child elements). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * [out, retval] Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> structure that receives information about the destination object. The following table describes the information that is returned in <i>pvarEnd</i>.
     * 
     * <table>
     * <tr>
     * <th>vt member</th>
     * <th>Value member</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_EMPTY"></a><a id="vt_empty"></a><dl>
     * <dt><b>VT_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None. There was no UI element in the specified direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_I4"></a><a id="vt_i4"></a><dl>
     * <dt><b>VT_I4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>lVal</b> contains the child ID of the UI element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VT_DISPATCH"></a><a id="vt_dispatch"></a><dl>
     * <dt><b>VT_DISPATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>pdispVal</b> contains the address of the UI element's <a href="https://docs.microsoft.com/windows/desktop/WinAuto/idispatch-interface">IDispatch</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-accnavigate
     */
    accNavigate(navDir, varStart) {
        pvarEndUpAt := VARIANT()
        result := ComCall(23, this, "int", navDir, "ptr", varStart, "ptr", pvarEndUpAt, "HRESULT")
        return pvarEndUpAt
    }

    /**
     * The IAccessible::accHitTest method retrieves the child element or child object that is displayed at a specific point on the screen.
     * @param {Integer} xLeft Type: <b>long</b>
     * 
     * Specifies the screen coordinates of the point that is hit tested. The x-coordinates increase from left to right. Note that when screen coordinates are used, the origin is the upper-left corner of the screen.
     * @param {Integer} yTop Type: <b>long</b>
     * 
     * Specifies the screen coordinates of the point that is hit tested. The y-coordinates increase from top to bottom. Note that when screen coordinates are used, the origin is the upper-left corner of the screen.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * [out, retval] Address of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> that identifies the object displayed at the point specified by <i>xLeft</i> and <i>yTop</i>. The information returned in <i>pvarID</i> depends on the location of the specified point in relation to the object whose <b>accHitTest</b> method is being called.
     * 
     * <table>
     * <tr>
     * <th>Point location</th>
     * <th>vt member</th>
     * <th>Value member</th>
     * </tr>
     * <tr>
     * <td>Outside of the object's boundaries, and either inside or outside of the object's bounding rectangle.</td>
     * <td>VT_EMPTY</td>
     * <td>None.</td>
     * </tr>
     * <tr>
     * <td>Within the object but not within a child element or a child object.</td>
     * <td>VT_I4</td>
     * <td><b>lVal</b> is CHILDID_SELF.</td>
     * </tr>
     * <tr>
     * <td>Within a child element.</td>
     * <td>VT_I4</td>
     * <td><b>lVal</b> contains the child ID.</td>
     * </tr>
     * <tr>
     * <td>Within a child object.</td>
     * <td>VT_DISPATCH</td>
     * <td><i>pdispVal</i> is set to the child object's <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-acchittest
     */
    accHitTest(xLeft, yTop) {
        pvarChild := VARIANT()
        result := ComCall(24, this, "int", xLeft, "int", yTop, "ptr", pvarChild, "HRESULT")
        return pvarChild
    }

    /**
     * The IAccessible::accDoDefaultAction method performs the specified object's default action. Not all objects have a default action.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the default action belongs to the object or one of the object's child elements. For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the values in the table that follows, or another standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support the method. This value is returned for controls that do not perform actions, such as edit fields.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-accdodefaultaction
     */
    accDoDefaultAction(varChild) {
        result := ComCall(25, this, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * The IAccessible::put_accName method is no longer supported. Client applications should use a control-specific workaround, such as the SetWindowText function. Servers should return E_NOTIMPL.
     * @param {VARIANT} varChild Not supported.
     * @param {BSTR} szName Not supported.
     * @returns {HRESULT} Not supported.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-put_accname
     */
    put_accName(varChild, szName) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(26, this, "ptr", varChild, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * The IAccessible::put_accValue method sets the value of the specified object. Not all objects have a value.
     * @param {VARIANT} varChild Type: <b>VARIANT</b>
     * 
     * Specifies whether the value information being set belongs to the object or one of the object's child elements. This parameter is either CHILDID_SELF (to set information on the object) or a child ID (to set information about the object's child element). For more information about initializing the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT structure</a>, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/how-child-ids-are-used-in-parameters">How Child IDs Are Used in Parameters</a>.
     * @param {BSTR} szValue Type: <b>BSTR</b>
     * 
     * A localized string that contains the object's value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * If not successful, returns one of the values in the table that follows, or another standard <a href="/windows/desktop/WinAuto/return-values">COM error code</a>. Servers return these values, but clients must always check output parameters to ensure that they contain valid values. For more information, see <a href="/windows/desktop/WinAuto/checking-iaccessible-return-values">Checking IAccessible Return Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DISP_E_MEMBERNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccessible-put_accvalue
     */
    put_accValue(varChild, szValue) {
        szValue := szValue is String ? BSTR.Alloc(szValue).Value : szValue

        result := ComCall(27, this, "ptr", varChild, "ptr", szValue, "HRESULT")
        return result
    }
}
