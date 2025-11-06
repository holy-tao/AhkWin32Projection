#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideRuntimeContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideRuntimeContext
     * @type {Guid}
     */
    static IID => Guid("{10e2414a-ec59-49d2-bc51-5add2c36febc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSourceContext"]

    /**
     * 
     * @param {Pointer<Pointer>} pdwContext 
     * @param {Pointer<VARIANT_BOOL>} pfExecutingGlobalCode 
     * @returns {HRESULT} 
     */
    GetCurrentSourceContext(pdwContext, pfExecutingGlobalCode) {
        pdwContextMarshal := pdwContext is VarRef ? "ptr*" : "ptr"
        pfExecutingGlobalCodeMarshal := pfExecutingGlobalCode is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pdwContextMarshal, pdwContext, pfExecutingGlobalCodeMarshal, pfExecutingGlobalCode, "HRESULT")
        return result
    }
}
