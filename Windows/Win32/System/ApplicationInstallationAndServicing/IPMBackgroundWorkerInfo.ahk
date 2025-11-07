#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMBackgroundWorkerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMBackgroundWorkerInfo
     * @type {Guid}
     */
    static IID => Guid("{7dd4531b-d3bf-4b6b-94f3-69c098b1497d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_TaskID", "get_BGName", "get_MaxStartupLatency", "get_ExpectedRuntime", "get_IsBootWorker"]

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, "ptr", pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGName 
     * @returns {HRESULT} 
     */
    get_BGName(pBGName) {
        result := ComCall(5, this, "ptr", pBGName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxStartupLatency() {
        result := ComCall(6, this, "uint*", &pMaxStartupLatency := 0, "HRESULT")
        return pMaxStartupLatency
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpectedRuntime() {
        result := ComCall(7, this, "uint*", &pExpectedRuntime := 0, "HRESULT")
        return pExpectedRuntime
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsBootWorker() {
        result := ComCall(8, this, "int*", &pIsBootWorker := 0, "HRESULT")
        return pIsBootWorker
    }
}
