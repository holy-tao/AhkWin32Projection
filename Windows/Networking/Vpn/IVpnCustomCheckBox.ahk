#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnCustomCheckBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnCustomCheckBox
     * @type {Guid}
     */
    static IID => Guid("{43878753-03c5-4e61-93d7-a957714c4282}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_InitialCheckState", "get_InitialCheckState", "get_Checked"]

    /**
     * @type {Boolean} 
     */
    InitialCheckState {
        get => this.get_InitialCheckState()
        set => this.put_InitialCheckState(value)
    }

    /**
     * @type {Boolean} 
     */
    Checked {
        get => this.get_Checked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InitialCheckState(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InitialCheckState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Checked() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
