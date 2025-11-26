#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPAT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IPAT interface enables the client to get information from a Program Association Table (PAT). The IAtscPsipParser::GetPAT method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPAT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPAT
     * @type {Guid}
     */
    static IID => Guid("{6623b511-4b5f-43c3-9a01-e8ff84188060}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTransportStreamId", "GetVersionNumber", "GetCountOfRecords", "GetRecordProgramNumber", "GetRecordProgramMapPid", "FindRecordProgramMapPid", "RegisterForNextTable", "GetNextTable", "RegisterForWhenCurrent", "ConvertNextToCurrent"]

    /**
     * The Initialize method initializes the object using captured table section data. This method is called internally by the IAtscPsipParser::GetPAT method, so applications typically should not call it.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface of the <b>SectionList</b> object that contains the section data.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * The GetTransportStreamId method returns the transport stream identifier (TSID) for the PAT.
     * @returns {Integer} Receives the transport_stream_id field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetVersionNumber method returns the version number for the PAT.
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetCountOfRecords method returns the number of records in the PAT. Each record corresponds to one program.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetRecordProgramNumber method retrieves a program number from the PAT.
     * @param {Integer} dwIndex Specifies the record to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords">IPAT::GetCountOfRecords</a> method to get the number of records in the PAT.
     * @returns {Integer} Receives the program number.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogramnumber
     */
    GetRecordProgramNumber(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetRecordProgramMapPid method returns the packet identifier (PID) for a given record in the PAT.
     * @param {Integer} dwIndex Specifies the record to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords">IPAT::GetCountOfRecords</a> method to get the number of records in the PAT.
     * @returns {Integer} Receives the PID. This value identifies the PID for the packets that contain the program map table (PMT) of the associated program.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogrammappid
     */
    GetRecordProgramMapPid(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The FindRecordProgramMapPid method returns the packet identifier (PID) for the program map table (PMT) associated with a given program number.
     * @param {Integer} wProgramNumber Specifies the program number.
     * @returns {Integer} Receives the PID.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-findrecordprogrammappid
     */
    FindRecordProgramMapPid(wProgramNumber) {
        result := ComCall(9, this, "ushort", wProgramNumber, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The RegisterForNextTable method registers the client to be notified when a next table arrives that will replace the current table.
     * @param {HANDLE} hNextTableAvailable Handle to an event created by the caller. The object signals the event when the <i>next</i> table arrives. When the event is signaled, call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getnexttable">IPAT::GetNextTable</a> method to retrieve the table.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>next</i> table.
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
     * Invalid argument; <i>hNextTableAvailable</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method has already been called.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(10, this, "ptr", hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * The GetNextTable method retrieves the next table that follows the current table.
     * @returns {IPAT} Address of a variable that receives an <b>IPAT</b> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-getnexttable
     */
    GetNextTable() {
        result := ComCall(11, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * The RegisterForWhenCurrent method registers the client to be notified when the table becomes current.
     * @param {HANDLE} hNextTableIsCurrent Handle to an event created by the caller. The object signals the event when the table becomes current.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already a <i>current</i> table.
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
     * Invalid argument; <i>hNextTableIsCurrent</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method has already been called.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(12, this, "ptr", hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * The ConvertNextToCurrent method converts a next table to a current table.
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
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This table is already current.
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
     * The <b>RegisterForWhenCurrent</b> method was not called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new <i>current</i> table is malformed.
     * 
     * </td>
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipat-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
