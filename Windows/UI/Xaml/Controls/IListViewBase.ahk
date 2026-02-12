#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\DataTemplate.ahk
#Include ..\Media\Animation\TransitionCollection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBase
     * @type {Guid}
     */
    static IID => Guid("{3d0813ba-6890-4537-bfe5-796d9458edd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedItems", "get_SelectionMode", "put_SelectionMode", "get_IsSwipeEnabled", "put_IsSwipeEnabled", "get_CanDragItems", "put_CanDragItems", "get_CanReorderItems", "put_CanReorderItems", "get_IsItemClickEnabled", "put_IsItemClickEnabled", "get_DataFetchSize", "put_DataFetchSize", "get_IncrementalLoadingThreshold", "put_IncrementalLoadingThreshold", "get_IncrementalLoadingTrigger", "put_IncrementalLoadingTrigger", "add_ItemClick", "remove_ItemClick", "add_DragItemsStarting", "remove_DragItemsStarting", "ScrollIntoView", "SelectAll", "LoadMoreItemsAsync", "ScrollIntoViewWithAlignment", "get_Header", "put_Header", "get_HeaderTemplate", "put_HeaderTemplate", "get_HeaderTransitions", "put_HeaderTransitions"]

    /**
     * @type {IVector<IInspectable>} 
     */
    SelectedItems {
        get => this.get_SelectedItems()
    }

    /**
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSwipeEnabled {
        get => this.get_IsSwipeEnabled()
        set => this.put_IsSwipeEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    CanDragItems {
        get => this.get_CanDragItems()
        set => this.put_CanDragItems(value)
    }

    /**
     * @type {Boolean} 
     */
    CanReorderItems {
        get => this.get_CanReorderItems()
        set => this.put_CanReorderItems(value)
    }

    /**
     * @type {Boolean} 
     */
    IsItemClickEnabled {
        get => this.get_IsItemClickEnabled()
        set => this.put_IsItemClickEnabled(value)
    }

    /**
     * @type {Float} 
     */
    DataFetchSize {
        get => this.get_DataFetchSize()
        set => this.put_DataFetchSize(value)
    }

    /**
     * @type {Float} 
     */
    IncrementalLoadingThreshold {
        get => this.get_IncrementalLoadingThreshold()
        set => this.put_IncrementalLoadingThreshold(value)
    }

    /**
     * @type {Integer} 
     */
    IncrementalLoadingTrigger {
        get => this.get_IncrementalLoadingTrigger()
        set => this.put_IncrementalLoadingTrigger(value)
    }

    /**
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * @type {TransitionCollection} 
     */
    HeaderTransitions {
        get => this.get_HeaderTransitions()
        set => this.put_HeaderTransitions(value)
    }

    /**
     * 
     * @returns {IVector<IInspectable>} 
     */
    get_SelectedItems() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IInspectable, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSwipeEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSwipeEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDragItems() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanDragItems(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReorderItems() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReorderItems(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsItemClickEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsItemClickEnabled(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DataFetchSize() {
        result := ComCall(17, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DataFetchSize(value) {
        result := ComCall(18, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IncrementalLoadingThreshold() {
        result := ComCall(19, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_IncrementalLoadingThreshold(value) {
        result := ComCall(20, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IncrementalLoadingTrigger() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IncrementalLoadingTrigger(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ItemClickEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemClick(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragItemsStartingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragItemsStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} item 
     * @returns {HRESULT} 
     */
    ScrollIntoView(item) {
        result := ComCall(27, this, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<LoadMoreItemsResult>} 
     */
    LoadMoreItemsAsync() {
        result := ComCall(29, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetLoadMoreItemsResult(), operation)
    }

    /**
     * 
     * @param {IInspectable} item 
     * @param {Integer} alignment 
     * @returns {HRESULT} 
     */
    ScrollIntoViewWithAlignment(item, alignment) {
        result := ComCall(30, this, "ptr", item, "int", alignment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TransitionCollection} 
     */
    get_HeaderTransitions() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TransitionCollection(value)
    }

    /**
     * 
     * @param {TransitionCollection} value 
     * @returns {HRESULT} 
     */
    put_HeaderTransitions(value) {
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
