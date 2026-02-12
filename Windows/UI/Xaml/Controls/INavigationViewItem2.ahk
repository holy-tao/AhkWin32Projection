#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewItem2
     * @type {Guid}
     */
    static IID => Guid("{ee488ef9-ea9c-5e04-b26c-83bf9655342f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectsOnInvoked", "put_SelectsOnInvoked"]

    /**
     * @type {Boolean} 
     */
    SelectsOnInvoked {
        get => this.get_SelectsOnInvoked()
        set => this.put_SelectsOnInvoked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SelectsOnInvoked() {
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
    put_SelectsOnInvoked(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
