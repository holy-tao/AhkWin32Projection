#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\PivotItemDataAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IPivotItemDataAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivotItemDataAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{517a2480-d3b6-412e-82b6-94a0a84c13b0}")

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
     * @param {PivotAutomationPeer} parent 
     * @returns {PivotItemDataAutomationPeer} 
     */
    CreateInstanceWithParentAndItem(item, parent) {
        result := ComCall(6, this, "ptr", item, "ptr", parent, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PivotItemDataAutomationPeer(value)
    }
}
