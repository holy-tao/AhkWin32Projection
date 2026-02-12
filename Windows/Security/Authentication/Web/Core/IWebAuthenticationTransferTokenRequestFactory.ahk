#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebAuthenticationTransferTokenRequest.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class IWebAuthenticationTransferTokenRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAuthenticationTransferTokenRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{5f16b627-04c4-5f0b-8683-8bab58965656}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithCorrelationId"]

    /**
     * Create Extended Stored Procedures
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} transferToken 
     * @returns {WebAuthenticationTransferTokenRequest} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(provider, transferToken) {
        if(transferToken is String) {
            pin := HSTRING.Create(transferToken)
            transferToken := pin.Value
        }
        transferToken := transferToken is Win32Handle ? NumGet(transferToken, "ptr") : transferToken

        result := ComCall(6, this, "ptr", provider, "ptr", transferToken, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationTransferTokenRequest(value)
    }

    /**
     * 
     * @param {WebAccountProvider} provider 
     * @param {HSTRING} transferToken 
     * @param {HSTRING} correlationId_ 
     * @returns {WebAuthenticationTransferTokenRequest} 
     */
    CreateWithCorrelationId(provider, transferToken, correlationId_) {
        if(transferToken is String) {
            pin := HSTRING.Create(transferToken)
            transferToken := pin.Value
        }
        transferToken := transferToken is Win32Handle ? NumGet(transferToken, "ptr") : transferToken
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(7, this, "ptr", provider, "ptr", transferToken, "ptr", correlationId_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAuthenticationTransferTokenRequest(value)
    }
}
