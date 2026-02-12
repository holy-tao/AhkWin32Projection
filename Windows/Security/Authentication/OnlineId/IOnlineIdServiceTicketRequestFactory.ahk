#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\OnlineIdServiceTicketRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IOnlineIdServiceTicketRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlineIdServiceTicketRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{bebb0a08-9e73-4077-9614-08614c0bc245}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateOnlineIdServiceTicketRequest", "CreateOnlineIdServiceTicketRequestAdvanced"]

    /**
     * 
     * @param {HSTRING} service 
     * @param {HSTRING} policy 
     * @returns {OnlineIdServiceTicketRequest} 
     */
    CreateOnlineIdServiceTicketRequest(service, policy) {
        if(service is String) {
            pin := HSTRING.Create(service)
            service := pin.Value
        }
        service := service is Win32Handle ? NumGet(service, "ptr") : service
        if(policy is String) {
            pin := HSTRING.Create(policy)
            policy := pin.Value
        }
        policy := policy is Win32Handle ? NumGet(policy, "ptr") : policy

        result := ComCall(6, this, "ptr", service, "ptr", policy, "ptr*", &onlineIdServiceTicketRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OnlineIdServiceTicketRequest(onlineIdServiceTicketRequest_)
    }

    /**
     * 
     * @param {HSTRING} service 
     * @returns {OnlineIdServiceTicketRequest} 
     */
    CreateOnlineIdServiceTicketRequestAdvanced(service) {
        if(service is String) {
            pin := HSTRING.Create(service)
            service := pin.Value
        }
        service := service is Win32Handle ? NumGet(service, "ptr") : service

        result := ComCall(7, this, "ptr", service, "ptr*", &onlineIdServiceTicketRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OnlineIdServiceTicketRequest(onlineIdServiceTicketRequest_)
    }
}
