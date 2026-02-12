#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumSTATDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages advisory connections and compound document notifications in an object server.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleadviseholder
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleAdviseHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleAdviseHolder
     * @type {Guid}
     */
    static IID => Guid("{00000111-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "EnumAdvise", "SendOnRename", "SendOnSave", "SendOnClose"]

    /**
     * Establishes an advisory connection between an OLE object and the calling object's advise sink. Through that sink, the calling object can receive notification when the OLE object is renamed, saved, or closed.
     * @remarks
     * Containers, object handlers, and link objects all create advise sinks to receive notification of changes in compound-document objects of interest, such as embedded or linked objects. OLE objects of interest to these objects must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> interface, which includes several advisory methods, including <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-advise">IOleObject::Advise</a>. A call to this method must set up an advisory connection with any advise sink that calls it, and maintain each connection until it is closed. It must be able to handle more than one advisory connection at a time.
     * 
     * <b>IOleAdviseHolder::Advise</b> is intended to be used to simplify the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-advise">IOleObject::Advise</a>. You can get a pointer to the OLE implementation of IOleAdviseHolder by calling <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createoleadviseholder">CreateOleAdviseHolder</a>, and then, to implement <b>IOleObject::Advise</b>, just delegate the call to <b>IOleAdviseHolder::Advise</b>. Other <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleadviseholder">IOleAdviseHolder</a> methods are intended to implement other <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> advisory methods.
     * 
     * If the attempt to establish an advisory connection is successful, the object receiving the call returns a nonzero value through <i>pdwConnection</i>. If the attempt fails, the object returns a zero. To delete an advisory connection, the object with the advise sink passes this nonzero token back to the object by calling <b>IOleAdviseHolder::Advise</b>.
     * @param {IAdviseSink} pAdvise A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advisory sink that should be informed of changes.
     * @returns {Integer} A pointer to a token that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-unadvise">IOleAdviseHolder::Unadvise</a> method to delete the advisory connection. The calling object is responsible for calling both <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on this pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-advise
     */
    Advise(pAdvise) {
        result := ComCall(3, this, "ptr", pAdvise, "uint*", &pdwConnection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwConnection
    }

    /**
     * Deletes a previously established advisory connection. (IOleAdviseHolder.Unadvise)
     * @remarks
     * <b>IOleAdviseHolder::Unadvise</b> is intended to be used to implement <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-unadvise">IOleObject::Unadvise</a> to delete an advisory connection. In general, you would use the OLE advise holder having obtained a pointer through a call to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createoleadviseholder">CreateOleAdviseHolder</a>.
     * 
     * Typically, containers call this method at shutdown or when an object is deleted. In certain cases, containers could call this method on objects that are running but not currently visible, as a way of reducing the overhead of maintaining multiple advisory connections.
     * @param {Integer} dwConnection The value previously returned by <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-advise">IOleAdviseHolder::Advise</a> in <i>pdwConnection</i>.
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
     * <dt><b>OLE_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwConnection</i> parameter does not represent a valid advisory connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an enumerator that can be used to enumerate the advisory connections currently established for an object.
     * @remarks
     * <b>IOleAdviseHolder::EnumAdvise</b> creates an enumerator that can be used to enumerate an object's established advisory connections. The method supplies a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> interface on this enumerator. Advisory connection information for each connection is stored in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statdata">STATDATA</a> structure, and the enumerator must be able to enumerate these structures.
     * 
     * For this method, the only relevant structure members are <b>pAdvise</b> and <b>dwConnection</b>. Other members contain data advisory information. When you call the enumeration methods, and while an enumeration is in progress, the effect of registering or revoking advisory connections on what is to be enumerated is undefined.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator. If this parameter is <b>NULL</b>, there are presently no advisory connections on the object, or an error occurred. The advise holder is responsible for incrementing the reference count on the <b>IEnumSTATDATA</b> pointer this method supplies. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is finished with the pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-enumadvise
     */
    EnumAdvise() {
        result := ComCall(5, this, "ptr*", &ppenumAdvise := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the name of object has changed.
     * @remarks
     * <b>SendOnRename</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> to advise the calling object, which must have already established an advisory connection, that the object has a new moniker. If you are using the OLE advise holder (having obtained a pointer through a call to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createoleadviseholder">CreateOleAdviseHolder</a>), you can call <b>SendOnRename</b> in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setmoniker">IOleObject::SetMoniker</a>, when you have determined that the operation is successful.
     * @param {IMoniker} pmk A pointer to the new full moniker of the object.
     * @returns {HRESULT} This method returns S_OK if advise sinks were sent <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> notifications.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-sendonrename
     */
    SendOnRename(pmk) {
        result := ComCall(6, this, "ptr", pmk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the object has been saved.
     * @remarks
     * <b>SendOnSave</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onsave">IAdviseSink::OnSave</a> to advise the calling object (client), which must have already established an advisory connection, that the object has been saved. If you are using the OLE advise holder (having obtained a pointer through a call to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createoleadviseholder">CreateOleAdviseHolder</a>), you can call <b>SendOnSave</b> whenever you save the object the advise holder is associated with.
     * 
     * To take the object from the running state to the loaded state, the client calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>. Within that implementation, if the user wants to save the object to persistent storage, the object calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-saveobject">IOleClientSite::SaveObject</a>, followed by the call to <b>SendOnSave</b>.
     * @returns {HRESULT} This method returns S_OK if advise sinks were sent <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onsave">IAdviseSink::OnSave</a> notifications.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-sendonsave
     */
    SendOnSave() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the object has closed.
     * @remarks
     * <b>SendOnClose</b> must call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> on all advise sinks that have a valid advisory connection with the object, whenever the object goes from the running state to the loaded state. This occurs through a call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a>, so you can call <b>SendOnClose</b> when you determine that a Close operation has been successful.
     * @returns {HRESULT} This method returns S_OK if advise sinks were notified of the close operation through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleadviseholder-sendonclose
     */
    SendOnClose() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
