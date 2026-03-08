#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IEnumMoniker.ahk

/**
 * Manages access to the running object table (ROT), a globally accessible look-up table on each workstation.
 * @remarks
 * The ROT contains entries of the following form: (<i>pmkObjectName</i>, <i>pUnkObject</i>).
 * 
 * The <i>pmkObjectName</i> element is a pointer to the moniker that identifies the running object. The <i>pUnkObject</i> element is a pointer to the running object itself. During the binding process, monikers consult the <i>pmkObjectName</i> entries in the ROT to see whether an object is already running.
 * 
 * Objects that can be named by monikers must be registered with the ROT when they are loaded and their registration must be revoked when they are no longer running.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-irunningobjecttable
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunningObjectTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunningObjectTable
     * @type {Guid}
     */
    static IID => Guid("{00000010-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Revoke", "IsRunning", "GetObject", "NoteChangeTime", "GetTimeOfLastChange", "EnumRunning"]

    /**
     * Registers an object and its identifying moniker in the running object table (ROT).
     * @remarks
     * This method registers a pointer to an object under a moniker that identifies the object. The moniker is used as the key when the table is searched with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-getobject">IRunningObjectTable::GetObject</a>.
     * 
     * When an object is registered, the ROT always calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the object. For a weak registration (ROTFLAGS_REGISTRATIONKEEPSALIVE not set), the ROT will release the object whenever the last strong reference to the object is released. For a strong registration (ROTFLAGS_REGISTRATIONKEEPSALIVE set), the ROT prevents the object from being destroyed until the object's registration is explicitly revoked.
     * 
     * A server registered as either LocalService or RunAs can set the ROTFLAGS_ALLOWANYCLIENT flag in its call to <b>Register</b> to allow any client to connect to it. A server setting this bit must have its executable name in the AppID section of the registry that refers to the AppID for the executable. An "activate as activator" server (not registered as LocalService or RunAs) must not set this flag in its call to <b>Register</b>. For details on installing services, see <a href="https://docs.microsoft.com/windows/desktop/com/installing-as-a-service-application">Installing as a Service Application</a>.
     * 
     * Registering a second object with the same moniker, or re-registering the same object with the same moniker, creates a second entry in the ROT. In this case, <b>Register</b> returns MK_S_MONIKERALREADYREGISTERED. Each call to <b>Register</b> must be matched by a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-revoke">IRunningObjectTable::Revoke</a> because even duplicate entries have different <i>pdwRegister</i> identifiers. A problem with duplicate registrations is that there is no way to determine which object will be returned if the moniker is specified in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-isrunning">IRunningObjectTable::IsRunning</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If you are a moniker provider (that is, you hand out monikers identifying your objects to make them accessible to others), you must call the <b>Register</b> method to register your objects when they begin running. You must also call this method if you rename your objects while they are loaded. 
     * 
     * 
     * 
     * The most common type of moniker provider is a compound-document link source. This includes server applications that support linking to their documents (or portions of a document) and container applications that support linking to embeddings within their documents. Server applications that do not support linking can also use the ROT to cooperate with container applications that support linking to embeddings.
     * 
     * 
     * 
     * If you are writing a server application, you should register an object with the ROT when it begins running, typically in your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a>. The object must be registered under its full moniker, which requires getting the moniker of its container document using <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getmoniker">IOleClientSite::GetMoniker</a>. You should also revoke and re-register the object in your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a>, which is called if the container document is renamed.
     * 
     * If you are writing a container application that supports linking to embeddings, you should register your document with the ROT when it is loaded. If your document is renamed, you should revoke and re-register it with the ROT and call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a> for any embedded objects in the document to give them an opportunity to re-register themselves.
     * 
     * Objects registered in the ROT must be explicitly revoked when the object is no longer running or when its moniker changes. This revocation is important because there is no way for the system to automatically remove entries from the ROT. You must cache the identifier that is written through pdwRegister and use it in a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-revoke">IRunningObjectTable::Revoke</a> to revoke the registration. For a strong registration, a strong reference is released when the objects registration is revoked.
     * 
     * As of Windows Server 2003, if there are stale entries that remain in the ROT due to unexpected server problems, COM will automatically remove these stale entries from the ROT.
     * 
     * The system's implementation of <b>Register</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-reduce">IMoniker::Reduce</a> on the <i>pmkObjectName</i> parameter to ensure that the moniker is fully reduced before registration. If an object is known by more than one fully reduced moniker, it should be registered under all such monikers.
     * @param {Integer} grfFlags Specifies whether the ROT's reference to punkObject is weak or strong and controls access to the object through its entry in the ROT. For details, see the Remarks section.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROTFLAGS_REGISTRATIONKEEPSALIVE"></a><a id="rotflags_registrationkeepsalive"></a><dl>
     * <dt><b>ROTFLAGS_REGISTRATIONKEEPSALIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, indicates a strong registration for the object. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ROTFLAGS_ALLOWANYCLIENT"></a><a id="rotflags_allowanyclient"></a><dl>
     * <dt><b>ROTFLAGS_ALLOWANYCLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set, any client can connect to the running object through its entry in the ROT. When not set, only clients in the window station that registered the object can connect to it.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} punkObject A pointer to the object that is being registered as running.
     * @param {IMoniker} pmkObjectName A pointer to the moniker that identifies <i>punkObject</i>.
     * @returns {Integer} An identifier for this ROT entry that can be used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-revoke">IRunningObjectTable::Revoke</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-notechangetime">IRunningObjectTable::NoteChangeTime</a>. The caller cannot specify <b>NULL</b> for this parameter. If an error occurs, *<i>pdwRegister</i> is set to zero.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-register
     */
    Register(grfFlags, punkObject, pmkObjectName) {
        result := ComCall(3, this, "uint", grfFlags, "ptr", punkObject, "ptr", pmkObjectName, "uint*", &pdwRegister := 0, "HRESULT")
        return pdwRegister
    }

    /**
     * Removes an entry from the running object table (ROT) that was previously registered by a call to IRunningObjectTable::Register.
     * @remarks
     * This method undoes the effect of a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>, removing both the moniker and the pointer to the object identified by that moniker.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A moniker provider (hands out monikers identifying its objects to make them accessible to others) must call the <b>Revoke</b> method to revoke the registration of its objects when it stops running. It must have previously called <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a> and stored the identifier returned by that method; it uses that identifier when calling <b>Revoke</b>.
     * 
     * The most common type of moniker provider is a compound-document link source. This includes server applications that support linking to their documents (or portions of a document) and container applications that support linking to embeddings within their documents. Server applications that do not support linking can also use the ROT to cooperate with container applications that support linking to embeddings.
     * 
     * If you are writing a container application, you must revoke a document's registration when the document is closed. You must also revoke a document's registration before re-registering it when it is renamed. 
     * 
     * 
     * 
     * If you are writing a server application, you must revoke an object's registration when the object is closed. You must also revoke an object's registration before re-registering it when its container document is renamed (see <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a>).
     * @param {Integer} dwRegister The identifier of the ROT entry to be revoked.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-revoke
     */
    Revoke(dwRegister) {
        result := ComCall(4, this, "uint", dwRegister, "HRESULT")
        return result
    }

    /**
     * Determines whether the object identified by the specified moniker is currently running.
     * @remarks
     * This method simply indicates whether a object is running. To retrieve a pointer to a running object, use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-getobject">IRunningObjectTable::GetObject</a> method.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Generally, you call the <b>IsRunning</b> method only if you are writing your own moniker class (that is, implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface). You typically call this method from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isrunning">IMoniker::IsRunning</a>. However, you should do so only if the <i>pmkToLeft</i> parameter of <b>IMoniker::IsRunning</b> is <b>NULL</b>. Otherwise, you should call <b>IMoniker::IsRunning</b> on your <i>pmkToLeft</i> parameter instead.
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {HRESULT} If the object is in the running state, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-isrunning
     */
    IsRunning(pmkObjectName) {
        result := ComCall(5, this, "ptr", pmkObjectName, "HRESULT")
        return result
    }

    /**
     * Determines whether the object identified by the specified moniker is running, and if it is, retrieves a pointer to that object.
     * @remarks
     * This method checks the ROT for the moniker specified by <i>pmkObjectName</i>. If that moniker had previously been registered with a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>, this method returns the pointer that was registered at that time.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Generally, you call the <b>IRunningObjectTable::GetObject</b> method only if you are writing your own moniker class (that is, implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface). You typically call this method from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>.
     * 
     * However, note that not all implementations of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> need to call this method. If you expect your moniker to have a prefix (indicated by a non-<b>NULL</b><i>pmkToLeft</i> parameter to <b>IMoniker::BindToObject</b>), you should not check the ROT. The reason for this is that only complete monikers are registered with the ROT, and if your moniker has a prefix, your moniker is part of a composite and thus not complete. Instead, your moniker should request services from the object identified by the prefix (for example, the container of the object identified by your moniker).
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {IUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer variable that receives the interface pointer to the running object. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the object; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If the object is not running or if an error occurs, the implementation sets *<i>ppunkObject</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-getobject
     */
    GetObject(pmkObjectName) {
        result := ComCall(6, this, "ptr", pmkObjectName, "ptr*", &ppunkObject := 0, "HRESULT")
        return IUnknown(ppunkObject)
    }

    /**
     * Records the time that a running object was last modified. The object must have previously been registered with the running object table (ROT). This method stores the time of last change in the ROT.
     * @remarks
     * The time recorded by this method can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-gettimeoflastchange">IRunningObjectTable::GetTimeOfLastChange</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A moniker provider (hands out monikers identifying its objects to make them accessible to others) must call the <b>NoteChangeTime</b> method whenever its objects are modified. It must have previously called <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a> and stored the identifier returned by that method; it uses that identifier when calling <b>NoteChangeTime</b>.
     * 
     * 
     * 
     * The most common type of moniker provider is a compound-document link source. This includes server applications that support linking to their documents (or portions of a document) and container applications that support linking to embeddings within their documents. Server applications that do not support linking can also use the ROT to cooperate with container applications that support linking to embeddings. 
     * 
     * 
     * 
     * When an object is first registered in the ROT, the ROT records its last change time as the value returned by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-gettimeoflastchange">IMoniker::GetTimeOfLastChange</a> on the moniker being registered.
     * @param {Integer} dwRegister The identifier of the ROT entry of the changed object. This value was previously returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-register">IRunningObjectTable::Register</a>.
     * @param {Pointer<FILETIME>} pfiletime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the object's last change time.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-notechangetime
     */
    NoteChangeTime(dwRegister, pfiletime) {
        result := ComCall(7, this, "uint", dwRegister, "ptr", pfiletime, "HRESULT")
        return result
    }

    /**
     * Retrieves the time that an object was last modified.
     * @remarks
     * This method returns the change time that was last reported for this object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-notechangetime">IRunningObjectTable::NoteChangeTime</a>. If <b>NoteChangeTime</b> has not been called previously, the method returns the time that was recorded when the object was registered.
     * 
     * This method is provided to enable checking whether a connection between two objects (represented by one object holding a moniker that identifies the other) is up-to-date. For example, if one object is holding cached information about the other object, this method can be used to check whether the object has been modified since the cache was last updated. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-gettimeoflastchange">IMoniker::GetTimeOfLastChange</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Generally, you call <b>GetTimeOfLastChange</b> only if you are writing your own moniker class (that is, implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface). You typically call this method from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-gettimeoflastchange">IMoniker::GetTimeOfLastChange</a>. However, you should do so only if the <i>pmkToLeft</i> parameter of <b>IMoniker::GetTimeOfLastChange</b> is <b>NULL</b>. Otherwise, you should call <b>IMoniker::GetTimeOfLastChange</b> on your <i>pmkToLeft</i> parameter instead.
     * @param {IMoniker} pmkObjectName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker.
     * @returns {FILETIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the object's last change time.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-gettimeoflastchange
     */
    GetTimeOfLastChange(pmkObjectName) {
        pfiletime := FILETIME()
        result := ComCall(8, this, "ptr", pmkObjectName, "ptr", pfiletime, "HRESULT")
        return pfiletime
    }

    /**
     * Creates and returns a pointer to an enumerator that can list the monikers of all the objects currently registered in the running object table (ROT).
     * @remarks
     * <b>IRunningObjectTable::EnumRunning</b> must create and return a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> interface on an enumerator object. The standard enumerator methods can then be called to enumerate the monikers currently registered in the registry. The enumerator cannot be used to enumerate monikers that are registered in the ROT after the enumerator has been created.
     * 
     * The <b>EnumRunning</b> method is intended primarily for the use by the system in implementing the alert object table. Note that OLE 2 does not include an implementation of the alert object table.
     * @returns {IEnumMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> pointer variable that receives the interface pointer to the new enumerator for the ROT. When successful, the implementation calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the enumerator; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs; the implementation sets *<i>ppenumMoniker</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irunningobjecttable-enumrunning
     */
    EnumRunning() {
        result := ComCall(9, this, "ptr*", &ppenumMoniker := 0, "HRESULT")
        return IEnumMoniker(ppenumMoniker)
    }
}
