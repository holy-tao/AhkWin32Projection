#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling alternate names used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodealtname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeAltName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeAltName
     * @type {Guid}
     */
    static IID => Guid("{1c9a8c70-1271-11d1-9bd4-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetNameCount", "GetNameChoice", "GetName", "Reset", "SetNameEntry", "Encode"]

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getnamecount
     */
    GetNameCount() {
        result := ComCall(8, this, "int*", &pNameCount := 0, "HRESULT")
        return pNameCount
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getnamechoice
     */
    GetNameChoice(NameIndex) {
        result := ComCall(9, this, "int", NameIndex, "int*", &pNameChoice := 0, "HRESULT")
        return pNameChoice
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-getname
     */
    GetName(NameIndex) {
        pstrName := BSTR()
        result := ComCall(10, this, "int", NameIndex, "ptr", pstrName, "HRESULT")
        return pstrName
    }

    /**
     * 
     * @param {Integer} NameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-reset
     */
    Reset(NameCount) {
        result := ComCall(11, this, "int", NameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-setnameentry
     */
    SetNameEntry(NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(12, this, "int", NameIndex, "int", NameChoice, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodealtname-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(13, this, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
