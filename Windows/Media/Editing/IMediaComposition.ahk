#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\MediaClip.ahk
#Include .\BackgroundAudioTrack.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MediaComposition.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Graphics\Imaging\ImageStream.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\MediaProperties\MediaEncodingProfile.ahk
#Include ..\Core\MediaStreamSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaComposition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaComposition
     * @type {Guid}
     */
    static IID => Guid("{2e06e605-dc71-41d6-b837-2d2bc14a2947}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Duration", "get_Clips", "get_BackgroundAudioTracks", "get_UserData", "Clone", "SaveAsync", "GetThumbnailAsync", "GetThumbnailsAsync", "RenderToFileAsync", "RenderToFileWithTrimmingPreferenceAsync", "RenderToFileWithProfileAsync", "CreateDefaultEncodingProfile", "GenerateMediaStreamSource", "GenerateMediaStreamSourceWithProfile", "GeneratePreviewMediaStreamSource"]

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {IVector<MediaClip>} 
     */
    Clips {
        get => this.get_Clips()
    }

    /**
     * @type {IVector<BackgroundAudioTrack>} 
     */
    BackgroundAudioTracks {
        get => this.get_BackgroundAudioTracks()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<MediaClip>} 
     */
    get_Clips() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MediaClip, value)
    }

    /**
     * 
     * @returns {IVector<BackgroundAudioTrack>} 
     */
    get_BackgroundAudioTracks() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(BackgroundAudioTrack, value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * Clone Method Example (VC++)
     * @returns {MediaComposition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaComposition(result_)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncAction} 
     */
    SaveAsync(file_) {
        result := ComCall(11, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TimeSpan} timeFromStart 
     * @param {Integer} scaledWidth 
     * @param {Integer} scaledHeight 
     * @param {Integer} framePrecision 
     * @returns {IAsyncOperation<ImageStream>} 
     */
    GetThumbnailAsync(timeFromStart, scaledWidth, scaledHeight, framePrecision) {
        result := ComCall(12, this, "ptr", timeFromStart, "int", scaledWidth, "int", scaledHeight, "int", framePrecision, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ImageStream, operation)
    }

    /**
     * 
     * @param {IIterable<TimeSpan>} timesFromStart 
     * @param {Integer} scaledWidth 
     * @param {Integer} scaledHeight 
     * @param {Integer} framePrecision 
     * @returns {IAsyncOperation<IVectorView<ImageStream>>} 
     */
    GetThumbnailsAsync(timesFromStart, scaledWidth, scaledHeight, framePrecision) {
        result := ComCall(13, this, "ptr", timesFromStart, "int", scaledWidth, "int", scaledHeight, "int", framePrecision, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ImageStream), operation)
    }

    /**
     * 
     * @param {IStorageFile} destination 
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     */
    RenderToFileAsync(destination) {
        result := ComCall(14, this, "ptr", destination, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetInt32(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @param {IStorageFile} destination 
     * @param {Integer} trimmingPreference 
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     */
    RenderToFileWithTrimmingPreferenceAsync(destination, trimmingPreference) {
        result := ComCall(15, this, "ptr", destination, "int", trimmingPreference, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetInt32(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @param {IStorageFile} destination 
     * @param {Integer} trimmingPreference 
     * @param {MediaEncodingProfile} encodingProfile 
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     */
    RenderToFileWithProfileAsync(destination, trimmingPreference, encodingProfile) {
        result := ComCall(16, this, "ptr", destination, "int", trimmingPreference, "ptr", encodingProfile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetInt32(), (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }

    /**
     * 
     * @returns {MediaEncodingProfile} 
     */
    CreateDefaultEncodingProfile() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(value)
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    GenerateMediaStreamSource() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(value)
    }

    /**
     * 
     * @param {MediaEncodingProfile} encodingProfile 
     * @returns {MediaStreamSource} 
     */
    GenerateMediaStreamSourceWithProfile(encodingProfile) {
        result := ComCall(19, this, "ptr", encodingProfile, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(value)
    }

    /**
     * 
     * @param {Integer} scaledWidth 
     * @param {Integer} scaledHeight 
     * @returns {MediaStreamSource} 
     */
    GeneratePreviewMediaStreamSource(scaledWidth, scaledHeight) {
        result := ComCall(20, this, "int", scaledWidth, "int", scaledHeight, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSource(value)
    }
}
