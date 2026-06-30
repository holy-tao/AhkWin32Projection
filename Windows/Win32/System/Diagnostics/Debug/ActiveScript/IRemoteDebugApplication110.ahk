#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IRemoteDebugApplicationThread.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include .\SCRIPT_DEBUGGER_OPTIONS.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IRemoteDebugApplication110 extends IUnknown {

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
     * @param {SCRIPT_DEBUGGER_OPTIONS} mask 
     * @param {SCRIPT_DEBUGGER_OPTIONS} value 
     * @returns {HRESULT} 
     */
    SetDebuggerOptions(mask, value) {
        result := ComCall(3, this, "int", mask, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SCRIPT_DEBUGGER_OPTIONS} 
     */
    GetCurrentDebuggerOptions() {
        result := ComCall(4, this, "int*", &pCurrentOptions := 0, "HRESULT")
        return pCurrentOptions
    }

    /**
     * 
     * @returns {IRemoteDebugApplicationThread} 
     */
    GetMainThread() {
        result := ComCall(5, this, "ptr*", &ppThread := 0, "HRESULT")
        return IRemoteDebugApplicationThread(ppThread)
    }
}
