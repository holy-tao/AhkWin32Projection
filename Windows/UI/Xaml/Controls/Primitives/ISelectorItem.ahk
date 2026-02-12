#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISelectorItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectorItem
     * @type {Guid}
     */
    static IID => Guid("{541c8d6c-0283-4581-b945-2a64c28a0646}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelected", "put_IsSelected"]

    /**
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
        set => this.put_IsSelected(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
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
    put_IsSelected(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
