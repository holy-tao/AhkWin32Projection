#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IComboBoxTemplateSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxTemplateSettings2
     * @type {Guid}
     */
    static IID => Guid("{00e90cd7-68be-449d-b5a7-76e26f703e9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropDownContentMinWidth"]

    /**
     * @type {Float} 
     */
    DropDownContentMinWidth {
        get => this.get_DropDownContentMinWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DropDownContentMinWidth() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
