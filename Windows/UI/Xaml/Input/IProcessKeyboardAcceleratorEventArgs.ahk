#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IProcessKeyboardAcceleratorEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessKeyboardAcceleratorEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fb79c216-972b-440c-9b83-2b4198dcf09d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Key", "get_Modifiers", "get_Handled", "put_Handled"]

    /**
     * @type {Integer} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
    }

    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Key() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
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
    put_Handled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
