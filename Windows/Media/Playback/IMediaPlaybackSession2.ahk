#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaPlaybackSphericalVideoProjection.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackSession2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackSession2
     * @type {Guid}
     */
    static IID => Guid("{f8ba7c79-1fc8-4097-ad70-c0fa18cc0050}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_BufferedRangesChanged", "remove_BufferedRangesChanged", "add_PlayedRangesChanged", "remove_PlayedRangesChanged", "add_SeekableRangesChanged", "remove_SeekableRangesChanged", "add_SupportedPlaybackRatesChanged", "remove_SupportedPlaybackRatesChanged", "get_SphericalVideoProjection", "get_IsMirroring", "put_IsMirroring", "GetBufferedRanges", "GetPlayedRanges", "GetSeekableRanges", "IsSupportedPlaybackRateRange"]

    /**
     * @type {MediaPlaybackSphericalVideoProjection} 
     */
    SphericalVideoProjection {
        get => this.get_SphericalVideoProjection()
    }

    /**
     * @type {Boolean} 
     */
    IsMirroring {
        get => this.get_IsMirroring()
        set => this.put_IsMirroring(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferedRangesChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_BufferedRangesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlayedRangesChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", value, "ptr", token, "int")
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
    remove_PlayedRangesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekableRangesChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", value, "ptr", token, "int")
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
    remove_SeekableRangesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SupportedPlaybackRatesChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
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
    remove_SupportedPlaybackRatesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaPlaybackSphericalVideoProjection} 
     */
    get_SphericalVideoProjection() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlaybackSphericalVideoProjection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMirroring() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_IsMirroring(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<MediaTimeRange>} 
     */
    GetBufferedRanges() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetMediaTimeRange(), value)
    }

    /**
     * 
     * @returns {IVectorView<MediaTimeRange>} 
     */
    GetPlayedRanges() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetMediaTimeRange(), value)
    }

    /**
     * 
     * @returns {IVectorView<MediaTimeRange>} 
     */
    GetSeekableRanges() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetMediaTimeRange(), value)
    }

    /**
     * 
     * @param {Float} rate1 
     * @param {Float} rate2 
     * @returns {Boolean} 
     */
    IsSupportedPlaybackRateRange(rate1, rate2) {
        result := ComCall(20, this, "double", rate1, "double", rate2, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
