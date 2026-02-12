#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MediaCapturePauseResult.ahk
#Include .\MediaCaptureStopResult.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include Frames\MediaFrameSource.ahk
#Include Frames\MediaFrameReader.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCapture5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCapture5
     * @type {Guid}
     */
    static IID => Guid("{da787c22-3a9b-4720-a71e-97900a316e5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveEffectAsync", "PauseRecordWithResultAsync", "StopRecordWithResultAsync", "get_FrameSources", "CreateFrameReaderAsync", "CreateFrameReaderWithSubtypeAsync", "CreateFrameReaderWithSubtypeAndSizeAsync"]

    /**
     * @type {IMapView<HSTRING, MediaFrameSource>} 
     */
    FrameSources {
        get => this.get_FrameSources()
    }

    /**
     * 
     * @param {IMediaExtension} effect_ 
     * @returns {IAsyncAction} 
     */
    RemoveEffectAsync(effect_) {
        result := ComCall(6, this, "ptr", effect_, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncInfo)
    }

    /**
     * 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<MediaCapturePauseResult>} 
     */
    PauseRecordWithResultAsync(behavior) {
        result := ComCall(7, this, "int", behavior, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaCapturePauseResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<MediaCaptureStopResult>} 
     */
    StopRecordWithResultAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaCaptureStopResult, operation)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, MediaFrameSource>} 
     */
    get_FrameSources() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), MediaFrameSource, value)
    }

    /**
     * 
     * @param {MediaFrameSource} inputSource 
     * @returns {IAsyncOperation<MediaFrameReader>} 
     */
    CreateFrameReaderAsync(inputSource) {
        result := ComCall(10, this, "ptr", inputSource, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameReader, value)
    }

    /**
     * 
     * @param {MediaFrameSource} inputSource 
     * @param {HSTRING} outputSubtype 
     * @returns {IAsyncOperation<MediaFrameReader>} 
     */
    CreateFrameReaderWithSubtypeAsync(inputSource, outputSubtype) {
        if(outputSubtype is String) {
            pin := HSTRING.Create(outputSubtype)
            outputSubtype := pin.Value
        }
        outputSubtype := outputSubtype is Win32Handle ? NumGet(outputSubtype, "ptr") : outputSubtype

        result := ComCall(11, this, "ptr", inputSource, "ptr", outputSubtype, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameReader, value)
    }

    /**
     * 
     * @param {MediaFrameSource} inputSource 
     * @param {HSTRING} outputSubtype 
     * @param {BitmapSize} outputSize 
     * @returns {IAsyncOperation<MediaFrameReader>} 
     */
    CreateFrameReaderWithSubtypeAndSizeAsync(inputSource, outputSubtype, outputSize) {
        if(outputSubtype is String) {
            pin := HSTRING.Create(outputSubtype)
            outputSubtype := pin.Value
        }
        outputSubtype := outputSubtype is Win32Handle ? NumGet(outputSubtype, "ptr") : outputSubtype

        result := ComCall(12, this, "ptr", inputSource, "ptr", outputSubtype, "ptr", outputSize, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameReader, value)
    }
}
