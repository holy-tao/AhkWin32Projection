#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetConnectionConnectUi extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetConnectionConnectUi
     * @type {Guid}
     */
    static IID => Guid("{c08956a3-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConnection", "Connect", "Disconnect"]

    /**
     * 
     * @param {INetConnection} pCon 
     * @returns {HRESULT} 
     */
    SetConnection(pCon) {
        result := ComCall(3, this, "ptr", pCon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Connect(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Disconnect(hwndParent, dwFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }
}
