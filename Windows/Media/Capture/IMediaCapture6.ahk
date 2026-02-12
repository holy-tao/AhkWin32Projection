#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include Frames\MultiSourceMediaFrameReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture6
     * @type {Guid}
     */
    static IID => Guid("{228948bd-4b20-4bb1-9fd6-a583212a1012}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_CaptureDeviceExclusiveControlStatusChanged", "remove_CaptureDeviceExclusiveControlStatusChanged", "CreateMultiSourceFrameReaderAsync"]

    /**
     * 
     * @param {TypedEventHandler<MediaCapture, MediaCaptureDeviceExclusiveControlStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CaptureDeviceExclusiveControlStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_CaptureDeviceExclusiveControlStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<MediaFrameSource>} inputSources 
     * @returns {IAsyncOperation<MultiSourceMediaFrameReader>} 
     */
    CreateMultiSourceFrameReaderAsync(inputSources) {
        result := ComCall(8, this, "ptr", inputSources, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MultiSourceMediaFrameReader, value)
    }
}
