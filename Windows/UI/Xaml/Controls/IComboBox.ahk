#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include Primitives\ComboBoxTemplateSettings.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBox
     * @type {Guid}
     */
    static IID => Guid("{b9a8d05c-ac97-47f1-a5f4-3f9f4d4b116c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDropDownOpen", "put_IsDropDownOpen", "get_IsEditable", "get_IsSelectionBoxHighlighted", "get_MaxDropDownHeight", "put_MaxDropDownHeight", "get_SelectionBoxItem", "get_SelectionBoxItemTemplate", "get_TemplateSettings", "add_DropDownClosed", "remove_DropDownClosed", "add_DropDownOpened", "remove_DropDownOpened"]

    /**
     * @type {Boolean} 
     */
    IsDropDownOpen {
        get => this.get_IsDropDownOpen()
        set => this.put_IsDropDownOpen(value)
    }

    /**
     * @type {Boolean} 
     */
    IsEditable {
        get => this.get_IsEditable()
    }

    /**
     * @type {Boolean} 
     */
    IsSelectionBoxHighlighted {
        get => this.get_IsSelectionBoxHighlighted()
    }

    /**
     * @type {Float} 
     */
    MaxDropDownHeight {
        get => this.get_MaxDropDownHeight()
        set => this.put_MaxDropDownHeight(value)
    }

    /**
     * @type {IInspectable} 
     */
    SelectionBoxItem {
        get => this.get_SelectionBoxItem()
    }

    /**
     * @type {DataTemplate} 
     */
    SelectionBoxItemTemplate {
        get => this.get_SelectionBoxItemTemplate()
    }

    /**
     * @type {ComboBoxTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDropDownOpen() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsDropDownOpen(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEditable() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionBoxHighlighted() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxDropDownHeight() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_MaxDropDownHeight(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectionBoxItem() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_SelectionBoxItemTemplate() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @returns {ComboBoxTemplateSettings} 
     */
    get_TemplateSettings() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ComboBoxTemplateSettings(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropDownClosed(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_DropDownClosed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropDownOpened(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_DropDownOpened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
