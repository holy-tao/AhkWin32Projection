#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IButtonBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IButtonBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{67ef17e1-fe37-474f-9e97-3b5e0b30f2df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClickModeProperty", "get_IsPointerOverProperty", "get_IsPressedProperty", "get_CommandProperty", "get_CommandParameterProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ClickModeProperty {
        get => this.get_ClickModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPointerOverProperty {
        get => this.get_IsPointerOverProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPressedProperty {
        get => this.get_IsPressedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CommandProperty {
        get => this.get_CommandProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CommandParameterProperty {
        get => this.get_CommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ClickModeProperty() {
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
    get_IsPointerOverProperty() {
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
    get_IsPressedProperty() {
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
    get_CommandProperty() {
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
    get_CommandParameterProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
