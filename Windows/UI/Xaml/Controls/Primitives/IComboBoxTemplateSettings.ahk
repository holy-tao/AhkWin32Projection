#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IComboBoxTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{83285c4e-17f6-4aa3-b61b-e87c718604ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropDownOpenedHeight", "get_DropDownClosedHeight", "get_DropDownOffset", "get_SelectedItemDirection"]

    /**
     * @type {Float} 
     */
    DropDownOpenedHeight {
        get => this.get_DropDownOpenedHeight()
    }

    /**
     * @type {Float} 
     */
    DropDownClosedHeight {
        get => this.get_DropDownClosedHeight()
    }

    /**
     * @type {Float} 
     */
    DropDownOffset {
        get => this.get_DropDownOffset()
    }

    /**
     * @type {Integer} 
     */
    SelectedItemDirection {
        get => this.get_SelectedItemDirection()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownOpenedHeight() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownClosedHeight() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownOffset() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedItemDirection() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
