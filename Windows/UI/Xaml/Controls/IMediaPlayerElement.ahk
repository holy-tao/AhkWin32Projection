#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Media\Playback\IMediaPlaybackSource.ahk
#Include .\MediaTransportControls.ahk
#Include ..\Media\ImageSource.ahk
#Include ..\..\..\Media\Playback\MediaPlayer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerElement
     * @type {Guid}
     */
    static IID => Guid("{3b4ca526-2e25-4598-bc71-d491f8e8de39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_TransportControls", "put_TransportControls", "get_AreTransportControlsEnabled", "put_AreTransportControlsEnabled", "get_PosterSource", "put_PosterSource", "get_Stretch", "put_Stretch", "get_AutoPlay", "put_AutoPlay", "get_IsFullWindow", "put_IsFullWindow", "get_MediaPlayer", "SetMediaPlayer"]

    /**
     * @type {IMediaPlaybackSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {MediaTransportControls} 
     */
    TransportControls {
        get => this.get_TransportControls()
        set => this.put_TransportControls(value)
    }

    /**
     * @type {Boolean} 
     */
    AreTransportControlsEnabled {
        get => this.get_AreTransportControlsEnabled()
        set => this.put_AreTransportControlsEnabled(value)
    }

    /**
     * @type {ImageSource} 
     */
    PosterSource {
        get => this.get_PosterSource()
        set => this.put_PosterSource(value)
    }

    /**
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFullWindow {
        get => this.get_IsFullWindow()
        set => this.put_IsFullWindow(value)
    }

    /**
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
    }

    /**
     * 
     * @returns {IMediaPlaybackSource} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaPlaybackSource(value)
    }

    /**
     * 
     * @param {IMediaPlaybackSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaTransportControls} 
     */
    get_TransportControls() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaTransportControls(value)
    }

    /**
     * 
     * @param {MediaTransportControls} value 
     * @returns {HRESULT} 
     */
    put_TransportControls(value) {
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
    get_AreTransportControlsEnabled() {
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
    put_AreTransportControlsEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PosterSource() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_Stretch(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindow() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsFullWindow(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlayer(value)
    }

    /**
     * 
     * @param {MediaPlayer} mediaPlayer_ 
     * @returns {HRESULT} 
     */
    SetMediaPlayer(mediaPlayer_) {
        result := ComCall(21, this, "ptr", mediaPlayer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
