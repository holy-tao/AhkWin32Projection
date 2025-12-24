#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMutualExclusion.ahk

/**
 * The IWMMutualExclusion2 interface provides advanced configuration features for mutual exclusion objects.This interface supports both multiple languages and advanced mutual exclusion.An IWMMutualExclusion2 interface is created for each mutual exclusion object created. To retrieve a pointer to an IWMMutualExclusion2 interface, call the QueryInterface method of the IWMMutualExclusion interface returned by IWMProfile::CreateNewMutualExclusion.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmutualexclusion2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMutualExclusion2 extends IWMMutualExclusion{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMutualExclusion2
     * @type {Guid}
     */
    static IID => Guid("{0302b57d-89d1-4ba2-85c9-166f2c53eb91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "SetName", "GetRecordCount", "AddRecord", "RemoveRecord", "GetRecordName", "SetRecordName", "GetStreamsForRecord", "AddStreamForRecord", "RemoveStreamForRecord"]

    /**
     * The GetName method retrieves the name of the current mutual exclusion object. A mutual exclusion object has a name only if a name has been assigned using the IWMMutualExclusion2::SetName method.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name of the mutual exclusion object. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchName On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The <i>pcchName</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getname
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * The SetName method assigns a name to a mutual exclusion object.
     * @param {PWSTR} pwszName Pointer to a wide-character null-terminated string containing the name you want to assign.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The method was unable to allocate memory to hold the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-setname
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(9, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * The GetRecordCount method retrieves the number of records present in the mutual exclusion object.
     * @returns {Integer} Pointer to a <b>WORD</b> containing the number of records that exist in the mutual exclusion object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(10, this, "ushort*", &pwRecordCount := 0, "HRESULT")
        return pwRecordCount
    }

    /**
     * The AddRecord method adds a record to the mutual exclusion object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The method was unable to allocate memory for the new record.
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
     * There was a problem adding the new record to the collection of records for this mutual exclusion object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-addrecord
     */
    AddRecord() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The RemoveRecord method removes a record from the mutual exclusion object.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the number of the record to remove.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The <i>wRecordNumber</i> parameter does not contain a valid record number.
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
     * The method is unable to access the record for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-removerecord
     */
    RemoveRecord(wRecordNumber) {
        result := ComCall(12, this, "ushort", wRecordNumber, "HRESULT")
        return result
    }

    /**
     * The GetRecordName method retrieves the name of the specified record. A record has a name only if a name has been assigned using the IWMMutualExclusion2::SetRecordName method.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the number of the record for which you want to get the name.
     * @param {PWSTR} pwszRecordName Pointer to a wide-character <b>null</b>-terminated string containing the record name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchRecordName On input, a pointer to a variable containing the length of the <i>pwszRecordName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the length of the name, including the terminating <b>null</b> character. However, if you pass <b>NULL</b> as <i>pwszRecordName</i>, this will be set to the required length on output.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * <i>wRecordNumber</i> does not contain a valid record number.
     * 
     * OR
     * 
     * <i>pcchRecordName</i> is <b>NULL</b>.
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
     * The method is unable to access the record for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getrecordname
     */
    GetRecordName(wRecordNumber, pwszRecordName, pcchRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        pcchRecordNameMarshal := pcchRecordName is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, "ushort", wRecordNumber, "ptr", pwszRecordName, pcchRecordNameMarshal, pcchRecordName, "HRESULT")
        return result
    }

    /**
     * The SetRecordName method assigns a name to a record. You should assign a name to every record so that you can easily identify the records in the future.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the record number to which you want to assign a name.
     * @param {PWSTR} pwszRecordName Pointer to a wide-character null-terminated string containing the name you want to assign to the record. Record names are limited to 256 wide characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The method was unable to allocate memory for the name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-setrecordname
     */
    SetRecordName(wRecordNumber, pwszRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        result := ComCall(14, this, "ushort", wRecordNumber, "ptr", pwszRecordName, "HRESULT")
        return result
    }

    /**
     * The GetStreamsForRecord method retrieves the list of streams that are present in a record.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the record number for which to retrieve the streams.
     * @param {Pointer<Integer>} pcStreams Pointer to a <b>WORD</b> containing the number of streams in the record.
     * @returns {Integer} Pointer to an array that will receive the stream numbers. If it is <b>NULL</b>, <b>GetStreamsForRecord</b> will return the number of streams to <i>pcStreams</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getstreamsforrecord
     */
    GetStreamsForRecord(wRecordNumber, pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, "ushort", wRecordNumber, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
    }

    /**
     * The AddStreamForRecord method adds a stream to a record created with IWMMutualExclusion2::AddRecord.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the number of the record to which to add the stream.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number you want to add.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The method is unable to allocate memory for the new stream number.
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
     * <i>wRecordNumber</i> contains an invalid record number.
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
     * The method is unable to access the record for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-addstreamforrecord
     */
    AddStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(16, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * The RemoveStreamForRecord method removes a stream from a record's list.
     * @param {Integer} wRecordNumber <b>WORD</b> containing the record number from which you want to remove a stream.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number you want to remove from the record.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOMATCHING_ELEMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream specified by <i>wStreamNumber</i> does not appear in the record specified by <i>wRecordNumber</i>.
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
     * <i>wRecordNumber</i> does not contain a valid record number.
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
     * The method is unable to access the record for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-removestreamforrecord
     */
    RemoveStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(17, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }
}
