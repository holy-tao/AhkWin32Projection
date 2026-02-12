#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ItemsControlAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IItemAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{953c34f6-3b31-47a7-b3bf-25d3ae99c317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_ItemsControlAutomationPeer"]

    /**
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * @type {ItemsControlAutomationPeer} 
     */
    ItemsControlAutomationPeer {
        get => this.get_ItemsControlAutomationPeer()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {ItemsControlAutomationPeer} 
     */
    get_ItemsControlAutomationPeer() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemsControlAutomationPeer(value)
    }
}
