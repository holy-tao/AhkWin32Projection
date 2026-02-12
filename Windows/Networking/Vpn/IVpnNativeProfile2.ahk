#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnNativeProfile2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnNativeProfile2
     * @type {Guid}
     */
    static IID => Guid("{0fec2467-cdb5-4ac7-b5a3-0afb5ec47682}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequireVpnClientAppUI", "put_RequireVpnClientAppUI", "get_ConnectionStatus"]

    /**
     * @type {Boolean} 
     */
    RequireVpnClientAppUI {
        get => this.get_RequireVpnClientAppUI()
        set => this.put_RequireVpnClientAppUI(value)
    }

    /**
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequireVpnClientAppUI() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireVpnClientAppUI(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
