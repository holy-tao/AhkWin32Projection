#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewStatics5
     * @type {Guid}
     */
    static IID => Guid("{08a0b8d1-508a-4db8-97ef-0fa505e19ec2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XYFocusLeftProperty", "get_XYFocusRightProperty", "get_XYFocusUpProperty", "get_XYFocusDownProperty"]

    /**
     * @type {DependencyProperty} 
     */
    XYFocusLeftProperty {
        get => this.get_XYFocusLeftProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusRightProperty {
        get => this.get_XYFocusRightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusUpProperty {
        get => this.get_XYFocusUpProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusDownProperty {
        get => this.get_XYFocusDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_XYFocusLeftProperty() {
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
    get_XYFocusRightProperty() {
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
    get_XYFocusUpProperty() {
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
    get_XYFocusDownProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
