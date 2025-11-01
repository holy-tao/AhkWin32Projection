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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetDistPointCount", "GetNameCount", "GetNameChoice", "GetName", "Reset", "SetNameCount", "SetNameEntry", "Encode"]

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDistPointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getdistpointcount
     */
    GetDistPointCount(pDistPointCount) {
        pDistPointCountMarshal := pDistPointCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pDistPointCountMarshal, pDistPointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Pointer<Integer>} pNameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getnamecount
     */
    GetNameCount(DistPointIndex, pNameCount) {
        pNameCountMarshal := pNameCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", DistPointIndex, pNameCountMarshal, pNameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Pointer<Integer>} pNameChoice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getnamechoice
     */
    GetNameChoice(DistPointIndex, NameIndex, pNameChoice) {
        pNameChoiceMarshal := pNameChoice is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", DistPointIndex, "int", NameIndex, pNameChoiceMarshal, pNameChoice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Pointer<BSTR>} pstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-getname
     */
    GetName(DistPointIndex, NameIndex, pstrName) {
        result := ComCall(11, this, "int", DistPointIndex, "int", NameIndex, "ptr", pstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-reset
     */
    Reset(DistPointCount) {
        result := ComCall(12, this, "int", DistPointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-setnamecount
     */
    SetNameCount(DistPointIndex, NameCount) {
        result := ComCall(13, this, "int", DistPointIndex, "int", NameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DistPointIndex 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-setnameentry
     */
    SetNameEntry(DistPointIndex, NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, "int", DistPointIndex, "int", NameIndex, "int", NameChoice, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodecrldistinfo-encode
     */
    Encode(pstrBinary) {
        result := ComCall(15, this, "ptr", pstrBinary, "HRESULT")
        return result
    }
}
