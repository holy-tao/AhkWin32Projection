#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRevocationListEntries extends IDispatch{
    /**
     * The interface identifier for IX509CertificateRevocationListEntries
     * @type {Guid}
     */
    static IID => Guid("{728ab35f-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IX509CertificateRevocationListEntry>} pVal 
     * @returns {HRESULT} 
     */
    get_ItemByIndex(Index, pVal) {
        result := ComCall(7, this, "int", Index, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(8, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRevocationListEntry>} pVal 
     * @returns {HRESULT} 
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} SerialNumber 
     * @param {Pointer<Int32>} pIndex 
     * @returns {HRESULT} 
     */
    get_IndexBySerialNumber(Encoding, SerialNumber, pIndex) {
        SerialNumber := SerialNumber is String ? BSTR.Alloc(SerialNumber).Value : SerialNumber

        result := ComCall(13, this, "int", Encoding, "ptr", SerialNumber, "int*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRevocationListEntries>} pValue 
     * @returns {HRESULT} 
     */
    AddRange(pValue) {
        result := ComCall(14, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
