#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplication110.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugApplication11064 extends IRemoteDebugApplication110{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugApplication11064
     * @type {Guid}
     */
    static IID => Guid("{2039d958-4eeb-496a-87bb-2e5201eadeef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynchronousCallInMainThread", "AsynchronousCallInMainThread", "CallableWaitForHandles"]

    /**
     * 
     * @param {IDebugThreadCall64} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    SynchronousCallInMainThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(6, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugThreadCall64} pptc 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {HRESULT} 
     */
    AsynchronousCallInMainThread(pptc, dwParam1, dwParam2, dwParam3) {
        result := ComCall(7, this, "ptr", pptc, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} handleCount 
     * @param {Pointer<HANDLE>} pHandles 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     */
    CallableWaitForHandles(handleCount, pHandles, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", handleCount, "ptr", pHandles, pIndexMarshal, pIndex, "HRESULT")
        return result
    }
}
