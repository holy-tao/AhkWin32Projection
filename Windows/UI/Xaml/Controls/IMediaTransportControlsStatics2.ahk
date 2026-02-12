#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControlsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControlsStatics2
     * @type {Guid}
     */
    static IID => Guid("{1728cfdc-561f-4386-a7f8-090d95f68d96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSkipForwardButtonVisibleProperty", "get_IsSkipForwardEnabledProperty", "get_IsSkipBackwardButtonVisibleProperty", "get_IsSkipBackwardEnabledProperty", "get_IsNextTrackButtonVisibleProperty", "get_IsPreviousTrackButtonVisibleProperty", "get_FastPlayFallbackBehaviourProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsSkipForwardButtonVisibleProperty {
        get => this.get_IsSkipForwardButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSkipForwardEnabledProperty {
        get => this.get_IsSkipForwardEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSkipBackwardButtonVisibleProperty {
        get => this.get_IsSkipBackwardButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSkipBackwardEnabledProperty {
        get => this.get_IsSkipBackwardEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsNextTrackButtonVisibleProperty {
        get => this.get_IsNextTrackButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPreviousTrackButtonVisibleProperty {
        get => this.get_IsPreviousTrackButtonVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FastPlayFallbackBehaviourProperty {
        get => this.get_FastPlayFallbackBehaviourProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSkipForwardButtonVisibleProperty() {
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
    get_IsSkipForwardEnabledProperty() {
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
    get_IsSkipBackwardButtonVisibleProperty() {
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
    get_IsSkipBackwardEnabledProperty() {
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
    get_IsNextTrackButtonVisibleProperty() {
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
    get_IsPreviousTrackButtonVisibleProperty() {
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
    get_FastPlayFallbackBehaviourProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
