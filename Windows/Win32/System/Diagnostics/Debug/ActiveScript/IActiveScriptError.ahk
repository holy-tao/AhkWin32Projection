#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptError extends IUnknown{
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
     * 
     * @param {Pointer<EXCEPINFO>} pexcepinfo 
     * @returns {HRESULT} 
     */
    GetExceptionInfo(pexcepinfo) {
        result := ComCall(3, this, "ptr", pexcepinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSourceContext 
     * @param {Pointer<UInt32>} pulLineNumber 
     * @param {Pointer<Int32>} plCharacterPosition 
     * @returns {HRESULT} 
     */
    GetSourcePosition(pdwSourceContext, pulLineNumber, plCharacterPosition) {
        result := ComCall(4, this, "uint*", pdwSourceContext, "uint*", pulLineNumber, "int*", plCharacterPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceLine 
     * @returns {HRESULT} 
     */
    GetSourceLineText(pbstrSourceLine) {
        result := ComCall(5, this, "ptr", pbstrSourceLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
