#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostFunctionLocalDetails.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetails2 extends IDebugHostFunctionLocalDetails{
    /**
     * The interface identifier for IDebugHostFunctionLocalDetails2
     * @type {Guid}
     */
    static IID => Guid("{199a57b0-1967-4363-b25e-90c7e8a07f22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @returns {Boolean} 
     */
    IsInlineScope() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostSymbol>} inlineFunction 
     * @returns {HRESULT} 
     */
    GetInlinedFunction(inlineFunction) {
        result := ComCall(9, this, "ptr", inlineFunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
