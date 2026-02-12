#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControls extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControls
     * @type {Guid}
     */
    static IID => Guid("{d6f69e7d-0825-49a9-9fce-5586d8694f0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFullWindowButtonVisible", "put_IsFullWindowButtonVisible", "get_IsFullWindowEnabled", "put_IsFullWindowEnabled", "get_IsZoomButtonVisible", "put_IsZoomButtonVisible", "get_IsZoomEnabled", "put_IsZoomEnabled", "get_IsFastForwardButtonVisible", "put_IsFastForwardButtonVisible", "get_IsFastForwardEnabled", "put_IsFastForwardEnabled", "get_IsFastRewindButtonVisible", "put_IsFastRewindButtonVisible", "get_IsFastRewindEnabled", "put_IsFastRewindEnabled", "get_IsStopButtonVisible", "put_IsStopButtonVisible", "get_IsStopEnabled", "put_IsStopEnabled", "get_IsVolumeButtonVisible", "put_IsVolumeButtonVisible", "get_IsVolumeEnabled", "put_IsVolumeEnabled", "get_IsPlaybackRateButtonVisible", "put_IsPlaybackRateButtonVisible", "get_IsPlaybackRateEnabled", "put_IsPlaybackRateEnabled", "get_IsSeekBarVisible", "put_IsSeekBarVisible", "get_IsSeekEnabled", "put_IsSeekEnabled", "get_IsCompact", "put_IsCompact"]

    /**
     * @type {Boolean} 
     */
    IsFullWindowButtonVisible {
        get => this.get_IsFullWindowButtonVisible()
        set => this.put_IsFullWindowButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFullWindowEnabled {
        get => this.get_IsFullWindowEnabled()
        set => this.put_IsFullWindowEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomButtonVisible {
        get => this.get_IsZoomButtonVisible()
        set => this.put_IsZoomButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsZoomEnabled {
        get => this.get_IsZoomEnabled()
        set => this.put_IsZoomEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFastForwardButtonVisible {
        get => this.get_IsFastForwardButtonVisible()
        set => this.put_IsFastForwardButtonVisible(value)
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
    IsFastRewindButtonVisible {
        get => this.get_IsFastRewindButtonVisible()
        set => this.put_IsFastRewindButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFastRewindEnabled {
        get => this.get_IsFastRewindEnabled()
        set => this.put_IsFastRewindEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStopButtonVisible {
        get => this.get_IsStopButtonVisible()
        set => this.put_IsStopButtonVisible(value)
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
    IsVolumeButtonVisible {
        get => this.get_IsVolumeButtonVisible()
        set => this.put_IsVolumeButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsVolumeEnabled {
        get => this.get_IsVolumeEnabled()
        set => this.put_IsVolumeEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPlaybackRateButtonVisible {
        get => this.get_IsPlaybackRateButtonVisible()
        set => this.put_IsPlaybackRateButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPlaybackRateEnabled {
        get => this.get_IsPlaybackRateEnabled()
        set => this.put_IsPlaybackRateEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSeekBarVisible {
        get => this.get_IsSeekBarVisible()
        set => this.put_IsSeekBarVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSeekEnabled {
        get => this.get_IsSeekEnabled()
        set => this.put_IsSeekEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindowButtonVisible() {
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
    put_IsFullWindowButtonVisible(value) {
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
    get_IsFullWindowEnabled() {
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
    put_IsFullWindowEnabled(value) {
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
    get_IsZoomButtonVisible() {
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
    put_IsZoomButtonVisible(value) {
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
    get_IsZoomEnabled() {
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
    put_IsZoomEnabled(value) {
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
    get_IsFastForwardButtonVisible() {
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
    put_IsFastForwardButtonVisible(value) {
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
    get_IsFastForwardEnabled() {
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
    put_IsFastForwardEnabled(value) {
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
    get_IsFastRewindButtonVisible() {
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
    put_IsFastRewindButtonVisible(value) {
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
    get_IsFastRewindEnabled() {
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
    put_IsFastRewindEnabled(value) {
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
    get_IsStopButtonVisible() {
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
    put_IsStopButtonVisible(value) {
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
    get_IsStopEnabled() {
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
    put_IsStopEnabled(value) {
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
    get_IsVolumeButtonVisible() {
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
    put_IsVolumeButtonVisible(value) {
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
    get_IsVolumeEnabled() {
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
    put_IsVolumeEnabled(value) {
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
    get_IsPlaybackRateButtonVisible() {
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
    put_IsPlaybackRateButtonVisible(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackRateEnabled() {
        result := ComCall(32, this, "int*", &value := 0, "int")
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
    put_IsPlaybackRateEnabled(value) {
        result := ComCall(33, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeekBarVisible() {
        result := ComCall(34, this, "int*", &value := 0, "int")
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
    put_IsSeekBarVisible(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeekEnabled() {
        result := ComCall(36, this, "int*", &value := 0, "int")
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
    put_IsSeekEnabled(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompact() {
        result := ComCall(38, this, "int*", &value := 0, "int")
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
    put_IsCompact(value) {
        result := ComCall(39, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
