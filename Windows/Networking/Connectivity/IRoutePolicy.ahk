#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ConnectionProfile.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IRoutePolicy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRoutePolicy
     * @type {Guid}
     */
    static IID => Guid("{11abc4ac-0fc7-42e4-8742-569923b1ca11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionProfile", "get_HostName", "get_HostNameType"]

    /**
     * @type {ConnectionProfile} 
     */
    ConnectionProfile {
        get => this.get_ConnectionProfile()
    }

    /**
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
    }

    /**
     * @type {Integer} 
     */
    HostNameType {
        get => this.get_HostNameType()
    }

    /**
     * 
     * @returns {ConnectionProfile} 
     */
    get_ConnectionProfile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectionProfile(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HostNameType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
