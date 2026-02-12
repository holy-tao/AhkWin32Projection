#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\SystemMediaTransportControlsDisplayUpdater.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Allows an app to get an instance of the ISystemMediaTransportControls interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/systemmediatransportcontrolsinterop/nn-systemmediatransportcontrolsinterop-isystemmediatransportcontrolsinterop
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class ISystemMediaTransportControls extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMediaTransportControls
     * @type {Guid}
     */
    static IID => Guid("{99fa3ff4-1742-42a6-902e-087d41f965ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlaybackStatus", "put_PlaybackStatus", "get_DisplayUpdater", "get_SoundLevel", "get_IsEnabled", "put_IsEnabled", "get_IsPlayEnabled", "put_IsPlayEnabled", "get_IsStopEnabled", "put_IsStopEnabled", "get_IsPauseEnabled", "put_IsPauseEnabled", "get_IsRecordEnabled", "put_IsRecordEnabled", "get_IsFastForwardEnabled", "put_IsFastForwardEnabled", "get_IsRewindEnabled", "put_IsRewindEnabled", "get_IsPreviousEnabled", "put_IsPreviousEnabled", "get_IsNextEnabled", "put_IsNextEnabled", "get_IsChannelUpEnabled", "put_IsChannelUpEnabled", "get_IsChannelDownEnabled", "put_IsChannelDownEnabled", "add_ButtonPressed", "remove_ButtonPressed", "add_PropertyChanged", "remove_PropertyChanged"]

    /**
     * @type {Integer} 
     */
    PlaybackStatus {
        get => this.get_PlaybackStatus()
        set => this.put_PlaybackStatus(value)
    }

    /**
     * @type {SystemMediaTransportControlsDisplayUpdater} 
     */
    DisplayUpdater {
        get => this.get_DisplayUpdater()
    }

    /**
     * @type {Integer} 
     */
    SoundLevel {
        get => this.get_SoundLevel()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPlayEnabled {
        get => this.get_IsPlayEnabled()
        set => this.put_IsPlayEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStopEnabled {
        get => this.get_IsStopEnabled()
        set => this.put_IsStopEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPauseEnabled {
        get => this.get_IsPauseEnabled()
        set => this.put_IsPauseEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRecordEnabled {
        get => this.get_IsRecordEnabled()
        set => this.put_IsRecordEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFastForwardEnabled {
        get => this.get_IsFastForwardEnabled()
        set => this.put_IsFastForwardEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRewindEnabled {
        get => this.get_IsRewindEnabled()
        set => this.put_IsRewindEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPreviousEnabled {
        get => this.get_IsPreviousEnabled()
        set => this.put_IsPreviousEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsNextEnabled {
        get => this.get_IsNextEnabled()
        set => this.put_IsNextEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsChannelUpEnabled {
        get => this.get_IsChannelUpEnabled()
        set => this.put_IsChannelUpEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsChannelDownEnabled {
        get => this.get_IsChannelDownEnabled()
        set => this.put_IsChannelDownEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_PlaybackStatus(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SystemMediaTransportControlsDisplayUpdater} 
     */
    get_DisplayUpdater() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemMediaTransportControlsDisplayUpdater(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SoundLevel() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
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
    put_IsEnabled(value) {
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
    get_IsPlayEnabled() {
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
    put_IsPlayEnabled(value) {
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
    get_IsStopEnabled() {
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
    put_IsStopEnabled(value) {
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
    get_IsPauseEnabled() {
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
    put_IsPauseEnabled(value) {
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
    get_IsRecordEnabled() {
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
    put_IsRecordEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastForwardEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_IsFastForwardEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRewindEnabled() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_IsRewindEnabled(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPreviousEnabled() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_IsPreviousEnabled(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextEnabled() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_IsNextEnabled(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelUpEnabled() {
        result := ComCall(28, this, "int*", &value := 0, "int")
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
    put_IsChannelUpEnabled(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelDownEnabled() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_IsChannelDownEnabled(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsButtonPressedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonPressed(handler) {
        token := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", token, "int")
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
    remove_ButtonPressed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(33, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsPropertyChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertyChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", token, "int")
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
    remove_PropertyChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
