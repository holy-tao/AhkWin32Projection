#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Not supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncustomprompt
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnCustomPrompt extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnCustomPrompt
     * @type {Guid}
     */
    static IID => Guid("{9b2ebe7b-87d5-433c-b4f6-eee6aa68a244}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Label", "get_Label", "put_Compulsory", "get_Compulsory", "put_Bordered", "get_Bordered"]

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncustomprompt.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncustomprompt.compulsory
     * @type {Boolean} 
     */
    Compulsory {
        get => this.get_Compulsory()
        set => this.put_Compulsory(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpncustomprompt.bordered
     * @type {Boolean} 
     */
    Bordered {
        get => this.get_Bordered()
        set => this.put_Bordered(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_Compulsory(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Compulsory() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_Bordered(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Bordered() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
