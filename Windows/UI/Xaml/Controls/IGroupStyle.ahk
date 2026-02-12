#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ItemsPanelTemplate.ahk
#Include ..\Style.ahk
#Include .\StyleSelector.ahk
#Include ..\DataTemplate.ahk
#Include .\DataTemplateSelector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGroupStyle extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGroupStyle
     * @type {Guid}
     */
    static IID => Guid("{71ca300b-b89e-4184-b0df-a9e95447de8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Panel", "put_Panel", "get_ContainerStyle", "put_ContainerStyle", "get_ContainerStyleSelector", "put_ContainerStyleSelector", "get_HeaderTemplate", "put_HeaderTemplate", "get_HeaderTemplateSelector", "put_HeaderTemplateSelector", "get_HidesIfEmpty", "put_HidesIfEmpty"]

    /**
     * @type {ItemsPanelTemplate} 
     */
    Panel {
        get => this.get_Panel()
        set => this.put_Panel(value)
    }

    /**
     * @type {Style} 
     */
    ContainerStyle {
        get => this.get_ContainerStyle()
        set => this.put_ContainerStyle(value)
    }

    /**
     * @type {StyleSelector} 
     */
    ContainerStyleSelector {
        get => this.get_ContainerStyleSelector()
        set => this.put_ContainerStyleSelector(value)
    }

    /**
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * @type {DataTemplateSelector} 
     */
    HeaderTemplateSelector {
        get => this.get_HeaderTemplateSelector()
        set => this.put_HeaderTemplateSelector(value)
    }

    /**
     * @type {Boolean} 
     */
    HidesIfEmpty {
        get => this.get_HidesIfEmpty()
        set => this.put_HidesIfEmpty(value)
    }

    /**
     * 
     * @returns {ItemsPanelTemplate} 
     */
    get_Panel() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemsPanelTemplate(value)
    }

    /**
     * 
     * @param {ItemsPanelTemplate} value 
     * @returns {HRESULT} 
     */
    put_Panel(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Style} 
     */
    get_ContainerStyle() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_ContainerStyle(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StyleSelector} 
     */
    get_ContainerStyleSelector() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StyleSelector(value)
    }

    /**
     * 
     * @param {StyleSelector} value 
     * @returns {HRESULT} 
     */
    put_ContainerStyleSelector(value) {
        result := ComCall(11, this, "ptr", value, "int")
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
        result := ComCall(12, this, "ptr*", &value := 0, "int")
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
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplateSelector} 
     */
    get_HeaderTemplateSelector() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplateSelector(value)
    }

    /**
     * 
     * @param {DataTemplateSelector} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplateSelector(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HidesIfEmpty() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_HidesIfEmpty(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
