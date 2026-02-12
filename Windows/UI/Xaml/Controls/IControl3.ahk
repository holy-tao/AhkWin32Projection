#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControl3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControl3
     * @type {Guid}
     */
    static IID => Guid("{077b29e4-dade-4f55-9b96-09e21b28eb1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseSystemFocusVisuals", "put_UseSystemFocusVisuals"]

    /**
     * @type {Boolean} 
     */
    UseSystemFocusVisuals {
        get => this.get_UseSystemFocusVisuals()
        set => this.put_UseSystemFocusVisuals(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseSystemFocusVisuals() {
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
    put_UseSystemFocusVisuals(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
