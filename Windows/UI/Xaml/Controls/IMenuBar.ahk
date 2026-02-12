#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\MenuBarItem.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMenuBar extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuBar
     * @type {Guid}
     */
    static IID => Guid("{c8f67b0c-0e76-5af2-bade-785049c80a41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items"]

    /**
     * @type {IVector<MenuBarItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {IVector<MenuBarItem>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MenuBarItem, value)
    }
}
