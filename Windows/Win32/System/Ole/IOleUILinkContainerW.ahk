#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by containers and used by OLE common dialog boxes. It supports these dialog boxes by providing the methods needed to manage a container's links.
 * @remarks
 * 
 * > [!NOTE]
 * > The oledlg.h header defines IOleUILinkContainer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuilinkcontainerw
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
     * Enumerates the links in a container.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. This value is only passed to other methods on this interface, so it can be any value that uniquely identifies a link to the container. Containers frequently use the pointer to the link's container site object for this value.
     * @returns {Integer} Returns a container's link identifiers in sequence; <b>NULL</b> if it has returned the last link.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-getnextlink
     */
    GetNextLink(dwLink) {
        result := ComCall(3, this, "uint", dwLink, "uint")
        return result
    }

    /**
     * Sets a link's update options to automatic or manual.
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
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-setlinkupdateoptions
     */
    SetLinkUpdateOptions(dwLink, dwUpdateOpt) {
        result := ComCall(4, this, "uint", dwLink, "uint", dwUpdateOpt, "HRESULT")
        return result
    }

    /**
     * Determines the current update options for a link.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @returns {Integer} A pointer to the location that the current update options will be written.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-getlinkupdateoptions
     */
    GetLinkUpdateOptions(dwLink) {
        result := ComCall(5, this, "uint", dwLink, "uint*", &lpdwUpdateOpt := 0, "HRESULT")
        return lpdwUpdateOpt
    }

    /**
     * Changes the source of a link.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. See <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getnextlink">IOleUILinkContainer::GetNextLink</a>.
     * @param {PWSTR} lpszDisplayName Pointer to new source string to be parsed.
     * @param {Integer} lenFileName Length of the leading file name portion of the <i>lpszDisplayName</i> string. If the link source is not stored in a file, then <i>lenFileName</i> should be 0. For OLE links, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname">IOleLink::GetSourceDisplayName</a>.
     * @param {BOOL} fValidateSource <b>TRUE</b> if the moniker should be validated; for OLE links, <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> should be called. <b>FALSE</b> if the moniker should not be validated. If possible, the link should accept the unvalidated source, and mark itself as unavailable.
     * @returns {Integer} Pointer to the number of characters successfully parsed in <i>lpszDisplayName</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-setlinksource
     */
    SetLinkSource(dwLink, lpszDisplayName, lenFileName, fValidateSource) {
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName

        result := ComCall(6, this, "uint", dwLink, "ptr", lpszDisplayName, "uint", lenFileName, "uint*", &pchEaten := 0, "int", fValidateSource, "HRESULT")
        return pchEaten
    }

    /**
     * Retrieves information about a link that can be displayed in the Links dialog box.
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
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-getlinksource
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
     * Opens the link's source.
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
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-openlinksource
     */
    OpenLinkSource(dwLink) {
        result := ComCall(8, this, "uint", dwLink, "HRESULT")
        return result
    }

    /**
     * Forces selected links to connect to their source and retrieve current information.
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
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-updatelink
     */
    UpdateLink(dwLink, fErrorMessage, fReserved) {
        result := ComCall(9, this, "uint", dwLink, "int", fErrorMessage, "int", fReserved, "HRESULT")
        return result
    }

    /**
     * Disconnects the selected links.
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
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuilinkcontainerw-cancellink
     */
    CancelLink(dwLink) {
        result := ComCall(10, this, "uint", dwLink, "HRESULT")
        return result
    }
}
