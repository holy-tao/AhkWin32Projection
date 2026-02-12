#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ListViewItemDataAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IListViewItemDataAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemDataAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{d0db12bb-d715-4523-acc0-1e1072d8e32b}")

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
     * @param {ListViewBaseAutomationPeer} parent 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {ListViewItemDataAutomationPeer} 
     */
    CreateInstanceWithParentAndItem(item, parent, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", item, "ptr", parent, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ListViewItemDataAutomationPeer(value)
    }
}
