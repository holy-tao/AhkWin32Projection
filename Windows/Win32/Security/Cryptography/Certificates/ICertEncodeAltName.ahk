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
     * @param {Pointer<Int32>} pNameCount 
     * @returns {HRESULT} 
     */
    GetNameCount(pNameCount) {
        result := ComCall(8, this, "int*", pNameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Pointer<Int32>} pNameChoice 
     * @returns {HRESULT} 
     */
    GetNameChoice(NameIndex, pNameChoice) {
        result := ComCall(9, this, "int", NameIndex, "int*", pNameChoice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Pointer<BSTR>} pstrName 
     * @returns {HRESULT} 
     */
    GetName(NameIndex, pstrName) {
        result := ComCall(10, this, "int", NameIndex, "ptr", pstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NameCount 
     * @returns {HRESULT} 
     */
    Reset(NameCount) {
        result := ComCall(11, this, "int", NameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @returns {HRESULT} 
     */
    SetNameEntry(NameIndex, NameChoice, strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(12, this, "int", NameIndex, "int", NameChoice, "ptr", strName, "int")
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
