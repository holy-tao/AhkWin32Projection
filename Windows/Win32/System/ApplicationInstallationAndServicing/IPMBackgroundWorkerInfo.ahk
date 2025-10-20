#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMBackgroundWorkerInfo extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, "ptr", pTaskID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGName 
     * @returns {HRESULT} 
     */
    get_BGName(pBGName) {
        result := ComCall(5, this, "ptr", pBGName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMaxStartupLatency 
     * @returns {HRESULT} 
     */
    get_MaxStartupLatency(pMaxStartupLatency) {
        result := ComCall(6, this, "uint*", pMaxStartupLatency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pExpectedRuntime 
     * @returns {HRESULT} 
     */
    get_ExpectedRuntime(pExpectedRuntime) {
        result := ComCall(7, this, "uint*", pExpectedRuntime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsBootWorker 
     * @returns {HRESULT} 
     */
    get_IsBootWorker(pIsBootWorker) {
        result := ComCall(8, this, "ptr", pIsBootWorker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
