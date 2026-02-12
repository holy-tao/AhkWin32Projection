#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\LowLagMediaRecording.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LowLagPhotoCapture.ahk
#Include .\LowLagPhotoSequenceCapture.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture2
     * @type {Guid}
     */
    static IID => Guid("{9cc68260-7da1-4043-b652-21b8878daff9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PrepareLowLagRecordToStorageFileAsync", "PrepareLowLagRecordToStreamAsync", "PrepareLowLagRecordToCustomSinkAsync", "PrepareLowLagRecordToCustomSinkIdAsync", "PrepareLowLagPhotoCaptureAsync", "PrepareLowLagPhotoSequenceCaptureAsync", "SetEncodingPropertiesAsync"]

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     */
    PrepareLowLagRecordToStorageFileAsync(encodingProfile, file_) {
        result := ComCall(6, this, "ptr", encodingProfile, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagMediaRecording, operation)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IRandomAccessStream} stream 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     */
    PrepareLowLagRecordToStreamAsync(encodingProfile, stream) {
        result := ComCall(7, this, "ptr", encodingProfile, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagMediaRecording, operation)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {IMediaExtension} customMediaSink 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     */
    PrepareLowLagRecordToCustomSinkAsync(encodingProfile, customMediaSink) {
        result := ComCall(8, this, "ptr", encodingProfile, "ptr", customMediaSink, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagMediaRecording, operation)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @param {HSTRING} customSinkActivationId 
     * @param {IPropertySet} customSinkSettings 
     * @returns {IAsyncOperation<LowLagMediaRecording>} 
     */
    PrepareLowLagRecordToCustomSinkIdAsync(encodingProfile, customSinkActivationId, customSinkSettings) {
        if(customSinkActivationId is String) {
            pin := HSTRING.Create(customSinkActivationId)
            customSinkActivationId := pin.Value
        }
        customSinkActivationId := customSinkActivationId is Win32Handle ? NumGet(customSinkActivationId, "ptr") : customSinkActivationId

        result := ComCall(9, this, "ptr", encodingProfile, "ptr", customSinkActivationId, "ptr", customSinkSettings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagMediaRecording, operation)
    }

    /**
     * 
     * @param {ImageEncodingProperties} type 
     * @returns {IAsyncOperation<LowLagPhotoCapture>} 
     */
    PrepareLowLagPhotoCaptureAsync(type) {
        result := ComCall(10, this, "ptr", type, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagPhotoCapture, operation)
    }

    /**
     * 
     * @param {ImageEncodingProperties} type 
     * @returns {IAsyncOperation<LowLagPhotoSequenceCapture>} 
     */
    PrepareLowLagPhotoSequenceCaptureAsync(type) {
        result := ComCall(11, this, "ptr", type, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LowLagPhotoSequenceCapture, operation)
    }

    /**
     * 
     * @param {Integer} mediaStreamType_ 
     * @param {IMediaEncodingProperties} mediaEncodingProperties 
     * @param {MediaPropertySet} encoderProperties 
     * @returns {IAsyncAction} 
     */
    SetEncodingPropertiesAsync(mediaStreamType_, mediaEncodingProperties, encoderProperties) {
        result := ComCall(12, this, "int", mediaStreamType_, "ptr", mediaEncodingProperties, "ptr", encoderProperties, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
