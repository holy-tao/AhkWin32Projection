#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannel5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannel5
     * @type {Guid}
     */
    static IID => Guid("{de7a0992-8384-4fbc-882c-1fd23124cd3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppendVpnReceivePacketBuffer", "AppendVpnSendPacketBuffer", "FlushVpnReceivePacketBuffers", "FlushVpnSendPacketBuffers"]

    /**
     * 
     * @param {VpnPacketBuffer} decapsulatedPacketBuffer 
     * @returns {HRESULT} 
     */
    AppendVpnReceivePacketBuffer(decapsulatedPacketBuffer) {
        result := ComCall(6, this, "ptr", decapsulatedPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VpnPacketBuffer} encapsulatedPacketBuffer 
     * @returns {HRESULT} 
     */
    AppendVpnSendPacketBuffer(encapsulatedPacketBuffer) {
        result := ComCall(7, this, "ptr", encapsulatedPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushVpnReceivePacketBuffers() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushVpnSendPacketBuffers() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
