#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPasswordBoxStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPasswordBoxStatics
     * @type {Guid}
     */
    static IID => Guid("{5ee67563-2d74-4ace-bd79-fcab61a7d77b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PasswordProperty", "get_PasswordCharProperty", "get_IsPasswordRevealButtonEnabledProperty", "get_MaxLengthProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PasswordProperty {
        get => this.get_PasswordProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PasswordCharProperty {
        get => this.get_PasswordCharProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPasswordRevealButtonEnabledProperty {
        get => this.get_IsPasswordRevealButtonEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxLengthProperty {
        get => this.get_MaxLengthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PasswordProperty() {
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
    get_PasswordCharProperty() {
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
    get_IsPasswordRevealButtonEnabledProperty() {
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
    get_MaxLengthProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
