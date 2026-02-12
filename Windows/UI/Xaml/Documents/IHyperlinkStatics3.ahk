#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IHyperlinkStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkStatics3
     * @type {Guid}
     */
    static IID => Guid("{3e15dea0-205e-4947-99a5-74e757e8e1b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_XYFocusLeftProperty", "get_XYFocusRightProperty", "get_XYFocusUpProperty", "get_XYFocusDownProperty", "get_ElementSoundModeProperty"]

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
     * @type {DependencyProperty} 
     */
    ElementSoundModeProperty {
        get => this.get_ElementSoundModeProperty()
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

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ElementSoundModeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
