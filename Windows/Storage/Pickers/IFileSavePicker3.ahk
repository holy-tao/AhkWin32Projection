#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileSavePicker3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSavePicker3
     * @type {Guid}
     */
    static IID => Guid("{698aec69-ba3c-4e51-bd90-4abcbbf4cfaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnterpriseId", "put_EnterpriseId"]

    /**
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
        set => this.put_EnterpriseId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnterpriseId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
