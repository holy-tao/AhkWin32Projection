#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\KeyCredentialRetrievalResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IKeyCredentialManagerExtendedStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyCredentialManagerExtendedStatics
     * @type {Guid}
     */
    static IID => Guid("{a5312d27-b408-5011-9b36-b07ab0a67a7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestCreateAsync", "OpenAsync"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} option 
     * @param {HSTRING} algorithm 
     * @param {HSTRING} message 
     * @param {KeyCredentialCacheConfiguration} cacheConfiguration 
     * @param {WindowId} windowId_ 
     * @param {Integer} callbackType 
     * @param {AttestationChallengeHandler} attestationCallback 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    RequestCreateAsync(name, option, algorithm, message, cacheConfiguration, windowId_, callbackType, attestationCallback) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(algorithm is String) {
            pin := HSTRING.Create(algorithm)
            algorithm := pin.Value
        }
        algorithm := algorithm is Win32Handle ? NumGet(algorithm, "ptr") : algorithm
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message
        windowId_ := windowId_ is Win32Handle ? NumGet(windowId_, "ptr") : windowId_

        result := ComCall(6, this, "ptr", name, "int", option, "ptr", algorithm, "ptr", message, "ptr", cacheConfiguration, "ptr", windowId_, "int", callbackType, "ptr", attestationCallback, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialRetrievalResult, operation)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} callbackType 
     * @param {AttestationChallengeHandler} attestationCallback 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    OpenAsync(name, callbackType, attestationCallback) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "int", callbackType, "ptr", attestationCallback, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(KeyCredentialRetrievalResult, operation)
    }
}
