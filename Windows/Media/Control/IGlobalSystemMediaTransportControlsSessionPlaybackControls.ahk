#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class IGlobalSystemMediaTransportControlsSessionPlaybackControls extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalSystemMediaTransportControlsSessionPlaybackControls
     * @type {Guid}
     */
    static IID => Guid("{6501a3e6-bc7a-503a-bb1b-68f158f3fb03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPlayEnabled", "get_IsPauseEnabled", "get_IsStopEnabled", "get_IsRecordEnabled", "get_IsFastForwardEnabled", "get_IsRewindEnabled", "get_IsNextEnabled", "get_IsPreviousEnabled", "get_IsChannelUpEnabled", "get_IsChannelDownEnabled", "get_IsPlayPauseToggleEnabled", "get_IsShuffleEnabled", "get_IsRepeatEnabled", "get_IsPlaybackRateEnabled", "get_IsPlaybackPositionEnabled"]

    /**
     * @type {Boolean} 
     */
    IsPlayEnabled {
        get => this.get_IsPlayEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsPauseEnabled {
        get => this.get_IsPauseEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsStopEnabled {
        get => this.get_IsStopEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsRecordEnabled {
        get => this.get_IsRecordEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsFastForwardEnabled {
        get => this.get_IsFastForwardEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsRewindEnabled {
        get => this.get_IsRewindEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsNextEnabled {
        get => this.get_IsNextEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsPreviousEnabled {
        get => this.get_IsPreviousEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsChannelUpEnabled {
        get => this.get_IsChannelUpEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsChannelDownEnabled {
        get => this.get_IsChannelDownEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsPlayPauseToggleEnabled {
        get => this.get_IsPlayPauseToggleEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsShuffleEnabled {
        get => this.get_IsShuffleEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsRepeatEnabled {
        get => this.get_IsRepeatEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsPlaybackRateEnabled {
        get => this.get_IsPlaybackRateEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsPlaybackPositionEnabled {
        get => this.get_IsPlaybackPositionEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPauseEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStopEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRecordEnabled() {
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
    get_IsFastForwardEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRewindEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextEnabled() {
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
    get_IsPreviousEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelUpEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelDownEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayPauseToggleEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShuffleEnabled() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRepeatEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackRateEnabled() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackPositionEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
