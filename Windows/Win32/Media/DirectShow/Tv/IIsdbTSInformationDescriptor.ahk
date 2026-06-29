#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbtsinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbTSInformationDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbTSInformationDescriptor
     * @type {Guid}
     */
    static IID := Guid("{d7ad183e-38f5-4210-b55f-ec8d601bbd47}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbTSInformationDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                        : IntPtr
        GetLength                     : IntPtr
        GetRemoteControlKeyId         : IntPtr
        GetTSNameW                    : IntPtr
        GetCountOfRecords             : IntPtr
        GetRecordTransmissionTypeInfo : IntPtr
        GetRecordNumberOfServices     : IntPtr
        GetRecordServiceIdByIndex     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbTSInformationDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Receives the tag that identifies an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the tag value. For ISDB TS information descriptors, this value is 0xCD.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the body length of the descriptor, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the remote_control_key_id field value from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the remote_control_key_id field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getremotecontrolkeyid
     */
    GetRemoteControlKeyId() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the transport stream name from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor, in Unicode string format.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the transport stream name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettsnamew
     */
    GetTSNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @returns {Integer} Receives the number of descriptor records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the transmission_type_info field from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the transmission_type_info field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordtransmissiontypeinfo
     */
    GetRecordTransmissionTypeInfo(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the number of service records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordnumberofservices
     */
    GetRecordNumberOfServices(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a service identifier from a specified service record in an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords">IIsdbTSInformationDescriptor::GetCountOfRecords</a>.
     * @param {Integer} bServiceIndex Zero-based index of the service identifier to return. To get the number of identifiers, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordnumberofservices">IIsdbTSInformationDescriptor::GetRecordNumberOfServices</a>.
     * @returns {Integer} Receives the service identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordserviceidbyindex
     */
    GetRecordServiceIdByIndex(bRecordIndex, bServiceIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char", bServiceIndex, "ushort*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    Query(iid) {
        if (IIsdbTSInformationDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetRemoteControlKeyId := CallbackCreate(GetMethod(implObj, "GetRemoteControlKeyId"), flags, 2)
        this.vtbl.GetTSNameW := CallbackCreate(GetMethod(implObj, "GetTSNameW"), flags, 3)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordTransmissionTypeInfo := CallbackCreate(GetMethod(implObj, "GetRecordTransmissionTypeInfo"), flags, 3)
        this.vtbl.GetRecordNumberOfServices := CallbackCreate(GetMethod(implObj, "GetRecordNumberOfServices"), flags, 3)
        this.vtbl.GetRecordServiceIdByIndex := CallbackCreate(GetMethod(implObj, "GetRecordServiceIdByIndex"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetRemoteControlKeyId)
        CallbackFree(this.vtbl.GetTSNameW)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordTransmissionTypeInfo)
        CallbackFree(this.vtbl.GetRecordNumberOfServices)
        CallbackFree(this.vtbl.GetRecordServiceIdByIndex)
    }
}
