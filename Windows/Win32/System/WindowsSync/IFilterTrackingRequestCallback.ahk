#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterTrackingRequestCallback extends IUnknown{
    /**
     * The interface identifier for IFilterTrackingRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{713ca7bb-c858-4674-b4b6-1122436587a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISyncFilter>} pFilter 
     * @returns {HRESULT} 
     */
    RequestTrackedFilter(pFilter) {
        result := ComCall(3, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
