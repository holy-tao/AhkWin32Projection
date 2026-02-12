#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwipeItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwipeItemStatics
     * @type {Guid}
     */
    static IID => Guid("{d0b44e96-2766-4d93-b5db-f5e1be832c2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IconSourceProperty", "get_TextProperty", "get_BackgroundProperty", "get_ForegroundProperty", "get_CommandProperty", "get_CommandParameterProperty", "get_BehaviorOnInvokedProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IconSourceProperty {
        get => this.get_IconSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextProperty {
        get => this.get_TextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BackgroundProperty {
        get => this.get_BackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ForegroundProperty {
        get => this.get_ForegroundProperty()
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
     * @type {DependencyProperty} 
     */
    BehaviorOnInvokedProperty {
        get => this.get_BehaviorOnInvokedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IconSourceProperty() {
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
    get_TextProperty() {
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
    get_BackgroundProperty() {
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
    get_ForegroundProperty() {
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
    get_CommandProperty() {
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
    get_CommandParameterProperty() {
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
    get_BehaviorOnInvokedProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
