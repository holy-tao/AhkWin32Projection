#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MediaClip.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\EmbeddedAudioTrack.ahk
#Include ..\MediaProperties\VideoEncodingProperties.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\Effects\IAudioEffectDefinition.ahk
#Include ..\Effects\IVideoEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaClip extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaClip
     * @type {Guid}
     */
    static IID => Guid("{53f25366-5fba-3ea4-8693-24761811140a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrimTimeFromStart", "put_TrimTimeFromStart", "get_TrimTimeFromEnd", "put_TrimTimeFromEnd", "get_OriginalDuration", "get_TrimmedDuration", "get_UserData", "Clone", "get_StartTimeInComposition", "get_EndTimeInComposition", "get_EmbeddedAudioTracks", "get_SelectedEmbeddedAudioTrackIndex", "put_SelectedEmbeddedAudioTrackIndex", "put_Volume", "get_Volume", "GetVideoEncodingProperties", "get_AudioEffectDefinitions", "get_VideoEffectDefinitions"]

    /**
     * @type {TimeSpan} 
     */
    TrimTimeFromStart {
        get => this.get_TrimTimeFromStart()
        set => this.put_TrimTimeFromStart(value)
    }

    /**
     * @type {TimeSpan} 
     */
    TrimTimeFromEnd {
        get => this.get_TrimTimeFromEnd()
        set => this.put_TrimTimeFromEnd(value)
    }

    /**
     * @type {TimeSpan} 
     */
    OriginalDuration {
        get => this.get_OriginalDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    TrimmedDuration {
        get => this.get_TrimmedDuration()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * @type {TimeSpan} 
     */
    StartTimeInComposition {
        get => this.get_StartTimeInComposition()
    }

    /**
     * @type {TimeSpan} 
     */
    EndTimeInComposition {
        get => this.get_EndTimeInComposition()
    }

    /**
     * @type {IVectorView<EmbeddedAudioTrack>} 
     */
    EmbeddedAudioTracks {
        get => this.get_EmbeddedAudioTracks()
    }

    /**
     * @type {Integer} 
     */
    SelectedEmbeddedAudioTrackIndex {
        get => this.get_SelectedEmbeddedAudioTrackIndex()
        set => this.put_SelectedEmbeddedAudioTrackIndex(value)
    }

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {IVector<IAudioEffectDefinition>} 
     */
    AudioEffectDefinitions {
        get => this.get_AudioEffectDefinitions()
    }

    /**
     * @type {IVector<IVideoEffectDefinition>} 
     */
    VideoEffectDefinitions {
        get => this.get_VideoEffectDefinitions()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromStart() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromStart(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromEnd() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromEnd(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OriginalDuration() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimmedDuration() {
        value := TimeSpan()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * Clone Method Example (VC++)
     * @returns {MediaClip} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaClip(result_)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTimeInComposition() {
        value := TimeSpan()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EndTimeInComposition() {
        value := TimeSpan()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<EmbeddedAudioTrack>} 
     */
    get_EmbeddedAudioTracks() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(EmbeddedAudioTrack, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedEmbeddedAudioTrackIndex() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedEmbeddedAudioTrackIndex(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        result := ComCall(19, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    GetVideoEncodingProperties() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEncodingProperties(value)
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_AudioEffectDefinitions() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IAudioEffectDefinition, value)
    }

    /**
     * 
     * @returns {IVector<IVideoEffectDefinition>} 
     */
    get_VideoEffectDefinitions() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IVideoEffectDefinition, value)
    }
}
