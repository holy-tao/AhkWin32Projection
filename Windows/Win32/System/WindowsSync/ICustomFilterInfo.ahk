#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilter.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ICustomFilterInfo extends ISyncFilterInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{1d335dff-6f88-4e4d-91a8-a3f351cfd473}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncFilter"]

    /**
     * 
     * @returns {ISyncFilter} 
     */
    GetSyncFilter() {
        result := ComCall(4, this, "ptr*", &pISyncFilter := 0, "HRESULT")
        return ISyncFilter(pISyncFilter)
    }
}
