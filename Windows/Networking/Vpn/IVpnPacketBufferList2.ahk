#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnPacketBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPacketBufferList2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPacketBufferList2
     * @type {Guid}
     */
    static IID => Guid("{3e7acfe5-ea1e-482a-8d98-c065f57d89ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddLeadingPacket", "RemoveLeadingPacket", "AddTrailingPacket", "RemoveTrailingPacket"]

    /**
     * 
     * @param {VpnPacketBuffer} nextVpnPacketBuffer 
     * @returns {HRESULT} 
     */
    AddLeadingPacket(nextVpnPacketBuffer) {
        result := ComCall(6, this, "ptr", nextVpnPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    RemoveLeadingPacket() {
        result := ComCall(7, this, "ptr*", &nextVpnPacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(nextVpnPacketBuffer)
    }

    /**
     * 
     * @param {VpnPacketBuffer} nextVpnPacketBuffer 
     * @returns {HRESULT} 
     */
    AddTrailingPacket(nextVpnPacketBuffer) {
        result := ComCall(8, this, "ptr", nextVpnPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    RemoveTrailingPacket() {
        result := ComCall(9, this, "ptr*", &nextVpnPacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(nextVpnPacketBuffer)
    }
}
