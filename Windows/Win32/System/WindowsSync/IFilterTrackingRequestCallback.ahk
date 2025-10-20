#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterTrackingRequestCallback extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestTrackedFilter"]

    /**
     * 
     * @param {ISyncFilter} pFilter 
     * @returns {HRESULT} 
     */
    RequestTrackedFilter(pFilter) {
        result := ComCall(3, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
