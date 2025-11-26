#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbcacontractinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbCAContractInformationDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbCAContractInformationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{08e18b25-a28f-4e92-821e-4fced5cc2291}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCASystemId", "GetCAUnitId", "GetCountOfRecords", "GetRecordComponentTag", "GetContractVerificationInfoLength", "GetContractVerificationInfo", "GetFeeNameW"]

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) conditional access (CA)contract information descriptor.
     * @returns {Integer} Receives the tag value. For ISDB CA contract information descriptors, this value is 0xCB.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the CA_system_id field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field identifies the conditional access system associated with the contract information.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the CA_unit_id field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field identifies the billing or nonbilling unit to which the component belongs.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcaunitid
     */
    GetCAUnitId() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the broadcaster-defined tag that identifies a component record from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the component record that contains the tag. To get the number of components, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcountofrecords">IIsdbCAContractInformationDescriptor::GetCountOfRecords</a>.
     * @returns {Integer} Receives the component record ID tag.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getrecordcomponenttag
     */
    GetRecordComponentTag(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the contract_verification_info field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor.
     * @returns {Integer} Receives the field length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfolength
     */
    GetContractVerificationInfoLength() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets data from the contract_verification_info field in an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field is used to determine allowable uses of the conditional access service.
     * @param {Integer} bBufLength Specifies the length of the buffer that holds the contract verification data.
     * @returns {Integer} Pointer to a buffer that receives the contract verification data.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfo
     */
    GetContractVerificationInfo(bBufLength) {
        result := ComCall(10, this, "char", bBufLength, "char*", &pbBuf := 0, "HRESULT")
        return pbBuf
    }

    /**
     * Gets, in Unicode-text format, the value of the fee_name field from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) contract information descriptor. This field describes the fee for the ES group being described.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the fee name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getfeenamew
     */
    GetFeeNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(11, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
