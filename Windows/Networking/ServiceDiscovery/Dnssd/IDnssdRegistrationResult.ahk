#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\HostName.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class IDnssdRegistrationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDnssdRegistrationResult
     * @type {Guid}
     */
    static IID => Guid("{3d786ad2-e606-5350-73ea-7e97f066162f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_IPAddress", "get_HasInstanceNameChanged"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HostName} 
     */
    IPAddress {
        get => this.get_IPAddress()
    }

    /**
     * @type {Boolean} 
     */
    HasInstanceNameChanged {
        get => this.get_HasInstanceNameChanged()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_IPAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasInstanceNameChanged() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
