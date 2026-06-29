#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISectionList.ahk" { ISectionList }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvb_rst
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVB_RST extends IUnknown {
    /**
     * The interface identifier for IDVB_RST
     * @type {Guid}
     */
    static IID := Guid("{f47dcd04-1e23-4fb7-9f96-b40eead10b2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVB_RST interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                 : IntPtr
        GetCountOfRecords          : IntPtr
        GetRecordTransportStreamId : IntPtr
        GetRecordOriginalNetworkId : IntPtr
        GetRecordServiceId         : IntPtr
        GetRecordEventId           : IntPtr
        GetRecordRunningStatus     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVB_RST.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface of the <b>SectionList</b> object that contains the section data.
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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-initialize
     */
    Initialize(pSectionList) {
        result := ComCall(3, this, "ptr", pSectionList, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(4, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords">IDVB_RST::GetCountOfRecords</a> method to get the number of records in the RST.
     * @returns {Integer} Pointer to a variable that receives the transport_stream_id field. This value identifies the transport stream from other transport streams in the multiplex.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordtransportstreamid
     */
    GetRecordTransportStreamId(dwRecordIndex) {
        result := ComCall(5, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords">IDVB_RST::GetCountOfRecords</a> method to get the number of records in the RST.
     * @returns {Integer} Pointer to a variable that receives the original_network_id field. This value identifies the network_id of the originating delivery system.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordoriginalnetworkid
     */
    GetRecordOriginalNetworkId(dwRecordIndex) {
        result := ComCall(6, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords">IDVB_RST::GetCountOfRecords</a> method to get the number of records in the RST.
     * @returns {Integer} Pointer to a variable that receives the service_id field. This value distinguishes the service from other services carried in the transport stream.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordserviceid
     */
    GetRecordServiceId(dwRecordIndex) {
        result := ComCall(7, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords">IDVB_RST::GetCountOfRecords</a> method to get the number of records in the RST.
     * @returns {Integer} Pointer to a variable that receives the event_id field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordeventid
     */
    GetRecordEventId(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * ETSI EN 300 468 defines the following values for the running_status field.
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Undefined.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Not running.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Starts in a few seconds.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Pausing.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Running.</td>
     * </tr>
     * <tr>
     * <td>5 to 7</td>
     * <td>Reserved.</td>
     * </tr>
     * </table>
     * @param {Integer} dwRecordIndex Specifies the record number, indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getcountofrecords">IDVB_RST::GetCountOfRecords</a> method to get the number of records in the RST.
     * @returns {Integer} Pointer to a variable that receives the running_status field.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvb_rst-getrecordrunningstatus
     */
    GetRecordRunningStatus(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDVB_RST.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordTransportStreamId := CallbackCreate(GetMethod(implObj, "GetRecordTransportStreamId"), flags, 3)
        this.vtbl.GetRecordOriginalNetworkId := CallbackCreate(GetMethod(implObj, "GetRecordOriginalNetworkId"), flags, 3)
        this.vtbl.GetRecordServiceId := CallbackCreate(GetMethod(implObj, "GetRecordServiceId"), flags, 3)
        this.vtbl.GetRecordEventId := CallbackCreate(GetMethod(implObj, "GetRecordEventId"), flags, 3)
        this.vtbl.GetRecordRunningStatus := CallbackCreate(GetMethod(implObj, "GetRecordRunningStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordTransportStreamId)
        CallbackFree(this.vtbl.GetRecordOriginalNetworkId)
        CallbackFree(this.vtbl.GetRecordServiceId)
        CallbackFree(this.vtbl.GetRecordEventId)
        CallbackFree(this.vtbl.GetRecordRunningStatus)
    }
}
