#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\KeyCredentialRetrievalResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredentialManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredentialManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{6aac468b-0ef1-4ce0-8290-4106da6a63b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupportedAsync", "RenewAttestationAsync", "RequestCreateAsync", "OpenAsync", "DeleteAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsSupportedAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RenewAttestationAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} option 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    RequestCreateAsync(name, option) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "int", option, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialRetrievalResult, value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    OpenAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(9, this, "ptr", name, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialRetrievalResult, value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncAction} 
     */
    DeleteAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
