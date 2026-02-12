#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnRoute](vpnroute.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnroutefactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnRoute extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnRoute
     * @type {Guid}
     */
    static IID => Guid("{b5731b83-0969-4699-938e-7776db29cfb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Address", "get_Address", "put_PrefixSize", "get_PrefixSize"]

    /**
     * @type {HostName} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * @type {Integer} 
     */
    PrefixSize {
        get => this.get_PrefixSize()
        set => this.put_PrefixSize(value)
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrefixSize(value) {
        result := ComCall(8, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrefixSize() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
