#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include .\IPMT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IPMT interface enables the client to get information from a program map table (PMT).
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipmt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPMT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMT
     * @type {Guid}
     */
    static IID => Guid("{01f3b398-9527-4736-94db-5195878e97a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetProgramNumber", "GetVersionNumber", "GetPcrPid", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag", "GetCountOfRecords", "GetRecordStreamType", "GetRecordElementaryPid", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "QueryServiceGatewayInfo", "QueryMPEInfo", "RegisterForNextTable", "GetNextTable", "RegisterForWhenCurrent", "ConvertNextToCurrent"]

    /**
     * The Initialize method initializes the object using captured table section data. This method is called internally by the IAtscPsipParser::GetPMT method, so applications typically should not call it.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * The GetProgramNumber method returns the program number for the PMT.
     * @returns {Integer} Receives the program_number field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getprogramnumber
     */
    GetProgramNumber() {
        result := ComCall(4, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetVersionNumber method returns the version number for the PMT.
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetPcrPid method returns the packet identifier (PID) of the packets that contain the Program Clock Reference (PCR) fields for this program.
     * @returns {Integer} Receives the PCR_PID field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getpcrpid
     */
    GetPcrPid() {
        result := ComCall(6, this, "ushort*", &pPidVal := 0, "HRESULT")
        return pPidVal
    }

    /**
     * The GetCountOfTableDescriptors method returns the number of table-wide descriptors in the PMT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetTableDescriptorByIndex method retrieves a table-wide descriptor for the PMT.
     * @param {Integer} dwIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountoftabledescriptors">IPMT::GetCountOfTableDescriptors</a> method to get the number of table descriptors in the PMT.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * The GetTableDescriptorByTag method searches the PMT for a table-wide descriptor with the specified descriptor tag.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * The GetCountOfRecords method returns the number of records in the PMT. Each record corresponds to a stream in the program.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(10, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * The GetRecordStreamType method returns the stream type for a given elementary stream in the program.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords">IPMT::GetCountOfRecords</a> method to get the number of records in the PMT.
     * @returns {Integer} Receives the stream_type field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordstreamtype
     */
    GetRecordStreamType(dwRecordIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * The GetRecordElementaryPid method returns the packet identifier (PID) for a given elementary stream in the program.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords">IPMT::GetCountOfRecords</a> method to get the number of records in the PMT.
     * @returns {Integer} Receives the elementary_PID field.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordelementarypid
     */
    GetRecordElementaryPid(dwRecordIndex) {
        result := ComCall(12, this, "uint", dwRecordIndex, "ushort*", &pPidVal := 0, "HRESULT")
        return pPidVal
    }

    /**
     * The GetRecordCountOfDescriptors method returns the number of descriptors for a record in the PMT.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords">IPMT::GetCountOfRecords</a> method to get the number of records in the PMT.
     * @returns {Integer} Receives the number of descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(13, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * The GetRecordDescriptorByIndex method retrieves a descriptor for a specified record in the PMT.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords">IPMT::GetCountOfRecords</a> method to get the number of records in the PMT.
     * @param {Integer} dwDescIndex Specifies which descriptor to retrieve, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecordcountofdescriptors">IPMT::GetRecordCountOfDescriptors</a> method to get the number of descriptors for a particular record.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwDescIndex) {
        result := ComCall(14, this, "uint", dwRecordIndex, "uint", dwDescIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * The GetRecordDescriptorByTag method searches a record in the PMT for a descriptor with a specified descriptor tag.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getcountofrecords">IPMT::GetCountOfRecords</a> method to get the number of records in the PMT.
     * @param {Integer} bTag Specifies the descriptor tag for which to search.
     * @param {Pointer<Integer>} pdwCookie Pointer to a variable that specifies the start position in the descriptor list. This parameter is optional. If the value of <i>pdwCookie</i> is <b>NULL</b>, the search starts from the first descriptor in the list. Otherwise, the search starts from the position given in <i>pdwCookie</i>. When the method returns, the <i>pdwCookie</i> parameter contains the position of the next matching descriptor, if any. You can use this parameter to iterate through the descriptor list, looking for every instance of a particular descriptor tag.
     * @returns {IGenericDescriptor} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor">IGenericDescriptor</a> interface pointer. Use this interface to retrieve the information in the descriptor. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * The QueryServiceGatewayInfo method returns the DSM-CC service gateway information in the PMT, if any.
     * @param {Pointer<Pointer<DSMCC_ELEMENT>>} ppDSMCCList Address of a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_element">DSMCC_ELEMENT</a> structures. The client must free the array by calling the <b>CoTaskMemFree</b> function.
     * @param {Pointer<Integer>} puiCount Receives the number of elements returned in <i>ppDSMCCList</i>.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
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
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Malformed table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_S_SG_INFO_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service gateway information was found in the PMT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_S_SG_INFO_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service gateway information was not found in the PMT.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-queryservicegatewayinfo
     */
    QueryServiceGatewayInfo(ppDSMCCList, puiCount) {
        ppDSMCCListMarshal := ppDSMCCList is VarRef ? "ptr*" : "ptr"
        puiCountMarshal := puiCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, ppDSMCCListMarshal, ppDSMCCList, puiCountMarshal, puiCount, "HRESULT")
        return result
    }

    /**
     * The QueryMPEInfo method returns the multi-protocol encapsulation (MPE) information in the PMT, if any.
     * @param {Pointer<Pointer<MPE_ELEMENT>>} ppMPEList Address of a variable that receives a pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpe_element">MPE_ELEMENT</a> structures. The client must free the array by calling the <b>CoTaskMemFree</b> function.
     * @param {Pointer<Integer>} puiCount Receives the number of elements returned in <i>ppMPEList</i>.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
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
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Malformed table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_S_MPE_INFO_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPE information was found in the PMT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_S_MPE_INFO_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPE information was not found in the PMT.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-querympeinfo
     */
    QueryMPEInfo(ppMPEList, puiCount) {
        ppMPEListMarshal := ppMPEList is VarRef ? "ptr*" : "ptr"
        puiCountMarshal := puiCount is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, ppMPEListMarshal, ppMPEList, puiCountMarshal, puiCount, "HRESULT")
        return result
    }

    /**
     * The RegisterForNextTable method registers the client to be notified when a next table arrives that will replace the current table.
     * @param {HANDLE} hNextTableAvailable Handle to an event created by the caller. The object signals the event when the <i>next</i> table arrives. When the event is signaled, call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-ipmt-getnexttable">IPMT::GetNextTable</a> method to retrieve the table.
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(18, this, "ptr", hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * The GetNextTable method retrieves the next table that follows the current table.
     * @returns {IPMT} Address of a variable that receives an <b>IPMT</b> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-getnexttable
     */
    GetNextTable() {
        result := ComCall(19, this, "ptr*", &ppPMT := 0, "HRESULT")
        return IPMT(ppPMT)
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(20, this, "ptr", hNextTableIsCurrent, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-ipmt-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
