#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\Data\ItemIndexRange.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBase4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBase4
     * @type {Guid}
     */
    static IID => Guid("{18b7792b-11dc-4eb6-a7bc-741adb3eeb79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedRanges", "get_IsMultiSelectCheckBoxEnabled", "put_IsMultiSelectCheckBoxEnabled", "add_DragItemsCompleted", "remove_DragItemsCompleted", "add_ChoosingItemContainer", "remove_ChoosingItemContainer", "add_ChoosingGroupHeaderContainer", "remove_ChoosingGroupHeaderContainer", "SelectRange", "DeselectRange"]

    /**
     * @type {IVectorView<ItemIndexRange>} 
     */
    SelectedRanges {
        get => this.get_SelectedRanges()
    }

    /**
     * @type {Boolean} 
     */
    IsMultiSelectCheckBoxEnabled {
        get => this.get_IsMultiSelectCheckBoxEnabled()
        set => this.put_IsMultiSelectCheckBoxEnabled(value)
    }

    /**
     * 
     * @returns {IVectorView<ItemIndexRange>} 
     */
    get_SelectedRanges() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ItemIndexRange, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMultiSelectCheckBoxEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsMultiSelectCheckBoxEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, DragItemsCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragItemsCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_DragItemsCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ChoosingItemContainerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ChoosingItemContainer(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_ChoosingItemContainer(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ListViewBase, ChoosingGroupHeaderContainerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ChoosingGroupHeaderContainer(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_ChoosingGroupHeaderContainer(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ItemIndexRange} itemIndexRange_ 
     * @returns {HRESULT} 
     */
    SelectRange(itemIndexRange_) {
        result := ComCall(15, this, "ptr", itemIndexRange_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ItemIndexRange} itemIndexRange_ 
     * @returns {HRESULT} 
     */
    DeselectRange(itemIndexRange_) {
        result := ComCall(16, this, "ptr", itemIndexRange_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
