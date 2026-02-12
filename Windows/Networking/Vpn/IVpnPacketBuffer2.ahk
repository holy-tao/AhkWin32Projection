#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnAppId.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPacketBuffer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPacketBuffer2
     * @type {Guid}
     */
    static IID => Guid("{665e91f0-8805-4bf5-a619-2e84882e6b4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppId"]

    /**
     * @type {VpnAppId} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * 
     * @returns {VpnAppId} 
     */
    get_AppId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnAppId(value)
    }
}
