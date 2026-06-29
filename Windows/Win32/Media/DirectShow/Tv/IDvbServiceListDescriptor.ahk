#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) service list descriptor. A service list descriptor is part of the DVB network information table (NIT) or bouquet association table (BAT) that lists services by service ID and type.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbservicelistdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbServiceListDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbServiceListDescriptor
     * @type {Guid}
     */
    static IID := Guid("{05db0d8f-6008-491a-acd3-7090952707d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbServiceListDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag               : IntPtr
        GetLength            : IntPtr
        GetCountOfRecords    : IntPtr
        GetRecordServiceId   : IntPtr
        GetRecordServiceType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbServiceListDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag identifying a Digital Video Broadcast (DVB) service list descriptor.
     * @returns {Integer} Receives the service list descriptor tag. Typically, this value is 0x41 for service list descriptors.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the descriptor_length field value from a Digital Video Broadcast (DVB) service descriptor.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an indexed count of service records for a Digital Video Broadcast (DVB) service list descriptor.
     * @returns {Integer} Receives the number of service records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the service_id field from a Digital Video Broadcast (DVB) service list descriptor.The service_id field value uniquely identifies the service within the MPEG-2 transport stream.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getcountofrecords">IDvbServiceListDescriptor::GetCountOfRecords</a> method to get the number of records in the logical channel descriptor.
     * @returns {Integer} Receives the service_id field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getrecordserviceid
     */
    GetRecordServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the service_type field value from a Digital Video Broadcast (DVB) service descriptor.
     * @param {Integer} bRecordIndex Specifies the service record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getcountofrecords">IDvbServiceListDescriptor::GetCountOfRecords</a> method to get the number of records in the logical channel descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbservicelistdescriptor-getrecordservicetype
     */
    GetRecordServiceType(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDvbServiceListDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordServiceId := CallbackCreate(GetMethod(implObj, "GetRecordServiceId"), flags, 3)
        this.vtbl.GetRecordServiceType := CallbackCreate(GetMethod(implObj, "GetRecordServiceType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordServiceId)
        CallbackFree(this.vtbl.GetRecordServiceType)
    }
}
