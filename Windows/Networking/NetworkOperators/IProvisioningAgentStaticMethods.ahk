#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProvisioningAgent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IProvisioningAgentStaticMethods extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisioningAgentStaticMethods
     * @type {Guid}
     */
    static IID => Guid("{217700e0-8101-11df-adb9-f4ce462d9137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromNetworkAccountId"]

    /**
     * 
     * @param {HSTRING} networkAccountId 
     * @returns {ProvisioningAgent} 
     */
    CreateFromNetworkAccountId(networkAccountId) {
        if(networkAccountId is String) {
            pin := HSTRING.Create(networkAccountId)
            networkAccountId := pin.Value
        }
        networkAccountId := networkAccountId is Win32Handle ? NumGet(networkAccountId, "ptr") : networkAccountId

        result := ComCall(6, this, "ptr", networkAccountId, "ptr*", &provisioningAgent_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProvisioningAgent(provisioningAgent_)
    }
}
