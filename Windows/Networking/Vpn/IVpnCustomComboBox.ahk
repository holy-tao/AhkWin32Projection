#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnCustomComboBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnCustomComboBox
     * @type {Guid}
     */
    static IID => Guid("{9a24158e-dba1-4c6f-8270-dcf3c9761c4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_OptionsText", "get_OptionsText", "get_Selected"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    OptionsText {
        get => this.get_OptionsText()
        set => this.put_OptionsText(value)
    }

    /**
     * @type {Integer} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * 
     * @param {IVectorView<HSTRING>} value 
     * @returns {HRESULT} 
     */
    put_OptionsText(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_OptionsText() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Selected() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
