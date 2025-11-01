#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IContainerActivationHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContainerActivationHelper
     * @type {Guid}
     */
    static IID => Guid("{b524f93f-80d5-4ec7-ae9e-d66e93ade1fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanActivateClientVM"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isAllowed 
     * @returns {HRESULT} 
     */
    CanActivateClientVM(isAllowed) {
        result := ComCall(3, this, "ptr", isAllowed, "HRESULT")
        return result
    }
}
