#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnInterfaceId.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnInterfaceId](vpninterfaceid.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpninterfaceidfactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnInterfaceIdFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnInterfaceIdFactory
     * @type {Guid}
     */
    static IID => Guid("{9e2ddca2-1712-4ce4-b179-8c652c6d1000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVpnInterfaceId"]

    /**
     * Creates a [VpnInterfaceId](vpninterfaceid.md) object.
     * @param {Integer} address_length 
     * @param {Pointer<Integer>} address The address represented as a set of bytes.
     * @returns {VpnInterfaceId} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpninterfaceidfactory.createvpninterfaceid
     */
    CreateVpnInterfaceId(address_length, address) {
        addressMarshal := address is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", address_length, addressMarshal, address, "ptr*", &vpnInterfaceId_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnInterfaceId(vpnInterfaceId_)
    }
}
