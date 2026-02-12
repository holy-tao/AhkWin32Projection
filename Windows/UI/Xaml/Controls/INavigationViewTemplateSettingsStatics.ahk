#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewTemplateSettingsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewTemplateSettingsStatics
     * @type {Guid}
     */
    static IID => Guid("{2c885e59-f7b9-5078-aeb6-8d7a03c05d02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TopPaddingProperty", "get_OverflowButtonVisibilityProperty", "get_PaneToggleButtonVisibilityProperty", "get_BackButtonVisibilityProperty", "get_TopPaneVisibilityProperty", "get_LeftPaneVisibilityProperty", "get_SingleSelectionFollowsFocusProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TopPaddingProperty {
        get => this.get_TopPaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OverflowButtonVisibilityProperty {
        get => this.get_OverflowButtonVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneToggleButtonVisibilityProperty {
        get => this.get_PaneToggleButtonVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BackButtonVisibilityProperty {
        get => this.get_BackButtonVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TopPaneVisibilityProperty {
        get => this.get_TopPaneVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LeftPaneVisibilityProperty {
        get => this.get_LeftPaneVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SingleSelectionFollowsFocusProperty {
        get => this.get_SingleSelectionFollowsFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TopPaddingProperty() {
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
    get_OverflowButtonVisibilityProperty() {
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
    get_PaneToggleButtonVisibilityProperty() {
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
    get_BackButtonVisibilityProperty() {
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
    get_TopPaneVisibilityProperty() {
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
    get_LeftPaneVisibilityProperty() {
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
    get_SingleSelectionFollowsFocusProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
