#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleClientSite.ahk
#Include ..\Com\IMoniker.ahk
#Include ..\Com\IDataObject.ahk
#Include .\IEnumOLEVERB.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\Com\IEnumSTATDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Serves as the principal means by which an embedded object provides basic functionality to, and communicates with, its container.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleObject
     * @type {Guid}
     */
    static IID => Guid("{00000112-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientSite", "GetClientSite", "SetHostNames", "Close", "SetMoniker", "GetMoniker", "InitFromData", "GetClipboardData", "DoVerb", "EnumVerbs", "Update", "IsUpToDate", "GetUserClassID", "GetUserType", "SetExtent", "GetExtent", "Advise", "Unadvise", "EnumAdvise", "GetMiscStatus", "SetColorScheme"]

    /**
     * Informs an embedded object of its display location, called a &quot;client site,&quot; within its container.
     * @remarks
     * Within a compound document, each embedded object has its own client site - the place where it is displayed and through which it receives information about its storage, user interface, and other resources. <b>IOleObject::SetClientSite</b> is the only method enabling an embedded object to obtain a pointer to its client site.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container can notify an object of its client site either at the time the object is created or, subsequently, when the object is initialized.
     * 
     * When creating or loading an object, a container may pass a client-site pointer (along with other arguments) to one of the following helper functions: <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreate">OleCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreatefromfile">OleCreateFromFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleload">OleLoad</a>. These helper functions load an object handler for the new object and call <b>IOleObject::SetClientSite</b> on the container's behalf before returning a pointer to the new object.
     * 
     * Passing a client-site pointer informs the object handler that the client site is ready to process requests. If the client site is unlikely to be ready immediately after the handler is loaded, you may want your container to pass a <b>NULL</b> client-site pointer to the helper function. The <b>NULL</b> pointer says that no client site is available and thereby defers notifying the object handler of the client site until the object is initialized. In response, the helper function returns a pointer to the object, but upon receiving that pointer the container must call <b>IOleObject::SetClientSite</b> as part of initializing the new object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Implementation consists simply of incrementing the reference count on, and storing, the pointer to the client site.
     * @param {IOleClientSite} pClientSite Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface on the container application's client-site.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setclientsite
     */
    SetClientSite(pClientSite) {
        result := ComCall(3, this, "ptr", pClientSite, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an embedded object's client site.
     * @remarks
     * Link clients most commonly call the <b>IOleObject::GetClientSite</b> method in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getcontainer">IOleClientSite::GetContainer</a> method to traverse a hierarchy of nested objects. A link client calls <b>IOleObject::GetClientSite</b> to get a pointer to the link source's client site. The client then calls <b>IOleClientSite::GetContainer</b> to get a pointer to the link source's container. Finally, the client calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> and <b>IOleObject::GetClientSite</b> to get the container's client site within its container. By repeating this sequence of calls, the caller can eventually retrieve a pointer to the master container in which all the other objects are nested.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The returned client-site pointer will be <b>NULL</b> if an embedded object has not yet been informed of its client site. This will be the case with a newly loaded or created object when a container has passed a <b>NULL</b> client-site pointer to one of the object-creation helper functions but has not yet called <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a> as part of initializing the object.
     * @returns {IOleClientSite} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> pointer variable that receives the interface pointer to the object's client site. If an object does not yet know its client site, or if an error has occurred, <i>ppClientSite</i> must be set to <b>NULL</b>. Each time an object receives a call to <b>IOleObject::GetClientSite</b>, it must increase the reference count on <i>ppClientSite</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is done with <i>ppClientSite</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getclientsite
     */
    GetClientSite() {
        result := ComCall(4, this, "ptr*", &ppClientSite := 0, "HRESULT")
        return IOleClientSite(ppClientSite)
    }

    /**
     * Provides an object with the names of its container application and the compound document in which it is embedded.
     * @remarks
     * <h3><a id="Notes_for_Callers"></a><a id="notes_for_callers"></a><a id="NOTES_FOR_CALLERS"></a>Notes for Callers</h3>
     * Call <b>IOleObject::SetHostNames</b> only for embedded objects, because for linked objects, the link source provides its own separate editing window and title bar information.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object's application of <b>IOleObject::SetHostNames</b> should include whatever modifications to its user interface may be appropriate to an object's embedded state. Such modifications typically will include adding and removing menu commands and altering the text displayed in the title bar of the editing window.
     * 
     * The complete window title for an embedded object in an SDI container application or an MDI application with a maximized child window should appear as follows:
     * 
     * 
     * ``` syntax
     * &lt;object application name&gt; - &lt;object short type&gt; in &lt;container document&gt;
     * ```
     * 
     * Otherwise, the title should be:
     * 
     * 
     * ``` syntax
     * &lt;object application name&gt; - &lt;container document&gt;
     * ```
     * 
     * The "object short type" refers to a form of an object's name short enough to be displayed in full in a list box. Because these identifying strings are not stored as part of the persistent state of the object, <b>IOleObject::SetHostNames</b> must be called each time the object loads or runs.
     * @param {PWSTR} szContainerApp Pointer to the name of the container application in which the object is running.
     * @param {PWSTR} szContainerObj Pointer to the name of the compound document that contains the object. If you do not wish to display the name of the compound document, you can set this parameter to <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-sethostnames
     */
    SetHostNames(szContainerApp, szContainerObj) {
        szContainerApp := szContainerApp is String ? StrPtr(szContainerApp) : szContainerApp
        szContainerObj := szContainerObj is String ? StrPtr(szContainerObj) : szContainerObj

        result := ComCall(5, this, "ptr", szContainerApp, "ptr", szContainerObj, "HRESULT")
        return result
    }

    /**
     * Changes an embedded object from the running to the loaded state. Disconnects a linked object from its link source.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container application calls <b>IOleObject::Close</b> when it wants to move the object from a running to a loaded state. Following such a call, the object still appears in its container but is not open for editing. Calling <b>IOleObject::Close</b> on an object that is loaded but not running has no effect. Closing a linked object simply means disconnecting it.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Upon receiving a call to <b>IOleObject::Close</b>, a running object should do the following:
     * 
     * <ul>
     * <li>If the object has been changed since it was last opened for editing, it should request to be saved, or not, according to instructions specified in <i>dwSaveOption</i>. If the option is to save the object, then it should call its container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-saveobject">IOleClientSite::SaveObject</a> interface.</li>
     * <li>If the object has <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> connections with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a>_DATAONSTOP flags, then it should send an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-ondatachange">IAdviseSink::OnDataChange</a> notification. See <b>IDataObject::DAdvise</b> for details.</li>
     * <li>If the object currently owns the Clipboard, it should empty it by calling <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a>.</li>
     * <li>If the object is currently visible, notify its container by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-onshowwindow">IOleClientSite::OnShowWindow</a> with the <i>fshow</i> argument set to <b>FALSE</b>.</li>
     * <li>Send <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> notifications to appropriate advise sinks.</li>
     * <li>Finally, forcibly cut off all remoting clients by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a>.</li>
     * </ul>
     * If the object application is a local server (an EXE rather than a DLL), closing the object should also shut down the object application unless the latter is supporting other running objects or has another reason to remain in the running state. Such reasons might include the presence of <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nf-unknwnbase-iclassfactory-lockserver">IClassFactory::LockServer</a> locks, end-user control of the application, or the existence of other open documents requiring access to the application.
     * 
     * Calling <b>IOleObject::Close</b> on a linked object disconnects it from, but does not shut down, its source application. A source application that is visible to the user when the object is closed remains visible and running after the disconnection and does not send an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> notification to the link container.
     * @param {Integer} dwSaveOption Indicates whether the object is to be saved as part of the transition to the loaded state. Valid values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleclose">OLECLOSE</a>.
     * 
     * <div class="alert"><b>Note</b>  The OLE 2 user model recommends that object applications do not prompt users before saving linked or embedded objects, including those activated in place. This policy represents a change from the OLE 1 user model, in which object applications always prompt the user to decide whether to save changes.</div>
     * <div> </div>
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
     * <dt><b>OLE_E_PROMPTSAVECANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user was prompted to save but chose the <b>Cancel</b> button from the prompt message box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-close
     */
    Close(dwSaveOption) {
        result := ComCall(6, this, "uint", dwSaveOption, "HRESULT")
        return result
    }

    /**
     * Notifies an object of its container's moniker, the object's own moniker relative to the container, or the object's full moniker.
     * @remarks
     * A container that supports links to embedded objects must be able to inform an embedded object when its moniker has changed. Otherwise, subsequent attempts by link clients to bind to the object will fail. The <b>IOleObject::SetMoniker</b> method provides one way for a container to communicate this information.
     * 
     * The container can pass either its own moniker, an object's moniker relative to the container, or an object's full moniker. In practice, if a container passes anything other than an object's full moniker, each object calls the container back to request assignment of the full moniker, which the object requires to register itself in the running object table.
     * 
     * The moniker of an object relative to its container is stored by the object handler as part of the object's persistent state. The moniker of the object's container, however, must not be persistently stored inside the object because the container can be renamed at any time.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container calls <b>IOleObject::SetMoniker</b> when the container has been renamed, and the container's embedded objects currently or can potentially serve as link sources. Containers call SetMoniker mainly in the context of linking because an embedded object is already aware of its moniker. Even in the context of linking, calling this method is optional because objects can call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a> to force assignment of a new moniker.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Upon receiving a call to <b>IOleObject::SetMoniker</b>, an object should register its full moniker in the running object table and send <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> notification to all advise sinks that exist for the object.
     * @param {Integer} dwWhichMoniker The moniker is passed in <i>pmk</i>. Possible values are from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olewhichmk">OLEWHICHMK</a>.
     * @param {IMoniker} pmk Pointer to where to return the moniker.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setmoniker
     */
    SetMoniker(dwWhichMoniker, pmk) {
        result := ComCall(7, this, "uint", dwWhichMoniker, "ptr", pmk, "HRESULT")
        return result
    }

    /**
     * Retrieves an embedded object's moniker, which the caller can use to link to the object.
     * @remarks
     * The <b>IOleObject::GetMoniker</b> method returns an object's moniker. Like <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a>, this method is important only in the context of managing links to embedded objects and even in that case is optional. A potential link client that requires an object's moniker to bind to the object can call this method to obtain that moniker. The default implementation of <b>IOleObject::GetMoniker</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a>, returning E_UNEXPECTED if the object is not running or does not have a valid pointer to a client site.
     * @param {Integer} dwAssign Determines how the moniker is assigned to the object. Depending on the value of <i>dwAssign</i>, <b>IOleObject::GetMoniker</b> does one of the following:
     * 
     * <ul>
     * <li>Obtains a moniker only if one has already been assigned.</li>
     * <li>Forces assignment of a moniker, if necessary, in order to satisfy the call.</li>
     * <li>Obtains a temporary moniker.</li>
     * </ul>
     * Values for <i>dwAssign</i> are specified in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olegetmoniker">OLEGETMONIKER</a>.
     * 
     * <div class="alert"><b>Note</b>   You cannot pass <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olegetmoniker">OLEGETMONIKER</a>_UNASSIGN when calling <b>IOleObject::GetMoniker</b>. This value is valid only when calling <b>IOleObject::GetMoniker</b>.</div>
     * <div> </div>
     * @param {Integer} dwWhichMoniker Specifies the form of the moniker being requested. Possible values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olewhichmk">OLEWHICHMK</a>.
     * @returns {IMoniker} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the object's moniker. If an error occurs, <i>ppmk</i> must be set to <b>NULL</b>. Each time an object receives a call to <b>IOleObject::GetMoniker</b>, it must increase the reference count on <i>ppmk</i>. It is the caller's responsibility to call Release when it is done with <i>ppmk</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker) {
        result := ComCall(8, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * Initializes a newly created object with data from a specified data object, which can reside either in the same container or on the Clipboard.
     * @remarks
     * This method enables a container document to insert within itself a new object whose content is based on a current data selection within the container. For example, a spreadsheet document may want to create a graph object based on data in a selected range of cells.
     * 
     * Using this method, a container can also replace the contents of an embedded object with data transferred from another source. This provides a convenient way of updating an embedded object.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Following initialization, the container should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getmiscstatus">IOleObject::GetMiscStatus</a> to check the value of the OLEMISC_INSERTNOTREPLACE bit. If the bit is on, the new object inserts itself following the selected data. If the bit is off, the new object replaces the selected data.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * A container specifies whether to base a new object on the current selection by passing either <b>TRUE</b> or <b>FALSE</b> to the <i>fCreation</i> parameter.
     * 
     * If <i>fCreation</i> is <b>TRUE</b>, the container is attempting to create a new instance of an object, initializing it with the selected data specified by the data object.
     * 
     * If <i>fCreation</i> is <b>FALSE</b>, the caller is attempting to replace the object's current contents with that pointed to by <i>pDataObject</i>. The usual constraints that apply to an object during a paste operation should be applied here. For example, if the type of the data provided is unacceptable, the object should fail to initialize and return S_FALSE.
     * 
     * If the object returns S_FALSE, it cannot initialize itself from the provided data.
     * @param {IDataObject} pDataObject Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object from which the initialization data is to be obtained. This parameter can be <b>NULL</b>, which indicates that the caller wants to know if it is worthwhile trying to send data; that is, whether the container is capable of initializing an object from data passed to it. The data object to be passed can be based on either the current selection within the container document or on data transferred to the container from an external source.
     * @param {BOOL} fCreation <b>TRUE</b> indicates the container is inserting a new object inside itself and initializing that object with data from the current selection; <b>FALSE</b> indicates a more general programmatic data transfer, most likely from a source other than the current selection.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {HRESULT} This method returns S_OK if <i>pDataObject</i> is not <b>NULL</b>, the object successfully attempted to initialize itself from the provided data; if <i>pDataObject</i> is <b>NULL</b>, the object is able to attempt a successful initialization.. Other possible return values include the following.
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
     * If pDataObject is not <b>NULL</b>, the object made no attempt to initialize itself; if <i>pDataObject</i> is <b>NULL</b>, the object cannot attempt to initialize itself from the data provided.
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
     * The object does not support <i>InitFromData</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_NOTRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not running and therefore cannot perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-initfromdata
     */
    InitFromData(pDataObject, fCreation, dwReserved) {
        result := ComCall(9, this, "ptr", pDataObject, "int", fCreation, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a data object containing the current contents of the embedded object on which this method is called. Using the pointer to this data object, it is possible to create a new embedded object with the same data as the original.
     * @remarks
     * You can use the <b>IOleObject::GetClipboardData</b> method to convert a linked object to an embedded object, in which case the container application would call <b>IOleObject::GetClipboardData</b> and then pass the data received to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatefromdata">OleCreateFromData</a>. This method returns a pointer to a data object that is identical to what would have been passed to the clipboard by a standard copy operation.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If you want a stable snapshot of the current contents of an embedded object, call <b>IOleObject::GetClipboardData</b>. Should the data change, you will need to call the function again for an updated snapshot. If you want the caller to be informed of changes that occur to the data, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, then call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If you implement this function, you must return an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer for an object whose data will not change.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {IDataObject} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the data object. If an error occurs, <i>ppDataObject</i> must be set to <b>NULL</b>. Each time an object receives a call to <b>IOleObject::GetClipboardData</b>, it must increase the reference count on <i>ppDataObject</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is done with <i>ppDataObject</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getclipboarddata
     */
    GetClipboardData(dwReserved) {
        result := ComCall(10, this, "uint", dwReserved, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * Requests that an object perform an action in response to an end-user's action. The possible actions are enumerated for the object in IOleObject::EnumVerbs.
     * @remarks
     * A "verb" is an action that an OLE object takes in response to a message from its container. An object's container, or a client linked to the object, normally calls <b>IOleObject::DoVerb</b> in response to some end-user action, such as double-clicking on the object. The various actions that are available for a given object are enumerated in an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-oleverb">OLEVERB</a> structure, which the container obtains by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumverbs">IOleObject::EnumVerbs</a>. <b>IOleObject::DoVerb</b> matches the value of iVerb against the iVerb member of the structure to determine which verb to invoke.
     * 
     * Through <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumverbs">IOleObject::EnumVerbs</a>, an object, rather than its container, determines which verbs (i.e., actions) it supports. OLE 2 defines seven verbs that are available, but not necessarily useful, to all objects. In addition, each object can define additional verbs that are unique to it. The following table describes the verbs defined by OLE.
     * 
     * <table>
     * <tr>
     * <th>Verb</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_PRIMARY (0L)
     * 
     * </td>
     * <td>
     * Specifies the action that occurs when an end user double-clicks the object in its container. The object, not the container, determines this action. If the object supports in-place activation, the primary verb usually activates the object in place.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_SHOW (-1)
     * 
     * </td>
     * <td>
     * Instructs an object to show itself for editing or viewing. Called to display newly inserted objects for initial editing and to show link sources. Usually an alias for some other object-defined verb.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_OPEN (-2)
     * 
     * </td>
     * <td>
     * Instructs an object, including one that otherwise supports in-place activation, to open itself for editing in a window separate from that of its container. If the object does not support in-place activation, this verb has the same semantics as OLEIVERB_SHOW.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_HIDE (-3)
     * 
     * </td>
     * <td>
     * Causes an object to remove its user interface from the view. Applies only to objects that are activated in-place.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_UIACTIVATE (-4)
     * 
     * </td>
     * <td>
     * Activates an object in place, along with its full set of user-interface tools, including menus, toolbars, and its name in the title bar of the container window. If the object does not support in-place activation, it should return E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_INPLACEACTIVATE (-5)
     * 
     * </td>
     * <td>
     * Activates an object in place without displaying tools, such as menus and toolbars, that end users need to change the behavior or appearance of the object. Single-clicking such an object causes it to negotiate the display of its user-interface tools with its container. If the container refuses, the object remains active but without its tools displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * OLEIVERB_DISCARDUNDOSTATE (-6)
     * 
     * </td>
     * <td>
     * Used to tell objects to discard any undo state that they may be maintaining without deactivating the object.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Containers call <b>IOleObject::DoVerb</b> as part of initializing a newly created object. Before making the call, containers should first call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a> to inform the object of its display location and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-sethostnames">IOleObject::SetHostNames</a> to alert the object that it is an embedded object and to trigger appropriate changes to the user interface of the object application in preparation for opening an editing window.
     * 
     * <b>IOleObject::DoVerb</b> automatically runs the OLE server application. If an error occurs during verb execution, the object application is shut down.
     * 
     * If an end user invokes a verb by some means other than selecting a command from a menu (say, by double-clicking or, more rarely, single-clicking an object), the object's container should pass a pointer to a Windows <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure containing the appropriate message. For example, if the end user invokes a verb by double-clicking the object, the container should pass a <b>MSG</b> structure containing WM_LBUTTONDBLCLK, WM_MBUTTONDBLCLK, or WM_RBUTTONDBLCLK. If the container passes no message, lpmsg should be set to <b>NULL</b>. The object should ignore the <b>hwnd</b> member of the passed <b>MSG</b> structure, but can use all the other MSG members.
     * 
     * If the object's embedding container calls <b>IOleObject::DoVerb</b>, the client-site pointer (<i>pClientSite</i>) passed to <b>IOleObject::DoVerb</b> is the same as that of the embedding site. If the embedded object is a link source, the pointer passed to <b>IOleObject::DoVerb</b> is that of the linking client's client site.
     * 
     * When <b>IOleObject::DoVerb</b> is invoked on an OLE link, it may return OLE_E_CLASSDIFF or MK_CONNECTMANUALLY. The link object returns the former error when the link source has been subjected to some sort of conversion while the link was passive. The link object returns the latter error when the link source is located on a network drive that is not currently connected to the caller's computer. The only way to connect a link under these conditions is to first call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>, ask for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolelink">IOleLink</a>, allocate a bind context, and run the link source by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a>.
     * 
     * Container applications that do not support general in-place activation can still use the <i>hwndParent</i> and <i>lprcPosRect</i> parameters to support in-place playback of multimedia files. Containers must pass valid <i>hwndParent</i> and <i>lprcPosRect</i> parameters to <b>IOleObject::DoVerb</b>.
     * 
     * Some code samples pass a lindex value of -1 instead of zero. The value -1 works but should be avoided in favor of zero. The <i>lindex</i> parameter is a reserved parameter, and for reasons of consistency Microsoft recommends assigning a zero value to all reserved parameters.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * In addition to the above verbs, an object can define in its <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-oleverb">OLEVERB</a> structure additional verbs that are specific to itself. Positive numbers designate these object-specific verbs. An object should treat any unknown positive verb number as if it were the primary verb and return OLEOBJ_S_INVALIDVERB to the calling function. The object should ignore verbs with negative numbers that it does not recognize and return E_NOTIMPL.
     * 
     * If the verb being executed places the object in the running state, you should register the object in the running object table (ROT) even if its server application doesn't support linking. Registration is important because the object at some point may serve as the source of a link in a container that supports links to embeddings. Registering the object with the ROT enables the link client to get a pointer to the object directly, instead of having to go through the object's container. To perform the registration, call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a> to get the full moniker of the object, call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getrunningobjecttable">GetRunningObjectTable</a> function to get a pointer to the ROT, and then call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>.
     * 
     * <div class="alert"><b>Note</b>  When the object leaves the running state, remember to revoke the object's registration with the ROT by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>. If the object's container document is renamed while the object is running, you should revoke the object's registration and re-register it with the ROT, using its new name. The container should inform the object of its new moniker either by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a> or by responding to the object's calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a>.</div>
     * <div> </div>
     * When showing a window as a result of <b>IOleObject::DoVerb</b>, it is very important for the object to explicitly call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setforegroundwindow">SetForegroundWindow</a> on its editing window. This ensures that the object's window will be visible to the user even if another process originally obscured it. For more information see <b>SetForegroundWindow</b> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setactivewindow">SetActiveWindow</a>.
     * @param {Integer} iVerb Number assigned to the verb in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ns-oleidl-oleverb">OLEVERB</a> structure returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumverbs">IOleObject::EnumVerbs</a>.
     * @param {Pointer<MSG>} lpmsg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure describing the event (such as a double-click) that invoked the verb. The caller should pass the <b>MSG</b> structure unmodified, without attempting to interpret or alter the values of any of the structure members.
     * @param {IOleClientSite} pActiveSite Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> interface on the object's active client site, where the event occurred that invoked the verb.
     * @param {Integer} lindex This parameter is reserved and must be zero.
     * @param {HWND} hwndParent Handle of the document window containing the object. This and <i>lprcPosRect</i> together make it possible to open a temporary window for an object, where <i>hwndParent</i> is the parent window in which the object's window is to be displayed, and <i>lprcPosRect</i> defines the area available for displaying the object window within that parent. A temporary window is useful, for example, to a multimedia object that opens itself for playback but not for editing.
     * @param {Pointer<RECT>} lprcPosRect Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates, in pixels, that define an object's bounding rectangle in <i>hwndParent</i>. This and <i>hwndParent</i> together enable opening multimedia objects for playback but not for editing.
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
     * <dt><b>OLE_E_NOT_INPLACEACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * iVerb set to OLEIVERB_UIACTIVATE or OLEIVERB_INPLACEACTIVATE and object is not already visible.
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
     * The object handler or link object cannot connect to the link source.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid lindex.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEOBJ_S_CANNOT_DOVERB_NOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The verb is valid, but in the object's current state it cannot carry out the corresponding action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEOBJ_S_INVALIDHWND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DoVerb was successful but <i>hwndParent</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEOBJ_E_NOVERBS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support any verbs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLEOBJ_S_INVALIDVERB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Link source is across a network that is not connected to a drive on this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Link source is across a network that is not connected to a drive on this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_CLASSDIFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Class for source of link has undergone a conversion.
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
     * Object does not support in-place activation or does not recognize a negative verb number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-doverb
     */
    DoVerb(iVerb, lpmsg, pActiveSite, lindex, hwndParent, lprcPosRect) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "int", iVerb, "ptr", lpmsg, "ptr", pActiveSite, "int", lindex, "ptr", hwndParent, "ptr", lprcPosRect, "HRESULT")
        return result
    }

    /**
     * Exposes a pull-down menu listing the verbs available for an object in ascending order by verb number.
     * @returns {IEnumOLEVERB} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ienumoleverb">IEnumOLEVERB</a> pointer variable that receives the interface pointer to the new enumerator object. Each time an object receives a call to <b>IOleObject::EnumVerbs</b>, it must increase the reference count on <i>ppEnumOleVerb</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is done with <i>ppEnumOleVerb</i>. If an error occurs, <i>ppEnumOleVerb</i> must be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-enumverbs
     */
    EnumVerbs() {
        result := ComCall(12, this, "ptr*", &ppEnumOleVerb := 0, "HRESULT")
        return IEnumOLEVERB(ppEnumOleVerb)
    }

    /**
     * Updates an object handler's or link object's data or view caches.
     * @remarks
     * The <b>Update</b> method provides a way for containers to keep data updated in their linked and embedded objects. A link object can become out-of-date if the link source has been updated. An embedded object that contains links to other objects can also become out of date. An embedded object that does not contain links cannot become out of date because its data is not linked to another source.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * When a container calls a link object's <b>IOleObject::Update</b> method, the link object finds the link source and gets a new presentation from it. This process may also involve running one or more object applications, which could be time-consuming.
     * 
     * When a container calls an embedded object's <b>IOleObject::Update</b> method, it is requesting the object to update all link objects it may contain. In response, the object handler recursively calls <b>IOleObject::Update</b> for each of its own linked objects, running each one as needed.
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
     * <dt><b>OLE_E_CANT_BINDTOSOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot run object to get updated data. The object is for some reason unavailable to the caller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CACHE_E_NOCACHE_UPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No caches were updated.
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
     * Some caches were not updated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-update
     */
    Update() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Checks whether an object is up to date.
     * @remarks
     * The <b>IOleObject::IsUpToDate</b> method provides a way for containers to check recursively whether all objects are up to date. That is, when the container calls this method on the first object, the object in turn calls it for all its own objects, and they in turn for all of theirs, until all objects have been checked.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Because of the recursive nature of <b>IOleObject::IsUpToDate</b>, determining whether an object is out-of-date, particularly one containing one or more other objects, can be as time-consuming as simply updating the object in the first place. If you would rather avoid lengthy queries of this type, make sure that <b>IOleObject::IsUpToDate</b> returns OLE_E_UNAVAILABLE. In cases where the object to be queried is small and contains no objects itself, thereby making an efficient query possible, this method can return either S_OK or S_FALSE.
     * @returns {HRESULT} This method returns S_OK if the object is up to date; otherwise, S_FALSE. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status of object cannot be determined in a timely manner.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-isuptodate
     */
    IsUpToDate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an object's class identifier, the CLSID corresponding to the string identifying the object to an end user.
     * @remarks
     * <b>IOleObject::GetUserClassID</b> returns the CLSID associated with the object in the registration database. Normally, this value is identical to the CLSID stored with the object, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a>. For linked objects, this is the CLSID of the last bound link source. If the object is running in an application different from the one in which it was created and for the purpose of being edited is emulating a class that the container application recognizes, the CLSID returned will be that of the class being emulated rather than that of the object's own class.
     * @returns {Guid} Pointer to the class identifier (CLSID) to be returned. An object's CLSID is the binary equivalent of the user-type name returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getuserclassid
     */
    GetUserClassID() {
        pClsid := Guid()
        result := ComCall(15, this, "ptr", pClsid, "HRESULT")
        return pClsid
    }

    /**
     * Retrieves the user-type name of an object for display in user-interface elements such as menus, list boxes, and dialog boxes.
     * @remarks
     * Containers call <b>IOleObject::GetUserType</b> in order to represent embedded objects in list boxes, menus, and dialog boxes by their normal, user-recognizable names. Examples include "Word Document," "Excel Chart," and "Paintbrush Object." The information returned by <b>IOleObject::GetUserType</b> is the user-readable equivalent of the binary class identifier returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getuserclassid">IOleObject::GetUserClassID</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The default handler's implementation of <b>IOleObject::GetUserType</b> uses the object's class identifier (the <i>pClsid</i> parameter returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getuserclassid">IOleObject::GetUserClassID</a>) and the <i>dwFormOfType</i> parameter together as a key into the registry. If an entry is found that matches the key exactly, then the user type specified by that entry is returned. If only the CLSID part of the key matches, then the lowest-numbered entry available (usually the full name) is used. If the CLSID is not found, or there are no user types registered for the class, the user type currently found in the object's storage is used.
     * 
     * You should not cache the string returned from <b>IOleObject::GetUserType</b>. Instead, call this method each and every time the string is needed. This guarantees correct results when the embedded object is being converted from one type into another without the caller's knowledge. Calling this method is inexpensive because the default handler implements it using the registry.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * You can use the implementation provided by the default handler by returning OLE_S_USEREG as your application's implementation of this method. If the user type name is an empty string, the message "Unknown Object" is returned.
     * 
     * You can call the OLE helper function <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olereggetusertype">OleRegGetUserType</a> to return the appropriate user type.
     * @param {Integer} dwFormOfType The form of the user-type name to be presented to users. Possible values are obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-userclasstype">USERCLASSTYPE</a> enumeration.
     * @returns {PWSTR} Address of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-calpolestr">LPOLESTR</a> pointer variable that receives a pointer to the user type string. The caller must free <i>pszUserType</i> using the current <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> instance. If an error occurs, the implementation must set <i>pszUserType</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getusertype
     */
    GetUserType(dwFormOfType) {
        result := ComCall(16, this, "uint", dwFormOfType, "ptr*", &pszUserType := 0, "HRESULT")
        return pszUserType
    }

    /**
     * Informs an object of how much display space its container has assigned it.
     * @remarks
     * A container calls <b>IOleObject::SetExtent</b> when it needs to dictate to an embedded object the size at which it will be displayed. Often, this call occurs in response to an end user resizing the object window. Upon receiving the call, the object, if possible, should recompose itself gracefully to fit the new window.
     * 
     * Whenever possible, a container seeks to display an object at its finest resolution, sometimes called the object's native size. All objects, however, have a default display size specified by their applications, and in the absence of other constraints, this is the size they will use to display themselves. Since an object knows its optimum display size better than does its container, the latter normally requests that size from a running object by calling <b>IOleObject::SetExtent</b>. Only in cases where the container cannot accommodate the value returned by the object does it override the object's preference by calling <b>IOleObject::SetExtent</b>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You can call <b>IOleObject::SetExtent</b> on an object only when the object is running. If a container resizes an object while an object is not running, the container should keep track of the object's new size but defer calling <b>IOleObject::SetExtent</b> until a user activates the object. If the OLEMISC_RECOMPOSEONRESIZE bit is set on an object, its container should force the object to run before calling <b>IOleObject::SetExtent</b>.
     * 
     * As noted above, a container may want to delegate responsibility for setting the size of an object's display site to the object itself, by calling <b>IOleObject::SetExtent</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * You may want to implement this method so that your object rescales itself to match as closely as possible the maximum space available to it in its container.
     * 
     * If an object's size is fixed, that is, if it cannot be set by its container, <b>IOleObject::SetExtent</b> should return E_FAIL. This is always the case with linked objects, whose sizes are set by their link sources, not by their containers.
     * @param {Integer} dwDrawAspect DWORD that describes which form, or "aspect," of an object is to be displayed. The object's container obtains this value from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> (refer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> enumeration). The most common aspect is DVASPECT_CONTENT, which specifies a full rendering of the object within its container. An object can also be rendered as an icon, a thumbnail version for display in a browsing tool, or a print version, which displays the object as it would be rendered using the <b>File Print</b> command.
     * @param {Pointer<SIZE>} psizel Pointer to the size limit for the object.
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
     * <dt><b>OLE_E_NOTRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setextent
     */
    SetExtent(dwDrawAspect, psizel) {
        result := ComCall(17, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return result
    }

    /**
     * Retrieves a running object's current display size.
     * @remarks
     * A container calls <b>IOleObject::GetExtent</b> on a running object to retrieve its current display size. If the container can accommodate that size, it will normally do so because the object, after all, knows what size it should be better than the container does. A container normally makes this call as part of initializing an object.
     * 
     * The display size returned by <b>IOleObject::GetExtent</b> may differ from the size last set by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setextent">IOleObject::SetExtent</a> because the latter method dictates the object's display space at the time the method is called but does not necessarily change the object's native size, as determined by its application.
     * 
     * If one of the new aspects is requested in <i>dwAspect</i>, this method can either fail or return the same rectangle as for the DVASPECT_CONTENT aspect.
     * 
     * <div class="alert"><b>Note</b>  This method must return the same size as DVASPECT_CONTENT for all the new aspects in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>. <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject2-getextent">IViewObject2::GetExtent</a> must do the same thing.</div>
     * <div> </div>
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Because a container can make this call only to a running object, the container must instead call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject2-getextent">IViewObject2::GetExtent</a> if it wants to get the display size of a loaded object from its cache.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Implementation consists of filling the sizel structure with an object's height and width.
     * @param {Integer} dwDrawAspect The aspect of the object whose limit is to be retrieved; the value is obtained from the enumerations <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> and from <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>. Note that newer objects and containers that support optimized drawing interfaces support the <b>DVASPECT2</b> enumeration values. Older objects and containers that do not support optimized drawing interfaces may not support <b>DVASPECT2</b>. The most common value for this method is DVASPECT_CONTENT, which specifies a full rendering of the object within its container.
     * @returns {SIZE} Pointer to where the object's size is to be returned.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getextent
     */
    GetExtent(dwDrawAspect) {
        psizel := SIZE()
        result := ComCall(18, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return psizel
    }

    /**
     * Establishes an advisory connection between a compound document object and the calling object's advise sink, through which the calling object receives notification when the compound document object is renamed, saved, or closed.
     * @remarks
     * The <b>IOleObject::Advise</b> method sets up an advisory connection between an object and its container, through which the object informs the container's advise sink of close, save, rename, and link-source change events in the object. A container calls this method, normally as part of initializing an object, to register its advisory sink with the object. In return, the object sends the container compound-document notifications by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink2">IAdviseSink2</a>.
     * 
     * If container and object successfully establish an advisory connection, the object receiving the call returns a nonzero value through <i>pdwConnection</i> to the container. If the attempt to establish an advisory connection fails, the object returns zero. To delete an advisory connection, the container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> and passes this nonzero token back to the object.
     * 
     * An object can delegate the job of managing and tracking advisory events to an OLE advise holder, to which you obtain a pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createoleadviseholder">CreateOleAdviseHolder</a>. The returned <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleadviseholder">IOleAdviseHolder</a> interface has three methods for sending advisory notifications, as well as <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-advise">IOleAdviseHolder::Advise</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-unadvise">IOleAdviseHolder::Unadvise</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-enumadvise">IOleAdviseHolder::EnumAdvise</a> methods that are identical to those for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a>. Calls to <b>IOleObject::Advise</b>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumadvise">IOleObject::EnumAdvise</a> are delegated to corresponding methods in the advise holder.
     * 
     * To destroy the advise holder, simply call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleadviseholder">IOleAdviseHolder</a> interface.
     * @param {IAdviseSink} pAdvSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advise sink of the calling object.
     * @returns {Integer} Pointer to a token that can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> to delete the advisory connection.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-advise
     */
    Advise(pAdvSink) {
        result := ComCall(19, this, "ptr", pAdvSink, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Deletes a previously established advisory connection. (IOleObject.Unadvise)
     * @remarks
     * Normally, containers call <b>IOleObject::Unadvise</b> at shutdown or when an object is deleted. In certain cases, containers can call this method on objects that are running but not currently visible as a way of reducing the overhead of maintaining multiple advisory connections. The easiest way to implement this method is to delegate the call to <b>IOleObject::Unadvise</b>.
     * @param {Integer} dwConnection Contains a token of nonzero value, which was previously returned from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-advise">IOleObject::Advise</a> through its <i>pdwConnection</i> parameter.
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
     * <dt><b>OLE_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * dwConnection does not represent a valid advisory connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(20, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an enumerator that can be used to enumerate the advisory connections registered for an object, so a container can know what to release prior to closing down.
     * @remarks
     * The <b>IOleObject::EnumAdvise</b> method supplies an enumerator that provides a way for containers to keep track of advisory connections registered for their objects. A container normally would call this function so that it can instruct an object to release each of its advisory connections prior to closing down.
     * 
     * The enumerator to which you get access through <b>IOleObject::EnumAdvise</b> enumerates items of type <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statdata">STATDATA</a>. Upon receiving the pointer, the container can then loop through <b>STATDATA</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> for each enumerated connection.
     * 
     * The usual way to implement this function is to delegate the call to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleadviseholder">IOleAdviseHolder</a> interface. Only the <b>pAdvise</b> and <b>dwConnection</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statdata">STATDATA</a> are relevant for <b>IOleObject::EnumAdvise</b>.
     * @returns {IEnumSTATDATA} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the enumerator object. If the object does not have any advisory connections or if an error occurs, the implementation must set <i>ppenumAdvise</i> to <b>NULL</b>. Each time an object receives a successful call to <b>IOleObject::EnumAdvise</b>, it must increase the reference count on <i>ppenumAdvise</i>. It is the caller's responsibility to call Release when it is done with the <i>ppenumAdvise</i>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-enumadvise
     */
    EnumAdvise() {
        result := ComCall(21, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * Retrieves the status of an object at creation and loading.
     * @remarks
     * A container normally calls <b>IOleObject::GetMiscStatus</b> when it creates or loads an object in order to determine how to display the object and what types of behaviors it supports.
     * 
     * Objects store status information in the registry. If the object is not running, the default handler's implementation of <b>IOleObject::GetMiscStatus</b> retrieves this information from the registry. If the object is running, the default handler invokes <b>IOleObject::GetMiscStatus</b> on the object itself.
     * 
     * The information that is actually stored in the registry varies with individual objects. The status values to be returned are defined in the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olemisc">OLEMISC</a>.
     * 
     * The default value of <b>IOleObject::GetMiscStatus</b> is used if a subkey corresponding to the specified <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> is not found. To set an OLE control, specify DVASPECT==1. This will cause the following to occur in the registry: 
     * 
     * 
     * <pre><b>HKEY_CLASSES_ROOT\CLSID\ . . .</b>
     *    <b>MiscStatus</b> = 1</pre>
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Implementation normally consists of delegating the call to the default handler.
     * @param {Integer} dwAspect The aspect of an object about which status information is being requested. The value is obtained from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>.
     * @returns {Integer} Pointer to where the status information is returned. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-getmiscstatus
     */
    GetMiscStatus(dwAspect) {
        result := ComCall(22, this, "uint", dwAspect, "int*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Specifies the color palette that the object application should use when it edits the specified object.
     * @remarks
     * The <b>IOleObject::SetColorScheme</b> method sends the container application's recommended color palette to the object application, which is not obliged to use it.
     * @param {Pointer<LOGPALETTE>} pLogpal Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure that specifies the recommended palette.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object does not support setting palettes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_PALETTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid LOGPALETTE structure pointed to by <i>pLogPal</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_NOTRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object must be running to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleobject-setcolorscheme
     */
    SetColorScheme(pLogpal) {
        result := ComCall(23, this, "ptr", pLogpal, "HRESULT")
        return result
    }
}
