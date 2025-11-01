#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplicationThread11032 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplicationThread11032
     * @type {Guid}
     */
    static IID => Guid("{2194ac5c-6561-404a-a2e9-f57d72de3702}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActiveThreadRequestCount", "IsSuspendedForBreakPoint", "IsThreadCallable", "AsynchronousCallIntoThread"]

    /**
     * 
     * @param {Pointer<Integer>} puiThreadRequests 
     * @returns {HRESULT} 
     */
    GetActiveThreadRequestCount(puiThreadRequests) {
        result := ComCall(3, this, "uint*", puiThreadRequests, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsSuspended 
     * @returns {HRESULT} 
     */
    IsSuspendedForBreakPoint(pfIsSuspended) {
        result := ComCall(4, this, "ptr", pfIsSuspended, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsCallable 
     * @returns {HRESULT} 
     */
    IsThreadCallable(pfIsCallable) {
        result := ComCall(5, this, "ptr", pfIsCallable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugThreadCall32} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    AsynchronousCallIntoThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(6, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }
}
