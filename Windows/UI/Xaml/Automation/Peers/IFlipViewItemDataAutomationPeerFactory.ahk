#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\FlipViewItemDataAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IFlipViewItemDataAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlipViewItemDataAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{3c864393-0aea-4e78-bc11-b775cac4114c}")

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
     * @param {FlipViewAutomationPeer} parent 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {FlipViewItemDataAutomationPeer} 
     */
    CreateInstanceWithParentAndItem(item, parent, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", item, "ptr", parent, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlipViewItemDataAutomationPeer(value)
    }
}
