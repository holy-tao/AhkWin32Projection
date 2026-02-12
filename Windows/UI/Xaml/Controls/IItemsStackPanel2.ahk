#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsStackPanel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsStackPanel2
     * @type {Guid}
     */
    static IID => Guid("{eeeecdb0-00b4-4534-937b-56318b293e92}")

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
