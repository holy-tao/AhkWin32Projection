#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling string arrays used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodestringarray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeStringArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeStringArray
     * @type {Guid}
     */
    static IID => Guid("{12a88820-7494-11d0-8816-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetStringType", "GetCount", "GetValue", "Reset", "SetValue", "Encode"]

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getstringtype
     */
    GetStringType() {
        result := ComCall(8, this, "int*", &pStringType := 0, "HRESULT")
        return pStringType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getcount
     */
    GetCount() {
        result := ComCall(9, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-getvalue
     */
    GetValue(Index) {
        pstr := BSTR()
        result := ComCall(10, this, "int", Index, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} StringType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-reset
     */
    Reset(Count, StringType) {
        result := ComCall(11, this, "int", Count, "int", StringType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BSTR} str 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-setvalue
     */
    SetValue(Index, str) {
        str := str is String ? BSTR.Alloc(str).Value : str

        result := ComCall(12, this, "int", Index, "ptr", str, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodestringarray-encode
     */
    Encode() {
        pstrBinary := BSTR()
        result := ComCall(13, this, "ptr", pstrBinary, "HRESULT")
        return pstrBinary
    }
}
