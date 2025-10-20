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
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetCASystemId(pwVal) {
        result := ComCall(5, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCAUnitId(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(7, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordComponentTag(bRecordIndex, pbVal) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetContractVerificationInfoLength(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bBufLength 
     * @param {Pointer<Byte>} pbBuf 
     * @returns {HRESULT} 
     */
    GetContractVerificationInfo(bBufLength, pbBuf) {
        result := ComCall(10, this, "char", bBufLength, "char*", pbBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetFeeNameW(convMode, pbstrName) {
        result := ComCall(11, this, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
