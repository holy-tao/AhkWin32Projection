#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\ImageSource.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\Duration.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\Media\TimelineMarkerCollection.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Media\PlayTo\PlayToSource.ahk
#Include ..\..\..\Media\Protection\MediaProtectionManager.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaElement
     * @type {Guid}
     */
    static IID => Guid("{a38ed2cf-13de-4299-ade2-ae18f74ed353}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PosterSource", "put_PosterSource", "get_Source", "put_Source", "get_IsMuted", "put_IsMuted", "get_IsAudioOnly", "get_AutoPlay", "put_AutoPlay", "get_Volume", "put_Volume", "get_Balance", "put_Balance", "get_NaturalVideoHeight", "get_NaturalVideoWidth", "get_NaturalDuration", "get_Position", "put_Position", "get_DownloadProgress", "get_BufferingProgress", "get_DownloadProgressOffset", "get_CurrentState", "get_Markers", "get_CanSeek", "get_CanPause", "get_AudioStreamCount", "get_AudioStreamIndex", "put_AudioStreamIndex", "get_PlaybackRate", "put_PlaybackRate", "get_IsLooping", "put_IsLooping", "get_PlayToSource", "get_DefaultPlaybackRate", "put_DefaultPlaybackRate", "get_AspectRatioWidth", "get_AspectRatioHeight", "get_RealTimePlayback", "put_RealTimePlayback", "get_AudioCategory", "put_AudioCategory", "get_AudioDeviceType", "put_AudioDeviceType", "get_ProtectionManager", "put_ProtectionManager", "get_Stereo3DVideoPackingMode", "put_Stereo3DVideoPackingMode", "get_Stereo3DVideoRenderMode", "put_Stereo3DVideoRenderMode", "get_IsStereo3DVideo", "add_MediaOpened", "remove_MediaOpened", "add_MediaEnded", "remove_MediaEnded", "add_MediaFailed", "remove_MediaFailed", "add_DownloadProgressChanged", "remove_DownloadProgressChanged", "add_BufferingProgressChanged", "remove_BufferingProgressChanged", "add_CurrentStateChanged", "remove_CurrentStateChanged", "add_MarkerReached", "remove_MarkerReached", "add_RateChanged", "remove_RateChanged", "add_VolumeChanged", "remove_VolumeChanged", "add_SeekCompleted", "remove_SeekCompleted", "Stop", "Play", "Pause", "CanPlayType", "SetSource", "GetAudioStreamLanguage", "AddAudioEffect", "AddVideoEffect", "RemoveAllEffects", "get_ActualStereo3DVideoPackingMode"]

    /**
     * @type {ImageSource} 
     */
    PosterSource {
        get => this.get_PosterSource()
        set => this.put_PosterSource(value)
    }

    /**
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
        set => this.put_IsMuted(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAudioOnly {
        get => this.get_IsAudioOnly()
    }

    /**
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {Float} 
     */
    Balance {
        get => this.get_Balance()
        set => this.put_Balance(value)
    }

    /**
     * @type {Integer} 
     */
    NaturalVideoHeight {
        get => this.get_NaturalVideoHeight()
    }

    /**
     * @type {Integer} 
     */
    NaturalVideoWidth {
        get => this.get_NaturalVideoWidth()
    }

    /**
     * @type {Duration} 
     */
    NaturalDuration {
        get => this.get_NaturalDuration()
    }

    /**
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * @type {Float} 
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * @type {Float} 
     */
    DownloadProgressOffset {
        get => this.get_DownloadProgressOffset()
    }

    /**
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * @type {TimelineMarkerCollection} 
     */
    Markers {
        get => this.get_Markers()
    }

    /**
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * @type {Boolean} 
     */
    CanPause {
        get => this.get_CanPause()
    }

    /**
     * @type {Integer} 
     */
    AudioStreamCount {
        get => this.get_AudioStreamCount()
    }

    /**
     * @type {IReference<Integer>} 
     */
    AudioStreamIndex {
        get => this.get_AudioStreamIndex()
        set => this.put_AudioStreamIndex(value)
    }

    /**
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * @type {Boolean} 
     */
    IsLooping {
        get => this.get_IsLooping()
        set => this.put_IsLooping(value)
    }

    /**
     * @type {PlayToSource} 
     */
    PlayToSource {
        get => this.get_PlayToSource()
    }

    /**
     * @type {Float} 
     */
    DefaultPlaybackRate {
        get => this.get_DefaultPlaybackRate()
        set => this.put_DefaultPlaybackRate(value)
    }

    /**
     * @type {Integer} 
     */
    AspectRatioWidth {
        get => this.get_AspectRatioWidth()
    }

    /**
     * @type {Integer} 
     */
    AspectRatioHeight {
        get => this.get_AspectRatioHeight()
    }

    /**
     * @type {Boolean} 
     */
    RealTimePlayback {
        get => this.get_RealTimePlayback()
        set => this.put_RealTimePlayback(value)
    }

    /**
     * @type {Integer} 
     */
    AudioCategory {
        get => this.get_AudioCategory()
        set => this.put_AudioCategory(value)
    }

    /**
     * @type {Integer} 
     */
    AudioDeviceType {
        get => this.get_AudioDeviceType()
        set => this.put_AudioDeviceType(value)
    }

    /**
     * @type {MediaProtectionManager} 
     */
    ProtectionManager {
        get => this.get_ProtectionManager()
        set => this.put_ProtectionManager(value)
    }

    /**
     * @type {Integer} 
     */
    Stereo3DVideoPackingMode {
        get => this.get_Stereo3DVideoPackingMode()
        set => this.put_Stereo3DVideoPackingMode(value)
    }

    /**
     * @type {Integer} 
     */
    Stereo3DVideoRenderMode {
        get => this.get_Stereo3DVideoRenderMode()
        set => this.put_Stereo3DVideoRenderMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStereo3DVideo {
        get => this.get_IsStereo3DVideo()
    }

    /**
     * @type {Integer} 
     */
    ActualStereo3DVideoPackingMode {
        get => this.get_ActualStereo3DVideoPackingMode()
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PosterSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PosterSource(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMuted(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioOnly() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        result := ComCall(14, this, "int", value, "int")
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
        result := ComCall(15, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        result := ComCall(16, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Balance() {
        result := ComCall(17, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Balance(value) {
        result := ComCall(18, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoHeight() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoWidth() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_NaturalDuration() {
        value := Duration()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        value := TimeSpan()
        result := ComCall(22, this, "ptr", value, "int")
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
    put_Position(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        result := ComCall(24, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BufferingProgress() {
        result := ComCall(25, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgressOffset() {
        result := ComCall(26, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentState() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimelineMarkerCollection} 
     */
    get_Markers() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimelineMarkerCollection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        result := ComCall(29, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPause() {
        result := ComCall(30, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioStreamCount() {
        result := ComCall(31, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AudioStreamIndex() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_AudioStreamIndex(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        result := ComCall(34, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        result := ComCall(35, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLooping() {
        result := ComCall(36, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLooping(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_PlayToSource() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToSource(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DefaultPlaybackRate() {
        result := ComCall(39, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DefaultPlaybackRate(value) {
        result := ComCall(40, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AspectRatioWidth() {
        result := ComCall(41, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AspectRatioHeight() {
        result := ComCall(42, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RealTimePlayback() {
        result := ComCall(43, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RealTimePlayback(value) {
        result := ComCall(44, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioCategory() {
        result := ComCall(45, this, "int*", &value := 0, "int")
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
    put_AudioCategory(value) {
        result := ComCall(46, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioDeviceType() {
        result := ComCall(47, this, "int*", &value := 0, "int")
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
    put_AudioDeviceType(value) {
        result := ComCall(48, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaProtectionManager} 
     */
    get_ProtectionManager() {
        result := ComCall(49, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionManager(value)
    }

    /**
     * 
     * @param {MediaProtectionManager} value 
     * @returns {HRESULT} 
     */
    put_ProtectionManager(value) {
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stereo3DVideoPackingMode() {
        result := ComCall(51, this, "int*", &value := 0, "int")
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
    put_Stereo3DVideoPackingMode(value) {
        result := ComCall(52, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stereo3DVideoRenderMode() {
        result := ComCall(53, this, "int*", &value := 0, "int")
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
    put_Stereo3DVideoRenderMode(value) {
        result := ComCall(54, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo3DVideo() {
        result := ComCall(55, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaOpened(handler) {
        token := EventRegistrationToken()
        result := ComCall(56, this, "ptr", handler, "ptr", token, "int")
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
    remove_MediaOpened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(57, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaEnded(handler) {
        token := EventRegistrationToken()
        result := ComCall(58, this, "ptr", handler, "ptr", token, "int")
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
    remove_MediaEnded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(59, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(60, this, "ptr", handler, "ptr", token, "int")
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
    remove_MediaFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(61, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadProgressChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(62, this, "ptr", handler, "ptr", token, "int")
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
    remove_DownloadProgressChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(63, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingProgressChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(64, this, "ptr", handler, "ptr", token, "int")
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
    remove_BufferingProgressChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(65, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(66, this, "ptr", handler, "ptr", token, "int")
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
    remove_CurrentStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(67, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimelineMarkerRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MarkerReached(handler) {
        token := EventRegistrationToken()
        result := ComCall(68, this, "ptr", handler, "ptr", token, "int")
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
    remove_MarkerReached(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(69, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RateChangedRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(70, this, "ptr", handler, "ptr", token, "int")
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
    remove_RateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(71, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VolumeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(72, this, "ptr", handler, "ptr", token, "int")
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
    remove_VolumeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(73, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(74, this, "ptr", handler, "ptr", token, "int")
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
    remove_SeekCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(75, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(76, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Play method plays the current DVD title.
     * @remarks
     * If playback is paused or stopped and [**EnableResetOnStop**](enableresetonstop-property.md) is true, then calling **Play** will resume playback at normal speed at the current location. If playback is stopped and **EnableResetOnStop** is false, then calling **Play** will cause the disc to start playing at the beginning of the first title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/play-method
     */
    Play() {
        result := ComCall(77, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(78, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} type 
     * @returns {Integer} 
     */
    CanPlayType(type) {
        if(type is String) {
            pin := HSTRING.Create(type)
            type := pin.Value
        }
        type := type is Win32Handle ? NumGet(type, "ptr") : type

        result := ComCall(79, this, "ptr", type, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {HSTRING} mimeType 
     * @returns {HRESULT} 
     */
    SetSource(stream, mimeType) {
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(80, this, "ptr", stream, "ptr", mimeType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IReference<Integer>} index 
     * @returns {HSTRING} 
     */
    GetAudioStreamLanguage(index) {
        result_ := HSTRING()
        result := ComCall(81, this, "ptr", index, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} effectID 
     * @param {Boolean} effectOptional 
     * @param {IPropertySet} effectConfiguration 
     * @returns {HRESULT} 
     */
    AddAudioEffect(effectID, effectOptional, effectConfiguration) {
        if(effectID is String) {
            pin := HSTRING.Create(effectID)
            effectID := pin.Value
        }
        effectID := effectID is Win32Handle ? NumGet(effectID, "ptr") : effectID

        result := ComCall(82, this, "ptr", effectID, "int", effectOptional, "ptr", effectConfiguration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} effectID 
     * @param {Boolean} effectOptional 
     * @param {IPropertySet} effectConfiguration 
     * @returns {HRESULT} 
     */
    AddVideoEffect(effectID, effectOptional, effectConfiguration) {
        if(effectID is String) {
            pin := HSTRING.Create(effectID)
            effectID := pin.Value
        }
        effectID := effectID is Win32Handle ? NumGet(effectID, "ptr") : effectID

        result := ComCall(83, this, "ptr", effectID, "int", effectOptional, "ptr", effectConfiguration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllEffects() {
        result := ComCall(84, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualStereo3DVideoPackingMode() {
        result := ComCall(85, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
