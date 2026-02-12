#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISplitViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplitViewStatics
     * @type {Guid}
     */
    static IID => Guid("{859b4f6f-44ab-4e4b-91c1-17b7056d9b5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentProperty", "get_PaneProperty", "get_IsPaneOpenProperty", "get_OpenPaneLengthProperty", "get_CompactPaneLengthProperty", "get_PanePlacementProperty", "get_DisplayModeProperty", "get_TemplateSettingsProperty", "get_PaneBackgroundProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaneProperty {
        get => this.get_PaneProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsPaneOpenProperty {
        get => this.get_IsPaneOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OpenPaneLengthProperty {
        get => this.get_OpenPaneLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CompactPaneLengthProperty {
        get => this.get_CompactPaneLengthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PanePlacementProperty {
        get => this.get_PanePlacementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DisplayModeProperty {
        get => this.get_DisplayModeProperty()
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
    PaneBackgroundProperty {
        get => this.get_PaneBackgroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContentProperty() {
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
    get_PaneProperty() {
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
    get_IsPaneOpenProperty() {
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
    get_OpenPaneLengthProperty() {
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
    get_CompactPaneLengthProperty() {
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
    get_PanePlacementProperty() {
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
    get_DisplayModeProperty() {
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
    get_TemplateSettingsProperty() {
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
    get_PaneBackgroundProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
