#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IKernelTransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKernelTransaction
     * @type {Guid}
     */
    static IID => Guid("{79427a2b-f895-40e0-be79-b57dc82ed231}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHandle"]

    /**
     * 
     * @param {Pointer<HANDLE>} pHandle 
     * @returns {HRESULT} 
     */
    GetHandle(pHandle) {
        result := ComCall(3, this, "ptr", pHandle, "HRESULT")
        return result
    }
}
