#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling certificate revocation list (CRL) distribution information arrays used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodecrldistinfo
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeCRLDistInfo extends IDispatch{
    /**
     * The interface identifier for ICertEncodeCRLDistInfo
     * @type {Guid}
     */
    static IID => Guid("{01958640-bbff-11d0-8825-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDistPointCount 
     * @returns {HRESULT} 
     */
    GetDistPointCount(pDistPointCount) {
        result := ComCall(8, this, "int*", pDistPointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Pointer<Int32>} pNameCount 
     * @returns {HRESULT} 
     */
    GetNameCount(DistPointIndex, pNameCount) {
        result := ComCall(9, this, "int", DistPointIndex, "int*", pNameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Pointer<Int32>} pNameChoice 
     * @returns {HRESULT} 
     */
    GetNameChoice(DistPointIndex, NameIndex, pNameChoice) {
        result := ComCall(10, this, "int", DistPointIndex, "int", NameIndex, "int*", pNameChoice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Pointer<BSTR>} pstrName 
     * @returns {HRESULT} 
     */
    GetName(DistPointIndex, NameIndex, pstrName) {
        result := ComCall(11, this, "int", DistPointIndex, "int", NameIndex, "ptr", pstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointCount 
     * @returns {HRESULT} 
     */
    Reset(DistPointCount) {
        result := ComCall(12, this, "int", DistPointCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameCount 
     * @returns {HRESULT} 
     */
    SetNameCount(DistPointIndex, NameCount) {
        result := ComCall(13, this, "int", DistPointIndex, "int", NameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     */
    SetNameEntry(DistPointIndex, NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "int", DistPointIndex, "int", NameIndex, "int", NameChoice, "ptr", strName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     */
    Encode(pstrBinary) {
        result := ComCall(15, this, "ptr", pstrBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
