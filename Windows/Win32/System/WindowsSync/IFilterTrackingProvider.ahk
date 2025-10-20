#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterTrackingProvider extends IUnknown{
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
     * 
     * @param {Pointer<IFilterTrackingRequestCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SpecifyTrackedFilters(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncFilter>} pFilter 
     * @returns {HRESULT} 
     */
    AddTrackedFilter(pFilter) {
        result := ComCall(4, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
