#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaElementStatics
     * @type {Guid}
     */
    static IID => Guid("{dccd2cb9-7568-4682-a72a-8ddf2a2665ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PosterSourceProperty", "get_SourceProperty", "get_IsMutedProperty", "get_IsAudioOnlyProperty", "get_AutoPlayProperty", "get_VolumeProperty", "get_BalanceProperty", "get_NaturalVideoHeightProperty", "get_NaturalVideoWidthProperty", "get_NaturalDurationProperty", "get_PositionProperty", "get_DownloadProgressProperty", "get_BufferingProgressProperty", "get_DownloadProgressOffsetProperty", "get_CurrentStateProperty", "get_CanSeekProperty", "get_CanPauseProperty", "get_AudioStreamCountProperty", "get_AudioStreamIndexProperty", "get_PlaybackRateProperty", "get_IsLoopingProperty", "get_PlayToSourceProperty", "get_DefaultPlaybackRateProperty", "get_AspectRatioWidthProperty", "get_AspectRatioHeightProperty", "get_RealTimePlaybackProperty", "get_AudioCategoryProperty", "get_AudioDeviceTypeProperty", "get_ProtectionManagerProperty", "get_Stereo3DVideoPackingModeProperty", "get_Stereo3DVideoRenderModeProperty", "get_IsStereo3DVideoProperty", "get_ActualStereo3DVideoPackingModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PosterSourceProperty {
        get => this.get_PosterSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SourceProperty {
        get => this.get_SourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsMutedProperty {
        get => this.get_IsMutedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAudioOnlyProperty {
        get => this.get_IsAudioOnlyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AutoPlayProperty {
        get => this.get_AutoPlayProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VolumeProperty {
        get => this.get_VolumeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BalanceProperty {
        get => this.get_BalanceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NaturalVideoHeightProperty {
        get => this.get_NaturalVideoHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NaturalVideoWidthProperty {
        get => this.get_NaturalVideoWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NaturalDurationProperty {
        get => this.get_NaturalDurationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PositionProperty {
        get => this.get_PositionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DownloadProgressProperty {
        get => this.get_DownloadProgressProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BufferingProgressProperty {
        get => this.get_BufferingProgressProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DownloadProgressOffsetProperty {
        get => this.get_DownloadProgressOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CurrentStateProperty {
        get => this.get_CurrentStateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanSeekProperty {
        get => this.get_CanSeekProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanPauseProperty {
        get => this.get_CanPauseProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AudioStreamCountProperty {
        get => this.get_AudioStreamCountProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AudioStreamIndexProperty {
        get => this.get_AudioStreamIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaybackRateProperty {
        get => this.get_PlaybackRateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsLoopingProperty {
        get => this.get_IsLoopingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlayToSourceProperty {
        get => this.get_PlayToSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DefaultPlaybackRateProperty {
        get => this.get_DefaultPlaybackRateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AspectRatioWidthProperty {
        get => this.get_AspectRatioWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AspectRatioHeightProperty {
        get => this.get_AspectRatioHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RealTimePlaybackProperty {
        get => this.get_RealTimePlaybackProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AudioCategoryProperty {
        get => this.get_AudioCategoryProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AudioDeviceTypeProperty {
        get => this.get_AudioDeviceTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ProtectionManagerProperty {
        get => this.get_ProtectionManagerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    Stereo3DVideoPackingModeProperty {
        get => this.get_Stereo3DVideoPackingModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    Stereo3DVideoRenderModeProperty {
        get => this.get_Stereo3DVideoRenderModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStereo3DVideoProperty {
        get => this.get_IsStereo3DVideoProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ActualStereo3DVideoPackingModeProperty {
        get => this.get_ActualStereo3DVideoPackingModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PosterSourceProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourceProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsMutedProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsAudioOnlyProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AutoPlayProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VolumeProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BalanceProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NaturalVideoHeightProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NaturalVideoWidthProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NaturalDurationProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PositionProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DownloadProgressProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BufferingProgressProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DownloadProgressOffsetProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CurrentStateProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanSeekProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanPauseProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AudioStreamCountProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AudioStreamIndexProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlaybackRateProperty() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsLoopingProperty() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlayToSourceProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DefaultPlaybackRateProperty() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AspectRatioWidthProperty() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AspectRatioHeightProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RealTimePlaybackProperty() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AudioCategoryProperty() {
        result := ComCall(32, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AudioDeviceTypeProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ProtectionManagerProperty() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Stereo3DVideoPackingModeProperty() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Stereo3DVideoRenderModeProperty() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsStereo3DVideoProperty() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ActualStereo3DVideoPackingModeProperty() {
        result := ComCall(38, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
