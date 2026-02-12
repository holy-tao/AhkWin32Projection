#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebTokenRequest.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebTokenRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebTokenRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{6cf2141c-0ff0-4c67-b84f-99ddbe4a72c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPromptType", "CreateWithProvider", "CreateWithScope"]

    /**
     * Create Extended Stored Procedures
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} scope 
     * @param {HSTRING} clientId 
     * @returns {WebTokenRequest} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(provider, scope, clientId) {
        if(scope is String) {
            pin := HSTRING.Create(scope)
            scope := pin.Value
        }
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(6, this, "ptr", provider, "ptr", scope, "ptr", clientId, "ptr*", &webTokenRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenRequest(webTokenRequest_)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} scope 
     * @param {HSTRING} clientId 
     * @param {Integer} promptType 
     * @returns {WebTokenRequest} 
     */
    CreateWithPromptType(provider, scope, clientId, promptType) {
        if(scope is String) {
            pin := HSTRING.Create(scope)
            scope := pin.Value
        }
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(7, this, "ptr", provider, "ptr", scope, "ptr", clientId, "int", promptType, "ptr*", &webTokenRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenRequest(webTokenRequest_)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @returns {WebTokenRequest} 
     */
    CreateWithProvider(provider) {
        result := ComCall(8, this, "ptr", provider, "ptr*", &webTokenRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenRequest(webTokenRequest_)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} scope 
     * @returns {WebTokenRequest} 
     */
    CreateWithScope(provider, scope) {
        if(scope is String) {
            pin := HSTRING.Create(scope)
            scope := pin.Value
        }
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope

        result := ComCall(9, this, "ptr", provider, "ptr", scope, "ptr*", &webTokenRequest_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebTokenRequest(webTokenRequest_)
    }
}
