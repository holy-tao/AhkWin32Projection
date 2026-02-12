#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControls2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControls2
     * @type {Guid}
     */
    static IID => Guid("{2b89efec-1bea-451e-8bcd-cfe2d9423262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSkipForwardButtonVisible", "put_IsSkipForwardButtonVisible", "get_IsSkipForwardEnabled", "put_IsSkipForwardEnabled", "get_IsSkipBackwardButtonVisible", "put_IsSkipBackwardButtonVisible", "get_IsSkipBackwardEnabled", "put_IsSkipBackwardEnabled", "get_IsNextTrackButtonVisible", "put_IsNextTrackButtonVisible", "get_IsPreviousTrackButtonVisible", "put_IsPreviousTrackButtonVisible", "get_FastPlayFallbackBehaviour", "put_FastPlayFallbackBehaviour", "add_ThumbnailRequested", "remove_ThumbnailRequested"]

    /**
     * @type {Boolean} 
     */
    IsSkipForwardButtonVisible {
        get => this.get_IsSkipForwardButtonVisible()
        set => this.put_IsSkipForwardButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSkipForwardEnabled {
        get => this.get_IsSkipForwardEnabled()
        set => this.put_IsSkipForwardEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSkipBackwardButtonVisible {
        get => this.get_IsSkipBackwardButtonVisible()
        set => this.put_IsSkipBackwardButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSkipBackwardEnabled {
        get => this.get_IsSkipBackwardEnabled()
        set => this.put_IsSkipBackwardEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsNextTrackButtonVisible {
        get => this.get_IsNextTrackButtonVisible()
        set => this.put_IsNextTrackButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPreviousTrackButtonVisible {
        get => this.get_IsPreviousTrackButtonVisible()
        set => this.put_IsPreviousTrackButtonVisible(value)
    }

    /**
     * @type {Integer} 
     */
    FastPlayFallbackBehaviour {
        get => this.get_FastPlayFallbackBehaviour()
        set => this.put_FastPlayFallbackBehaviour(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipForwardButtonVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsSkipForwardButtonVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipForwardEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsSkipForwardEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipBackwardButtonVisible() {
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
    put_IsSkipBackwardButtonVisible(value) {
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
    get_IsSkipBackwardEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsSkipBackwardEnabled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextTrackButtonVisible() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_IsNextTrackButtonVisible(value) {
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
    get_IsPreviousTrackButtonVisible() {
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
    put_IsPreviousTrackButtonVisible(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FastPlayFallbackBehaviour() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_FastPlayFallbackBehaviour(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTransportControls, MediaTransportControlsThumbnailRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ThumbnailRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_ThumbnailRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
