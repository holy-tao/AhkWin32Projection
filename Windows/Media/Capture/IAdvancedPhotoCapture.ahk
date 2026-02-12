#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AdvancedCapturedPhoto.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAdvancedPhotoCapture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedPhotoCapture
     * @type {Guid}
     */
    static IID => Guid("{83ffaafa-6667-44dc-973c-a6bce596aa0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CaptureAsync", "CaptureWithContextAsync", "add_OptionalReferencePhotoCaptured", "remove_OptionalReferencePhotoCaptured", "add_AllPhotosCaptured", "remove_AllPhotosCaptured", "FinishAsync"]

    /**
     * 
     * @returns {IAsyncOperation<AdvancedCapturedPhoto>} 
     */
    CaptureAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdvancedCapturedPhoto, operation)
    }

    /**
     * 
     * @param {IInspectable} context_ 
     * @returns {IAsyncOperation<AdvancedCapturedPhoto>} 
     */
    CaptureWithContextAsync(context_) {
        result := ComCall(7, this, "ptr", context_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AdvancedCapturedPhoto, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<AdvancedPhotoCapture, OptionalReferencePhotoCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionalReferencePhotoCaptured(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_OptionalReferencePhotoCaptured(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AdvancedPhotoCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AllPhotosCaptured(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_AllPhotosCaptured(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    FinishAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
