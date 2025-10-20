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
     * @param {Pointer<Int32>} pStringType 
     * @returns {HRESULT} 
     */
    GetStringType(pStringType) {
        result := ComCall(8, this, "int*", pStringType, "int")
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
        result := ComCall(9, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     */
    GetValue(Index, pstr) {
        result := ComCall(10, this, "int", Index, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} StringType 
     * @returns {HRESULT} 
     */
    Reset(Count, StringType) {
        result := ComCall(11, this, "int", Count, "int", StringType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BSTR} str 
     * @returns {HRESULT} 
     */
    SetValue(Index, str) {
        str := str is String ? BSTR.Alloc(str).Value : str

        result := ComCall(12, this, "int", Index, "ptr", str, "int")
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
        result := ComCall(13, this, "ptr", pstrBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
