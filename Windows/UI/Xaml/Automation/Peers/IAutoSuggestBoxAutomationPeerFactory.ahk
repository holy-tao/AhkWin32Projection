#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\AutoSuggestBoxAutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutoSuggestBoxAutomationPeerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoSuggestBoxAutomationPeerFactory
     * @type {Guid}
     */
    static IID => Guid("{80046849-18e7-4475-b362-4bbd53d24562}")

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
     * @param {AutoSuggestBox} owner 
     * @returns {AutoSuggestBoxAutomationPeer} 
     */
    CreateInstanceWithOwner(owner) {
        result := ComCall(6, this, "ptr", owner, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutoSuggestBoxAutomationPeer(value)
    }
}
