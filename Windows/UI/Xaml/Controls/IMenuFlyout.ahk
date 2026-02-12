#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\MenuFlyoutItemBase.ahk
#Include ..\Style.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMenuFlyout extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuFlyout
     * @type {Guid}
     */
    static IID => Guid("{ad3210f1-985b-4171-bbba-67bcc729649b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items", "get_MenuFlyoutPresenterStyle", "put_MenuFlyoutPresenterStyle"]

    /**
     * @type {IVector<MenuFlyoutItemBase>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {Style} 
     */
    MenuFlyoutPresenterStyle {
        get => this.get_MenuFlyoutPresenterStyle()
        set => this.put_MenuFlyoutPresenterStyle(value)
    }

    /**
     * 
     * @returns {IVector<MenuFlyoutItemBase>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MenuFlyoutItemBase, value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_MenuFlyoutPresenterStyle() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Style(value)
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_MenuFlyoutPresenterStyle(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
