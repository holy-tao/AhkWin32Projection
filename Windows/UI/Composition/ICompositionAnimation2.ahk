#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionAnimation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionAnimation2
     * @type {Guid}
     */
    static IID => Guid("{369b603e-a80f-4948-93e3-ed23fb38c6cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBooleanParameter", "get_Target", "put_Target"]

    /**
     * @type {HSTRING} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetBooleanParameter(key, value) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(6, this, "ptr", key, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Target() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_Target(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
