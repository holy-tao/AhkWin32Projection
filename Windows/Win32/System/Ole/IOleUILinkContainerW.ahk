#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by containers and used by OLE common dialog boxes. It supports these dialog boxes by providing the methods needed to manage a container's links. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines IOleUILinkContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/nn-oledlg-ioleuilinkcontainerw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class IOleUILinkContainerW extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextLink", "SetLinkUpdateOptions", "GetLinkUpdateOptions", "SetLinkSource", "GetLinkSource", "OpenLinkSource", "UpdateLink", "CancelLink"]

    /**
     * Enumerates the links in a container. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method to enumerate the links in a container. If the value passed in <i>dwLink</i> is <b>NULL</b>, then the container should return the first link's identifier. If <i>dwLink</i> identifies the last link in the container, then the container should return <b>NULL</b>.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. This value is only passed to other methods on this interface, so it can be any value that uniquely identifies a link to the container. Containers frequently use the pointer to the link's container site object for this value.
     * @returns {Integer} Returns a container's link identifiers in sequence; <b>NULL</b> if it has returned the last link.
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getnextlink
     */
    GetNextLink(dwLink) {
        result := ComCall(3, this, "uint", dwLink, "uint")
        return result
    }

    /**
     * Sets a link's update options to automatic or manual. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Containers can implement this method for OLE links by simply calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setupdateoptions">IOleLink::SetUpdateOptions</a> on the link object.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @param {Integer} dwUpdateOpt Update options, which can be automatic (OLEUPDATE_ALWAYS) or manual (OLEUPDATE_ONCALL).
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-setlinkupdateoptions
     */
    SetLinkUpdateOptions(dwLink, dwUpdateOpt) {
        result := ComCall(4, this, "uint", dwLink, "uint", dwUpdateOpt, "HRESULT")
        return result
    }

    /**
     * Determines the current update options for a link. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Containers can implement this method for OLE links simply by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setupdateoptions">IOleLink::SetUpdateOptions</a> on the link object.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @returns {Integer} A pointer to the location that the current update options will be written.
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getlinkupdateoptions
     */
    GetLinkUpdateOptions(dwLink) {
        result := ComCall(5, this, "uint", dwLink, "uint*", &lpdwUpdateOpt := 0, "HRESULT")
        return lpdwUpdateOpt
    }

    /**
     * Changes the source of a link. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method from the <b>Change Source</b> dialog box, with <i>fValidateSource</i> initially set to <b>TRUE</b>. <b>Change Source</b> can be called directly or from the <b>Links</b> dialog box. If this call to <b>IOleUILinkContainer::SetLinkSource</b> returns an error (e.g., <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> failed because the source was unavailable), then you should display an <b>Invalid Link Source</b> message, and the user should be allowed to decide whether to fix the source. If the user chooses to fix the source, then the user should be returned to the <b>Change Source</b> dialog box with the invalid portion of the input string highlighted. If the user chooses not to fix the source, then <b>IOleUILinkContainer::SetLinkSource</b> should be called a second time with <i>fValidateSource</i> set to <b>FALSE</b>, and the user should be returned to the <b>Links</b> dialog box with the link marked <b>Unavailable</b>.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @param {PWSTR} lpszDisplayName Pointer to new source string to be parsed.
     * @param {Integer} lenFileName Length of the leading file name portion of the <i>lpszDisplayName</i> string. If the link source is not stored in a file, then <i>lenFileName</i> should be 0. For OLE links, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname">IOleLink::GetSourceDisplayName</a>.
     * @param {BOOL} fValidateSource <b>TRUE</b> if the moniker should be validated; for OLE links, <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> should be called. <b>FALSE</b> if the moniker should not be validated. If possible, the link should accept the unvalidated source, and mark itself as unavailable.
     * @returns {Integer} Pointer to the number of characters successfully parsed in <i>lpszDisplayName</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-setlinksource
     */
    SetLinkSource(dwLink, lpszDisplayName, lenFileName, fValidateSource) {
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName

        result := ComCall(6, this, "uint", dwLink, "ptr", lpszDisplayName, "uint", lenFileName, "uint*", &pchEaten := 0, "int", fValidateSource, "HRESULT")
        return pchEaten
    }

    /**
     * Retrieves information about a link that can be displayed in the Links dialog box. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method during dialog box initialization, after returning from the <b>Change Source</b> dialog box.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @param {Pointer<PWSTR>} lplpszDisplayName Address of a pointer variable that receives a pointer to the full display name string for the link source. The <b>Links</b> dialog box will free this string.
     * @param {Pointer<Integer>} lplenFileName Pointer to the length of the leading file name portion of the <i>lplpszDisplayName</i> string. If the link source is not stored in a file, then <i>lplenFileName</i> should be 0. For OLE links, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname">IOleLink::GetSourceDisplayName</a>.
     * @param {Pointer<PWSTR>} lplpszFullLinkType Address of a pointer variable that receives a pointer to the full link type string that is displayed at the bottom of the <b>Links</b> dialog box. The caller allocates this string. The <b>Links</b> dialog box will free this string. For OLE links, this should be the full User Type name. Use <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a>, specifying USERCLASSTYPE_FULL for <i>dwFormOfType</i>.
     * @param {Pointer<PWSTR>} lplpszShortLinkType Address of a pointer variable that receives a pointer to the short link type string that is displayed in the listbox of the <b>Links</b> dialog box. The caller allocates this string. The <b>Links</b> dialog box will free this string. For OLE links, this should be the short user type name. Use <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a>, specifying USERCLASSTYPE_SHORT for <i>dwFormOfType</i>.
     * @param {Pointer<BOOL>} lpfSourceAvailable Pointer that returns <b>FALSE</b> if it is known that a link is unavailable since the link is to some known but unavailable document. Certain options, such as <b>Update Now</b>, are disabled (grayed in the user interface) for such cases.
     * @param {Pointer<BOOL>} lpfIsSelected Pointer to a variable that tells the <b>Edit Links</b> dialog box that this link's entry should be selected in the dialog's multi-selection listbox. <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> calls this method at least once for each item to be placed in the links list. If none of them return <b>TRUE</b>, then none of them will be selected when the dialog box is first displayed. If all of them return <b>TRUE</b>, then all will be displayed. That is, it returns <b>TRUE</b> if this link is currently part of the selection in the underlying document, <b>FALSE</b> if not. Any links that are selected in the underlying document are selected in the dialog box; this way, the user can select a set of links and use the dialog box to update them or change their source(s) simultaneously.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-getlinksource
     */
    GetLinkSource(dwLink, lplpszDisplayName, lplenFileName, lplpszFullLinkType, lplpszShortLinkType, lpfSourceAvailable, lpfIsSelected) {
        lplpszDisplayNameMarshal := lplpszDisplayName is VarRef ? "ptr*" : "ptr"
        lplenFileNameMarshal := lplenFileName is VarRef ? "uint*" : "ptr"
        lplpszFullLinkTypeMarshal := lplpszFullLinkType is VarRef ? "ptr*" : "ptr"
        lplpszShortLinkTypeMarshal := lplpszShortLinkType is VarRef ? "ptr*" : "ptr"
        lpfSourceAvailableMarshal := lpfSourceAvailable is VarRef ? "int*" : "ptr"
        lpfIsSelectedMarshal := lpfIsSelected is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", dwLink, lplpszDisplayNameMarshal, lplpszDisplayName, lplenFileNameMarshal, lplenFileName, lplpszFullLinkTypeMarshal, lplpszFullLinkType, lplpszShortLinkTypeMarshal, lplpszShortLinkType, lpfSourceAvailableMarshal, lpfSourceAvailable, lpfIsSelectedMarshal, lpfIsSelected, "HRESULT")
        return result
    }

    /**
     * Opens the link's source. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <b>IOleUILinkContainer::OpenLinkSource</b> method is called when the <b>Open Source</b> button is selected from the <b>Links</b> dialog box. For OLE links, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a>, specifying OLEIVERB_SHOW for <i>iVerb</i>.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-openlinksource
     */
    OpenLinkSource(dwLink) {
        result := ComCall(8, this, "uint", dwLink, "HRESULT")
        return result
    }

    /**
     * Forces selected links to connect to their source and retrieve current information. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method with <i>fErrorMessage</i> set to <b>TRUE</b> in cases where the user expressly presses a button to have a link updated, that is, presses the links' <b>Update Now</b> button. Call it with <b>FALSE</b> in cases where the container should never display an error message, that is, where a large set of operations are being performed and the error should be propagated back to the user later, as might occur with the <b>Update links</b> progress meter. Rather than providing one message for each failure, assuming there are failures, provide a single message for all failures at the end of the operation.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * For OLE links, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-update">IOleObject::Update</a>.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     * @param {BOOL} fErrorMessage Determines whether the caller (implementer of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a>) should show an error message upon failure to update a link. The <b>Update Links</b> dialog box sets this to <b>FALSE</b>. The <b>Object Properties</b> and <b>Links</b> dialog boxes set it to <b>TRUE</b>.
     * @param {BOOL} fReserved This parameter is reserved and must be set to <b>FALSE</b>.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-updatelink
     */
    UpdateLink(dwLink, fErrorMessage, fReserved) {
        result := ComCall(9, this, "uint", dwLink, "int", fErrorMessage, "int", fReserved, "HRESULT")
        return result
    }

    /**
     * Disconnects the selected links. (Unicode)
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call <b>IOleUILinkContainer::CancelLink</b> when the user selects the <b>Break Link</b> button from the <b>Links</b> dialog box. The link should be converted to a picture. The <b>Links</b> dialog box will not be dismissed for OLE links.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * For OLE links, <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatestaticfromdata">OleCreateStaticFromData</a> can be used to create a static picture object using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface of the link as the source.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkcontainerw-cancellink
     */
    CancelLink(dwLink) {
        result := ComCall(10, this, "uint", dwLink, "HRESULT")
        return result
    }
}
