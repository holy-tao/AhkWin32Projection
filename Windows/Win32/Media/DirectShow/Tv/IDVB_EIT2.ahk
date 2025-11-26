#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVB_EIT.ahk

/**
 * The IDVB_EIT2 interface enables an application to get information from a Digital Video Broadcasting (DVB) event information table (EIT). The IDvbSiParser2::GetEIT2 method returns a pointer to this interface. This interface extends the IDVB_EIT interface.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvb_eit2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVB_EIT2 extends IDVB_EIT{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDVB_EIT2
     * @type {Guid}
     */
    static IID => Guid("{61a389e0-9b9e-4ba0-aeea-5ddd159820ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSegmentInfo", "GetRecordSection"]

    /**
     * Gets the table identifier and segment number for the current EIT segment.
     * @param {Pointer<Integer>} pbTid Receives the table identifier.
     * @param {Pointer<Integer>} pbSegment Receives the segment number.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_UNINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-initialize">Initialize</a> method was not called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvb_eit2-getsegmentinfo
     */
    GetSegmentInfo(pbTid, pbSegment) {
        pbTidMarshal := pbTid is VarRef ? "char*" : "ptr"
        pbSegmentMarshal := pbSegment is VarRef ? "char*" : "ptr"

        result := ComCall(24, this, pbTidMarshal, pbTid, pbSegmentMarshal, pbSegment, "HRESULT")
        return result
    }

    /**
     * Gets the number of a section containing an event information table (EIT) record.
     * @param {Integer} dwRecordIndex The record number, indexed from 0. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-getcountofrecords">IDVB_EIT::GetCountOfRecords</a> to get the number of records in the EIT.
     * @returns {Integer} Receives the number of the section containing the specified record. A value of 0 indicates the present section; a value of 1 indicates the following section.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvb_eit2-getrecordsection
     */
    GetRecordSection(dwRecordIndex) {
        result := ComCall(25, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }
}
