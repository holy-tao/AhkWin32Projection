#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\Core\MediaSource.ahk
#Include .\MediaPlaybackAudioTrackList.ahk
#Include .\MediaPlaybackVideoTrackList.ahk
#Include .\MediaPlaybackTimedMetadataTrackList.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackItem
     * @type {Guid}
     */
    static IID => Guid("{047097d2-e4af-48ab-b283-6929e674ece2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AudioTracksChanged", "remove_AudioTracksChanged", "add_VideoTracksChanged", "remove_VideoTracksChanged", "add_TimedMetadataTracksChanged", "remove_TimedMetadataTracksChanged", "get_Source", "get_AudioTracks", "get_VideoTracks", "get_TimedMetadataTracks"]

    /**
     * @type {MediaSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {MediaPlaybackAudioTrackList} 
     */
    AudioTracks {
        get => this.get_AudioTracks()
    }

    /**
     * @type {MediaPlaybackVideoTrackList} 
     */
    VideoTracks {
        get => this.get_VideoTracks()
    }

    /**
     * @type {MediaPlaybackTimedMetadataTrackList} 
     */
    TimedMetadataTracks {
        get => this.get_TimedMetadataTracks()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioTracksChanged(handler) {
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
    remove_AudioTracksChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoTracksChanged(handler) {
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
    remove_VideoTracksChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackItem, IVectorChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimedMetadataTracksChanged(handler) {
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
    remove_TimedMetadataTracksChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaSource} 
     */
    get_Source() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaSource(value)
    }

    /**
     * 
     * @returns {MediaPlaybackAudioTrackList} 
     */
    get_AudioTracks() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackAudioTrackList(value)
    }

    /**
     * 
     * @returns {MediaPlaybackVideoTrackList} 
     */
    get_VideoTracks() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackVideoTrackList(value)
    }

    /**
     * 
     * @returns {MediaPlaybackTimedMetadataTrackList} 
     */
    get_TimedMetadataTracks() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackTimedMetadataTrackList(value)
    }
}
