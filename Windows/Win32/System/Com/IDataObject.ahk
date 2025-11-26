#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STGMEDIUM.ahk
#Include .\FORMATETC.ahk
#Include .\IEnumFORMATETC.ahk
#Include .\IEnumSTATDATA.ahk
#Include .\IUnknown.ahk

/**
 * Enables data transfer and notification of changes in data.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idataobject
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IDataObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataObject
     * @type {Guid}
     */
    static IID => Guid("{0000010e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "GetDataHere", "QueryGetData", "GetCanonicalFormatEtc", "SetData", "EnumFormatEtc", "DAdvise", "DUnadvise", "EnumDAdvise"]

    /**
     * Called by a data consumer to obtain data from a source data object.
     * @param {Pointer<FORMATETC>} pformatetcIn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, medium, and target device to use when passing the data. It is possible to specify more than one medium by using the Boolean OR operator, allowing the method to choose the best medium among those specified.
     * @returns {STGMEDIUM} A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure that indicates the storage medium containing the returned data through its tymed member, and the responsibility for releasing the medium through the value of its <b>pUnkForRelease</b> member. If <b>pUnkForRelease</b> is <b>NULL</b>, the receiver of the medium is responsible for releasing it; otherwise, <b>pUnkForRelease</b> points to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> on the appropriate object so its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method can be called. The medium must be allocated and filled in by <b>GetData</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-getdata
     */
    GetData(pformatetcIn) {
        pmedium := STGMEDIUM()
        result := ComCall(3, this, "ptr", pformatetcIn, "ptr", pmedium, "HRESULT")
        return pmedium
    }

    /**
     * Called by a data consumer to obtain data from a source data object. This method differs from the GetData method in that the caller must allocate and free the specified storage medium.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, medium, and target device to use when passing the data. Only one medium can be specified in <b>tymed</b>, and only the following values are valid: TYMED_ISTORAGE, TYMED_ISTREAM, TYMED_HGLOBAL, or TYMED_FILE.
     * @param {Pointer<STGMEDIUM>} pmedium A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure that defines the storage medium containing the data being transferred. The medium must be allocated by the caller and filled in by <b>GetDataHere</b>. The caller must also free the medium. The implementation of this method must always supply a value of <b>NULL</b> for the <b>punkForRelease</b> member of the <b>STGMEDIUM</b> structure to which this parameter points.
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
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <b>lindex</b> is not valid; currently, only -1 is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_FORMATETC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>pformatetc</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_TYMED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>tymed</b> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwAspect</b> value is not valid.
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
     * The object application is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred when allocating the medium.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>dwDirection</i> parameter is not valid.
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
     * There was insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-getdatahere
     */
    GetDataHere(pformatetc, pmedium) {
        result := ComCall(4, this, "ptr", pformatetc, "ptr", pmedium, "HRESULT")
        return result
    }

    /**
     * Determines whether the data object is capable of rendering the data as specified. Objects attempting a paste or drop operation can call this method before calling IDataObject::GetData to get an indication of whether the operation may be successful.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure defining the format, medium, and target device to use for the query.
     * @returns {HRESULT} This method returns S_OK on success. Other possible values include the following
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for <b>lindex</b>; currently, only -1 is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_FORMATETC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for <i>pformatetc</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_TYMED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>tymed</b> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwAspect</b> value is not valid.
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
     * The object application is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>dwDirection</i> value is not valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-querygetdata
     */
    QueryGetData(pformatetc) {
        result := ComCall(5, this, "ptr", pformatetc, "int")
        return result
    }

    /**
     * Provides a potentially different but logically equivalent FORMATETC structure. You use this method to determine whether two different FORMATETC structures would return the same data, removing the need for duplicate rendering.
     * @param {Pointer<FORMATETC>} pformatectIn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, medium, and target device that the caller would like to use to retrieve data in a subsequent call such as <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. The <b>tymed</b> member is not significant in this case and should be ignored.
     * @returns {FORMATETC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains the most general information possible for a specific rendering, making it canonically equivalent to <i>pformatetcIn</i>. The caller must allocate this structure and the <b>GetCanonicalFormatEtc</b> method must fill in the data. To retrieve data in a subsequent call like <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>, the caller uses the specified value of <i>pformatetcOut</i>, unless the value specified is <b>NULL</b>. This value is <b>NULL</b> if the method returns DATA_S_SAMEFORMATETC. The <b>tymed</b> member is not significant in this case and should be ignored.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-getcanonicalformatetc
     */
    GetCanonicalFormatEtc(pformatectIn) {
        pformatetcOut := FORMATETC()
        result := ComCall(6, this, "ptr", pformatectIn, "ptr", pformatetcOut, "int")
        return pformatetcOut
    }

    /**
     * Called by an object containing a data source to transfer data to the object that implements this method.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure defining the format used by the data object when interpreting the data contained in the storage medium.
     * @param {Pointer<STGMEDIUM>} pmedium A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure defining the storage medium in which the data is being passed.
     * @param {BOOL} fRelease If <b>TRUE</b>, the data object called, which implements <b>SetData</b>, owns the storage medium after the call returns. This means it must free the medium after it has been used by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-releasestgmedium">ReleaseStgMedium</a> function. If <b>FALSE</b>, the caller retains ownership of the storage medium and the data object called uses the storage medium for the duration of the call only.
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
     * <dt><b>DV_E_LINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid value for <b>lindex</b>; currently, only -1 is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_FORMATETC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>pformatetc</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_TYMED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>tymed</b> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DV_E_DVASPECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwAspect</b> value is not valid.
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
     * The object application is not running.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>dwDirection</i> value is not valid.
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
     * There was insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "HRESULT")
        return result
    }

    /**
     * Creates an object to enumerate the formats supported by a data object.
     * @param {Integer} dwDirection The direction of the data.  Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-datadir">DATADIR</a> enumeration.
     * 
     * The value DATADIR_GET enumerates the formats that can be passed in to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. The value DATADIR_SET enumerates those formats that can be passed in to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>.
     * @returns {IEnumFORMATETC} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> pointer variable that receives the interface pointer to the new enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-enumformatetc
     */
    EnumFormatEtc(dwDirection) {
        result := ComCall(8, this, "uint", dwDirection, "ptr*", &ppenumFormatEtc := 0, "HRESULT")
        return IEnumFORMATETC(ppenumFormatEtc)
    }

    /**
     * Called by an object supporting an advise sink to create a connection between a data object and the advise sink. This enables the advise sink to be notified of changes in the data of the object.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, target device, aspect, and medium that will be used for future notifications. For example, one sink may want to know only when the bitmap representation of the data in the data object changes. Another sink may be interested in only the metafile format of the same object. Each advise sink is notified when the data of interest changes. This data is passed back to the advise sink when notification occurs.
     * @param {Integer} advf A group of flags for controlling the advisory connection. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. However, only some of the possible <b>ADVF</b> values are relevant for this method. The following table briefly describes the relevant values.
     * 
     * <table>
     * <tr>
     * <th>ADVF Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>ADVF_NODATA
     * </td>
     * <td>
     * Asks the data object to avoid sending data with the notifications. Typically data is sent. This flag is a way to override the default behavior. When ADVF_NODATA is used, the <b>tymed</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-ondatachange">OnDataChange</a> will usually contain TYMED_NULL. The caller can then retrieve the data with a subsequent <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ADVF_ONLYONCE
     * </td>
     * <td>
     * Causes the advisory connection to be destroyed after the first change notification is sent. An implicit call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dunadvise">IDataObject::DUnadvise</a> is made on behalf of the caller to remove the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ADVF_PRIMEFIRST
     * </td>
     * <td>
     * Asks for an additional initial notification. The combination of ADVF_ONLYONCE and ADVF_PRIMEFIRST provides, in effect, an asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>ADVF_DATAONSTOP
     * </td>
     * <td>
     * When specified with ADVF_NODATA, this flag causes a last notification with the data included to to be sent before the data object is destroyed.
     * 
     * If used without ADVF_NODATA, <b>DAdvise</b> can be implemented in one of the following ways:
     * 
     * <ul>
     * <li>The ADVF_DATAONSTOP can be ignored.</li>
     * <li>The object can behave as if ADVF_NODATA was specified.</li>
     * </ul>
     * A change notification is sent only in the shutdown case. Data changes prior to shutdown do not cause a notification to be sent.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IAdviseSink} pAdvSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface on the advisory sink that will receive the change notification.
     * @returns {Integer} A token that identifies this connection. You can use this token later to delete the advisory connection (by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dunadvise">IDataObject::DUnadvise</a>). If this value is 0, the connection was not established.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-dadvise
     */
    DAdvise(pformatetc, advf, pAdvSink) {
        result := ComCall(9, this, "ptr", pformatetc, "uint", advf, "ptr", pAdvSink, "uint*", &pdwConnection := 0, "HRESULT")
        return pdwConnection
    }

    /**
     * Destroys a notification connection that had been previously set up.
     * @param {Integer} dwConnection A token that specifies the connection to be removed. Use the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> when the connection was originally established.
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
     * The specified value for <i>dwConnection</i> is not a valid connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OLE_E_ADVISENOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This <a href="/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> implementation does not support notification.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-dunadvise
     */
    DUnadvise(dwConnection) {
        result := ComCall(10, this, "uint", dwConnection, "HRESULT")
        return result
    }

    /**
     * Creates an object that can be used to enumerate the current advisory connections.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator object. If the implementation sets *<i>ppenumAdvise</i> to <b>NULL</b>, there are no connections to advise sinks at this time.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idataobject-enumdadvise
     */
    EnumDAdvise() {
        result := ComCall(11, this, "ptr*", &ppenumAdvise := 0, "HRESULT")
        return IEnumSTATDATA(ppenumAdvise)
    }
}
