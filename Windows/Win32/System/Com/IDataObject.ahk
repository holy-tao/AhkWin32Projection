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
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-idataobject
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
     * @remarks
     * A data consumer calls <b>GetData</b> to retrieve data from a data object, conveyed through a storage medium (defined through the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure).
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You can specify more than one acceptable <b>tymed</b> medium with the Boolean OR operator. <b>GetData</b> must choose from the OR'd values the medium that best represents the data, do the allocation, and indicate responsibility for releasing the medium.
     * 
     * Data transferred across a stream extends from position zero of the stream pointer through to the position immediately before the current stream pointer (that is, the stream pointer position upon exit).
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * <b>GetData</b> must check all fields in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure. It is important that <b>GetData</b> render the requested aspect and, if possible, use the requested medium. If the data object cannot comply with the information specified in the <b>FORMATETC</b>, the method should return DV_E_FORMATETC. If an attempt to allocate the medium fails, the method should return STG_E_MEDIUMFULL. It is important to fill in all of the fields in the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure.
     * 
     * Although the caller can specify more than one medium for returning the data, <b>GetData</b> can provide only one medium. If the initial transfer fails with the selected medium, this method can be implemented to try one of the other media specified before returning an error.
     * @param {Pointer<FORMATETC>} pformatetcIn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, medium, and target device to use when passing the data. It is possible to specify more than one medium by using the Boolean OR operator, allowing the method to choose the best medium among those specified.
     * @returns {STGMEDIUM} A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure that indicates the storage medium containing the returned data through its tymed member, and the responsibility for releasing the medium through the value of its <b>pUnkForRelease</b> member. If <b>pUnkForRelease</b> is <b>NULL</b>, the receiver of the medium is responsible for releasing it; otherwise, <b>pUnkForRelease</b> points to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> on the appropriate object so its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method can be called. The medium must be allocated and filled in by <b>GetData</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-getdata
     */
    GetData(pformatetcIn) {
        pmedium := STGMEDIUM()
        result := ComCall(3, this, "ptr", pformatetcIn, "ptr", pmedium, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pmedium
    }

    /**
     * Called by a data consumer to obtain data from a source data object. This method differs from the GetData method in that the caller must allocate and free the specified storage medium.
     * @remarks
     * The <b>GetDataHere</b> method is similar to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>, except that the caller must both allocate and free the medium specified in <i>pmedium</i>. <b>GetDataHere</b> renders the data described in a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure and copies the data into that caller-provided <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure. For example, if the medium is TYMED_HGLOBAL, this method cannot resize the medium or allocate a new hGlobal.
     * 
     * Some media are not appropriate in a call to <b>GetDataHere</b>, including GDI types such as metafiles. The <b>GetDataHere</b> method cannot put data into a caller-provided metafile. In general, the only storage media it is necessary to support in this method are TYMED_ISTORAGE, TYMED_ISTREAM, and TYMED_FILE.
     * 
     * When the transfer medium is a stream, OLE makes assumptions about where the data is being returned and the position of the stream's seek pointer. In a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">GetData</a> call, the data returned is from stream position zero through just before the current seek pointer of the stream (that is, the position on exit). For <b>GetDataHere</b>, the data returned is from the stream position on entry through just before the position on exit.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-getdatahere
     */
    GetDataHere(pformatetc, pmedium) {
        result := ComCall(4, this, "ptr", pformatetc, "ptr", pmedium, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the data object is capable of rendering the data as specified. Objects attempting a paste or drop operation can call this method before calling IDataObject::GetData to get an indication of whether the operation may be successful.
     * @remarks
     * The client of a data object calls <b>QueryGetData</b> to determine whether passing the specified <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure to a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> is likely to be successful. A successful return from this method does not necessarily ensure the success of the subsequent paste or drop operation.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-querygetdata
     */
    QueryGetData(pformatetc) {
        result := ComCall(5, this, "ptr", pformatetc, "int")
        return result
    }

    /**
     * Provides a potentially different but logically equivalent FORMATETC structure. You use this method to determine whether two different FORMATETC structures would return the same data, removing the need for duplicate rendering.
     * @remarks
     * If a data object can supply exactly the same data for more than one requested <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure, <b>GetCanonicalFormatEtc</b> can supply a "canonical", or standard <b>FORMATETC</b> that gives the same rendering as a set of more complicated <b>FORMATETC</b> structures. For example, it is common for the data returned to be insensitive to the target device specified in any one of a set of otherwise similar <b>FORMATETC</b> structures.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A call to this method can determine whether two calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> on a data object, specifying two different <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures, would actually produce the same renderings, thus eliminating the need for the second call and improving performance. If the call to <b>GetCanonicalFormatEtc</b> results in a canonical format being written to the <i>pformatetcOut</i> parameter, the caller then uses that structure in a subsequent call to <b>IDataObject::GetData</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Conceptually, it is possible to think of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in groups defined by a canonical <b>FORMATETC</b> that provides the same results as each of the group members. In constructing the canonical <b>FORMATETC</b>, you should make sure it contains the most general information possible that still produces a specific rendering.
     * 
     * For data objects that never provide device-specific renderings, the simplest implementation of this method is to copy the input <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> to the output <b>FORMATETC</b>, store a <b>NULL</b> in the <b>ptd</b> member of the output <b>FORMATETC</b>, and return DATA_S_SAMEFORMATETC.
     * @param {Pointer<FORMATETC>} pformatectIn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, medium, and target device that the caller would like to use to retrieve data in a subsequent call such as <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. The <b>tymed</b> member is not significant in this case and should be ignored.
     * @returns {FORMATETC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains the most general information possible for a specific rendering, making it canonically equivalent to <i>pformatetcIn</i>. The caller must allocate this structure and the <b>GetCanonicalFormatEtc</b> method must fill in the data. To retrieve data in a subsequent call like <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>, the caller uses the specified value of <i>pformatetcOut</i>, unless the value specified is <b>NULL</b>. This value is <b>NULL</b> if the method returns DATA_S_SAMEFORMATETC. The <b>tymed</b> member is not significant in this case and should be ignored.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-getcanonicalformatetc
     */
    GetCanonicalFormatEtc(pformatectIn) {
        pformatetcOut := FORMATETC()
        result := ComCall(6, this, "ptr", pformatectIn, "ptr", pformatetcOut, "int")
        return pformatetcOut
    }

    /**
     * Called by an object containing a data source to transfer data to the object that implements this method.
     * @remarks
     * <b>SetData</b> allows another object to attempt to send data to the implementing data object. A data object implements this method if it supports receiving data from another object. If it does not support this, it should be implemented to return E_NOTIMPL.
     * 
     * The caller allocates the storage medium indicated by the <i>pmedium</i> parameter, in which the data is passed. The data object called does not take ownership of the data until it has successfully received it and no error code is returned. The value of the <i>fRelease</i> parameter indicates the ownership of the medium after the call returns. <b>FALSE</b> indicates the caller still owns the medium, and the data object only has the use of it during the call; <b>TRUE</b> indicates that the data object now owns it and must release it when it is no longer needed.
     * 
     * The type of medium specified in the <i>pformatetc</i> and <i>pmedium</i> parameters must be the same. For example, one cannot be a global handle and the other a stream.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-setdata
     */
    SetData(pformatetc, pmedium, fRelease) {
        result := ComCall(7, this, "ptr", pformatetc, "ptr", pmedium, "int", fRelease, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an object to enumerate the formats supported by a data object.
     * @remarks
     * <b>EnumFormatEtc</b> creates an enumerator object that can be used to determine all of the ways the data object can describe data in a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure, and provides a pointer to its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interface. This is one of the standard enumerator interfaces.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Having obtained the pointer, the caller can enumerate the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures by calling the enumeration methods of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a>. Because the formats can change over time, there is no guarantee that an enumerated format is currently supported because the formats can change over time. Accordingly, applications should treat the enumeration as a hint of the format types that can be passed. The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when it is finished with the enumerator.
     * 
     * <b>EnumFormatEtc</b> is called when one of the following actions occurs:
     * 
     * <ul>
     * <li>An application calls <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a>. OLE must determine what data to place on the clipboard and whether it is necessary to put OLE 1 compatibility formats on the clipboard.</li>
     * <li>Data is being pasted from the clipboard or dropped. An application uses the first acceptable format.
     * </li>
     * <li>The <b>Paste Special</b> dialog box is displayed. The target application builds the list of formats from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> entries.</li>
     * </ul>
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Formats can be registered statically in the registry or dynamically during object initialization. If an object has an unchanging list of formats and these formats are registered in the registry, OLE provides an implementation of a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> enumeration object that can enumerate formats registered under a specific CLSID in the registry. A pointer to its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interface is available through a call to the helper function <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleregenumformatetc">OleRegEnumFormatEtc</a>. In this situation, therefore, you can implement the <b>EnumFormatEtc</b> method simply with a call to this function.
     * 
     * EXE applications can effectively do the same thing by implementing the method to return the value OLE_S_USEREG. This return value instructs the default object handler to call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleregenumformatetc">OleRegEnumFormatEtc</a>. Object applications that are implemented as DLL object applications cannot return OLE_S_USEREG, so must call <b>OleRegEnumFormatEtc</b> directly.
     * 
     * Private formats can be enumerated for OLE 1 objects, if they are registered with the RequestDataFormats or SetDataFormats keys in the registry. Also, private formats can be enumerated for OLE objects (all versions after OLE 1), if they are registered with the GetDataFormats or SetDataFormats keys.
     * 
     * For OLE 1 objects whose servers do not have RequestDataFormats or SetDataFormats information registered in the registry, a call to <b>EnumFormatEtc</b> passing DATADIR_GET only enumerates the native and metafile formats, regardless of whether they support these formats or others. Calling <b>EnumFormatEtc</b> passing DATADIR_SET on such objects only enumerates native, regardless of whether the object supports being set with other formats.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure returned by the enumeration usually indicates a <b>NULL</b> target device (ptd). This is appropriate because, unlike the other members of <b>FORMATETC</b>, the target device does not participate in the object's decision as to whether it can accept or provide the data in either a SetData or GetData call.
     * 
     * The <b>tymed</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> often indicates that more than one kind of storage medium is acceptable. You should always mask and test for this by using a Boolean OR operator.
     * @param {Integer} dwDirection The direction of the data.  Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-datadir">DATADIR</a> enumeration.
     * 
     * The value DATADIR_GET enumerates the formats that can be passed in to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. The value DATADIR_SET enumerates those formats that can be passed in to a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>.
     * @returns {IEnumFORMATETC} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> pointer variable that receives the interface pointer to the new enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-enumformatetc
     */
    EnumFormatEtc(dwDirection) {
        result := ComCall(8, this, "uint", dwDirection, "ptr*", &ppenumFormatEtc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumFORMATETC(ppenumFormatEtc)
    }

    /**
     * Called by an object supporting an advise sink to create a connection between a data object and the advise sink. This enables the advise sink to be notified of changes in the data of the object.
     * @remarks
     * <b>DAdvise</b> creates a change notification connection between a data object and the caller. The caller provides an advisory sink to which the notifications can be sent when the object's data changes.
     * 
     * Objects used simply for data transfer typically do not support advisory notifications and return OLE_E_ADVISENOTSUPPORTED from <b>DAdvise</b>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The object supporting the advise sink calls <b>DAdvise</b> to set up the connection, specifying the format, aspect, medium, and/or target device of interest in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure passed in. If the data object does not support one or more of the requested attributes or the sending of notifications at all, it can refuse the connection by returning OLE_E_ADVISENOTSUPPORTED.
     * 
     * Containers of linked objects can set up advisory connections directly with the bound link source or indirectly through the standard OLE link object that manages the connection. Connections set up with the bound link source are not automatically deleted. The container must explicitly call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dunadvise">IDataObject::DUnadvise</a> on the bound link source to delete an advisory connection. The OLE link object, manipulated through the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolelink">IOleLink</a> interface, is implemented in the default handler. Connections set up through the OLE link object are destroyed when the link object is deleted.
     * 
     * The OLE default link object creates a "wildcard advise" with the link source so OLE can maintain the time of last change. This advise is specifically used to note the time that anything changed. OLE ignores all data formats that may have changed, noting only the time of last change. To allow wildcard advises, set the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> members as follows before calling <b>DAdvise</b>:
     * 
     * 
     * ``` syntax
     * cf == 0; 
     * ptd == NULL; 
     * dwAspect == -1; 
     * lindex == -1 
     * tymed == -1;
     * ```
     * 
     * The advise flags should also include ADVF_NODATA. Wildcard advises from OLE should always be accepted by applications.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * To simplify the implementation of <b>DAdvise</b> and the other notification methods in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dunadvise">DUnadvise</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumdadvise">EnumDAdvise</a>) that supports notification, OLE provides an advise holder object that manages the registration and sending of notifications. To get a pointer to this object, call the helper function <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createdataadviseholder">CreateDataAdviseHolder</a> on the first invocation of <b>DAdvise</b>. This supplies a pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataadviseholder">IDataAdviseHolder</a> interface. Then, delegate the call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-advise">IDataAdviseHolder::Advise</a> method in the data advise holder, which creates, and subsequently manages, the requested connection.
     * @param {Pointer<FORMATETC>} pformatetc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that defines the format, target device, aspect, and medium that will be used for future notifications. For example, one sink may want to know only when the bitmap representation of the data in the data object changes. Another sink may be interested in only the metafile format of the same object. Each advise sink is notified when the data of interest changes. This data is passed back to the advise sink when notification occurs.
     * @param {Integer} advf_ A group of flags for controlling the advisory connection. Possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration. However, only some of the possible <b>ADVF</b> values are relevant for this method. The following table briefly describes the relevant values.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-dadvise
     */
    DAdvise(pformatetc, advf_, pAdvSink) {
        result := ComCall(9, this, "ptr", pformatetc, "uint", advf_, "ptr", pAdvSink, "uint*", &pdwConnection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwConnection
    }

    /**
     * Destroys a notification connection that had been previously set up.
     * @remarks
     * This methods destroys a notification created with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> method.
     * 
     * If the advisory connection being deleted was initially set up by delegating the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-advise">IDataAdviseHolder::Advise</a>, you must delegate this call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-unadvise">IDataAdviseHolder::Unadvise</a> to delete it.
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
     * This <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> implementation does not support notification.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-dunadvise
     */
    DUnadvise(dwConnection) {
        result := ComCall(10, this, "uint", dwConnection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an object that can be used to enumerate the current advisory connections.
     * @remarks
     * The enumerator object created by this method implements the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> interface. <b>IEnumSTATDATA</b> permits the enumeration of the data stored in an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statdata">STATDATA</a> structures. Each of these structures provides information on a single advisory connection, and includes <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> information, as well as the pointer to the advise sink and the token representing the connection.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * It is recommended that you use the OLE data advise holder object to handle advisory connections. With the pointer obtained through a call to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-createdataadviseholder">CreateDataAdviseHolder</a>, implementing <b>IDataObject::EnumDAdvise</b> becomes a simple matter of delegating the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-enumadvise">IDataAdviseHolder::EnumAdvise</a>. This creates the enumerator and supplies the pointer to the OLE implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a>. At that point, you can call its methods to enumerate the current advisory connections.
     * @returns {IEnumSTATDATA} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatdata">IEnumSTATDATA</a> pointer variable that receives the interface pointer to the new enumerator object. If the implementation sets *<i>ppenumAdvise</i> to <b>NULL</b>, there are no connections to advise sinks at this time.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idataobject-enumdadvise
     */
    EnumDAdvise() {
        result := ComCall(11, this, "ptr*", &ppenumAdvise := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumSTATDATA(ppenumAdvise)
    }
}
