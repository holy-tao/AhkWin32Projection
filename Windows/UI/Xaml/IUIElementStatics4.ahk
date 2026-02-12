#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics4
     * @type {Guid}
     */
    static IID => Guid("{1d157d61-16af-411f-b774-272375a4ac2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContextFlyoutProperty", "get_ExitDisplayModeOnAccessKeyInvokedProperty", "get_IsAccessKeyScopeProperty", "get_AccessKeyScopeOwnerProperty", "get_AccessKeyProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContextFlyoutProperty {
        get => this.get_ContextFlyoutProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExitDisplayModeOnAccessKeyInvokedProperty {
        get => this.get_ExitDisplayModeOnAccessKeyInvokedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsAccessKeyScopeProperty {
        get => this.get_IsAccessKeyScopeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AccessKeyScopeOwnerProperty {
        get => this.get_AccessKeyScopeOwnerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AccessKeyProperty {
        get => this.get_AccessKeyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContextFlyoutProperty() {
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
    get_ExitDisplayModeOnAccessKeyInvokedProperty() {
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
    get_IsAccessKeyScopeProperty() {
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
    get_AccessKeyScopeOwnerProperty() {
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
    get_AccessKeyProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
