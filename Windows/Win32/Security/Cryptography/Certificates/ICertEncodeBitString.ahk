#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling bit strings used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodebitstring
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeBitString extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeBitString
     * @type {Guid}
     */
    static IID => Guid("{6db525be-1278-11d1-9bd4-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetBitCount", "GetBitString", "Encode"]

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBitCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-getbitcount
     */
    GetBitCount(pBitCount) {
        pBitCountMarshal := pBitCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pBitCountMarshal, pBitCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrBitString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-getbitstring
     */
    GetBitString(pstrBitString) {
        result := ComCall(9, this, "ptr", pstrBitString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BitCount 
     * @param {BSTR} strBitString 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-encode
     */
    Encode(BitCount, strBitString, pstrBinary) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        result := ComCall(10, this, "int", BitCount, "ptr", strBitString, "ptr", pstrBinary, "HRESULT")
        return result
    }
}
