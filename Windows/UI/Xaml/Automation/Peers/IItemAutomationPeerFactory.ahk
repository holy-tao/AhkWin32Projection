#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ItemAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IItemAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{29065073-de3d-4d3f-97b4-4d6f9d53444d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithParentAndItem"]

    /**
     * 
     * @param {IInspectable} item 
     * @param {ItemsControlAutomationPeer} parent 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {ItemAutomationPeer} 
     */
    CreateInstanceWithParentAndItem(item, parent, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", item, "ptr", parent, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemAutomationPeer(value)
    }
}
