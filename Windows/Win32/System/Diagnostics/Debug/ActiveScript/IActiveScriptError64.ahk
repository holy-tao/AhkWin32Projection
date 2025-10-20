#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptError.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptError64 extends IActiveScriptError{
    /**
     * The interface identifier for IActiveScriptError64
     * @type {Guid}
     */
    static IID => Guid("{b21fb2a1-5b8f-4963-8c21-21450f84ed7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<UInt64>} pdwSourceContext 
     * @param {Pointer<UInt32>} pulLineNumber 
     * @param {Pointer<Int32>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition64(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        result := ComCall(6, this, "uint*", pdwSourceContext, "uint*", pulLineNumber, "int*", plCharacterPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
