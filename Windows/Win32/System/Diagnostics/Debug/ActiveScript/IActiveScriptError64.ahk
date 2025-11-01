#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptError.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptError64 extends IActiveScriptError{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourcePosition64"]

    /**
     * 
     * @param {Pointer<Integer>} pdwSourceContext 
     * @param {Pointer<Integer>} pulLineNumber 
     * @param {Pointer<Integer>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition64(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        pdwSourceContextMarshal := pdwSourceContext is VarRef ? "uint*" : "ptr"
        pulLineNumberMarshal := pulLineNumber is VarRef ? "uint*" : "ptr"
        plCharacterPositionMarshal := plCharacterPosition is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pdwSourceContextMarshal, pdwSourceContext, pulLineNumberMarshal, pulLineNumber, plCharacterPositionMarshal, plCharacterPosition, "HRESULT")
        return result
    }
}
