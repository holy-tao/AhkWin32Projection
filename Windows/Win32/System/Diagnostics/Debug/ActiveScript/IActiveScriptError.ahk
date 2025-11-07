#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\EXCEPINFO.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptError
     * @type {Guid}
     */
    static IID => Guid("{eae1ba61-a4ed-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExceptionInfo", "GetSourcePosition", "GetSourceLineText"]

    /**
     * 
     * @returns {EXCEPINFO} 
     */
    GetExceptionInfo() {
        pexcepinfo := EXCEPINFO()
        result := ComCall(3, this, "ptr", pexcepinfo, "HRESULT")
        return pexcepinfo
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSourceContext 
     * @param {Pointer<Integer>} pulLineNumber 
     * @param {Pointer<Integer>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        pdwSourceContextMarshal := pdwSourceContext is VarRef ? "uint*" : "ptr"
        pulLineNumberMarshal := pulLineNumber is VarRef ? "uint*" : "ptr"
        plCharacterPositionMarshal := plCharacterPosition is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pdwSourceContextMarshal, pdwSourceContext, pulLineNumberMarshal, pulLineNumber, plCharacterPositionMarshal, plCharacterPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSourceLineText() {
        pbstrSourceLine := BSTR()
        result := ComCall(5, this, "ptr", pbstrSourceLine, "HRESULT")
        return pbstrSourceLine
    }
}
