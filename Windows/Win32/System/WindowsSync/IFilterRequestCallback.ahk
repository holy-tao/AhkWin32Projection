#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Mediates filter negotiation between a destination provider and a source provider.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifilterrequestcallback
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFilterRequestCallback extends IUnknown{
    /**
     * The interface identifier for IFilterRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{82df8873-6360-463a-a8a1-ede5e1a1594d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pFilter 
     * @param {Integer} filteringType 
     * @returns {HRESULT} 
     */
    RequestFilter(pFilter, filteringType) {
        result := ComCall(3, this, "ptr", pFilter, "int", filteringType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
