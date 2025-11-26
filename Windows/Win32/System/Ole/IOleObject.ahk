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
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleobject
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-setclientsite
     */
    SetClientSite(pClientSite) {
        result := ComCall(3, this, "ptr", pClientSite, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an embedded object's client site.
     * @returns {IOleClientSite} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleclientsite">IOleClientSite</a> pointer variable that receives the interface pointer to the object's client site. If an object does not yet know its client site, or if an error has occurred, <i>ppClientSite</i> must be set to <b>NULL</b>. Each time an object receives a call to <b>IOleObject::GetClientSite</b>, it must increase the reference count on <i>ppClientSite</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is done with <i>ppClientSite</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getclientsite
     */
    GetClientSite() {
        result := ComCall(4, this, "ptr*", &ppClientSite := 0, "HRESULT")
        return IOleClientSite(ppClientSite)
    }

    /**
     * Provides an object with the names of its container application and the compound document in which it is embedded.
     * @param {PWSTR} szContainerApp Pointer to the name of the container application in which the object is running.
     * @param {PWSTR} szContainerObj Pointer to the name of the compound document that contains the object. If you do not wish to display the name of the compound document, you can set this parameter to <b>NULL</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-sethostnames
     */
    SetHostNames(szContainerApp, szContainerObj) {
        szContainerApp := szContainerApp is String ? StrPtr(szContainerApp) : szContainerApp
        szContainerObj := szContainerObj is String ? StrPtr(szContainerObj) : szContainerObj

        result := ComCall(5, this, "ptr", szContainerApp, "ptr", szContainerObj, "HRESULT")
        return result
    }

    /**
     * Changes an embedded object from the running to the loaded state. Disconnects a linked object from its link source.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-close
     */
    Close(dwSaveOption) {
        result := ComCall(6, this, "uint", dwSaveOption, "HRESULT")
        return result
    }

    /**
     * Notifies an object of its container's moniker, the object's own moniker relative to the container, or the object's full moniker.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-setmoniker
     */
    SetMoniker(dwWhichMoniker, pmk) {
        result := ComCall(7, this, "uint", dwWhichMoniker, "ptr", pmk, "HRESULT")
        return result
    }

    /**
     * Retrieves an embedded object's moniker, which the caller can use to link to the object.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getmoniker
     */
    GetMoniker(dwAssign, dwWhichMoniker) {
        result := ComCall(8, this, "uint", dwAssign, "uint", dwWhichMoniker, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * Initializes a newly created object with data from a specified data object, which can reside either in the same container or on the Clipboard.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-initfromdata
     */
    InitFromData(pDataObject, fCreation, dwReserved) {
        result := ComCall(9, this, "ptr", pDataObject, "int", fCreation, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a data object containing the current contents of the embedded object on which this method is called. Using the pointer to this data object, it is possible to create a new embedded object with the same data as the original.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {IDataObject} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer variable that receives the interface pointer to the data object. If an error occurs, <i>ppDataObject</i> must be set to <b>NULL</b>. Each time an object receives a call to <b>IOleObject::GetClipboardData</b>, it must increase the reference count on <i>ppDataObject</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is done with <i>ppDataObject</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getclipboarddata
     */
    GetClipboardData(dwReserved) {
        result := ComCall(10, this, "uint", dwReserved, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * Requests that an object perform an action in response to an end-user's action. The possible actions are enumerated for the object in IOleObject::EnumVerbs.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-doverb
     */
    DoVerb(iVerb, lpmsg, pActiveSite, lindex, hwndParent, lprcPosRect) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "int", iVerb, "ptr", lpmsg, "ptr", pActiveSite, "int", lindex, "ptr", hwndParent, "ptr", lprcPosRect, "HRESULT")
        return result
    }

    /**
     * Exposes a pull-down menu listing the verbs available for an object in ascending order by verb number.
     * @returns {IEnumOLEVERB} Address of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ienumoleverb">IEnumOLEVERB</a> pointer variable that receives the interface pointer to the new enumerator object. Each time an object receives a call to <b>IOleObject::EnumVerbs</b>, it must increase the reference count on <i>ppEnumOleVerb</i>. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is done with <i>ppEnumOleVerb</i>. If an error occurs, <i>ppEnumOleVerb</i> must be set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-enumverbs
     */
    EnumVerbs() {
        result := ComCall(12, this, "ptr*", &ppEnumOleVerb := 0, "HRESULT")
        return IEnumOLEVERB(ppEnumOleVerb)
    }

    /**
     * Updates an object handler's or link object's data or view caches.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-update
     */
    Update() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Checks whether an object is up to date.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-isuptodate
     */
    IsUpToDate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an object's class identifier, the CLSID corresponding to the string identifying the object to an end user.
     * @returns {Guid} Pointer to the class identifier (CLSID) to be returned. An object's CLSID is the binary equivalent of the user-type name returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getuserclassid
     */
    GetUserClassID() {
        pClsid := Guid()
        result := ComCall(15, this, "ptr", pClsid, "HRESULT")
        return pClsid
    }

    /**
     * Retrieves the user-type name of an object for display in user-interface elements such as menus, list boxes, and dialog boxes.
     * @param {Integer} dwFormOfType The form of the user-type name to be presented to users. Possible values are obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-userclasstype">USERCLASSTYPE</a> enumeration.
     * @returns {PWSTR} Address of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-calpolestr">LPOLESTR</a> pointer variable that receives a pointer to the user type string. The caller must free <i>pszUserType</i> using the current <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> instance. If an error occurs, the implementation must set <i>pszUserType</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getusertype
     */
    GetUserType(dwFormOfType) {
        result := ComCall(16, this, "uint", dwFormOfType, "ptr*", &pszUserType := 0, "HRESULT")
        return pszUserType
    }

    /**
     * Informs an object of how much display space its container has assigned it.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-setextent
     */
    SetExtent(dwDrawAspect, psizel) {
        result := ComCall(17, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return result
    }

    /**
     * Retrieves a running object's current display size.
     * @param {Integer} dwDrawAspect The aspect of the object whose limit is to be retrieved; the value is obtained from the enumerations <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a> and from <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-dvaspect2">DVASPECT2</a>. Note that newer objects and containers that support optimized drawing interfaces support the <b>DVASPECT2</b> enumeration values. Older objects and containers that do not support optimized drawing interfaces may not support <b>DVASPECT2</b>. The most common value for this method is DVASPECT_CONTENT, which specifies a full rendering of the object within its container.
     * @returns {SIZE} Pointer to where the object's size is to be returned.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getextent
     */
    GetExtent(dwDrawAspect) {
        psizel := SIZE()
        result := ComCall(18, this, "uint", dwDrawAspect, "ptr", psizel, "HRESULT")
        return psizel
    }

    /**
     * Establishes an advisory connection between a compound document object and the calling object's advise sink, through which the calling object receives notification when the compound document object is renamed, saved, or closed.
     * @param {IAdviseSink} pAdvSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advise sink of the calling object.
     * @returns {Integer} Pointer to a token that can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> to delete the advisory connection.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-advise
     */
    Advise(pAdvSink) {
        result := ComCall(19, this, "ptr", pAdvSink, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Deletes a previously established advisory connection.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(20, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an enumerator that can be used to enumerate the advisory connections registered for an object, so a container can know what to release prior to closing down.
     * @returns {IEnumSTATDATA} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the enumerator object. If the object does not have any advisory connections or if an error occurs, the implementation must set <i>ppenumAdvise</i> to <b>NULL</b>. Each time an object receives a successful call to <b>IOleObject::EnumAdvise</b>, it must increase the reference count on <i>ppenumAdvise</i>. It is the caller's responsibility to call Release when it is done with the <i>ppenumAdvise</i>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-enumadvise
     */
    EnumAdvise() {
        result := ComCall(21, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * Retrieves the status of an object at creation and loading.
     * @param {Integer} dwAspect The aspect of an object about which status information is being requested. The value is obtained from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-dvaspect">DVASPECT</a>.
     * @returns {Integer} Pointer to where the status information is returned. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-getmiscstatus
     */
    GetMiscStatus(dwAspect) {
        result := ComCall(22, this, "uint", dwAspect, "int*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Specifies the color palette that the object application should use when it edits the specified object.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleobject-setcolorscheme
     */
    SetColorScheme(pLogpal) {
        result := ComCall(23, this, "ptr", pLogpal, "HRESULT")
        return result
    }
}
