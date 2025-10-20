#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptError.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptErrorDebug extends IActiveScriptError{
    /**
     * The interface identifier for IActiveScriptErrorDebug
     * @type {Guid}
     */
    static IID => Guid("{51973c12-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<IDebugDocumentContext>} ppssc 
     * @returns {HRESULT} 
     */
    GetDocumentContext(ppssc) {
        result := ComCall(6, this, "ptr", ppssc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugStackFrame>} ppdsf 
     * @returns {HRESULT} 
     */
    GetStackFrame(ppdsf) {
        result := ComCall(7, this, "ptr", ppdsf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
