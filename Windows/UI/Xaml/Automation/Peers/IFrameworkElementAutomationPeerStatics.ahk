#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\AutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementAutomationPeerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementAutomationPeerStatics
     * @type {Guid}
     */
    static IID => Guid("{b9c0b997-2820-44a1-a5a8-9b801edc269e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromElement", "CreatePeerForElement"]

    /**
     * 
     * @param {UIElement} element 
     * @returns {AutomationPeer} 
     */
    FromElement(element) {
        result := ComCall(6, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {AutomationPeer} 
     */
    CreatePeerForElement(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }
}
