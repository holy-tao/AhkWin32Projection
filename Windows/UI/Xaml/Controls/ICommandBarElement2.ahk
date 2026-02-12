#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines members to manage the command bar overflow menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.icommandbarelement2
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBarElement2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarElement2
     * @type {Guid}
     */
    static IID => Guid("{a9bf1236-4402-4688-b987-9d2b9b7bf2bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsInOverflow", "get_DynamicOverflowOrder", "put_DynamicOverflowOrder"]

    /**
     * Gets a value that indicates whether this item is in the overflow menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.icommandbarelement2.isinoverflow
     * @type {Boolean} 
     */
    IsInOverflow {
        get => this.get_IsInOverflow()
    }

    /**
     * Gets or sets the order in which this item is moved to the [CommandBar](commandbar.md) overflow menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.icommandbarelement2.dynamicoverfloworder
     * @type {Integer} 
     */
    DynamicOverflowOrder {
        get => this.get_DynamicOverflowOrder()
        set => this.put_DynamicOverflowOrder(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInOverflow() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DynamicOverflowOrder() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_DynamicOverflowOrder(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
