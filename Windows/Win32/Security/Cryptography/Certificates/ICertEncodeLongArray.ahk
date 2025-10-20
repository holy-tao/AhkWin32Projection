#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides methods for handling Long arrays used in certificate extensions.
 * @see https://docs.microsoft.com/windows/win32/api//certenc/nn-certenc-icertencodelongarray
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeLongArray extends IDispatch{
    /**
     * The interface identifier for ICertEncodeLongArray
     * @type {Guid}
     */
    static IID => Guid("{15e2f230-a0a2-11d0-8821-00a0c903b83c}")

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
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(8, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetValue(Index, pValue) {
        result := ComCall(9, this, "int", Index, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    Reset(Count) {
        result := ComCall(10, this, "int", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetValue(Index, Value) {
        result := ComCall(11, this, "int", Index, "int", Value, "int")
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
        result := ComCall(12, this, "ptr", pstrBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
