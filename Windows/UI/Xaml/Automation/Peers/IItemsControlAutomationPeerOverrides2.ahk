#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ItemAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IItemsControlAutomationPeerOverrides2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsControlAutomationPeerOverrides2
     * @type {Guid}
     */
    static IID => Guid("{361dc0e8-b56f-45e9-80fe-10a0fb0fe177}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCreateItemAutomationPeer"]

    /**
     * 
     * @param {IInspectable} item 
     * @returns {ItemAutomationPeer} 
     */
    OnCreateItemAutomationPeer(item) {
        result := ComCall(6, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemAutomationPeer(result_)
    }
}
