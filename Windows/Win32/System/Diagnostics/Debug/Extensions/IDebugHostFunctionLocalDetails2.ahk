#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk
#Include .\IDebugHostFunctionLocalDetails.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetails2 extends IDebugHostFunctionLocalDetails{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInlineScope", "GetInlinedFunction"]

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
     * @returns {IDebugHostSymbol} 
     */
    GetInlinedFunction() {
        result := ComCall(9, this, "ptr*", &inlineFunction := 0, "HRESULT")
        return IDebugHostSymbol(inlineFunction)
    }
}
