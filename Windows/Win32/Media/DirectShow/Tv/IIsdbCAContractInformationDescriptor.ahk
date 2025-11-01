#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcasystemid
     */
    GetCASystemId(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcaunitid
     */
    GetCAUnitId(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(7, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getrecordcomponenttag
     */
    GetRecordComponentTag(bRecordIndex, pbVal) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfolength
     */
    GetContractVerificationInfoLength(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bBufLength 
     * @param {Pointer<Integer>} pbBuf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getcontractverificationinfo
     */
    GetContractVerificationInfo(bBufLength, pbBuf) {
        result := ComCall(10, this, "char", bBufLength, "char*", pbBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcacontractinformationdescriptor-getfeenamew
     */
    GetFeeNameW(convMode, pbstrName) {
        result := ComCall(11, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return result
    }
}
