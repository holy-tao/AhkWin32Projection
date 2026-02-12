#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaElementStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaElementStatics2
     * @type {Guid}
     */
    static IID => Guid("{9ee7f826-f154-4dc6-8014-a6eba987f847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreTransportControlsEnabledProperty", "get_StretchProperty", "get_IsFullWindowProperty", "get_PlayToPreferredSourceUriProperty"]

    /**
     * @type {DependencyProperty} 
     */
    AreTransportControlsEnabledProperty {
        get => this.get_AreTransportControlsEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StretchProperty {
        get => this.get_StretchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFullWindowProperty {
        get => this.get_IsFullWindowProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlayToPreferredSourceUriProperty {
        get => this.get_PlayToPreferredSourceUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AreTransportControlsEnabledProperty() {
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
    get_StretchProperty() {
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
    get_IsFullWindowProperty() {
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
    get_PlayToPreferredSourceUriProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
