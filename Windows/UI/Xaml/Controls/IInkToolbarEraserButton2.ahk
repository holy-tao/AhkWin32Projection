#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInkToolbarEraserButton2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkToolbarEraserButton2
     * @type {Guid}
     */
    static IID => Guid("{e7a59257-5ae8-436d-b2e2-93c200900ca0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsClearAllVisible", "put_IsClearAllVisible"]

    /**
     * @type {Boolean} 
     */
    IsClearAllVisible {
        get => this.get_IsClearAllVisible()
        set => this.put_IsClearAllVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClearAllVisible() {
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
    put_IsClearAllVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
