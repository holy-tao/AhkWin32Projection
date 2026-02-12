#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IInputPaneControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPaneControl
     * @type {Guid}
     */
    static IID => Guid("{088bb24f-962f-489d-aa6e-c6be1a0a6e52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Visible", "put_Visible"]

    /**
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
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
    put_Visible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
