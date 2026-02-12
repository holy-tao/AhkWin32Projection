#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\RadialControllerMenuItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerMenu extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerMenu
     * @type {Guid}
     */
    static IID => Guid("{8506b35d-f640-4412-aba0-bad077e5ea8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items", "get_IsEnabled", "put_IsEnabled", "GetSelectedMenuItem", "SelectMenuItem", "TrySelectPreviouslySelectedMenuItem"]

    /**
     * @type {IVector<RadialControllerMenuItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {IVector<RadialControllerMenuItem>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(RadialControllerMenuItem, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RadialControllerMenuItem} 
     */
    GetSelectedMenuItem() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenuItem(result_)
    }

    /**
     * 
     * @param {RadialControllerMenuItem} menuItem_ 
     * @returns {HRESULT} 
     */
    SelectMenuItem(menuItem_) {
        result := ComCall(10, this, "ptr", menuItem_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TrySelectPreviouslySelectedMenuItem() {
        result := ComCall(11, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
