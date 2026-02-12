#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DnssdServiceInstance.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class IDnssdServiceInstanceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDnssdServiceInstanceFactory
     * @type {Guid}
     */
    static IID => Guid("{6cb061a1-c478-4331-9684-4af2186c0a2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} dnssdServiceInstanceName 
     * @param {HostName} hostName_ 
     * @param {Integer} port 
     * @returns {DnssdServiceInstance} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(dnssdServiceInstanceName, hostName_, port) {
        if(dnssdServiceInstanceName is String) {
            pin := HSTRING.Create(dnssdServiceInstanceName)
            dnssdServiceInstanceName := pin.Value
        }
        dnssdServiceInstanceName := dnssdServiceInstanceName is Win32Handle ? NumGet(dnssdServiceInstanceName, "ptr") : dnssdServiceInstanceName

        result := ComCall(6, this, "ptr", dnssdServiceInstanceName, "ptr", hostName_, "ushort", port, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DnssdServiceInstance(result_)
    }
}
