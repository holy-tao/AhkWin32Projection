#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the tokens that result from using a word breaker.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-itokencollection
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITokenCollection extends IUnknown{
    /**
     * The interface identifier for ITokenCollection
     * @type {Guid}
     */
    static IID => Guid("{22d8b4f2-f577-4adb-a335-c2ae88416fab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    NumberOfTokens(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<UInt32>} pBegin 
     * @param {Pointer<UInt32>} pLength 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     */
    GetToken(i, pBegin, pLength, ppsz) {
        result := ComCall(4, this, "uint", i, "uint*", pBegin, "uint*", pLength, "ptr", ppsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
