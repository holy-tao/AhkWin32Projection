#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\IMediaCue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the interface implemented by a custom stream that provides metadata tracks.
 * @remarks
 * Streams implement this interface to provide metadata tracks when passed into [MediaSource.CreateFromStream](mediasource_createfromstream_983868770.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.itimedmetadatatrackprovider
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataTrack extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataTrack
     * @type {Guid}
     */
    static IID => Guid("{9e6aed9e-f67a-49a9-b330-cf03b0e9cf07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_CueEntered", "remove_CueEntered", "add_CueExited", "remove_CueExited", "add_TrackFailed", "remove_TrackFailed", "get_Cues", "get_ActiveCues", "get_TimedMetadataKind", "get_DispatchType", "AddCue", "RemoveCue"]

    /**
     * @type {IVectorView<IMediaCue>} 
     */
    Cues {
        get => this.get_Cues()
    }

    /**
     * @type {IVectorView<IMediaCue>} 
     */
    ActiveCues {
        get => this.get_ActiveCues()
    }

    /**
     * @type {Integer} 
     */
    TimedMetadataKind {
        get => this.get_TimedMetadataKind()
    }

    /**
     * @type {HSTRING} 
     */
    DispatchType {
        get => this.get_DispatchType()
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CueEntered(handler) {
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
    remove_CueEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, MediaCueEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CueExited(handler) {
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
    remove_CueExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TimedMetadataTrack, TimedMetadataTrackFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TrackFailed(handler) {
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
    remove_TrackFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<IMediaCue>} 
     */
    get_Cues() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IMediaCue, value)
    }

    /**
     * 
     * @returns {IVectorView<IMediaCue>} 
     */
    get_ActiveCues() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IMediaCue, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimedMetadataKind() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DispatchType() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IMediaCue} cue 
     * @returns {HRESULT} 
     */
    AddCue(cue) {
        result := ComCall(16, this, "ptr", cue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaCue} cue 
     * @returns {HRESULT} 
     */
    RemoveCue(cue) {
        result := ComCall(17, this, "ptr", cue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
