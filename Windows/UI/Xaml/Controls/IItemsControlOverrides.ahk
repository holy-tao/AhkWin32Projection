#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsControlOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsControlOverrides
     * @type {Guid}
     */
    static IID => Guid("{c79bb41b-a084-4301-a496-72971f364ed1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsItemItsOwnContainerOverride", "GetContainerForItemOverride", "ClearContainerForItemOverride", "PrepareContainerForItemOverride", "OnItemsChanged", "OnItemContainerStyleChanged", "OnItemContainerStyleSelectorChanged", "OnItemTemplateChanged", "OnItemTemplateSelectorChanged", "OnGroupStyleSelectorChanged"]

    /**
     * 
     * @param {IInspectable} item 
     * @returns {Boolean} 
     */
    IsItemItsOwnContainerOverride(item) {
        result := ComCall(6, this, "ptr", item, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    GetContainerForItemOverride() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {IInspectable} item 
     * @returns {HRESULT} 
     */
    ClearContainerForItemOverride(element, item) {
        result := ComCall(8, this, "ptr", element, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {IInspectable} item 
     * @returns {HRESULT} 
     */
    PrepareContainerForItemOverride(element, item) {
        result := ComCall(9, this, "ptr", element, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} e 
     * @returns {HRESULT} 
     */
    OnItemsChanged(e) {
        result := ComCall(10, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Style} oldItemContainerStyle 
     * @param {Style} newItemContainerStyle 
     * @returns {HRESULT} 
     */
    OnItemContainerStyleChanged(oldItemContainerStyle, newItemContainerStyle) {
        result := ComCall(11, this, "ptr", oldItemContainerStyle, "ptr", newItemContainerStyle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {StyleSelector} oldItemContainerStyleSelector 
     * @param {StyleSelector} newItemContainerStyleSelector 
     * @returns {HRESULT} 
     */
    OnItemContainerStyleSelectorChanged(oldItemContainerStyleSelector, newItemContainerStyleSelector) {
        result := ComCall(12, this, "ptr", oldItemContainerStyleSelector, "ptr", newItemContainerStyleSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DataTemplate} oldItemTemplate 
     * @param {DataTemplate} newItemTemplate 
     * @returns {HRESULT} 
     */
    OnItemTemplateChanged(oldItemTemplate, newItemTemplate) {
        result := ComCall(13, this, "ptr", oldItemTemplate, "ptr", newItemTemplate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DataTemplateSelector} oldItemTemplateSelector 
     * @param {DataTemplateSelector} newItemTemplateSelector 
     * @returns {HRESULT} 
     */
    OnItemTemplateSelectorChanged(oldItemTemplateSelector, newItemTemplateSelector) {
        result := ComCall(14, this, "ptr", oldItemTemplateSelector, "ptr", newItemTemplateSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GroupStyleSelector} oldGroupStyleSelector 
     * @param {GroupStyleSelector} newGroupStyleSelector 
     * @returns {HRESULT} 
     */
    OnGroupStyleSelectorChanged(oldGroupStyleSelector, newGroupStyleSelector) {
        result := ComCall(15, this, "ptr", oldGroupStyleSelector, "ptr", newGroupStyleSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
