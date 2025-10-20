#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IEnumMsmString extends IUnknown{
    /**
     * The interface identifier for IEnumMsmString
     * @type {Guid}
     */
    static IID => Guid("{0adda826-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cFetch 
     * @param {Pointer<BSTR>} rgbstrStrings 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFetch, rgbstrStrings, pcFetched) {
        result := ComCall(3, this, "uint", cFetch, "ptr", rgbstrStrings, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cSkip 
     * @returns {HRESULT} 
     */
    Skip(cSkip) {
        result := ComCall(4, this, "uint", cSkip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMsmString>} pemsmStrings 
     * @returns {HRESULT} 
     */
    Clone(pemsmStrings) {
        result := ComCall(6, this, "ptr", pemsmStrings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
