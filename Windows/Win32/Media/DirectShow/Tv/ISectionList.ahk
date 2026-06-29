#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\MPEG_CONTEXT.ahk" { MPEG_CONTEXT }
#Import ".\MPEG_PACKET_LIST.ahk" { MPEG_PACKET_LIST }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SECTION.ahk" { SECTION }
#Import ".\MPEG_REQUEST_TYPE.ahk" { MPEG_REQUEST_TYPE }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MPEG2_FILTER.ahk" { MPEG2_FILTER }
#Import ".\IMpeg2Data.ahk" { IMpeg2Data }

/**
 * The ISectionList interface represents a list of MPEG-2 table sections.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISectionList)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nn-mpeg2data-isectionlist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISectionList extends IUnknown {
    /**
     * The interface identifier for ISectionList
     * @type {Guid}
     */
    static IID := Guid("{afec1eb5-2a64-46c6-bf4b-ae3ccb6afdb0}")

    /**
     * The class identifier for SectionList
     * @type {Guid}
     */
    static CLSID := Guid("{73da5d04-4347-45d3-a9dc-fae9ddbe558d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISectionList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                : IntPtr
        InitializeWithRawSections : IntPtr
        CancelPendingRequest      : IntPtr
        GetNumberOfSections       : IntPtr
        GetSectionData            : IntPtr
        GetProgramIdentifier      : IntPtr
        GetTableIdentifier        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISectionList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Initialize method initializes the object. This method should be called once, immediately after creating the object. The IMpeg2Data::GetSection and IMpeg2Data::GetTable methods call this method internally, so typically an application will not call it.
     * @remarks
     * This method is either synchronous or asynchronous, depending on the request type defined in the <i>requestType</i> parameter. When the method is asynchronous, it returns immediately and signals the event specified in <i>hDoneEvent</i>. When the method is synchronous, it blocks until the request completes or until the time out specified in the <i>timeout</i> parameter expires.
     * @param {MPEG_REQUEST_TYPE} requestType Specifies the request type, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ne-mpeg2structs-mpeg_request_type">MPEG_REQUEST_TYPE</a> value.
     * @param {IMpeg2Data} pMpeg2Data Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the MPEG-2 Sections and Tables filter.
     * @param {Pointer<MPEG_CONTEXT>} pContext Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_context">MPEG_CONTEXT</a> structure. This structure indicates the MPEG-2 source.
     * @param {Integer} pid Specifies a packet identifier (PID), indicating which packets in the transport stream are requested.
     * @param {Integer} tid Specifies a table identifier (TID), indicating which table sections to retrieve.
     * @param {Pointer<MPEG2_FILTER>} pFilter Optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg2_filter">MPEG2_FILTER</a> structure. The caller can use this parameter to exclude packets based on additional MPEG-2 header fields. This parameter can be <b>NULL</b>.
     * @param {Integer} timeout Specifies the maximum length of time that a synchronous request should wait before it times out.
     * @param {HANDLE} hDoneEvent Specifies a handle to an event. The object signals the event when the request completes. This parameter is optional; it should be specified for asynchronous requests.
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
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-initialize
     */
    Initialize(requestType, pMpeg2Data, pContext, pid, tid, pFilter, timeout, hDoneEvent) {
        result := ComCall(3, this, MPEG_REQUEST_TYPE, requestType, "ptr", pMpeg2Data, MPEG_CONTEXT.Ptr, pContext, "ushort", pid, "char", tid, MPEG2_FILTER.Ptr, pFilter, "uint", timeout, HANDLE, hDoneEvent, "HRESULT")
        return result
    }

    /**
     * The InitializeWithRawSections method initializes the object with raw section data. This method allows for custom processing of section data.
     * @remarks
     * Use this method as follows:
     * 
     * <ol>
     * <li>Get the section data by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nf-mpeg2data-impeg2data-getstreamofsections">IMpeg2Data::GetStreamOfSections</a> method.</li>
     * <li>Create a new <b>SectionList</b> object and call <b>InitializeWithRawSections</b> with the section data.</li>
     * </ol>
     * @param {Pointer<MPEG_PACKET_LIST>} pmplSections Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list">MPEG_PACKET_LIST</a> structure that contains a list of MPEG-2 sections.
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
     * The object has already been initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-initializewithrawsections
     */
    InitializeWithRawSections(pmplSections) {
        result := ComCall(4, this, MPEG_PACKET_LIST.Ptr, pmplSections, "HRESULT")
        return result
    }

    /**
     * The CancelPendingRequest method cancels any pending asynchronous request.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-cancelpendingrequest
     */
    CancelPendingRequest() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfSections method returns the number of MPEG-2 sections that were received.
     * @returns {Integer} Receives the number of sections.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getnumberofsections
     */
    GetNumberOfSections() {
        result := ComCall(6, this, "ushort*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetSectionData method retrieves a section.
     * @remarks
     * The section header is converted from network byte order to native byte order. The number of header bytes that are converted depends on the header type. The header types are <i>short header</i> (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure), <i>long header</i> (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-long_section">LONG_SECTION</a> structure), or <i>DSM-CC header</i> (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-dsmcc_section">DSMCC_SECTION</a> structure). If the section has a short header, the first three bytes are converted; for a long header, the first eight bytes are converted; and for a DSM-CC header, the first 20 bytes are converted.
     * 
     * The body of the section data, after the header, is left unparsed and unconverted.
     * @param {Integer} sectionNumber Specifies the section number to retrieve, indexed from zero. Call the <b>GetNumberOfSections</b> method to get the number of sections.
     * @param {Pointer<Integer>} pdwRawPacketLength Receives the size of the section data, in bytes.
     * @param {Pointer<Pointer<SECTION>>} ppSection Address of a variable that receives a pointer to a <b>SECTION</b> structure, containing the section data. Do not free the memory for the structure; the object frees the memory when the interface is released.
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
     * The request has not completed yet.
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
     * <dt><b>MPEG2_E_OUT_OF_BOUNDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The section number is out of range.
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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getsectiondata
     */
    GetSectionData(sectionNumber, pdwRawPacketLength, ppSection) {
        pdwRawPacketLengthMarshal := pdwRawPacketLength is VarRef ? "uint*" : "ptr"
        ppSectionMarshal := ppSection is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ushort", sectionNumber, pdwRawPacketLengthMarshal, pdwRawPacketLength, ppSectionMarshal, ppSection, "HRESULT")
        return result
    }

    /**
     * The GetProgramIdentifier method retrieves the program identifier (PID) of the packets that this object is receiving.
     * @remarks
     * The PID value is set when the object is first initialized.
     * @param {Pointer<Integer>} pPid Receives the PID.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-getprogramidentifier
     */
    GetProgramIdentifier(pPid) {
        pPidMarshal := pPid is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, pPidMarshal, pPid, "HRESULT")
        return result
    }

    /**
     * The GetTableIdentifier method returns the table identifier (TID) of the packets that this object is receiving.
     * @remarks
     * The TID value is set when the object is first initialized.
     * @param {Pointer<Integer>} pTableId Receives the TID.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-isectionlist-gettableidentifier
     */
    GetTableIdentifier(pTableId) {
        pTableIdMarshal := pTableId is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, pTableIdMarshal, pTableId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISectionList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 9)
        this.vtbl.InitializeWithRawSections := CallbackCreate(GetMethod(implObj, "InitializeWithRawSections"), flags, 2)
        this.vtbl.CancelPendingRequest := CallbackCreate(GetMethod(implObj, "CancelPendingRequest"), flags, 1)
        this.vtbl.GetNumberOfSections := CallbackCreate(GetMethod(implObj, "GetNumberOfSections"), flags, 2)
        this.vtbl.GetSectionData := CallbackCreate(GetMethod(implObj, "GetSectionData"), flags, 4)
        this.vtbl.GetProgramIdentifier := CallbackCreate(GetMethod(implObj, "GetProgramIdentifier"), flags, 2)
        this.vtbl.GetTableIdentifier := CallbackCreate(GetMethod(implObj, "GetTableIdentifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeWithRawSections)
        CallbackFree(this.vtbl.CancelPendingRequest)
        CallbackFree(this.vtbl.GetNumberOfSections)
        CallbackFree(this.vtbl.GetSectionData)
        CallbackFree(this.vtbl.GetProgramIdentifier)
        CallbackFree(this.vtbl.GetTableIdentifier)
    }
}
