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
     * @param {Pointer<Int32>} pBitCount 
     * @returns {HRESULT} 
     */
    GetBitCount(pBitCount) {
        result := ComCall(8, this, "int*", pBitCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrBitString 
     * @returns {HRESULT} 
     */
    GetBitString(pstrBitString) {
        result := ComCall(9, this, "ptr", pstrBitString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BitCount 
     * @param {BSTR} strBitString 
     * @param {Pointer<BSTR>} pstrBinary 
     * @returns {HRESULT} 
     */
    Encode(BitCount, strBitString, pstrBinary) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        result := ComCall(10, this, "int", BitCount, "ptr", strBitString, "ptr", pstrBinary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
