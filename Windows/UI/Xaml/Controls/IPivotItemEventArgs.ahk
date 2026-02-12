#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PivotItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPivotItemEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPivotItemEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1a6f7254-1ed5-4bc5-a060-655530bca6ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "put_Item"]

    /**
     * @type {PivotItem} 
     */
    Item {
        get => this.get_Item()
        set => this.put_Item(value)
    }

    /**
     * 
     * @returns {PivotItem} 
     */
    get_Item() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PivotItem(value)
    }

    /**
     * 
     * @param {PivotItem} value 
     * @returns {HRESULT} 
     */
    put_Item(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
