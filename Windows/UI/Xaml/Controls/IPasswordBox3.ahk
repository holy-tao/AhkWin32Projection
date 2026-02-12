#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Input\InputScope.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPasswordBox3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPasswordBox3
     * @type {Guid}
     */
    static IID => Guid("{6024d9d1-56b7-41f0-9558-3934c14244d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PasswordRevealMode", "put_PasswordRevealMode", "get_TextReadingOrder", "put_TextReadingOrder", "get_InputScope", "put_InputScope"]

    /**
     * @type {Integer} 
     */
    PasswordRevealMode {
        get => this.get_PasswordRevealMode()
        set => this.put_PasswordRevealMode(value)
    }

    /**
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * @type {InputScope} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordRevealMode() {
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
    put_PasswordRevealMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_TextReadingOrder(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {InputScope} 
     */
    get_InputScope() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputScope(value)
    }

    /**
     * 
     * @param {InputScope} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
