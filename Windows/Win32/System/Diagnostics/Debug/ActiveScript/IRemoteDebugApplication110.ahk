#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplication110 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteDebugApplication110
     * @type {Guid}
     */
    static IID => Guid("{d5fe005b-2836-485e-b1f9-89d91aa24fd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDebuggerOptions", "GetCurrentDebuggerOptions", "GetMainThread"]

    /**
     * 
     * @param {Integer} mask 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetDebuggerOptions(mask, value) {
        result := ComCall(3, this, "int", mask, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrentOptions 
     * @returns {HRESULT} 
     */
    GetCurrentDebuggerOptions(pCurrentOptions) {
        pCurrentOptionsMarshal := pCurrentOptions is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pCurrentOptionsMarshal, pCurrentOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDebugApplicationThread>} ppThread 
     * @returns {HRESULT} 
     */
    GetMainThread(ppThread) {
        result := ComCall(5, this, "ptr*", ppThread, "HRESULT")
        return result
    }
}
