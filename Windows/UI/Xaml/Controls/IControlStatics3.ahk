#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlStatics3
     * @type {Guid}
     */
    static IID => Guid("{aad15e61-e4b9-4d72-b653-934149aa5003}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseSystemFocusVisualsProperty", "get_IsTemplateFocusTargetProperty", "GetIsTemplateFocusTarget", "SetIsTemplateFocusTarget"]

    /**
     * @type {DependencyProperty} 
     */
    UseSystemFocusVisualsProperty {
        get => this.get_UseSystemFocusVisualsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTemplateFocusTargetProperty {
        get => this.get_IsTemplateFocusTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_UseSystemFocusVisualsProperty() {
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
    get_IsTemplateFocusTargetProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {Boolean} 
     */
    GetIsTemplateFocusTarget(element) {
        result := ComCall(8, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsTemplateFocusTarget(element, value) {
        result := ComCall(9, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
