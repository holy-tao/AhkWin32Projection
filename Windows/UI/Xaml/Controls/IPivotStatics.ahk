#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPivotStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivotStatics
     * @type {Guid}
     */
    static IID => Guid("{ee22c7f4-c15d-4ff3-8a94-f50dfdfbe899}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TitleProperty", "get_TitleTemplateProperty", "get_HeaderTemplateProperty", "get_SelectedIndexProperty", "get_SelectedItemProperty", "get_IsLockedProperty", "get_SlideInAnimationGroupProperty", "GetSlideInAnimationGroup", "SetSlideInAnimationGroup"]

    /**
     * @type {DependencyProperty} 
     */
    TitleProperty {
        get => this.get_TitleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TitleTemplateProperty {
        get => this.get_TitleTemplateProperty()
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
    SelectedIndexProperty {
        get => this.get_SelectedIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedItemProperty {
        get => this.get_SelectedItemProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsLockedProperty {
        get => this.get_IsLockedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SlideInAnimationGroupProperty {
        get => this.get_SlideInAnimationGroupProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TitleProperty() {
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
    get_TitleTemplateProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_SelectedIndexProperty() {
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
    get_SelectedItemProperty() {
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
    get_IsLockedProperty() {
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
    get_SlideInAnimationGroupProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @returns {Integer} 
     */
    GetSlideInAnimationGroup(element) {
        result := ComCall(13, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {FrameworkElement} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetSlideInAnimationGroup(element, value) {
        result := ComCall(14, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
