#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IEnumMsmDependency extends IUnknown{
    /**
     * The interface identifier for IEnumMsmDependency
     * @type {Guid}
     */
    static IID => Guid("{0adda82c-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cFetch 
     * @param {Pointer<IMsmDependency>} rgmsmDependencies 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFetch, rgmsmDependencies, pcFetched) {
        result := ComCall(3, this, "uint", cFetch, "ptr", rgmsmDependencies, "uint*", pcFetched, "int")
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
     * @param {Pointer<IEnumMsmDependency>} pemsmDependencies 
     * @returns {HRESULT} 
     */
    Clone(pemsmDependencies) {
        result := ComCall(6, this, "ptr", pemsmDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
