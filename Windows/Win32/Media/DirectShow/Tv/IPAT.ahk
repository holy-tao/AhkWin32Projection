#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * The IPAT interface enables the client to get information from a Program Association Table (PAT). The IAtscPsipParser::GetPAT method returns a pointer to this interface.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nn-mpeg2psiparser-ipat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPAT extends IUnknown {
    /**
     * The interface identifier for IPAT
     * @type {Guid}
     */
    static IID := Guid("{6623b511-4b5f-43c3-9a01-e8ff84188060}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPAT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize              : IntPtr
        GetTransportStreamId    : IntPtr
        GetVersionNumber        : IntPtr
        GetCountOfRecords       : IntPtr
        GetRecordProgramNumber  : IntPtr
        GetRecordProgramMapPid  : IntPtr
        FindRecordProgramMapPid : IntPtr
        RegisterForNextTable    : IntPtr
        GetNextTable            : IntPtr
        RegisterForWhenCurrent  : IntPtr
        ConvertNextToCurrent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPAT.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * The GetTransportStreamId method returns the transport stream identifier (TSID) for the PAT.
     * @returns {Integer} Receives the transport_stream_id field.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-gettransportstreamid
     */
    GetTransportStreamId() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetVersionNumber method returns the version number for the PAT.
     * @returns {Integer} Receives the version_number field.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetCountOfRecords method returns the number of records in the PAT. Each record corresponds to one program.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetRecordProgramNumber method retrieves a program number from the PAT.
     * @param {Integer} dwIndex Specifies the record to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords">IPAT::GetCountOfRecords</a> method to get the number of records in the PAT.
     * @returns {Integer} Receives the program number.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogramnumber
     */
    GetRecordProgramNumber(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetRecordProgramMapPid method returns the packet identifier (PID) for a given record in the PAT.
     * @param {Integer} dwIndex Specifies the record to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getcountofrecords">IPAT::GetCountOfRecords</a> method to get the number of records in the PAT.
     * @returns {Integer} Receives the PID. This value identifies the PID for the packets that contain the program map table (PMT) of the associated program.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getrecordprogrammappid
     */
    GetRecordProgramMapPid(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The FindRecordProgramMapPid method returns the packet identifier (PID) for the program map table (PMT) associated with a given program number.
     * @param {Integer} wProgramNumber Specifies the program number.
     * @returns {Integer} Receives the PID.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-findrecordprogrammappid
     */
    FindRecordProgramMapPid(wProgramNumber) {
        result := ComCall(9, this, "ushort", wProgramNumber, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The RegisterForNextTable method registers the client to be notified when a next table arrives that will replace the current table.
     * @remarks
     * This method applies only to <i>current</i> tables. Otherwise, the method returns E_ACCESSDENIED.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        result := ComCall(10, this, HANDLE, hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * The GetNextTable method retrieves the next table that follows the current table.
     * @remarks
     * This method applies only to <i>current</i> tables. Otherwise, the method returns E_ACCESSDENIED.
     * @returns {IPAT} Address of a variable that receives an <b>IPAT</b> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-getnexttable
     */
    GetNextTable() {
        result := ComCall(11, this, "ptr*", &ppPAT := 0, "HRESULT")
        return IPAT(ppPAT)
    }

    /**
     * The RegisterForWhenCurrent method registers the client to be notified when the table becomes current.
     * @remarks
     * This method applies only to <i>next</i> tables. Otherwise, the method returns E_ACCESSDENIED.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        result := ComCall(12, this, HANDLE, hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * The ConvertNextToCurrent method converts a next table to a current table.
     * @remarks
     * This method applies only to <i>next</i> tables that have become current. Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-registerforwhencurrent">IPAT::RegisterForWhenCurrent</a> and wait for the event to be signaled.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipat-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPAT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetTransportStreamId := CallbackCreate(GetMethod(implObj, "GetTransportStreamId"), flags, 2)
        this.vtbl.GetVersionNumber := CallbackCreate(GetMethod(implObj, "GetVersionNumber"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordProgramNumber := CallbackCreate(GetMethod(implObj, "GetRecordProgramNumber"), flags, 3)
        this.vtbl.GetRecordProgramMapPid := CallbackCreate(GetMethod(implObj, "GetRecordProgramMapPid"), flags, 3)
        this.vtbl.FindRecordProgramMapPid := CallbackCreate(GetMethod(implObj, "FindRecordProgramMapPid"), flags, 3)
        this.vtbl.RegisterForNextTable := CallbackCreate(GetMethod(implObj, "RegisterForNextTable"), flags, 2)
        this.vtbl.GetNextTable := CallbackCreate(GetMethod(implObj, "GetNextTable"), flags, 2)
        this.vtbl.RegisterForWhenCurrent := CallbackCreate(GetMethod(implObj, "RegisterForWhenCurrent"), flags, 2)
        this.vtbl.ConvertNextToCurrent := CallbackCreate(GetMethod(implObj, "ConvertNextToCurrent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetTransportStreamId)
        CallbackFree(this.vtbl.GetVersionNumber)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordProgramNumber)
        CallbackFree(this.vtbl.GetRecordProgramMapPid)
        CallbackFree(this.vtbl.FindRecordProgramMapPid)
        CallbackFree(this.vtbl.RegisterForNextTable)
        CallbackFree(this.vtbl.GetNextTable)
        CallbackFree(this.vtbl.RegisterForWhenCurrent)
        CallbackFree(this.vtbl.ConvertNextToCurrent)
    }
}
