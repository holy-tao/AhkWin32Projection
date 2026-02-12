#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IInputScopeName extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputScopeName
     * @type {Guid}
     */
    static IID => Guid("{fd3e6997-08fb-4cba-a021-792d7589fd5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NameValue", "put_NameValue"]

    /**
     * @type {Integer} 
     */
    NameValue {
        get => this.get_NameValue()
        set => this.put_NameValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NameValue() {
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
    put_NameValue(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
