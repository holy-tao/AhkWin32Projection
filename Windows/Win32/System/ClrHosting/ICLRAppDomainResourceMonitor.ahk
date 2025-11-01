#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRAppDomainResourceMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRAppDomainResourceMonitor
     * @type {Guid}
     */
    static IID => Guid("{c62de18c-2e23-4aea-8423-b40c1fc59eae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentAllocated", "GetCurrentSurvived", "GetCurrentCpuTime"]

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pBytesAllocated 
     * @returns {HRESULT} 
     */
    GetCurrentAllocated(dwAppDomainId, pBytesAllocated) {
        pBytesAllocatedMarshal := pBytesAllocated is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwAppDomainId, pBytesAllocatedMarshal, pBytesAllocated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pAppDomainBytesSurvived 
     * @param {Pointer<Integer>} pTotalBytesSurvived 
     * @returns {HRESULT} 
     */
    GetCurrentSurvived(dwAppDomainId, pAppDomainBytesSurvived, pTotalBytesSurvived) {
        pAppDomainBytesSurvivedMarshal := pAppDomainBytesSurvived is VarRef ? "uint*" : "ptr"
        pTotalBytesSurvivedMarshal := pTotalBytesSurvived is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwAppDomainId, pAppDomainBytesSurvivedMarshal, pAppDomainBytesSurvived, pTotalBytesSurvivedMarshal, pTotalBytesSurvived, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<Integer>} pMilliseconds 
     * @returns {HRESULT} 
     */
    GetCurrentCpuTime(dwAppDomainId, pMilliseconds) {
        pMillisecondsMarshal := pMilliseconds is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwAppDomainId, pMillisecondsMarshal, pMilliseconds, "HRESULT")
        return result
    }
}
