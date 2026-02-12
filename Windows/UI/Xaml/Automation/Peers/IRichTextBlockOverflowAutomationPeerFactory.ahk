#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\RichTextBlockOverflowAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockOverflowAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockOverflowAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{bd5eb663-2c14-4665-adef-f2b033947beb}")

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
     * @param {RichTextBlockOverflow} owner 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {RichTextBlockOverflowAutomationPeer} 
     */
    CreateInstanceWithOwner(owner, baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", owner, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RichTextBlockOverflowAutomationPeer(value)
    }
}
