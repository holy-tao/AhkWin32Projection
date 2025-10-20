#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelOperatorProviderNative extends IUnknown{
    /**
     * The interface identifier for ILearningModelOperatorProviderNative
     * @type {Guid}
     */
    static IID => Guid("{1adaa23a-eb67-41f3-aad8-5d984e9bacd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLOperatorRegistry>} ppOperatorRegistry 
     * @returns {HRESULT} 
     */
    GetRegistry(ppOperatorRegistry) {
        result := ComCall(3, this, "ptr", ppOperatorRegistry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
