#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationClientConnectionCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationClientConnectionCallback
     * @type {Guid}
     */
    static IID => Guid("{5b8e8f2a-9c7d-4f3e-a1b2-8d6e9f4c0a1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnected", "OnDisconnected"]

    /**
     * 
     * @param {IUIAutomationClientInfo} clientInfo 
     * @returns {HRESULT} 
     */
    OnConnected(clientInfo) {
        result := ComCall(3, this, "ptr", clientInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationClientInfo} clientInfo 
     * @returns {HRESULT} 
     */
    OnDisconnected(clientInfo) {
        result := ComCall(4, this, "ptr", clientInfo, "HRESULT")
        return result
    }
}
