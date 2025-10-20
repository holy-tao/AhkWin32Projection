#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRAppDomainResourceMonitor extends IUnknown{
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
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<UInt64>} pBytesAllocated 
     * @returns {HRESULT} 
     */
    GetCurrentAllocated(dwAppDomainId, pBytesAllocated) {
        result := ComCall(3, this, "uint", dwAppDomainId, "uint*", pBytesAllocated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<UInt64>} pAppDomainBytesSurvived 
     * @param {Pointer<UInt64>} pTotalBytesSurvived 
     * @returns {HRESULT} 
     */
    GetCurrentSurvived(dwAppDomainId, pAppDomainBytesSurvived, pTotalBytesSurvived) {
        result := ComCall(4, this, "uint", dwAppDomainId, "uint*", pAppDomainBytesSurvived, "uint*", pTotalBytesSurvived, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<UInt64>} pMilliseconds 
     * @returns {HRESULT} 
     */
    GetCurrentCpuTime(dwAppDomainId, pMilliseconds) {
        result := ComCall(5, this, "uint", dwAppDomainId, "uint*", pMilliseconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
