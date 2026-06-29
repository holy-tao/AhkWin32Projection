#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) emergency information descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbemergencyinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbEmergencyInformationDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbEmergencyInformationDescriptor
     * @type {Guid}
     */
    static IID := Guid("{ba6fa681-b973-4da1-9207-ac3e7f0341eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbEmergencyInformationDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag            : IntPtr
        GetLength         : IntPtr
        GetCountOfRecords : IntPtr
        GetServiceId      : IntPtr
        GetStartEndFlag   : IntPtr
        GetSignalLevel    : IntPtr
        GetAreaCode       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbEmergencyInformationDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an emergency information descriptor.
     * @returns {Integer} Receives the tag value. For emergency information descriptors, this value is 0xFC.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an emergency information descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in an emergency information descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier for a broadcasting event from an emergency information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the event identifiers. To get the number of emergency information descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the broadcasting event identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getserviceid
     */
    GetServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the start_end_flag field from an emergency information descriptor. This field indicates whether the emergency alarm signal has started or finished broadcasting.
     * @param {Integer} bRecordIndex Zero-based index of the service information (SI) descriptor containing the table descriptor. To get the number of SI descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Gets the start/end flag from the descriptor. If this value is 1, the emergency signal has started or is being broadcast. If it is 0, the emergency signal broadcast has ended.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getstartendflag
     */
    GetStartEndFlag(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets a flag that indicates the emergency alarm signal type from an emergency information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the emergency alarm signal. To get the number of emergency information descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives a boolean value that indicates whether the emergency alarm signal is the first (0) or second (1) type of start signal. Annex D of the document titled <i>SERVICE INFORMATION FOR DIGITAL
     * BROADCASTING SYSTEM,
     * ARIB STANDARD,
     * ARIB STD-B10, Version 4.4</i> describes the two start signal types.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getsignallevel
     */
    GetSignalLevel(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the area codes from an emergency information descriptor.
     * @remarks
     * For more information about area codes and their use with emergency broadcast signals, refer to Annex D of the document titled <i>SERVICE INFORMATION FOR DIGITAL
     * BROADCASTING SYSTEM,
     * ARIB STANDARD,
     * ARIB STD-B10, Version 4.4</i>.
     * @param {Integer} bRecordIndex Zero-based index of the emergency information descriptor that contains the area code records. To get the number of area code records, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords">IIsdbEmergencyInformationDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Pointer<Integer>>} ppwVal Pointer to a buffer allocated to hold the area codes. The caller is responsible for freeing this memory.
     * @param {Pointer<Integer>} pbNumAreaCodes Receives the number of area codes in the descriptor.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getareacode
     */
    GetAreaCode(bRecordIndex, ppwVal, pbNumAreaCodes) {
        ppwValMarshal := ppwVal is VarRef ? "ptr*" : "ptr"
        pbNumAreaCodesMarshal := pbNumAreaCodes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "char", bRecordIndex, ppwValMarshal, ppwVal, pbNumAreaCodesMarshal, pbNumAreaCodes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIsdbEmergencyInformationDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetServiceId := CallbackCreate(GetMethod(implObj, "GetServiceId"), flags, 3)
        this.vtbl.GetStartEndFlag := CallbackCreate(GetMethod(implObj, "GetStartEndFlag"), flags, 3)
        this.vtbl.GetSignalLevel := CallbackCreate(GetMethod(implObj, "GetSignalLevel"), flags, 3)
        this.vtbl.GetAreaCode := CallbackCreate(GetMethod(implObj, "GetAreaCode"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetServiceId)
        CallbackFree(this.vtbl.GetStartEndFlag)
        CallbackFree(this.vtbl.GetSignalLevel)
        CallbackFree(this.vtbl.GetAreaCode)
    }
}
