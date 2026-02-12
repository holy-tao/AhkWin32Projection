#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewStatics3
     * @type {Guid}
     */
    static IID => Guid("{9b6b69b7-f746-5550-91e1-ee0c9a85c05e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PaneDisplayModeProperty", "get_PaneHeaderProperty", "get_PaneCustomContentProperty", "get_ContentOverlayProperty", "get_IsPaneVisibleProperty", "get_SelectionFollowsFocusProperty", "get_TemplateSettingsProperty", "get_ShoulderNavigationEnabledProperty", "get_OverflowLabelModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PaneDisplayModeProperty {
        get => this.get_PaneDisplayModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneHeaderProperty {
        get => this.get_PaneHeaderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneCustomContentProperty {
        get => this.get_PaneCustomContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentOverlayProperty {
        get => this.get_ContentOverlayProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPaneVisibleProperty {
        get => this.get_IsPaneVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectionFollowsFocusProperty {
        get => this.get_SelectionFollowsFocusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TemplateSettingsProperty {
        get => this.get_TemplateSettingsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ShoulderNavigationEnabledProperty {
        get => this.get_ShoulderNavigationEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OverflowLabelModeProperty {
        get => this.get_OverflowLabelModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaneDisplayModeProperty() {
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
    get_PaneHeaderProperty() {
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
    get_PaneCustomContentProperty() {
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
    get_ContentOverlayProperty() {
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
    get_IsPaneVisibleProperty() {
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
    get_SelectionFollowsFocusProperty() {
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
    get_TemplateSettingsProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ShoulderNavigationEnabledProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OverflowLabelModeProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
