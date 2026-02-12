#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MenuFlyoutItemAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IMenuFlyoutItemAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuFlyoutItemAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{d08bfcb8-20d1-45d8-a2c2-2f130df714e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithOwner"]

    /**
     * 
     * @param {MenuFlyoutItem} owner 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MenuFlyoutItemAutomationPeer} 
     */
    CreateInstanceWithOwner(owner, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", owner, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MenuFlyoutItemAutomationPeer(value)
    }
}
