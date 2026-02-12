#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Binding.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IBindingExpression extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindingExpression
     * @type {Guid}
     */
    static IID => Guid("{516a19a5-c2fd-4a9e-9fd3-9aa42f995a3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataItem", "get_ParentBinding", "UpdateSource"]

    /**
     * @type {IInspectable} 
     */
    DataItem {
        get => this.get_DataItem()
    }

    /**
     * @type {Binding} 
     */
    ParentBinding {
        get => this.get_ParentBinding()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DataItem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {Binding} 
     */
    get_ParentBinding() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Binding(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateSource() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
