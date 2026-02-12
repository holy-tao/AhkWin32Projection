#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IHyperlinkStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkStatics4
     * @type {Guid}
     */
    static IID => Guid("{0476b378-8faa-4e24-b3b6-e9de4d3c708c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FocusStateProperty", "get_XYFocusUpNavigationStrategyProperty", "get_XYFocusDownNavigationStrategyProperty", "get_XYFocusLeftNavigationStrategyProperty", "get_XYFocusRightNavigationStrategyProperty"]

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
     * 
     * @returns {DependencyProperty} 
     */
    get_FocusStateProperty() {
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
    get_XYFocusUpNavigationStrategyProperty() {
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
    get_XYFocusDownNavigationStrategyProperty() {
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
    get_XYFocusLeftNavigationStrategyProperty() {
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
    get_XYFocusRightNavigationStrategyProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
