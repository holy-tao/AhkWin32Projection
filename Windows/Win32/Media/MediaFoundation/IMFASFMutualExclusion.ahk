#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFASFMutualExclusion.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures an Advanced Systems Format (ASF) mutual exclusion object, which manages information about a group of streams in an ASF profile that are mutually exclusive.
 * @remarks
 * 
 * An ASF profile object can support multiple mutual exclusions. Each must be configured using a separate ASF mutual exclusion object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfmutualexclusion
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFMutualExclusion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFMutualExclusion
     * @type {Guid}
     */
    static IID => Guid("{12558291-e399-11d5-bc2a-00b0d0f3f4ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType", "GetRecordCount", "GetStreamsForRecord", "AddStreamForRecord", "RemoveStreamFromRecord", "RemoveRecord", "AddRecord", "Clone"]

    /**
     * Retrieves the type of mutual exclusion represented by the Advanced Systems Format (ASF) mutual exclusion object.
     * @returns {Guid} A variable that receives the type identifier. For a list of predefined mutual exclusion type constants, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-mutual-exclusion-type-guids">ASF Mutual Exclusion Type GUIDs</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(3, this, "ptr", pguidType, "HRESULT")
        return pguidType
    }

    /**
     * Sets the type of mutual exclusion that is represented by the Advanced Systems Format (ASF) mutual exclusion object.
     * @param {Pointer<Guid>} guidType The type of mutual exclusion that is represented by the ASF mutual exclusion object. For a list of predefined mutual exclusion type constants, see <a href="https://docs.microsoft.com/windows/desktop/medfound/asf-mutual-exclusion-type-guids">ASF Mutual Exclusion Type GUIDs</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-settype
     */
    SetType(guidType) {
        result := ComCall(4, this, "ptr", guidType, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of records in the Advanced Systems Format mutual exclusion object.
     * @returns {Integer} Receives the count of records.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(5, this, "uint*", &pdwRecordCount := 0, "HRESULT")
        return pdwRecordCount
    }

    /**
     * Retrieves the stream numbers contained in a record in the Advanced Systems Format mutual exclusion object.
     * @param {Integer} dwRecordNumber The number of the record for which to retrieve the stream numbers.
     * @param {Pointer<Integer>} pcStreams On input, the number of elements in the array referenced by <i>pwStreamNumArray</i>. On output, the method sets this value to the count of stream numbers in the record. You can call <b>GetStreamsForRecord</b> with <i>pwStreamNumArray</i> set to <b>NULL</b> to retrieve the number of elements required to hold all of the stream numbers.
     * @returns {Integer} An array that receives the stream numbers. Set to <b>NULL</b> to get the number of elements required, which is indicated by the value of <i>pcStreams</i> on return. If this parameter is not <b>NULL</b>, the method will copy as many stream numbers to the array as there are elements indicated by the value of <i>pcStreams</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getstreamsforrecord
     */
    GetStreamsForRecord(dwRecordNumber, pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwRecordNumber, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
    }

    /**
     * Adds a stream number to a record in the Advanced Systems Format mutual exclusion object.
     * @param {Integer} dwRecordNumber The record number to which the stream is added. A record number is set by the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addrecord">IMFASFMutualExclusion::AddRecord</a> method.
     * @param {Integer} wStreamNumber The stream number to add to the record.
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
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified stream number is already associated with the record.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addstreamforrecord
     */
    AddStreamForRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(7, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * Removes a stream number from a record in the Advanced Systems Format mutual exclusion object.
     * @param {Integer} dwRecordNumber The record number from which to remove the stream number.
     * @param {Integer} wStreamNumber The stream number to remove from the record.
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
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream number is not listed for the specified record.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-removestreamfromrecord
     */
    RemoveStreamFromRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(8, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * Removes a record from the Advanced Systems Format (ASF) mutual exclusion object.
     * @param {Integer} dwRecordNumber The index of the record to remove.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-removerecord
     */
    RemoveRecord(dwRecordNumber) {
        result := ComCall(9, this, "uint", dwRecordNumber, "HRESULT")
        return result
    }

    /**
     * Adds a record to the mutual exclusion object. A record specifies streams that are mutually exclusive with the streams in all other records.
     * @returns {Integer} Receives the index assigned to the new record. Record indexes are zero-based and sequential.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addrecord
     */
    AddRecord() {
        result := ComCall(10, this, "uint*", &pdwRecordNumber := 0, "HRESULT")
        return pdwRecordNumber
    }

    /**
     * Creates a copy of the Advanced Systems Format mutual exclusion object.
     * @returns {IMFASFMutualExclusion} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmutualexclusion">IMFASFMutualExclusion</a> interface of the new object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmutualexclusion-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
    }
}
