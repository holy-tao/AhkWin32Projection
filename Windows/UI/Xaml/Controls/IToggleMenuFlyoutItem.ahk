#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToggleMenuFlyoutItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleMenuFlyoutItem
     * @type {Guid}
     */
    static IID => Guid("{49841edd-88e9-4663-a701-cd4fd25e398f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsChecked", "put_IsChecked"]

    /**
     * @type {Boolean} 
     */
    IsChecked {
        get => this.get_IsChecked()
        set => this.put_IsChecked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChecked() {
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
    put_IsChecked(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
