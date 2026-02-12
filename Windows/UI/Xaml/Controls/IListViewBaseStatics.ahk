#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBaseStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBaseStatics
     * @type {Guid}
     */
    static IID => Guid("{8532b8f7-3e16-455b-89a8-c1346223f6d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionModeProperty", "get_IsSwipeEnabledProperty", "get_CanDragItemsProperty", "get_CanReorderItemsProperty", "get_IsItemClickEnabledProperty", "get_DataFetchSizeProperty", "get_IncrementalLoadingThresholdProperty", "get_IncrementalLoadingTriggerProperty", "get_SemanticZoomOwnerProperty", "get_IsActiveViewProperty", "get_IsZoomedInViewProperty", "get_HeaderProperty", "get_HeaderTemplateProperty", "get_HeaderTransitionsProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionModeProperty {
        get => this.get_SelectionModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsSwipeEnabledProperty {
        get => this.get_IsSwipeEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanDragItemsProperty {
        get => this.get_CanDragItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanReorderItemsProperty {
        get => this.get_CanReorderItemsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsItemClickEnabledProperty {
        get => this.get_IsItemClickEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DataFetchSizeProperty {
        get => this.get_DataFetchSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IncrementalLoadingThresholdProperty {
        get => this.get_IncrementalLoadingThresholdProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IncrementalLoadingTriggerProperty {
        get => this.get_IncrementalLoadingTriggerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SemanticZoomOwnerProperty {
        get => this.get_SemanticZoomOwnerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsActiveViewProperty {
        get => this.get_IsActiveViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsZoomedInViewProperty {
        get => this.get_IsZoomedInViewProperty()
    }

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
    HeaderTransitionsProperty {
        get => this.get_HeaderTransitionsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionModeProperty() {
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
    get_IsSwipeEnabledProperty() {
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
    get_CanDragItemsProperty() {
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
    get_CanReorderItemsProperty() {
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
    get_IsItemClickEnabledProperty() {
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
    get_DataFetchSizeProperty() {
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
    get_IncrementalLoadingThresholdProperty() {
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
    get_IncrementalLoadingTriggerProperty() {
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
    get_SemanticZoomOwnerProperty() {
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
    get_IsActiveViewProperty() {
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
    get_IsZoomedInViewProperty() {
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
    get_HeaderProperty() {
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
    get_HeaderTemplateProperty() {
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
    get_HeaderTransitionsProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
