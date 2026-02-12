#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnInterfaceId](vpninterfaceid.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpninterfaceidfactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnInterfaceId extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnInterfaceId
     * @type {Guid}
     */
    static IID => Guid("{9e2ddca2-1712-4ce4-b179-8c652c6d1011}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAddressInfo"]

    /**
     * 
     * @param {Pointer<Byte>} id 
     * @returns {HRESULT} 
     */
    GetAddressInfo(id) {
        result := ComCall(6, this, "ptr", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
