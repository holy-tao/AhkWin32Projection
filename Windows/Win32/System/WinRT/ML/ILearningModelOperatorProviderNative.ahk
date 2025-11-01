#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelOperatorProviderNative extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegistry"]

    /**
     * 
     * @param {Pointer<IMLOperatorRegistry>} ppOperatorRegistry 
     * @returns {HRESULT} 
     */
    GetRegistry(ppOperatorRegistry) {
        result := ComCall(3, this, "ptr*", ppOperatorRegistry, "HRESULT")
        return result
    }
}
