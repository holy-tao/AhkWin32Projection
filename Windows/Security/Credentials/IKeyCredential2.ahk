#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\KeyCredentialOperationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredential2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredential2
     * @type {Guid}
     */
    static IID => Guid("{ca343273-f558-53ef-b943-4a3ec81a217e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestDeriveSharedSecretAsync", "RetrieveAuthorizationContext"]

    /**
     * 
     * @param {WindowId} windowId_ 
     * @param {HSTRING} message 
     * @param {IBuffer} publicKey 
     * @returns {IAsyncOperation<KeyCredentialOperationResult>} 
     */
    RequestDeriveSharedSecretAsync(windowId_, message, publicKey) {
        windowId_ := windowId_ is Win32Handle ? NumGet(windowId_, "ptr") : windowId_
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(6, this, "ptr", windowId_, "ptr", message, "ptr", publicKey, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialOperationResult, operation)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    RetrieveAuthorizationContext() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }
}
