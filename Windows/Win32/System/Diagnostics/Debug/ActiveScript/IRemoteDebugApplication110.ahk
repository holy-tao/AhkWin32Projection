#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IRemoteDebugApplication110 extends IUnknown{
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
     * 
     * @param {Integer} mask 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetDebuggerOptions(mask, value) {
        result := ComCall(3, this, "int", mask, "int", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCurrentOptions 
     * @returns {HRESULT} 
     */
    GetCurrentDebuggerOptions(pCurrentOptions) {
        result := ComCall(4, this, "int*", pCurrentOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRemoteDebugApplicationThread>} ppThread 
     * @returns {HRESULT} 
     */
    GetMainThread(ppThread) {
        result := ComCall(5, this, "ptr", ppThread, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
