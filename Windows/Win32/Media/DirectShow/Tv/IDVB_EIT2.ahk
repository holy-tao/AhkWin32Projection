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
     * 
     * @param {Pointer<Integer>} pbTid 
     * @param {Pointer<Integer>} pbSegment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit2-getsegmentinfo
     */
    GetSegmentInfo(pbTid, pbSegment) {
        pbTidMarshal := pbTid is VarRef ? "char*" : "ptr"
        pbSegmentMarshal := pbSegment is VarRef ? "char*" : "ptr"

        result := ComCall(24, this, pbTidMarshal, pbTid, pbSegmentMarshal, pbSegment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_eit2-getrecordsection
     */
    GetRecordSection(dwRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(25, this, "uint", dwRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }
}
