#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include Core\VariablePhotoSequenceCapture.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture3
     * @type {Guid}
     */
    static IID => Guid("{d4136f30-1564-466e-bc0a-af94e02ab016}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareVariablePhotoSequenceCaptureAsync", "add_FocusChanged", "remove_FocusChanged", "add_PhotoConfirmationCaptured", "remove_PhotoConfirmationCaptured"]

    /**
     * 
     * @param {ImageEncodingProperties} type 
     * @returns {IAsyncOperation<VariablePhotoSequenceCapture>} 
     */
    PrepareVariablePhotoSequenceCaptureAsync(type) {
        result := ComCall(6, this, "ptr", type, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VariablePhotoSequenceCapture, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, MediaCaptureFocusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, PhotoConfirmationCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PhotoConfirmationCaptured(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PhotoConfirmationCaptured(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
