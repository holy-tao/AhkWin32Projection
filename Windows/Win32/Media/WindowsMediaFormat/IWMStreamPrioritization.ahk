#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WM_STREAM_PRIORITY_RECORD.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamPrioritization interface provides methods to set and read priority records for a file.Stream prioritization allows content creators to specify the priority of the streams in an ASF file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamprioritization
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamPrioritization extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMStreamPrioritization
     * @type {Guid}
     */
    static IID => Guid("{8c1c6090-f9a8-4748-8ec3-dd1108ba1e77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPriorityRecords", "SetPriorityRecords"]

    /**
     * The GetPriorityRecords method retrieves the list of streams and their priorities from the profile.
     * @param {Pointer<Integer>} pcRecords Pointer to a <b>WORD</b> that receives the count of records.
     * @returns {WM_STREAM_PRIORITY_RECORD} Pointer to an array of <b>WM_STREAM_PRIORITY_RECORD</b> structures. This array will receive the current stream priority data.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamprioritization-getpriorityrecords
     */
    GetPriorityRecords(pcRecords) {
        pcRecordsMarshal := pcRecords is VarRef ? "ushort*" : "ptr"

        pRecordArray := WM_STREAM_PRIORITY_RECORD()
        result := ComCall(3, this, "ptr", pRecordArray, pcRecordsMarshal, pcRecords, "HRESULT")
        return pRecordArray
    }

    /**
     * The SetPriorityRecords method assigns the members of an array as the stream priority list in the stream prioritization object.
     * @param {Pointer<WM_STREAM_PRIORITY_RECORD>} pRecordArray Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_stream_priority_record">WM_STREAM_PRIORITY_RECORD</a> structures.
     * @param {Integer} cRecords Count of records.
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
     * <i>cRecords</i> specifies a record count greater than zero, but <i>pRecordArray</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * One of the array rules has been broken (see the Remarks section).
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
     * The method is unable to allocate the memory required to store the array in the stream prioritization object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamprioritization-setpriorityrecords
     */
    SetPriorityRecords(pRecordArray, cRecords) {
        result := ComCall(4, this, "ptr", pRecordArray, "ushort", cRecords, "HRESULT")
        return result
    }
}
