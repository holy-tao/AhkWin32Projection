#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDVB_EIT.ahk" { IDVB_EIT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDVB_EIT2 interface enables an application to get information from a Digital Video Broadcasting (DVB) event information table (EIT). The IDvbSiParser2::GetEIT2 method returns a pointer to this interface. This interface extends the IDVB_EIT interface.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvb_eit2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVB_EIT2 extends IDVB_EIT {
    /**
     * The interface identifier for IDVB_EIT2
     * @type {Guid}
     */
    static IID := Guid("{61a389e0-9b9e-4ba0-aeea-5ddd159820ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVB_EIT2 interfaces
    */
    struct Vtbl extends IDVB_EIT.Vtbl {
        GetSegmentInfo   : IntPtr
        GetRecordSection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVB_EIT2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_eit-initialize">Initialize</a> method was not called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit2-getsegmentinfo
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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit2-getrecordsection
     */
    GetRecordSection(dwRecordIndex) {
        result := ComCall(25, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDVB_EIT2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSegmentInfo := CallbackCreate(GetMethod(implObj, "GetSegmentInfo"), flags, 3)
        this.vtbl.GetRecordSection := CallbackCreate(GetMethod(implObj, "GetRecordSection"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSegmentInfo)
        CallbackFree(this.vtbl.GetRecordSection)
    }
}
