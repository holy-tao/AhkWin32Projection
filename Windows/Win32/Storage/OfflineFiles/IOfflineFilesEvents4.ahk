#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOfflineFilesEvents3.ahk

/**
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEvents4 extends IOfflineFilesEvents3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesEvents4
     * @type {Guid}
     */
    static IID => Guid("{dbd69b1e-c7d2-473e-b35f-9d8c24c0c484}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrefetchCloseHandleBegin", "PrefetchCloseHandleEnd"]

    /**
     * 
     * @returns {HRESULT} 
     */
    PrefetchCloseHandleBegin() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwClosedHandleCount 
     * @param {Integer} dwOpenHandleCount 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    PrefetchCloseHandleEnd(dwClosedHandleCount, dwOpenHandleCount, hrResult) {
        result := ComCall(41, this, "uint", dwClosedHandleCount, "uint", dwOpenHandleCount, "int", hrResult, "HRESULT")
        return result
    }
}
