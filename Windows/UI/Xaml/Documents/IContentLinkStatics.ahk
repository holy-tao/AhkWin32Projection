#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IContentLinkStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentLinkStatics
     * @type {Guid}
     */
    static IID => Guid("{a34e3063-eb16-484e-a3df-522b9a832e6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundProperty", "get_CursorProperty", "get_XYFocusLeftProperty", "get_XYFocusRightProperty", "get_XYFocusUpProperty", "get_XYFocusDownProperty", "get_ElementSoundModeProperty", "get_FocusStateProperty", "get_XYFocusUpNavigationStrategyProperty", "get_XYFocusDownNavigationStrategyProperty", "get_XYFocusLeftNavigationStrategyProperty", "get_XYFocusRightNavigationStrategyProperty", "get_IsTabStopProperty", "get_TabIndexProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BackgroundProperty {
        get => this.get_BackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CursorProperty {
        get => this.get_CursorProperty()
    }

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
     * @type {DependencyProperty} 
     */
    FocusStateProperty {
        get => this.get_FocusStateProperty()
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
    IsTabStopProperty {
        get => this.get_IsTabStopProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TabIndexProperty {
        get => this.get_TabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackgroundProperty() {
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
    get_CursorProperty() {
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
    get_XYFocusLeftProperty() {
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
    get_XYFocusRightProperty() {
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
    get_XYFocusUpProperty() {
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
    get_XYFocusDownProperty() {
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
    get_ElementSoundModeProperty() {
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
    get_FocusStateProperty() {
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
    get_XYFocusUpNavigationStrategyProperty() {
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
    get_XYFocusDownNavigationStrategyProperty() {
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
    get_XYFocusLeftNavigationStrategyProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
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
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTabStopProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TabIndexProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
