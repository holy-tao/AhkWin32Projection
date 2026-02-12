#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISearchBoxStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchBoxStatics
     * @type {Guid}
     */
    static IID => Guid("{b123634f-6871-48cd-92df-4cff22459082}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SearchHistoryEnabledProperty", "get_SearchHistoryContextProperty", "get_PlaceholderTextProperty", "get_QueryTextProperty", "get_FocusOnKeyboardInputProperty", "get_ChooseSuggestionOnEnterProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SearchHistoryEnabledProperty {
        get => this.get_SearchHistoryEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SearchHistoryContextProperty {
        get => this.get_SearchHistoryContextProperty()
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
    QueryTextProperty {
        get => this.get_QueryTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FocusOnKeyboardInputProperty {
        get => this.get_FocusOnKeyboardInputProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ChooseSuggestionOnEnterProperty {
        get => this.get_ChooseSuggestionOnEnterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SearchHistoryEnabledProperty() {
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
    get_SearchHistoryContextProperty() {
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
    get_QueryTextProperty() {
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
    get_FocusOnKeyboardInputProperty() {
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
    get_ChooseSuggestionOnEnterProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
