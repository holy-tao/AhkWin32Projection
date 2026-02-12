#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\Playback\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AudioTrackSupportInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IAudioTrack extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioTrack
     * @type {Guid}
     */
    static IID => Guid("{f23b6e77-3ef7-40de-b943-068b1321701d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_OpenFailed", "remove_OpenFailed", "GetEncodingProperties", "get_PlaybackItem", "get_Name", "get_SupportInfo"]

    /**
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {AudioTrackSupportInfo} 
     */
    SupportInfo {
        get => this.get_SupportInfo()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioTrack, AudioTrackOpenFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenFailed(handler) {
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
    remove_OpenFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    GetEncodingProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AudioTrackSupportInfo} 
     */
    get_SupportInfo() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioTrackSupportInfo(value)
    }
}
