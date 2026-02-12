#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBox4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBox4
     * @type {Guid}
     */
    static IID => Guid("{b7974f49-b05c-47f9-9aaf-d6f9187be5fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionChangedTrigger", "put_SelectionChangedTrigger"]

    /**
     * @type {Integer} 
     */
    SelectionChangedTrigger {
        get => this.get_SelectionChangedTrigger()
        set => this.put_SelectionChangedTrigger(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionChangedTrigger() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_SelectionChangedTrigger(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
