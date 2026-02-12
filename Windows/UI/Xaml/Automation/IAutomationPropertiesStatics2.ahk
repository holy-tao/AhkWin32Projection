#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationPropertiesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPropertiesStatics2
     * @type {Guid}
     */
    static IID => Guid("{3976547f-7089-4801-8f1d-aab78090d1a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccessibilityViewProperty", "GetAccessibilityView", "SetAccessibilityView", "get_ControlledPeersProperty", "GetControlledPeers"]

    /**
     * @type {DependencyProperty} 
     */
    AccessibilityViewProperty {
        get => this.get_AccessibilityViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ControlledPeersProperty {
        get => this.get_ControlledPeersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AccessibilityViewProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetAccessibilityView(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetAccessibilityView(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ControlledPeersProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {IVector<UIElement>} 
     */
    GetControlledPeers(element) {
        result := ComCall(10, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(UIElement, result_)
    }
}
