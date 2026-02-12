#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnPacketBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is reserved for system use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnpacketbufferfactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPacketBufferFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPacketBufferFactory
     * @type {Guid}
     */
    static IID => Guid("{9e2ddca2-1712-4ce4-b179-8c652c6d9999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVpnPacketBuffer"]

    /**
     * Reserved.
     * @param {VpnPacketBuffer} parentBuffer Reserved.
     * @param {Integer} offset Reserved.
     * @param {Integer} length Not used.
     * @returns {VpnPacketBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnpacketbufferfactory.createvpnpacketbuffer
     */
    CreateVpnPacketBuffer(parentBuffer, offset, length) {
        result := ComCall(6, this, "ptr", parentBuffer, "uint", offset, "uint", length, "ptr*", &vpnPacketBuffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(vpnPacketBuffer_)
    }
}
