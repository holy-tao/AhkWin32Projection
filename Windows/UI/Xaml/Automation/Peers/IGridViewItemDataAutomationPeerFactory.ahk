#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\GridViewItemDataAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IGridViewItemDataAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridViewItemDataAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{a65e7a88-770d-402c-996f-67506af2a4af}")

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
     * @param {GridViewAutomationPeer} parent 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {GridViewItemDataAutomationPeer} 
     */
    CreateInstanceWithParentAndItem(item, parent, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", item, "ptr", parent, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GridViewItemDataAutomationPeer(value)
    }
}
