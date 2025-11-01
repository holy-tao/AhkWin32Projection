#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IEnumMsmDependency extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cFetch 
     * @param {Pointer<IMsmDependency>} rgmsmDependencies 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFetch, rgmsmDependencies, pcFetched) {
        result := ComCall(3, this, "uint", cFetch, "ptr*", rgmsmDependencies, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cSkip 
     * @returns {HRESULT} 
     */
    Skip(cSkip) {
        result := ComCall(4, this, "uint", cSkip, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMsmDependency>} pemsmDependencies 
     * @returns {HRESULT} 
     */
    Clone(pemsmDependencies) {
        result := ComCall(6, this, "ptr*", pemsmDependencies, "HRESULT")
        return result
    }
}
