#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling Date arrays used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodedatearray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeDateArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeDateArray
     * @type {Guid}
     */
    static IID => Guid("{2f9469a0-a470-11d0-8821-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "GetCount", "GetValue", "Reset", "SetValue", "Encode"]

    /**
     * 
     * @param {BSTR} strBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-decode
     */
    Decode(strBinary) {
        strBinary := strBinary is String ? BSTR.Alloc(strBinary).Value : strBinary

        result := ComCall(7, this, "ptr", strBinary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-getcount
     */
    GetCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-getvalue
     */
    GetValue(Index, pValue) {
        pValueMarshal := pValue is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "int", Index, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-reset
     */
    Reset(Count) {
        result := ComCall(10, this, "int", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-setvalue
     */
    SetValue(Index, Value) {
        result := ComCall(11, this, "int", Index, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodedatearray-encode
     */
    Encode(pstrBinary) {
        result := ComCall(12, this, "ptr", pstrBinary, "HRESULT")
        return result
    }
}
