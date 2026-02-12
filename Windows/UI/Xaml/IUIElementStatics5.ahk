#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics5
     * @type {Guid}
     */
    static IID => Guid("{59bd7d91-8fa3-4c65-ba1b-40df38556cbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LightsProperty", "get_KeyTipPlacementModeProperty", "get_KeyTipHorizontalOffsetProperty", "get_KeyTipVerticalOffsetProperty", "get_XYFocusKeyboardNavigationProperty", "get_XYFocusUpNavigationStrategyProperty", "get_XYFocusDownNavigationStrategyProperty", "get_XYFocusLeftNavigationStrategyProperty", "get_XYFocusRightNavigationStrategyProperty", "get_HighContrastAdjustmentProperty", "get_TabFocusNavigationProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LightsProperty {
        get => this.get_LightsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipPlacementModeProperty {
        get => this.get_KeyTipPlacementModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipHorizontalOffsetProperty {
        get => this.get_KeyTipHorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipVerticalOffsetProperty {
        get => this.get_KeyTipVerticalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusKeyboardNavigationProperty {
        get => this.get_XYFocusKeyboardNavigationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusUpNavigationStrategyProperty {
        get => this.get_XYFocusUpNavigationStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusDownNavigationStrategyProperty {
        get => this.get_XYFocusDownNavigationStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusLeftNavigationStrategyProperty {
        get => this.get_XYFocusLeftNavigationStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    XYFocusRightNavigationStrategyProperty {
        get => this.get_XYFocusRightNavigationStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HighContrastAdjustmentProperty {
        get => this.get_HighContrastAdjustmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TabFocusNavigationProperty {
        get => this.get_TabFocusNavigationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LightsProperty() {
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
    get_KeyTipPlacementModeProperty() {
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
    get_KeyTipHorizontalOffsetProperty() {
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
    get_KeyTipVerticalOffsetProperty() {
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
    get_XYFocusKeyboardNavigationProperty() {
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
    get_XYFocusUpNavigationStrategyProperty() {
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
    get_XYFocusDownNavigationStrategyProperty() {
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
    get_XYFocusLeftNavigationStrategyProperty() {
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
    get_XYFocusRightNavigationStrategyProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HighContrastAdjustmentProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TabFocusNavigationProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
