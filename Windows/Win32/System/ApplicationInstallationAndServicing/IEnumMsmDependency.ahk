#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMsmDependency.ahk
#Include .\IEnumMsmDependency.ahk
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
     * @param {Pointer<Integer>} pcFetched 
     * @returns {IMsmDependency} 
     */
    Next(cFetch, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFetch, "ptr*", &rgmsmDependencies := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IMsmDependency(rgmsmDependencies)
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
     * @returns {IEnumMsmDependency} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &pemsmDependencies := 0, "HRESULT")
        return IEnumMsmDependency(pemsmDependencies)
    }
}
