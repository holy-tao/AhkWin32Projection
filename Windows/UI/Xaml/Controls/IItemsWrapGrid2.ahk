#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsWrapGrid2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsWrapGrid2
     * @type {Guid}
     */
    static IID => Guid("{80c21c0f-63ec-4258-bd61-d4a6956c864a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreStickyGroupHeadersEnabled", "put_AreStickyGroupHeadersEnabled"]

    /**
     * @type {Boolean} 
     */
    AreStickyGroupHeadersEnabled {
        get => this.get_AreStickyGroupHeadersEnabled()
        set => this.put_AreStickyGroupHeadersEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreStickyGroupHeadersEnabled() {
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
    put_AreStickyGroupHeadersEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
