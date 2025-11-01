#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComMtaThreadPoolKnobs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComMtaThreadPoolKnobs
     * @type {Guid}
     */
    static IID => Guid("{f9a76d2e-76a5-43eb-a0c4-49bec8e48480}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MTASetMaxThreadCount", "MTAGetMaxThreadCount", "MTASetThrottleValue", "MTAGetThrottleValue"]

    /**
     * 
     * @param {Integer} dwMaxThreads 
     * @returns {HRESULT} 
     */
    MTASetMaxThreadCount(dwMaxThreads) {
        result := ComCall(3, this, "uint", dwMaxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxThreads 
     * @returns {HRESULT} 
     */
    MTAGetMaxThreadCount(pdwMaxThreads) {
        result := ComCall(4, this, "uint*", pdwMaxThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThrottle 
     * @returns {HRESULT} 
     */
    MTASetThrottleValue(dwThrottle) {
        result := ComCall(5, this, "uint", dwThrottle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwThrottle 
     * @returns {HRESULT} 
     */
    MTAGetThrottleValue(pdwThrottle) {
        result := ComCall(6, this, "uint*", pdwThrottle, "HRESULT")
        return result
    }
}
