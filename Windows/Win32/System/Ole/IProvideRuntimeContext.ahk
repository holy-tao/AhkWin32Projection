#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideRuntimeContext extends IUnknown{
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
     * 
     * @param {Pointer<UIntPtr>} pdwContext 
     * @param {Pointer<VARIANT_BOOL>} pfExecutingGlobalCode 
     * @returns {HRESULT} 
     */
    GetCurrentSourceContext(pdwContext, pfExecutingGlobalCode) {
        result := ComCall(3, this, "ptr*", pdwContext, "ptr", pfExecutingGlobalCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
