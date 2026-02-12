#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBoxStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBoxStatics2
     * @type {Guid}
     */
    static IID => Guid("{e3eb26de-2748-420b-b1fc-ce95b6e85eec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeaderProperty", "get_HeaderTemplateProperty", "get_PlaceholderTextProperty", "get_SelectionHighlightColorProperty", "get_PreventKeyboardDisplayOnProgrammaticFocusProperty", "get_IsColorFontEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HeaderProperty {
        get => this.get_HeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderTemplateProperty {
        get => this.get_HeaderTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderTextProperty {
        get => this.get_PlaceholderTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionHighlightColorProperty {
        get => this.get_SelectionHighlightColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PreventKeyboardDisplayOnProgrammaticFocusProperty {
        get => this.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsColorFontEnabledProperty {
        get => this.get_IsColorFontEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeaderProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_PlaceholderTextProperty() {
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
    get_SelectionHighlightColorProperty() {
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
    get_PreventKeyboardDisplayOnProgrammaticFocusProperty() {
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
    get_IsColorFontEnabledProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
