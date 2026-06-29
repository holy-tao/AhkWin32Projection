#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbeventgroupdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbEventGroupDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbEventGroupDescriptor
     * @type {Guid}
     */
    static IID := Guid("{94b06780-2e2a-44dc-a966-cc56fdabc6c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbEventGroupDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag               : IntPtr
        GetLength            : IntPtr
        GetGroupType         : IntPtr
        GetCountOfRecords    : IntPtr
        GetRecordEvent       : IntPtr
        GetCountOfRefRecords : IntPtr
        GetRefRecordEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbEventGroupDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the tag value. For ISDB event group descriptors, this value is 0xD6.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) event group descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that describes the event group type from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getgrouptype
     */
    GetGroupType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of event records from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from an event record in an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the event record containing the data. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbEventGrouptDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pwServiceId Receives the value of the sevice_id field from the event record. This value identifies the information service and appears in the program_number field of the corresponding program map section.
     * @param {Pointer<Integer>} pwEventId Receives the value of  the event_id field from the related event record. This value identifies the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrecordevent
     */
    GetRecordEvent(bRecordIndex, pwServiceId, pwEventId) {
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pwServiceIdMarshal, pwServiceId, pwEventIdMarshal, pwEventId, "HRESULT")
        return result
    }

    /**
     * Gets the number of related event records from an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @returns {Integer} Receives the number of related event records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getcountofrefrecords
     */
    GetCountOfRefRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from a related event record in an Integrated Services Digital Broadcasting (ISDB) event group descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the related event record containing the data. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbEventGrouptDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pwOriginalNetworkId Receives the value of the original_network_id field from the related
     * event record. This value is transmitted at the time of event relay or event move across networks.
     * @param {Pointer<Integer>} pwTransportStreamId Receives the value of the transport_stream_id field from the related
     * event record. This value that is transmitted at the time of event relay or event move across networks.
     * @param {Pointer<Integer>} pwServiceId Receives the value of the sevice_id field from the related event record. This value identifies the related information service and appears in the program_number field of the corresponding program map section.
     * @param {Pointer<Integer>} pwEventId Receives the value of  the event_id field from the related event record. This value identifies the related event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbeventgroupdescriptor-getrefrecordevent
     */
    GetRefRecordEvent(bRecordIndex, pwOriginalNetworkId, pwTransportStreamId, pwServiceId, pwEventId) {
        pwOriginalNetworkIdMarshal := pwOriginalNetworkId is VarRef ? "ushort*" : "ptr"
        pwTransportStreamIdMarshal := pwTransportStreamId is VarRef ? "ushort*" : "ptr"
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"
        pwEventIdMarshal := pwEventId is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, "char", bRecordIndex, pwOriginalNetworkIdMarshal, pwOriginalNetworkId, pwTransportStreamIdMarshal, pwTransportStreamId, pwServiceIdMarshal, pwServiceId, pwEventIdMarshal, pwEventId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIsdbEventGroupDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetGroupType := CallbackCreate(GetMethod(implObj, "GetGroupType"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordEvent := CallbackCreate(GetMethod(implObj, "GetRecordEvent"), flags, 4)
        this.vtbl.GetCountOfRefRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRefRecords"), flags, 2)
        this.vtbl.GetRefRecordEvent := CallbackCreate(GetMethod(implObj, "GetRefRecordEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetGroupType)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordEvent)
        CallbackFree(this.vtbl.GetCountOfRefRecords)
        CallbackFree(this.vtbl.GetRefRecordEvent)
    }
}
