#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentDialogStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentDialogStatics2
     * @type {Guid}
     */
    static IID => Guid("{329825b2-8fb0-4125-bb07-e79a5a03819f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CloseButtonTextProperty", "get_CloseButtonCommandProperty", "get_CloseButtonCommandParameterProperty", "get_PrimaryButtonStyleProperty", "get_SecondaryButtonStyleProperty", "get_CloseButtonStyleProperty", "get_DefaultButtonProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CloseButtonTextProperty {
        get => this.get_CloseButtonTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CloseButtonCommandProperty {
        get => this.get_CloseButtonCommandProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CloseButtonCommandParameterProperty {
        get => this.get_CloseButtonCommandParameterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PrimaryButtonStyleProperty {
        get => this.get_PrimaryButtonStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SecondaryButtonStyleProperty {
        get => this.get_SecondaryButtonStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CloseButtonStyleProperty {
        get => this.get_CloseButtonStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DefaultButtonProperty {
        get => this.get_DefaultButtonProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CloseButtonTextProperty() {
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
    get_CloseButtonCommandProperty() {
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
    get_CloseButtonCommandParameterProperty() {
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
    get_PrimaryButtonStyleProperty() {
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
    get_SecondaryButtonStyleProperty() {
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
    get_CloseButtonStyleProperty() {
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
    get_DefaultButtonProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
