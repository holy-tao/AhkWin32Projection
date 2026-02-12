#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaTransportControlsStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTransportControlsStatics3
     * @type {Guid}
     */
    static IID => Guid("{5fe05542-0940-11e7-93ae-92361f002671}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShowAndHideAutomaticallyProperty", "get_IsRepeatEnabledProperty", "get_IsRepeatButtonVisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ShowAndHideAutomaticallyProperty {
        get => this.get_ShowAndHideAutomaticallyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRepeatEnabledProperty {
        get => this.get_IsRepeatEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRepeatButtonVisibleProperty {
        get => this.get_IsRepeatButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ShowAndHideAutomaticallyProperty() {
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
    get_IsRepeatEnabledProperty() {
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
    get_IsRepeatButtonVisibleProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
