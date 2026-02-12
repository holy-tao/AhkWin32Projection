#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MediaBreak.ahk
#Include .\MediaPlaybackItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaBreakSchedule extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBreakSchedule
     * @type {Guid}
     */
    static IID => Guid("{a19a5813-98b6-41d8-83da-f971d22b7bba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ScheduleChanged", "remove_ScheduleChanged", "InsertMidrollBreak", "RemoveMidrollBreak", "get_MidrollBreaks", "put_PrerollBreak", "get_PrerollBreak", "put_PostrollBreak", "get_PostrollBreak", "get_PlaybackItem"]

    /**
     * @type {IVectorView<MediaBreak>} 
     */
    MidrollBreaks {
        get => this.get_MidrollBreaks()
    }

    /**
     * @type {MediaBreak} 
     */
    PrerollBreak {
        get => this.get_PrerollBreak()
        set => this.put_PrerollBreak(value)
    }

    /**
     * @type {MediaBreak} 
     */
    PostrollBreak {
        get => this.get_PostrollBreak()
        set => this.put_PostrollBreak(value)
    }

    /**
     * @type {MediaPlaybackItem} 
     */
    PlaybackItem {
        get => this.get_PlaybackItem()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakSchedule, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScheduleChanged(handler) {
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
    remove_ScheduleChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MediaBreak} mediaBreak_ 
     * @returns {HRESULT} 
     */
    InsertMidrollBreak(mediaBreak_) {
        result := ComCall(8, this, "ptr", mediaBreak_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {MediaBreak} mediaBreak_ 
     * @returns {HRESULT} 
     */
    RemoveMidrollBreak(mediaBreak_) {
        result := ComCall(9, this, "ptr", mediaBreak_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<MediaBreak>} 
     */
    get_MidrollBreaks() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaBreak, value)
    }

    /**
     * 
     * @param {MediaBreak} value 
     * @returns {HRESULT} 
     */
    put_PrerollBreak(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_PrerollBreak() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(value)
    }

    /**
     * 
     * @param {MediaBreak} value 
     * @returns {HRESULT} 
     */
    put_PostrollBreak(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_PostrollBreak() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(value)
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_PlaybackItem() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackItem(value)
    }
}
