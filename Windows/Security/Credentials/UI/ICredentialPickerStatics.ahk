#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\CredentialPickerResults.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class ICredentialPickerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialPickerStatics
     * @type {Guid}
     */
    static IID => Guid("{aa3a5c73-c9ea-4782-99fb-e6d7e938e12d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PickWithOptionsAsync", "PickWithMessageAsync", "PickWithCaptionAsync"]

    /**
     * 
     * @param {CredentialPickerOptions} options 
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     */
    PickWithOptionsAsync(options) {
        result := ComCall(6, this, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CredentialPickerResults, operation)
    }

    /**
     * 
     * @param {HSTRING} targetName 
     * @param {HSTRING} message 
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     */
    PickWithMessageAsync(targetName, message) {
        if(targetName is String) {
            pin := HSTRING.Create(targetName)
            targetName := pin.Value
        }
        targetName := targetName is Win32Handle ? NumGet(targetName, "ptr") : targetName
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(7, this, "ptr", targetName, "ptr", message, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CredentialPickerResults, operation)
    }

    /**
     * 
     * @param {HSTRING} targetName 
     * @param {HSTRING} message 
     * @param {HSTRING} caption 
     * @returns {IAsyncOperation<CredentialPickerResults>} 
     */
    PickWithCaptionAsync(targetName, message, caption) {
        if(targetName is String) {
            pin := HSTRING.Create(targetName)
            targetName := pin.Value
        }
        targetName := targetName is Win32Handle ? NumGet(targetName, "ptr") : targetName
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message
        if(caption is String) {
            pin := HSTRING.Create(caption)
            caption := pin.Value
        }
        caption := caption is Win32Handle ? NumGet(caption, "ptr") : caption

        result := ComCall(8, this, "ptr", targetName, "ptr", message, "ptr", caption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CredentialPickerResults, operation)
    }
}
