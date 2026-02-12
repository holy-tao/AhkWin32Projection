#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputKeyboardInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputKeyboardInfo
     * @type {Guid}
     */
    static IID => Guid("{4b46d140-2b6a-5ffa-7eae-bd077b052acd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyOptions", "put_KeyOptions", "get_ScanCode", "put_ScanCode", "get_VirtualKey", "put_VirtualKey"]

    /**
     * @type {Integer} 
     */
    KeyOptions {
        get => this.get_KeyOptions()
        set => this.put_KeyOptions(value)
    }

    /**
     * @type {Integer} 
     */
    ScanCode {
        get => this.get_ScanCode()
        set => this.put_ScanCode(value)
    }

    /**
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
        set => this.put_VirtualKey(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyOptions() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_KeyOptions(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanCode() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
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
    put_ScanCode(value) {
        result := ComCall(9, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VirtualKey() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
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
    put_VirtualKey(value) {
        result := ComCall(11, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
