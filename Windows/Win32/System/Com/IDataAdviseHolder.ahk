#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSTATDATA.ahk
#Include .\IUnknown.ahk

/**
 * Creates and manages advisory connections between a data object and one or more advise sinks.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idataadviseholder
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDataAdviseHolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataAdviseHolder
     * @type {Guid}
     */
    static IID => Guid("{00000110-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "EnumAdvise", "SendOnDataChange"]

    /**
     * Creates a connection between an advise sink and a data object for receiving notifications.
     * @param {IDataObject} pDataObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object for which notifications are requested. If data in this object changes, a notification is sent to the advise sinks that have requested notification.
     * @param {Pointer<FORMATETC>} pFetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains the specified format, medium, and target device that is of interest to the advise sink requesting notification. For example, one sink may want to know only when the bitmap representation of the data in the data object changes. Another sink may be interested in only the metafile format of the same object. Each advise sink is notified when the data of interest changes. This data is passed back to the advise sink when notification occurs.
     * @param {Integer} advf A group of flags that  control the advisory connection. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. However, only some of the possible <b>ADVF</b> values are relevant for this method. The following table briefly describes the relevant values; a more detailed description can be found in the description of the <b>ADVF</b> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_NODATA"></a><a id="advf_nodata"></a><dl>
     * <dt><b>ADVF_NODATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Asks that no data be sent along with the notification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_ONLYONCE"></a><a id="advf_onlyonce"></a><dl>
     * <dt><b>ADVF_ONLYONCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the advisory connection to be destroyed after the first notification is sent. An implicit call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-unadvise">IDataAdviseHolder::Unadvise</a> is made on behalf of the caller to remove the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_PRIMEFIRST"></a><a id="advf_primefirst"></a><dl>
     * <dt><b>ADVF_PRIMEFIRST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes an initial notification to be sent regardless of whether data has changed from its current state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADVF_DATAONSTOP"></a><a id="advf_dataonstop"></a><dl>
     * <dt><b>ADVF_DATAONSTOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When specified with ADVF_NODATA, this flag causes a last notification with the data included to be sent before the data object is destroyed. When ADVF_NODATA is not specified, this flag has no effect.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IAdviseSink} pAdvise A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advisory sink that receives the change notification.
     * @returns {Integer} A pointer to a variable that receives a  token that identifies this connection. The calling object can later delete the advisory connection by passing this token to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-unadvise">IDataAdviseHolder::Unadvise</a>. If this value is zero, the connection was not established.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataadviseholder-advise
     */
    Advise(pDataObject, pFetc, advf, pAdvise) {
        result := ComCall(3, this, "ptr", pDataObject, "ptr", pFetc, "uint", advf, "ptr", pAdvise, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Removes a connection between a data object and an advisory sink that was set up through a previous call to IDataAdviseHolder::Advise. This method is typically called in the implementation of IDataObject::DUnadvise.
     * @param {Integer} dwConnection A token that specifies the connection to be removed. This value was returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-advise">IDataAdviseHolder::Advise</a> when the connection was originally established.
     * @returns {HRESULT} This method returns S_OK on success. Other possible values include the following.
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
     * The <i>dwConnection</i> parameter does not specify a valid connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataadviseholder-unadvise
     */
    Unadvise(dwConnection) {
        result := ComCall(4, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Returns an object that can be used to enumerate the current advisory connections.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator object. If the implementation returns <b>NULL</b> in *<i>ppenumAdvise</i>, there are no connections to advise sinks at this time.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataadviseholder-enumadvise
     */
    EnumAdvise() {
        result := ComCall(5, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }

    /**
     * Sends notifications to each advise sink for which there is a connection established by calling the IAdviseSink::OnDataChange method for each advise sink currently being handled by this instance of the advise holder object.
     * @param {IDataObject} pDataObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object in which the data has just changed. This pointer is used in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-ondatachange">IAdviseSink::OnDataChange</a>.
     * @param {Integer} advf Container for advise flags that specify how the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-ondatachange">IAdviseSink::OnDataChange</a> is made. These flag values are from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a>. Typically, the value for <i>advf</i> is <b>NULL</b>. The only exception occurs when the data object is shutting down and must send a final notification that includes the actual data to sinks that have specified ADVF_DATAONSTOP and ADVF_NODATA in their call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a>. In this case, <i>advf</i> contains ADVF_DATAONSTOP.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataadviseholder-sendondatachange
     */
    SendOnDataChange(pDataObject, advf) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", pDataObject, "uint", dwReserved, "uint", advf, "HRESULT")
        return result
    }
}
