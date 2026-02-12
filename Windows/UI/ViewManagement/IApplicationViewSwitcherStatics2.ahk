#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewSwitcherStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewSwitcherStatics2
     * @type {Guid}
     */
    static IID => Guid("{60e995cd-4fc2-48c4-b8e3-395f2b9f0fc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableSystemViewActivationPolicy"]

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableSystemViewActivationPolicy() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
