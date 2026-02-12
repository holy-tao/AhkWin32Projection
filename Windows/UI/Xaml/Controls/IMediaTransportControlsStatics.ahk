#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControlsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControlsStatics
     * @type {Guid}
     */
    static IID => Guid("{590ea907-d2ef-4c1a-9429-b4b15d64fd56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFullWindowButtonVisibleProperty", "get_IsFullWindowEnabledProperty", "get_IsZoomButtonVisibleProperty", "get_IsZoomEnabledProperty", "get_IsFastForwardButtonVisibleProperty", "get_IsFastForwardEnabledProperty", "get_IsFastRewindButtonVisibleProperty", "get_IsFastRewindEnabledProperty", "get_IsStopButtonVisibleProperty", "get_IsStopEnabledProperty", "get_IsVolumeButtonVisibleProperty", "get_IsVolumeEnabledProperty", "get_IsPlaybackRateButtonVisibleProperty", "get_IsPlaybackRateEnabledProperty", "get_IsSeekBarVisibleProperty", "get_IsSeekEnabledProperty", "get_IsCompactProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsFullWindowButtonVisibleProperty {
        get => this.get_IsFullWindowButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFullWindowEnabledProperty {
        get => this.get_IsFullWindowEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomButtonVisibleProperty {
        get => this.get_IsZoomButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomEnabledProperty {
        get => this.get_IsZoomEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFastForwardButtonVisibleProperty {
        get => this.get_IsFastForwardButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFastForwardEnabledProperty {
        get => this.get_IsFastForwardEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFastRewindButtonVisibleProperty {
        get => this.get_IsFastRewindButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFastRewindEnabledProperty {
        get => this.get_IsFastRewindEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStopButtonVisibleProperty {
        get => this.get_IsStopButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsStopEnabledProperty {
        get => this.get_IsStopEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVolumeButtonVisibleProperty {
        get => this.get_IsVolumeButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsVolumeEnabledProperty {
        get => this.get_IsVolumeEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPlaybackRateButtonVisibleProperty {
        get => this.get_IsPlaybackRateButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPlaybackRateEnabledProperty {
        get => this.get_IsPlaybackRateEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSeekBarVisibleProperty {
        get => this.get_IsSeekBarVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSeekEnabledProperty {
        get => this.get_IsSeekEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsCompactProperty {
        get => this.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFullWindowButtonVisibleProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFullWindowEnabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsZoomButtonVisibleProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsZoomEnabledProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFastForwardButtonVisibleProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFastForwardEnabledProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFastRewindButtonVisibleProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFastRewindEnabledProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsStopButtonVisibleProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsStopEnabledProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsVolumeButtonVisibleProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsVolumeEnabledProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPlaybackRateButtonVisibleProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsPlaybackRateEnabledProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSeekBarVisibleProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSeekEnabledProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsCompactProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
