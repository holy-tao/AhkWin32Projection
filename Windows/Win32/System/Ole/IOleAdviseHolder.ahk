#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumSTATDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Manages advisory connections and compound document notifications in an object server.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleadviseholder
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
     * @param {IAdviseSink} pAdvise A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advisory sink that should be informed of changes.
     * @returns {Integer} A pointer to a token that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleadviseholder-unadvise">IOleAdviseHolder::Unadvise</a> method to delete the advisory connection. The calling object is responsible for calling both <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on this pointer.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-advise
     */
    Advise(pAdvise) {
        result := ComCall(3, this, "ptr", pAdvise, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Deletes a previously established advisory connection.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Creates an enumerator that can be used to enumerate the advisory connections currently established for an object.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator. If this parameter is <b>NULL</b>, there are presently no advisory connections on the object, or an error occurred. The advise holder is responsible for incrementing the reference count on the <b>IEnumSTATDATA</b> pointer this method supplies. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when it is finished with the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-enumadvise
     */
    EnumAdvise() {
        result := ComCall(5, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the name of object has changed.
     * @param {IMoniker} pmk A pointer to the new full moniker of the object.
     * @returns {HRESULT} This method returns S_OK if advise sinks were sent <a href="/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">IAdviseSink::OnRename</a> notifications.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-sendonrename
     */
    SendOnRename(pmk) {
        result := ComCall(6, this, "ptr", pmk, "HRESULT")
        return result
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the object has been saved.
     * @returns {HRESULT} This method returns S_OK if advise sinks were sent <a href="/windows/desktop/api/objidl/nf-objidl-iadvisesink-onsave">IAdviseSink::OnSave</a> notifications.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-sendonsave
     */
    SendOnSave() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Sends notification to all advisory sinks currently registered with the advise holder that the object has closed.
     * @returns {HRESULT} This method returns S_OK if advise sinks were notified of the close operation through a call to the <a href="/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleadviseholder-sendonclose
     */
    SendOnClose() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
