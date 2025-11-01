#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11Device3.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device4 adds new methods to those in ID3D11Device3, such as RegisterDeviceRemovedEvent and UnregisterDeviceRemoved.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11device4
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device4 extends ID3D11Device3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device4
     * @type {Guid}
     */
    static IID => Guid("{8992ab71-02e6-4b8d-ba48-b056dcda42c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDeviceRemovedEvent", "UnregisterDeviceRemoved"]

    /**
     * 
     * @param {HANDLE} hEvent 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device4-registerdeviceremovedevent
     */
    RegisterDeviceRemovedEvent(hEvent, pdwCookie) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, "ptr", hEvent, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11device4-unregisterdeviceremoved
     */
    UnregisterDeviceRemoved(dwCookie) {
        ComCall(66, this, "uint", dwCookie)
    }
}
