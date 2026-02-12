#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a linked object to provide its container with functions pertaining to linking.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-iolelink
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleLink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleLink
     * @type {Guid}
     */
    static IID => Guid("{0000011d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUpdateOptions", "GetUpdateOptions", "SetSourceMoniker", "GetSourceMoniker", "SetSourceDisplayName", "GetSourceDisplayName", "BindToSource", "BindIfRunning", "GetBoundSource", "UnbindSource", "Update"]

    /**
     * Specifies how often a linked object should update its cached data.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application should call <b>IOleLink::SetUpdateOptions</b> when the end user changes the update option for a linked object.
     * 
     * The end user selects the update option for a linked object using the <b>Links</b> dialog box. If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display this dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-setlinkupdateoptions">IOleUILinkContainer::SetLinkUpdateOptions</a> method to specify the update option chosen by the end user. Your implementation of this method should call the <b>IOleLink::SetUpdateOptions</b> method to pass the selected option to the linked object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The default update option is OLEUDPATE_ALWAYS. The linked object's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> saves the current update option.
     * 
     * If OLEUDPATE_ALWAYS is specified as the update option, the linked object updates the link's caches in the following situations:
     * 
     * <ul>
     * <li>When the update option is changed from manual to automatic, if the link source is running.</li>
     * <li>Whenever the linked object binds to the link source.</li>
     * <li>Whenever the link source is running and the linked object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onsave">IAdviseSink::OnSave</a> implementations are called.</li>
     * </ul>
     * For both manual and automatic links, the linked object updates the cache whenever the container application calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-update">IOleObject::Update</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-update">IOleLink::Update</a>.
     * @param {Integer} dwUpdateOpt Specifies how often a linked object should update its cached data. The possible values for <i>dwUpdateOpt</i> are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleupdate">OLEUPDATE</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied value is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-setupdateoptions
     */
    SetUpdateOptions(dwUpdateOpt) {
        result := ComCall(3, this, "uint", dwUpdateOpt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a value indicating how often the linked object updates its cached data.
     * @returns {Integer} A pointer to a variable that receives the current value for the linked object's update option, indicating how often the linked object updates the cached data for the linked object. The possible values for <i>pdwUpdateOpt</i> are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleupdate">OLEUPDATE</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-getupdateoptions
     */
    GetUpdateOptions() {
        result := ComCall(4, this, "uint*", &pdwUpdateOpt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwUpdateOpt
    }

    /**
     * Sets the moniker for the link source.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application can call <b>IOleLink::SetSourceMoniker</b> when the end user changes the source of a link or breaks a link. Note that this requires your container to use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> function to create a moniker out of the display name that the end user enters. If you'd rather have the linked object perform the parsing, your container can call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setsourcedisplayname">IOleLink::SetSourceDisplayName</a> instead of <b>IOleLink::SetSourceMoniker</b>.
     * 
     * The end user changes the source of a link or breaks a link using the <b>Links</b> dialog box. If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display the <b>Links</b> dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-setlinksource">IOleUILinkContainer::SetLinkSource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-cancellink">IOleUILinkContainer::CancelLink</a>; your implementation of these methods can call <b>IOleLink::SetSourceMoniker</b>.
     * 
     * If the linked object is currently bound to its link source, the linked object's implementation of <b>IOleLink::SetSourceMoniker</b> closes the link before changing the moniker.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolelink">IOleLink</a> contract does not specify how the linked object stores or uses the link source moniker. The provided implementation stores the absolute moniker specified when the link is created or when the moniker is changed; it then computes and stores a relative moniker. Future implementations might manage monikers differently to provide better moniker tracking. The absolute moniker provides the complete path to the link source. The linked object uses this absolute moniker and the moniker of the compound document to compute a relative moniker that identifies the link source relative to the compound document that contains the link.
     * 
     * pmkCompoundDoc-&gt;RelativePathTo(pmkAbsolute, ppmkRelative)
     * 
     * When binding to the link source, the linked object first tries to bind using the relative moniker. If that fails, it tries to bind the absolute moniker.
     * 
     * When the linked object successfully binds using either the relative or the absolute moniker, it automatically updates the other moniker. The linked object also updates both monikers when it is bound to the link source and it receives a rename notification through the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> method. A container application can also use the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setsourcedisplayname">IOleLink::SetSourceDisplayName</a> method to change a link's moniker.
     * 
     * The linked object's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> saves both the relative and the absolute moniker.
     * @param {IMoniker} pmk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on a moniker that identifies the new link source of the linked object. A value of <b>NULL</b> breaks the link.
     * @param {Pointer<Guid>} rclsid The CLSID of the link source that the linked object should use to access information about the linked object when it is not bound.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-setsourcemoniker
     */
    SetSourceMoniker(pmk, rclsid) {
        result := ComCall(5, this, "ptr", pmk, "ptr", rclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the moniker identifying the link source of a linked object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application can call <b>IOleLink::GetSourceMoniker</b> to display the current source of a link in the <b>Links</b> dialog box. Note that this requires your container to use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-getdisplayname">IMoniker::GetDisplayName</a> method to get the display name of the moniker. If you would rather get the display name directly, your container can call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname">IOleLink::GetSourceDisplayName</a> instead of <b>IOleLink::GetSourceMoniker</b>.
     * 
     * If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display the <b>Links</b> dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getlinksource">IOleUILinkContainer::GetLinkSource</a> to get the string it should display. Your implementation of that method can call <b>IOleLink::GetSourceMoniker</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The linked object stores both an absolute and a relative moniker for the link source. If the relative moniker is non-<b>NULL</b> and a moniker is available for the compound document, <b>IOleLink::GetSourceMoniker</b> returns the moniker created by composing the relative moniker onto the end of the compound document's moniker. Otherwise, it returns the absolute moniker or, if an error occurs, <b>NULL</b>.
     * 
     * The container specifies the absolute moniker when it calls one of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatelink">OleCreateLink</a> functions to create a link. The application can call <b>IOleLink::GetSourceMoniker</b> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname">IOleLink::GetSourceDisplayName</a> to change the absolute moniker. In addition, the linked object automatically updates the monikers whenever it successfully binds to the link source, or when it is bound to the link source and it receives a rename notification through the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> method.
     * @returns {IMoniker} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to an absolute moniker that identifies the link source. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on <i>ppmk</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs the implementation must set <i>ppmk</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-getsourcemoniker
     */
    GetSourceMoniker() {
        result := ComCall(6, this, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Sets the display name for the link source.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application can call <b>IOleLink::SetSourceDisplayName</b> when the end user changes the source of a link or breaks a link. Note that this requires the linked object to create a moniker out of the display name. If you'd rather parse the display name into a moniker yourself, your container can call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setsourcemoniker">IOleLink::SetSourceMoniker</a> instead of <b>IOleLink::SetSourceDisplayName</b>.
     * 
     * If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display the <b>Links</b> dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-setlinksource">IOleUILinkContainer::SetLinkSource</a> and <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-cancellink">IOleUILinkContainer::CancelLink</a>. Your implementation of these methods can call <b>IOleLink::SetSourceDisplayName</b>.
     * 
     * If your container application is immediately going to bind to a newly specified link source, you should call <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setsourcemoniker">IOleLink::SetSourceMoniker</a> instead, and then call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a> using the bind context from the parsing operation. By reusing the bind context, you can avoid redundant loading of objects that might otherwise occur.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The contract for <b>IOleLink::SetSourceDisplayName</b> does not specify when the linked object will parse the display name into a moniker. The parsing can occur before <b>IOleLink::SetSourceDisplayName</b> returns, or the linked object can store the display name and parse it only when it needs to bind to the link source. Note that parsing the display name is potentially an expensive operation because it might require binding to the link source. The provided implementation of <b>IOleLink::SetSourceDisplayName</b> parses the display name and then releases the bind context used in the parse operation. This can result in running and then stopping the link source server.
     * 
     * If the linked object is bound to the current link source, the implementation of <b>IOleLink::SetSourceDisplayName</b> breaks the connection.
     * 
     * For more information on how the linked object stores and uses the moniker to the link source, see <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setsourcemoniker">IOleLink::SetSourceMoniker</a>.
     * @param {PWSTR} pszStatusText A pointer to the display name of the new link source. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * 
     * Values from <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> may also be returned here.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-setsourcedisplayname
     */
    SetSourceDisplayName(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(7, this, "ptr", pszStatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the display name of the link source of the linked object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application can call <b>IOleLink::GetSourceDisplayName</b> to display the current source of a link.
     * 
     * The current source of a link is displayed in the <b>Links</b> dialog box. If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display the <b>Links</b> dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-getlinksource">IOleUILinkContainer::GetLinkSource</a> to get the string it should display. Your implementation of that method can call <b>IOleLink::GetSourceDisplayName</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The linked object's implementation of <b>IOleLink::GetSourceDisplayName</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-getsourcemoniker">IOleLink::GetSourceMoniker</a> to get the link source moniker, and then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-getdisplayname">IMoniker::GetDisplayName</a> to get that moniker's display name. This operation is potentially expensive because it might require binding the moniker. All of the system-provided monikers can return a display name without binding, but there is no guarantee that other moniker implementations can. Instead of making repeated calls to <b>IOleLink::GetSourceDisplayName</b>, your container application can cache the name and update it whenever the link source is bound.
     * @returns {PWSTR} Address of a pointer variable that receives a pointer to the display name of the link source. If an error occurs, <i>ppszDisplayName</i> is set to <b>NULL</b>; otherwise, the implementation must use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> to allocate the string returned in <i>ppszDisplayName</i>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a> to free it. Both caller and called use the allocator returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-getsourcedisplayname
     */
    GetSourceDisplayName() {
        result := ComCall(8, this, "ptr*", &ppszDisplayName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDisplayName
    }

    /**
     * Activates the connection to the link source by binding the moniker stored within the linked object.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Typically, your container application does not need to call the <b>IOleLink::BindToSource</b> method directly. When it's necessary to activate the connection to the link source, your container typically calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-update">IOleObject::Update</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-update">IOleLink::Update</a>. The linked object's implementation of these methods calls <b>IOleLink::BindToSource</b>. Your container can also call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olerun">OleRun</a> function, which calls <b>IOleLink::BindToSource</b> when called on a linked object.
     * 
     * In each of the examples listed previously, in which <b>IOleLink::BindToSource</b> is called indirectly, the bindflags parameter is set to zero. Consequently, these calls can fail with the OLE_E_CLASSDIFF error if the class of the link source is different from what it was the last time the linked object was bound. This could happen, for example, if the original link source was an embedded Lotus spreadsheet that an end user had subsequently converted (using the Change Type dialog box) to an Excel spreadsheet.
     * 
     * If you want your container to bind even though the link source now has a different CLSID, you can call <b>IOleLink::BindToSource</b> directly and specify OLELINKBIND_EVENIFCLASSDIFF for the bindflags parameter. This call binds to the link source and updates the link object's CLSID. Alternatively, your container can delete the existing link and use the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatelink">OleCreateLink</a> function to create a new linked object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The linked object caches the interface pointer to the link source acquired during binding.
     * 
     * The linked object's <b>IOleLink::BindToSource</b> implementation first tries to bind using a moniker consisting of the compound document's moniker composed with the link source's relative moniker. If successful, it updates the link's absolute moniker. Otherwise, it tries to bind using the absolute moniker, updating the relative moniker if successful.
     * 
     * If <b>IOleLink::BindToSource</b> binds to the link source, it calls the compound document's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">IOleContainer::LockContainer</a> implementation to keep the containing compound document alive while the link source is running. <b>IOleLink::BindToSource</b> also calls the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-advise">IOleObject::Advise</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> implementations of the link source to set up advisory connections. The <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-unbindsource">IOleLink::UnbindSource</a> implementation unlocks the container and deletes the advisory connections.
     * @param {Integer} bindflags Specifies how to proceed if the link source has a different CLSID from the last time it was bound. If this parameter is zero and the CLSIDs are different, the method fails and returns OLE_E_CLASSDIFF. If the OLELINKBIND_EVENIFCLASSDIFF value from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olelinkbind">OLELINKBIND</a> enumeration is specified and the CLSIDs are different, the method binds successfully and updates the CLSID stored in the linked object.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. This parameter can be <b>NULL</b>. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment. For more information, see <b>IBindCtx</b>.
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
     * <dt><b>OLE_E_CLASSDIFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source was not bound because its CLSID has changed. This error is returned only if the OLELINKBIND_EVENIFCLASSDIFF flag is not specified in the <i>bindflags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source could not be found or (if the link source's moniker is a composite) some intermediate object identified in the composite could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNSPEC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link's moniker is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Binding the moniker might require calling the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function; therefore, this method may return errors generated by <b>CreateBindCtx</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-bindtosource
     */
    BindToSource(bindflags, pbc) {
        result := ComCall(9, this, "uint", bindflags, "ptr", pbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Activates the connection between the linked object and the link source if the link source is already running.
     * @remarks
     * You typically do not need to call <b>IOleLink::BindIfRunning</b>. This method is primarily called by the linked object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The linked object's implementation of <b>IOleLink::BindIfRunning</b> checks the running object table (ROT) to determine whether the link source is already running. It checks both the relative and absolute monikers. If the link source is running, <b>IOleLink::BindIfRunning</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a> to connect the linked object to the link source.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The link source is not running.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Binding the moniker might require calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isrunning">IMoniker::IsRunning</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a>; therefore, errors generated by these functions can also be returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-bindifrunning
     */
    BindIfRunning() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a pointer to the link source if the connection is active.
     * @remarks
     * You typically do not need to call <b>IOleLink::GetBoundSource</b>.
     * @returns {IUnknown} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the link source. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on <i>ppunk</i>; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>. If an error occurs, the implementation sets <i>ppunk</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-getboundsource
     */
    GetBoundSource() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunk)
    }

    /**
     * Breaks the connection between a linked object and its link source.
     * @remarks
     * You typically do not call <b>UnbindSource</b> directly. When it's necessary to deactivate the connection to the link source, your container typically calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>; the linked object's implementation of these methods calls <b>UnbindSource</b>. The linked object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> implementation also calls <b>UnbindSource</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The linked object's implementation of <b>UnbindSource</b> does nothing if the link source is not currently bound. If the link source is bound, <b>UnbindSource</b> calls the link source's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dunadvise">IDataObject::DUnadvise</a> implementations to delete the advisory connections to the link source. The <b>UnbindSource</b> method also calls the compound document's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">IOleContainer::LockContainer</a> implementation to unlock the containing compound document. This undoes the lock on the container and the advisory connections that were established in <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a>. <b>UnbindSource</b> releases all the linked object's interface pointers to the link source.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-unbindsource
     */
    UnbindSource() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the compound document's cached data for a linked object. This involves binding to the link source, if it is not already bound.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Your container application should call <b>Update</b> if the end user updates the cached data for a linked object.
     * 
     * The end user can update the cached data for a linked object by choosing the <b>Update Now</b> button in the <b>Links</b> dialog box. If you use the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuieditlinksa">OleUIEditLinks</a> function to display the <b>Links</b> dialog box, you must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nn-oledlg-ioleuilinkcontainera">IOleUILinkContainer</a> interface. The dialog box calls your implementations of <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-ioleuilinkcontainera-updatelink">IOleUILinkContainer::UpdateLink</a> when the end user chooses the <b>Update Now</b> button. Your implementation of that method can call <b>Update</b>.
     * 
     * Your container application can also call <b>Update</b> to update a linked object, because that method calls <b>Update</b> when it is called on a linked object.
     * 
     * This method updates both automatic links and manual links. For manual links, calling <b>Update</b> or <b>Update</b> is the only way to update the caches. For more information on automatic and manual links, see <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-setupdateoptions">IOleLink::SetUpdateOptions</a>.
     * 
     * <h3><a id="Notes_on_Implementation"></a><a id="notes_on_implementation"></a><a id="NOTES_ON_IMPLEMENTATION"></a>Notes on Implementation</h3>
     * If <i>pbc</i> is non-<b>NULL</b>, the linked object's implementation of <b>Update</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectbound">IBindCtx::RegisterObjectBound</a> to register the bound link source. This ensures that the link source remains running until the bind context is released.
     * 
     * The current caches are left intact if the link source cannot be bound.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in binding the link source. This parameter can be <b>NULL</b>. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the binding implementation should retrieve information about its environment. For more information, see <b>IBindCtx</b>.
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
     * <dt><b>CACHE_E_NOCACHE_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bind operation worked but no caches were updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CACHE_S_SOMECACHES_NOTUPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bind operation worked but not all caches were updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_CANT_BINDTOSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to bind to the link source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-iolelink-update
     */
    Update(pbc) {
        result := ComCall(13, this, "ptr", pbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
