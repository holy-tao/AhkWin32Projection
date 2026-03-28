#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationClientInfoSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationClientInfoSource
     * @type {Guid}
     */
    static IID => Guid("{f4b8a2e1-9c3d-4a7e-8f6b-2d5e4c1a9b8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterClientConnectionCallback", "UnregisterClientConnectionCallback", "GetConnectedClients"]

    /**
     * 
     * @param {IUIAutomationClientConnectionCallback} callback 
     * @returns {Integer} 
     */
    RegisterClientConnectionCallback(callback) {
        result := ComCall(3, this, "ptr", callback, "uint*", &_handle := 0, "HRESULT")
        return _handle
    }

    /**
     * 
     * @param {Integer} _handle 
     * @returns {HRESULT} 
     */
    UnregisterClientConnectionCallback(_handle) {
        result := ComCall(4, this, "uint", _handle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     */
    GetConnectedClients() {
        result := ComCall(5, this, "ptr*", &clients := 0, "HRESULT")
        return clients
    }
}
