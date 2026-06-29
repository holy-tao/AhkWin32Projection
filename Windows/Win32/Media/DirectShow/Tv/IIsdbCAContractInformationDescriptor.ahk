#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbcacontractinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbCAContractInformationDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbCAContractInformationDescriptor
     * @type {Guid}
     */
    static IID := Guid("{08e18b25-a28f-4e92-821e-4fced5cc2291}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbCAContractInformationDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                            : IntPtr
        GetLength                         : IntPtr
        GetCASystemId                     : IntPtr
        GetCAUnitId                       : IntPtr
        GetCountOfRecords                 : IntPtr
        GetRecordComponentTag             : IntPtr
        GetContractVerificationInfoLength : IntPtr
        GetContractVerificationInfo       : IntPtr
        GetFeeNameW                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbCAContractInformationDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) conditional access (CA)contract information descriptor.
     * @returns {Integer} Receives the tag value. For ISDB CA contract information descriptors, this value is 0xCB.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the CA_system_id field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field identifies the conditional access system associated with the contract information.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the CA_unit_id field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field identifies the billing or nonbilling unit to which the component belongs.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcaunitid
     */
    GetCAUnitId() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the broadcaster-defined tag that identifies a component record from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the component record that contains the tag. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcountofrecords">IIsdbCAContractInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the component record ID tag.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getrecordcomponenttag
     */
    GetRecordComponentTag(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the contract_verification_info field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @returns {Integer} Receives the field length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfolength
     */
    GetContractVerificationInfoLength() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from the contract_verification_info field in an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field is used to determine allowable uses of the conditional access service.
     * @remarks
     * The contract_verification_info field is used to confirm whether the service, or the ES group
     * that comprises a service, can be reserved for viewing (recording). When the contract_verification_info field appears in the event information table (EIT), it  is also used to determine whether the event in question is
     * a flat-type or tier-type event, an ES group that comprises an event, a pay-per-view (PPV) event, or an ES
     * group that comprises a PPV event. If the event is a PPV event or ES group that comprises a PPV event, the descriptor is used to determine the viewing fee and recording
     * request information.
     * @param {Integer} bBufLength Specifies the length of the buffer that holds the contract verification data.
     * @returns {Integer} Pointer to a buffer that receives the contract verification data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfo
     */
    GetContractVerificationInfo(bBufLength) {
        result := ComCall(10, this, "char", bBufLength, "char*", &pbBuf := 0, "HRESULT")
        return pbBuf
    }

    /**
     * Gets, in Unicode-text format, the value of the fee_name field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field describes the fee for the ES group being described.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the fee name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getfeenamew
     */
    GetFeeNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(11, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IIsdbCAContractInformationDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCASystemId := CallbackCreate(GetMethod(implObj, "GetCASystemId"), flags, 2)
        this.vtbl.GetCAUnitId := CallbackCreate(GetMethod(implObj, "GetCAUnitId"), flags, 2)
        this.vtbl.GetCountOfRecords := CallbackCreate(GetMethod(implObj, "GetCountOfRecords"), flags, 2)
        this.vtbl.GetRecordComponentTag := CallbackCreate(GetMethod(implObj, "GetRecordComponentTag"), flags, 3)
        this.vtbl.GetContractVerificationInfoLength := CallbackCreate(GetMethod(implObj, "GetContractVerificationInfoLength"), flags, 2)
        this.vtbl.GetContractVerificationInfo := CallbackCreate(GetMethod(implObj, "GetContractVerificationInfo"), flags, 3)
        this.vtbl.GetFeeNameW := CallbackCreate(GetMethod(implObj, "GetFeeNameW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCASystemId)
        CallbackFree(this.vtbl.GetCAUnitId)
        CallbackFree(this.vtbl.GetCountOfRecords)
        CallbackFree(this.vtbl.GetRecordComponentTag)
        CallbackFree(this.vtbl.GetContractVerificationInfoLength)
        CallbackFree(this.vtbl.GetContractVerificationInfo)
        CallbackFree(this.vtbl.GetFeeNameW)
    }
}
