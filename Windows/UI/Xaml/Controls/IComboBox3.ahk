#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBox3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBox3
     * @type {Guid}
     */
    static IID => Guid("{52400a63-476c-4bb6-b781-019324d3fed9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LightDismissOverlayMode", "put_LightDismissOverlayMode", "get_IsTextSearchEnabled", "put_IsTextSearchEnabled"]

    /**
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTextSearchEnabled {
        get => this.get_IsTextSearchEnabled()
        set => this.put_IsTextSearchEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_LightDismissOverlayMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextSearchEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsTextSearchEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
