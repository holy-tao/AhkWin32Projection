#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterTrackingProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterTrackingProvider
     * @type {Guid}
     */
    static IID => Guid("{743383c0-fc4e-45ba-ad81-d9d84c7a24f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SpecifyTrackedFilters", "AddTrackedFilter"]

    /**
     * 
     * @param {IFilterTrackingRequestCallback} pCallback 
     * @returns {HRESULT} 
     */
    SpecifyTrackedFilters(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncFilter} pFilter 
     * @returns {HRESULT} 
     */
    AddTrackedFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
