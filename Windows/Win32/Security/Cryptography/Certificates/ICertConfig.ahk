#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICertConfig interface provides functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertConfig extends IDispatch{
    /**
     * The interface identifier for ICertConfig
     * @type {Guid}
     */
    static IID => Guid("{372fce34-4324-11d0-8810-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    Reset(Index, pCount) {
        result := ComCall(7, this, "int", Index, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pIndex 
     * @returns {HRESULT} 
     */
    Next(pIndex) {
        result := ComCall(8, this, "int*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strFieldName 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     */
    GetField(strFieldName, pstrOut) {
        strFieldName := strFieldName is String ? BSTR.Alloc(strFieldName).Value : strFieldName

        result := ComCall(9, this, "ptr", strFieldName, "ptr", pstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     */
    GetConfig(Flags, pstrOut) {
        result := ComCall(10, this, "int", Flags, "ptr", pstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
