#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugSyncOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSyncOperation
     * @type {Guid}
     */
    static IID => Guid("{51973c1a-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTargetThread", "Execute", "InProgressAbort"]

    /**
     * 
     * @param {Pointer<IDebugApplicationThread>} ppatTarget 
     * @returns {HRESULT} 
     */
    GetTargetThread(ppatTarget) {
        result := ComCall(3, this, "ptr*", ppatTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunkResult 
     * @returns {HRESULT} 
     */
    Execute(ppunkResult) {
        result := ComCall(4, this, "ptr*", ppunkResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InProgressAbort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
